//
//  BooksSearchServiceTests.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/29/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>
#import <OCMock/OCMock.h>
#import <OCHamcrest/OCHamcrest.h>
#import "BooksSearchService.h"
#import "ServerAPIs.h"
#import "Book.h"

@interface BooksSearchServiceTests : XCTestCase
@end

@implementation BooksSearchServiceTests

- (void)testBookService_shouldSendCorrectRequest {
    NSString *keyword = @"test";
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    OCMExpect([sessionManager GET:[OCMArg checkWithBlock:^BOOL(NSString *searchUrl) {
        return [searchUrl isEqualToString:BOOK_SEARCH_URL];
    }] parameters:[OCMArg checkWithBlock:^BOOL(NSDictionary *param) {
        return [param isEqualToDictionary:@{@"q":keyword}];
    }] progress:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]]);
    
    [BooksSearchService searchBookWithKeyword:keyword success:nil failure:nil];
    
    OCMVerifyAll(sessionManager);
}

- (void)testBookService_shouldInvokeSuccessCallback_whenRequestSuccess {
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    OCMStub([sessionManager GET:[OCMArg any] parameters:[OCMArg any]
                       progress:[OCMArg any]
                        success:([OCMArg invokeBlockWithArgs:[OCMArg any], [self mockedResponseDictionary], nil])
                        failure:[OCMArg any]]);
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Successfully callback"];
    [BooksSearchService searchBookWithKeyword:@"test" success:^(NSArray *books) {
        [expecation fulfill];
        assertThat(books, allOfIn(@[hasCountOf(2), everyItem(isA([Book class]))]));
    } failure:nil];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (void)testBookService_shouldInvokeFailureCallback_whenRequestFailed {
    id sessionManager = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub([sessionManager manager]).andReturn(sessionManager);
    NSError *mockError = [NSError errorWithDomain:@"MockError" code:400 userInfo:nil];
    OCMStub([sessionManager GET:[OCMArg any] parameters:[OCMArg any]
                       progress:[OCMArg any]
                        success:[OCMArg any]
                        failure:([OCMArg invokeBlockWithArgs:[OCMArg any], mockError, nil])]);
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Successfully callback"];
    [BooksSearchService searchBookWithKeyword:@"test" success:nil failure:^(NSError *error) {
        [expecation fulfill];
        assertThat(error, allOfIn(@[hasProperty(@"code", @(mockError.code)),
                                    hasProperty(@"domain", mockError.domain)]));
    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (NSDictionary *)mockedResponseDictionary {
    return @{@"books":@[@{@"id": @"123",
                          @"title": @"BookTitle",
                          @"author":@[@"John"],
                          @"image": @"http://test/image.jpg"},
                        @{@"id": @"456",
                          @"title": @"BookTitle2",
                          @"author":@[@"Jane"],
                          @"image": @"http://test/image2.jpg"}]};
}

@end
