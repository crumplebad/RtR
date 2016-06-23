//
//  Model.h
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Designers.h"
#import "Products.h"

@interface Model : NSObject

@property (nonatomic, strong) Designers *dressDesigners;
@property (nonatomic, strong) Designers *accessoryDesigners;
@property (nonatomic, strong) Products *products;

+ (id)sharedinstance;

@end
