//
//  NSStringAppendTests.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Append.h"
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "FeatureToggles.h"

@interface NSStringAppendTests : XCTestCase
@end

@implementation NSStringAppendTests

- (void)testString_shouldCorrectlyAppendAString {
    NSString *aString = @"Say";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"hander called"];
    [aString appendString:@" hi!" resultHandler:^(NSString *result) {
        [expectation fulfill];
        XCTAssertEqualObjects(result, @"Say hi!");
    }];
    
    [self waitForExpectationsWithTimeout:1.5 handler:nil];
}

- (void)testString_shouldCorrectlyAppendAString_usingHamcrest {
    __block NSString *resultStr;
    [@"say" appendString:@" hi!" resultHandler:^(NSString *result) {
        resultStr = result;
    }];
    
    assertWithTimeout(1.5, thatEventually(resultStr), is(@"say hi!"));
}

- (void)testAppendString_shouldAutoSeperated_whenFeatureToggleIsOn {
    id featureToggle = OCMPartialMock([FeatureToggles shareInstance]);
    OCMStub([featureToggle isAutoSeperateStringWhenAppendToggleOn]).andReturn(YES);
    
    NSString *result = [@"Say" appendAnotherString:@"Hi!"];
    
    assertThat(result, is(@"Say-Hi!"));
}

- (void)testAppendString_shouldNotAutoSeperated_whenFeatureToggleIsOff {
    id featureToggle = OCMClassMock([FeatureToggles class]);
    OCMStub([featureToggle shareInstance]).andReturn(featureToggle);
    OCMStub([featureToggle isAutoSeperateStringWhenAppendToggleOn]).andReturn(NO);
    
    NSString *result = [@"Say" appendAnotherString:@"Hi!"];
    
    assertThat(result, is(@"SayHi!"));
}

- (void)testThrowException {
    NSArray *a1 = @[@"1", @"2"];
    XCTAssertThrows(a1[4]);
    XCTAssertThrowsSpecificNamed(a1[4], NSException, NSRangeException);
    
    assertThat(a1[4], throwsException(equalTo(NSRangeException)));
}


@end
