//
//  DataManager.m
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Realm/Realm.h>
#import "SharedDataManager.h"
#import "Model.h"
#import "Designer.h"
#import "Products.h"
#import "Designers.h"
#import "NSDictionary+RtR.h"

NSString *const kDressDesignerUrl = @"http://static.sqvr.co/designer-dresses.json";
NSString *const kAccessoryDesignerUrl = @"http://static.sqvr.co/designer-accesories.json";
NSString *const kProductUrl = @"http://static.sqvr.co/random-items.json";

@implementation SharedDataManager


- (void)getData:(void(^)(NSError *))completionBlock {

    __block NSError *error;
    dispatch_group_t downloadGroup = dispatch_group_create();
    
    dispatch_apply(3, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(size_t i) {
        
        NSURL *url;
        switch (i) {
            case 0:
                url = [NSURL URLWithString:kDressDesignerUrl];
                break;
            case 1:
                url = [NSURL URLWithString:kAccessoryDesignerUrl];
                break;
            case 2:
                url = [NSURL URLWithString:kProductUrl];
                break;
            default:
                break;
        }
        
        dispatch_group_enter(downloadGroup);
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (data) {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                switch (i) {
                    case 0:
                        [[Model sharedinstance] setDressDesigners:[[Designers alloc] initWithArray:[json arrayForKey:@"designer"]]];
                        break;
                    case 1:
                        [[Model sharedinstance] setAccessoryDesigners:[[Designers alloc] initWithArray:[json arrayForKey:@"designer"]]];
                        break;
                    case 2:
                        [[Model sharedinstance] setProducts:[[Products alloc] initWithArray:[json arrayForKey:@"products"]]];
                        break;
                    default:
                        break;
                }
                
            } else {
                NSLog(@"Data is NIL");
            }
            dispatch_group_leave(downloadGroup); // 4
            
        }];
        
        [dataTask resume];
    });
    
    dispatch_group_notify(downloadGroup, dispatch_get_main_queue(), ^{
        if (completionBlock) {
            completionBlock(error);
        }
    });
}


- (void)addFavoriteDesigner:(Designer *)designer {
#pragma TODO figure out why DB update in the bg causes crash later in the app
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        Designer *newDesigner = [Designer new];
        newDesigner.designerName = designer.designerName;
        @try {
            [realm beginWriteTransaction];
            [realm addObject:newDesigner];
            [realm commitWriteTransaction];
                    } @catch (NSException *exception) {
            NSLog(@"Exception while adding favorite");//reverse the model change.
        } @finally {
            
        }
    });
}

- (void)removeFavoriteDesigner:(Designer *)designer {
#pragma TODO figure out why DB update in the bg causes crash later in the app
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        RLMResults *otherResults = [Designer objectsInRealm:realm where:[NSString stringWithFormat:@"designerName = '%@'",designer.designerName]];
        @try {
            [realm beginWriteTransaction];
            [realm deleteObjects:otherResults];
            [realm commitWriteTransaction];
        } @catch (NSException *exception) {
            NSLog(@"Exception while removing favorite");//reverse the model change.
        } @finally {
            
        }
    });
}

@end