//
//  BooksSearchService.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "BooksSearchService.h"
#import <AFNetworking.h>
#import <Blockskit.h>
#import "Book.h"

static NSString *const BOOK_SEARCH_URL = @"https://api.douban.com/v2/book/search";

@implementation BooksSearchService

+ (void)searchBookWithKeyword:(NSString *)keyword success:(void (^)(NSArray *books))success failure:(void (^)(NSError *error))failure {
    [[AFHTTPSessionManager manager] GET:BOOK_SEARCH_URL parameters:@{@"q":keyword} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSArray *books = (NSArray *)((NSDictionary *)responseObject)[@"books"];
            NSArray *filteredBooks = [[books bk_map:^id(NSDictionary *dic) {
                return [[Book alloc] initWithDictionary:dic];
            }] bk_select:^BOOL(Book *book) {
                return book.bookID.length > 0 && book.title.length > 0;
            }];
            success(filteredBooks);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
