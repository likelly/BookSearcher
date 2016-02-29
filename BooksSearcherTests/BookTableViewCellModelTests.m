//
//  BookTableViewCellModelTests.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/29/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Book.h"
#import "BookTableViewCellModel.h"

@interface BookTableViewCellModelTests : XCTestCase
@property (nonatomic) BookTableViewCellModel *cellModel;
@end

@implementation BookTableViewCellModelTests

- (void)setUp {
    [super setUp];
    
    NSDictionary *bookDic = @{@"id": @"123",
                              @"title": @"BookTitle",
                              @"author":@[@"John"],
                              @"image": @"http://test/image.jpg"};
    Book *book = [[Book alloc] initWithDictionary:bookDic];
    _cellModel = [[BookTableViewCellModel alloc] initWithBook:book];
}

- (void)testTitle {
    assertThat([self.cellModel title], is(@"BookTitle"));
}

- (void)testAuthor {
    assertThat([self.cellModel author], is(@"John"));
}

- (void)testImageUrl {
    assertThat([self.cellModel imageUrl].absoluteString, is(@"http://test/image.jpg"));
}

@end
