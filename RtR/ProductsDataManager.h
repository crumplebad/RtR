//
//  ProductsDataManager.h
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductsDataManager : NSObject

- (void)getAllProductsForDesigner:(NSString *)designerName withCompletionHandler:(void(^)(NSMutableArray *productsArray))completionBlock;

@end
