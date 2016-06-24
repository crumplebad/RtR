//
//  AppDependency.m
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "AppDependency.h"

#import "DesignersListViewController.h"
#import "ProductListViewController.h"
#import "DetailViewController.h"

#import "DesignersPresenter.h"
#import "ProductsPresenter.h"
#import "DetailPresenter.h"

#import "DesignersInteractor.h"
#import "ProductsInteractor.h"
#import "DetailInteractor.h"

#import "SharedDataManager.h"
#import "DetailDataManager.h"
#import "ProductsDataManager.h"

@implementation AppDependency

+ (void)configureDependencyForDesigners:(DesignersListViewController *)view {
    DesignersPresenter *presenter = [[DesignersPresenter alloc] init];
    
    SharedDataManager *dataManager = [[SharedDataManager alloc] init];
    DesignersInteractor *interactor = [[DesignersInteractor alloc] initWithDataManager:dataManager];
    
    view.presenter = presenter;
    presenter.view = view;
    
    presenter.input = interactor;
    interactor.output = presenter;
}

+ (void)configureDependencyForProducts:(ProductListViewController *)view {
    ProductsPresenter *presenter = [[ProductsPresenter alloc] init];
    
    ProductsDataManager *dataManager = [[ProductsDataManager alloc] init];
    ProductsInteractor *interactor = [[ProductsInteractor alloc] initWithDataManager:dataManager];
    
    view.presenter = presenter;
    presenter.view = view;
    
    presenter.input = interactor;
    interactor.output = presenter;
}

+ (void)configureDependencyForDetails:(DetailViewController *)view {
    DetailPresenter *presenter = [[DetailPresenter alloc] init];
    
    DetailDataManager *dataManager = [[DetailDataManager alloc] init];
    DetailInteractor *interactor = [[DetailInteractor alloc] initWithDataManager:dataManager];
    
    view.presenter = presenter;
    presenter.view = view;
    
    presenter.input = interactor;
    interactor.output = presenter;
}


@end
