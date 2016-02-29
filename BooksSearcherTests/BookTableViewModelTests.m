//
//  BookTableViewModelTests.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/29/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Book.h"
#import "BooksSearchService.h"
#import "BookTableViewCellModel.h"
#import "BooksSearchTableViewModel.h"

@interface BookTableViewModelTests : XCTestCase
@end

@implementation BookTableViewModelTests

- (void)testViewModelSearchBook_shouldInvokedCompletion_whenSearchSuccess {
    id mockService = OCMClassMock([BooksSearchService class]);
    NSArray *books = [self responseBooks];
    OCMStub([mockService searchBookWithKeyword:[OCMArg any] success:([OCMArg invokeBlockWithArgs:books, nil]) failure:[OCMArg any]]);
    BooksSearchTableViewModel *model = [[BooksSearchTableViewModel alloc] init];
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Completion called"];
    [model searchBooksWithKeyword:@"test" completion:^(NSError *error) {
        [expecation fulfill];
        XCTAssert(YES);
    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (void)testViewModelSearchBook_shouldInvokedCompletionWithError_whenSearchFailed {
    id mockService = OCMClassMock([BooksSearchService class]);
    NSError *mockError = [NSError errorWithDomain:@"MockError" code:404 userInfo:nil];
    OCMStub([mockService searchBookWithKeyword:[OCMArg any] success:[OCMArg any] failure:([OCMArg invokeBlockWithArgs:mockError, nil])]);
    BooksSearchTableViewModel *model = [[BooksSearchTableViewModel alloc] init];
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Completion called"];
    [model searchBooksWithKeyword:@"test" completion:^(NSError *error) {
        [expecation fulfill];
        assertThat(error, allOfIn(@[hasProperty(@"code", @(mockError.code)),
                                    hasProperty(@"domain", mockError.domain)]));
    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (void)testViewModel_shouldGenerateCorrectCellModels_whenSearchSuccess {
    id mockService = OCMClassMock([BooksSearchService class]);
    NSArray *books = [self responseBooks];
    OCMStub([mockService searchBookWithKeyword:[OCMArg any] success:([OCMArg invokeBlockWithArgs:books, nil]) failure:[OCMArg any]]);
    BooksSearchTableViewModel *model = [[BooksSearchTableViewModel alloc] init];
    
    XCTestExpectation *expecation = [self expectationWithDescription:@"Completion called"];
    [model searchBooksWithKeyword:@"test" completion:^(NSError *error) {
        [expecation fulfill];
        assertThat(model.cellModels, allOfIn(@[hasCountOf(books.count), everyItem(isA([BookTableViewCellModel class]))]));
    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (NSArray *)responseBooks {
    return @[[[Book alloc] initWithDictionary:@{@"id": @"123",
                                                @"title": @"BookTitle",
                                                @"author":@[@"John"],
                                                @"image": @"http://test/image.jpg"}],
             [[Book alloc] initWithDictionary:@{@"id": @"123",
                                               @"title": @"BookTitle",
                                               @"author":@[@"John"],
                                               @"image": @"http://test/image.jpg"}]];
}
@end
