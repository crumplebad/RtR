//
//  DesignersInteractor.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DesignersInteractorIO.h"

@class SharedDataManager;
@class Designer;

@interface DesignersInteractor : NSObject<DesignersInteractorInput>

@property (nonatomic, weak) id<DesignersInteractorOutput> output;
@property (nonatomic, strong) SharedDataManager *dataManager;

- (void)addFavoriteDesigner:(Designer *)designer;
- (void)removeFavoriteDesigner:(Designer *)designer;

- (DesignersInteractor *)initWithDataManager:(SharedDataManager *)manager;

@end
