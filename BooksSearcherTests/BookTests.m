//
//  BookTests.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Book.h"

@interface BookTests : XCTestCase
@end

@implementation BookTests

- (void)testBook_shouldInitializedCorrect {
    NSDictionary *bookDic = @{@"id": @"123",
                              @"title": @"BookTitle",
                              @"author":@[@"John"],
                              @"image": @"http://test/image.jpg"};
    
    Book *book = [[Book alloc] initWithDictionary:bookDic];
    
    assertThat(book.bookID, is(@"123"));
    assertThat(book, hasProperty(@"title", @"BookTitle"));
    assertThat(book.author, equalTo(@"John"));
    assertThat(book.image, is(@"http://test/image.jpg"));
}

@end
