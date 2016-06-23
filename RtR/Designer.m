//
//  Designer.m
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "Designer.h"

@implementation Designer

-(id)initWithName:(NSString *)name andFavorite:(BOOL)isfavorite {
    if(self = [super init]){
        _designerName = name;
        _isFavorite = isfavorite;
    }
    
    return self;
}

@end
