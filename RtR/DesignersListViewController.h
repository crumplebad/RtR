//
//  ViewController.h
//  RtR
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DesignersPresenter.h"
#import "DesignersView.h"

@class ProductListViewController;

@interface DesignersListViewController : UITableViewController<DesignersView>

@property (nonatomic, strong) DesignersPresenter *presenter;

@property (nonatomic, strong) ProductListViewController *productListViewController;

@end

