//
//  BookTableViewCellModel.h
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Book;

@interface BookTableViewCellModel : NSObject

- (instancetype)initWithBook:(Book *)book;

- (NSString *)title;
- (NSString *)author;
- (NSURL *)imageUrl;

@end
