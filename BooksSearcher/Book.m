//
//  Book.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        _bookID = dict[@"id"];
        _title = dict[@"origin_title"];
        _author = [self firstAuthorNameFromAuthorArray:dict[@"author"]];
        _image = dict[@"image"];
    }
    return self;
}

- (NSString *)firstAuthorNameFromAuthorArray:(NSArray *)authors {
    return (NSString *)authors.firstObject;
}

@end
