//
//  DesignersInteractor.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DesignersInteractorIO.h"
#import "DesignersProductsDataManager.h"

@interface DesignersInteractor : NSObject<DesignersInteractorInput>

@property (nonatomic, weak) id<DesignersInteractorOutput> output;
@property (nonatomic, strong) DesignersProductsDataManager *dataManager;

- (DesignersInteractor *)initWithDataManager:(DesignersProductsDataManager *)manager;

@end
