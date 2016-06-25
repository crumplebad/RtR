//
//  DesignersInteractor.m
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DesignersInteractor.h"
#import "Model.h"
#import "Designer.h"
#import "Designers.h"
#import "Product.h"
#import "Products.h"
#import "SharedDataManager.h"

@implementation DesignersInteractor

- (DesignersInteractor *)initWithDataManager:(SharedDataManager *)manager {
    if (self = [super init]) {
        _dataManager = manager;
    }
    
    return self;
}

- (void)getAllData {
    __weak typeof(self) welf = self;
    [_dataManager getData:^(NSError *error){
        if (!error) {
            NSLog(@"Alll data downloaded!!");
            [welf.output returnDesignersData: [welf getPreparedDataForDisplay]];
        }
    }];
}

- (NSArray *)getPreparedDataForDisplay {
    NSMutableArray *designerArray = [NSMutableArray new];
    
    [designerArray addObjectsFromArray:[[Model sharedinstance] accessoryDesigners].value];
    [designerArray addObjectsFromArray:[[Model sharedinstance] dressDesigners].value];

    designerArray = [[self sortArrayByDesigners:designerArray] mutableCopy];
    
    designerArray = [[self mapNumberOfProductsToDesigners:designerArray] mutableCopy];
    
    return [designerArray copy];
    
}

- (NSArray *)sortArrayByDesigners:(NSMutableArray *)designersArray {
    NSArray *sortedArray;
    sortedArray = [designersArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [[(Designer*)a designerName] uppercaseString];
        NSString *second = [[(Designer*)b designerName] uppercaseString];
        return [first compare:second];
    }];
    
    return sortedArray;
}

- (NSArray *)mapNumberOfProductsToDesigners:(NSMutableArray *)designersArray{
 
    NSDictionary *productDictionary = [[[Model sharedinstance] products] value];
    for (Designer* designer in designersArray) {
        NSArray *productArray = [productDictionary objectForKey:designer.designerName];
        if (productArray) {
            designer.numberOfProducts = [productArray count];
        } else {
            designer.numberOfProducts = 0;
        }
    }
    
    return [designersArray copy];
}

- (void)addFavoriteDesigner:(Designer *)designer {
    [_dataManager addFavoriteDesigner:designer withCompletionHandler:nil];
}

- (void)removeFavoriteDesigner:(Designer *)designer {
    [_dataManager removeFavoriteDesigner:designer withCompletionHandler:nil];
}

@end