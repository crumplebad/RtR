//
//  DetailInteractor.h
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailInteractorIO.h"
@class DetailDataManager;

@interface DetailInteractor : NSObject<DetailInteractorInput>

@property (nonatomic, weak) id<DetailInteractorOutput> output;
@property (nonatomic, strong) DetailDataManager *dataManager;

- (DetailInteractor *)initWithDataManager:(DetailDataManager *)manager;

@end