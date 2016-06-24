//
//  ProductList.h
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject

@property (nonatomic, strong) NSDictionary *value;

- (id)initWithArray:(NSArray *)array;

@end
