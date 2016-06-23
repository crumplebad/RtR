//
//  Product.m
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "Product.h"
#import "NSDictionary+RtR.h"

@implementation Product


- (id)initWithDictionary:(NSDictionary *)dictionary {

    if (self = [super init]) {
        _styleName = [dictionary stringForKey:@"styleName"];
        _displayName = [dictionary stringForKey:@"displayName"];
        _productDetail = [dictionary stringForKey:@"productDetail"];
        _designer = [dictionary stringForKey:@"designer"];
        _type = [dictionary stringForKey:@"type"];
        _fitNotes = [dictionary stringForKey:@"fitNotes"];
        _styleNotes = [dictionary stringForKey:@"styleNotes"];
        _rentalFee8Day = [dictionary stringForKey:@"rentalFee8Day"];
        _rentalFee = [dictionary stringForKey:@"rentalFee"];
        _clearance = [dictionary stringForKey:@"clearance"];
        _imagesBySize = [dictionary dictionaryForKey:@"imagesBySize"];
    }
    
    return self;
}

@end
