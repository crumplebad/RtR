//
//  ProductsPresenter.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ProductsInteractorIO.h"
#import "ProductsView.h"
@class Product;

@interface ProductsPresenter: NSObject <ProductsInteractorOutput, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak)     id<ProductsView>            view;
@property (nonatomic, strong)   id<ProductsInteractorInput> input;

- (void)loadProductsForDesigner:(NSString *)designer;

- (Product *)getProductAtIndex:(NSIndexPath *)indexpath;

@end
