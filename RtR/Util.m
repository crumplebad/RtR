//
//  Util.m
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Realm/Realm.h>

#import "Util.h"
#import "Designer.h"

@implementation Util


+ (BOOL)isDesignerFavorite:(NSString *)designer {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults *otherResults;
    @try {
        otherResults = [Designer objectsInRealm:realm where:[NSString stringWithFormat:@"designerName = '%@'",designer]];
    } @catch (NSException *exception) {
        NSLog(@"Realm EXCEPTION while reading.");
        return NO;
    } @finally {

    }
    
    return (otherResults.count >0)? YES:NO;
}

@end
