//
//  Designer.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Designer : NSObject

@property (nonatomic, strong) NSString *designerName;
@property (nonatomic) NSUInteger numberOfProducts;
@property BOOL isFavorite;

- (id)initWithName:(NSString *)name andFavorite:(BOOL)isfavorite;

@end
