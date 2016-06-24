//
//  DetailInteractor.m
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DetailInteractor.h"
#import "DetailDataManager.h"

@implementation DetailInteractor

- (DetailInteractor *)initWithDataManager:(DetailDataManager *)manager {
    if (self = [super init]) {
        _dataManager = manager;
    }
    
    return self;
}


- (void)getAllImagesForUrl:(NSArray *)urlArray {
    __weak typeof(self) welf = self;
    [_dataManager getImagesForUrls:(NSArray *)urlArray withCompletionHandler:^(NSArray *imageArray, NSError *error){
        if (!error) {
            NSLog(@"Alll Images downloaded!!");
            [welf.output returnAllImageData: imageArray];
        }
    }];
    
}

@end
