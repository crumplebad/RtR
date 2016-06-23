//
//  DataManager.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesignersProductsDataManager : NSObject

@property (nonatomic, strong) NSArray *value;

- (void)getData:(void(^)(NSError *))completionBlock;

@end
