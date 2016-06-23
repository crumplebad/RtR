//
//  DesignersList.m
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "Designers.h"
#import "Designer.h"
#import "Util.h"

@implementation Designers

- (id)initWithArray:(NSArray *)array {

    if (self = [super init]){
        NSMutableArray *mutableArray = [NSMutableArray new];
        for (id designer in array) {
            [mutableArray addObject:[[Designer alloc] initWithName:designer andFavorite:[Util isDesignerFavorite:designer]]];
        }
        _value = [mutableArray copy];
    }
    
    return self;
}

@end
