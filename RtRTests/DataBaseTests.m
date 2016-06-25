//
//  DataBaseTests.m
//  RtR
//
//  Created by Jay on 6/24/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "SharedDataManager.h"
#import "Designer.h"

@interface DataBaseTests : XCTestCase {
    SharedDataManager *gSharedDataManager;
    Designer *gDesigner;
}

@end

@implementation DataBaseTests

- (void)setUp {
    [super setUp];
    gSharedDataManager = [SharedDataManager new];
    gDesigner = [Designer new];
    gDesigner.designerName = @"com.jay";
}

- (void)tearDown {
    gSharedDataManager = nil;
    gDesigner = nil;
    [super tearDown];
}

- (void)testAddFavoriteDesigner{
    
    XCTestExpectation *addfavoriteDesigner = [self expectationWithDescription:@"Add favorite designer"];

    [gSharedDataManager addFavoriteDesigner:gDesigner withCompletionHandler:^(void){
    
        [addfavoriteDesigner fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        NSLog(@"In waitForExpectationsWithTimeout");
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        RLMResults *results;
        @try {
            results = [Designer objectsInRealm:realm where:[NSString stringWithFormat:@"designerName = '%@'",gDesigner.designerName]];
        } @catch (NSException *exception) {
            NSLog(@"Realm EXCEPTION while reading.");
            
        } @finally {
            
        }
        XCTAssertTrue([results count] == 1, @"Result count should be 1.");
        [self removeFavDesigner];
    }];
}

- (void)testRemoveFavoriteDesigner {
//   given
    [self addFavoriteDesigner];
//    when
    XCTestExpectation *removefavoriteDesigner = [self expectationWithDescription:@"Remove favorite designer"];
    
    [gSharedDataManager removeFavoriteDesigner:gDesigner withCompletionHandler:^(void){
        
        [removefavoriteDesigner fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        NSLog(@"In waitForExpectationsWithTimeout");
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        RLMResults *results;
        @try {
            results = [Designer objectsInRealm:realm where:[NSString stringWithFormat:@"designerName = '%@'",gDesigner.designerName]];
        } @catch (NSException *exception) {
            NSLog(@"Realm EXCEPTION while reading.");
            
        } @finally {
            
        }
//        then
        XCTAssertTrue([results count] == 0, @"Result count should be 0.");
    }];
}

- (void)addFavoriteDesigner {
    [gSharedDataManager addFavoriteDesigner:gDesigner withCompletionHandler:nil];

}

- (void)removeFavDesigner {
    [gSharedDataManager removeFavoriteDesigner:gDesigner withCompletionHandler:nil];
}
@end