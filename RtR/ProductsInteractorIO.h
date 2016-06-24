//
//  ProductsInteractorIO.h
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductsInteractorInput <NSObject>

- (void)getAllProductsForDesigner:(NSString *)designerName;

@end

@protocol ProductsInteractorOutput <NSObject>

- (void)returnAllProducts:(NSMutableArray *)productsArray ;

@end
