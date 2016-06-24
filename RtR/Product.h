//
//  Product.h
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong) NSString *styleName;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *productDetail;
@property (nonatomic, strong) NSString *designer;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *fitNotes;
@property (nonatomic, strong) NSString *styleNotes;
@property (nonatomic, strong) NSString *rentalFee8Day;
@property (nonatomic, strong) NSString *rentalFee;
@property (nonatomic, strong) NSString *clearance;

@property (nonatomic, strong) NSDictionary *imagesBySize;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
