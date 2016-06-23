//
//  NSDictionary+RtR.m
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "NSDictionary+RtR.h"

@implementation NSDictionary (RtR)

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    id object = [self objectForKey:key];
    if ((NSNull *)object == [NSNull null] || (__bridge CFNullRef)object == kCFNull || ![object isKindOfClass:[NSDictionary class]])
        return nil;
    return object;
}


- (NSString *)stringForKey:(NSString *)key {
    id object = [self objectForKey:key];
    
    if ((NSNull *)object == [NSNull null] || (__bridge CFNullRef)object == kCFNull || ![object isKindOfClass:[NSString class]] || [[[NSString stringWithFormat:@"%@",object] uppercaseString] isEqualToString:@"NULL"])
        return @"";
    return [NSString stringWithFormat:@"%@",object];
}

- (NSArray *)arrayForKey:(NSString *)key {
    id object = [self objectForKey:key];
    if (object == NULL || [object isKindOfClass:[NSNull class]] || ![object isKindOfClass:[NSArray class]] ||[object count] == 0)
        return nil;
    return object;
}

@end
