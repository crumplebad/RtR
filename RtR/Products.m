//
//  ProductList.m
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "Products.h"
#import "Product.h"

@implementation Products

- (id)initWithArray:(NSArray *)array {
    
    if (self = [super init]) {
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
        for (id product in array) {
//            TOO MUCH happening in the init method. Following data dictionary manipulaiton should happen in the interactor. Doing here for efficiency at the cost of not so clean design.
            Product *aProduct = [[Product alloc] initWithDictionary:product];
            NSMutableArray *valueArray = [mutableDictionary objectForKey:aProduct.designer];
            if (valueArray) {
                [valueArray addObject:aProduct];
                [mutableDictionary removeObjectForKey:aProduct.designer];
                [mutableDictionary setObject:valueArray forKey:aProduct.designer];
            } else {
                [mutableDictionary setObject:[[NSMutableArray alloc] initWithObjects:aProduct, nil] forKey:aProduct.designer];
            }
        }
        _value = [mutableDictionary copy];
    }
    
    return self;
}

@end
