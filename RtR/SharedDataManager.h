//
//  DataManager.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Designer;

@interface SharedDataManager : NSObject

@property (nonatomic, strong) NSArray *value;

- (void)getData:(void(^)(NSError *))completionBlock;

- (void)addFavoriteDesigner:(Designer *)designer withCompletionHandler:(void(^)(void))completionBlock;
- (void)removeFavoriteDesigner:(Designer *)designer  withCompletionHandler:(void(^)(void))completionBlock;

@end
