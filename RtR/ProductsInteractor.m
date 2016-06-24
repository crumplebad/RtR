//
//  ProductsInteractor.m
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "ProductsInteractor.h"
#import "ProductsDataManager.h"

@implementation ProductsInteractor

- (ProductsInteractor *)initWithDataManager:(ProductsDataManager *)manager {
    if (self = [super init]) {
        _dataManager = manager;
    }
    
    return self;
}

- (void)getAllProductsForDesigner:(NSString *)designerName {
    __weak typeof(self) welf = self;
    
    [_dataManager getAllProductsForDesigner:(NSString *)designerName withCompletionHandler:^(NSMutableArray *productsArray){
            [welf.output returnAllProducts: productsArray];
    }];
    
}

@end
