//
//  AppDependency.h
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DesignersListViewController;
@class ProductListViewController;
@class DetailViewController;

@interface AppDependency : NSObject

+ (void)configureDependencyForDesigners:(DesignersListViewController *)view;

+ (void)configureDependencyForProducts:(ProductListViewController *)view;

+ (void)configureDependencyForDetails:(DetailViewController *)view;

@end
