//
//  ProductListViewController.h
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsView.h"

@class Designer;
@class ProductsPresenter;

@interface ProductListViewController : UITableViewController<ProductsView>

@property(nonatomic, strong)ProductsPresenter *presenter;

- (void)setDesigner:(Designer *)designer;

@end
