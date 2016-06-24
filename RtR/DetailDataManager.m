//
//  DetailDataManager.m
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DetailDataManager.h"
#import "Model.h"
#import "NSDictionary+RtR.h"

@implementation DetailDataManager

- (void)getImagesForUrls:(NSArray *)urlArray withCompletionHandler:(void(^)(NSArray *imageArray , NSError *))completionBlock {
    
    __block NSError *error;
    dispatch_group_t downloadGroup = dispatch_group_create();
    
    NSMutableArray *imageArray = [NSMutableArray new];
    dispatch_apply([urlArray count], dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(size_t i) {
        
        NSURL *url = [NSURL URLWithString:urlArray[i]];
        
        dispatch_group_enter(downloadGroup);
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDownloadTask *dataTask = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            if (response) {
                UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                [imageArray addObject:downloadedImage];
            } else {
                NSLog(@"Image is NIL");
            }
            dispatch_group_leave(downloadGroup);
            
        }];
        
        [dataTask resume];
    });
    
    dispatch_group_notify(downloadGroup, dispatch_get_main_queue(), ^{
        if (completionBlock) {
            completionBlock([imageArray copy], error);
        }
    });
}

@end