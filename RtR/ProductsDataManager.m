//
//  ProductsDataManager.m
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "ProductsDataManager.h"
#import "Model.h"
#import "Products.h"

@implementation ProductsDataManager

- (void)getAllProductsForDesigner:(NSString *)designerName withCompletionHandler:(void(^)(NSMutableArray *productsArray))completionBlock {
    if (completionBlock) {
        completionBlock([[[[Model sharedinstance] products] value] objectForKey:designerName]);
    }
}

@end
