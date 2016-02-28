//
//  BookTableViewCellModel.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "BookTableViewCellModel.h"
#import "Book.h"

@interface BookTableViewCellModel()
@property (nonatomic) Book *book;
@end

@implementation BookTableViewCellModel

- (instancetype)initWithBook:(Book *)book {
    if (self = [super init]) {
        _book = book;
    }
    return self;
}

- (NSString *)title {
    return self.book.title;
}

- (NSString *)author {
    return self.book.author;
}

- (NSURL *)imageUrl {
    return self.book.image.length > 0 ? [NSURL URLWithString:self.book.image] : nil;
}

@end
