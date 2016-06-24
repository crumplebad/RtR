//
//  ProductsDataTest.m
//  RtR
//
//  Created by Jay on 6/24/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SharedDataManager.h"
#import "Model.h"
#import "Products.h"

@interface ProductsDataTests : XCTestCase {
    
    SharedDataManager *gSharedDataManager;
}
@end

@implementation ProductsDataTests

- (void)setUp {
    [super setUp];
    gSharedDataManager = [SharedDataManager new];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAcessoryDesignerDataIsFetchedAndParsed {
    XCTestExpectation *fetchParseData = [self expectationWithDescription:@"downlofetchad and parse data"];
    [gSharedDataManager getData:^(NSError *error){
        if (!error) {
            XCTAssertTrue([[[[[Model sharedinstance] products] value] allValues] count] >0, @"Should be more than zero");
            [fetchParseData fulfill];
        }
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error) {
        NSLog(@"In waitForExpectationsWithTimeout");
        
    }];
}

@end
