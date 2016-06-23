//
//  AppDependency.m
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "AppDependency.h"
#import "DesignersListViewController.h"
#import "DetailViewController.h"

#import "DesignersPresenter.h"
#import "DetailPresenter.h"

#import "DesignersInteractor.h"
#import "DetailInteractor.h"

#import "DesignersProductsDataManager.h"
#import "DetailDataManager.h"

@implementation AppDependency

+ (void)configureDependencyForDesigners:(DesignersListViewController *)view {
    DesignersPresenter *presenter = [[DesignersPresenter alloc] init];
    
    DesignersProductsDataManager *dataManager = [[DesignersProductsDataManager alloc] init];
    DesignersInteractor *interactor = [[DesignersInteractor alloc] initWithDataManager:dataManager];
    
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
