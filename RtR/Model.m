//
//  Model.m
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (id)sharedinstance {
    
    static Model *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
    
        sharedInstance = [[self alloc] init];
        
    });
    
    return sharedInstance;
}

@end
