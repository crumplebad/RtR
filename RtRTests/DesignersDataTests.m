//
//  DesignersDataTest.m
//  RtR
//
//  Created by Jay on 6/24/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SharedDataManager.h"
#import "Model.h"
#import "Designers.h"

@interface DesignersDataTests : XCTestCase {
    
    SharedDataManager *gSharedDataManager;
}
@end

@implementation DesignersDataTests

- (void)setUp {
    [super setUp];
    gSharedDataManager = [SharedDataManager new];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    gSharedDataManager = nil;
    [super tearDown];
}

- (void)testDressDesignerDataIsFetchedAndParsed {

    XCTestExpectation *fetchParseData = [self expectationWithDescription:@"fetch and parse data"];
    [gSharedDataManager getData:^(NSError *error){
        if (!error) {
            XCTAssertTrue([[[[Model sharedinstance] dressDesigners] value] count] > 0, @"Should be more than zero");
            [fetchParseData fulfill];
        }
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        NSLog(@"In waitForExpectationsWithTimeout");
        
    }];

}

- (void)testAcessoryDesignerDataIsFetchedAndParsed {
    
    XCTestExpectation *fetchParseData = [self expectationWithDescription:@"downlofetchad and parse data"];
    [gSharedDataManager getData:^(NSError *error){
        if (!error) {
            XCTAssertTrue([[[[Model sharedinstance] accessoryDesigners] value] count] > 0, @"Should be more than zero");
            [fetchParseData fulfill];
        }
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        NSLog(@"In waitForExpectationsWithTimeout");
        
    }];
}

@end
