//
//  ProductsInteractor.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductsInteractorIO.h"
@class ProductsDataManager;

@interface ProductsInteractor : NSObject<ProductsInteractorInput>

@property (nonatomic, weak) id<ProductsInteractorOutput> output;
@property (nonatomic, strong) ProductsDataManager *dataManager;

- (ProductsInteractor *)initWithDataManager:(ProductsDataManager *)manager;

@end
