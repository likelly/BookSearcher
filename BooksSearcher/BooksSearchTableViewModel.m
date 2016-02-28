//
//  BooksSearchTableViewModel.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "BooksSearchTableViewModel.h"
#import <BlocksKit.h>
#import "Book.h"
#import "BookTableViewCellModel.h"
#import "BooksSearchService.h"

@interface BooksSearchTableViewModel()
@property (nonatomic) NSArray *cellModels;
@end

@implementation BooksSearchTableViewModel

- (void)searchBooksWithKeyword:(NSString *)keyword completion:(void (^)())completion {

    [BooksSearchService searchBookWithKeyword:keyword success:^(NSArray *books) {
        _cellModels = [books bk_map:^id(Book *book) {
            return [[BookTableViewCellModel alloc] initWithBook:book];
        }];
        
        if (completion) {
            completion();
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion();
        }
    }];
    
}

@end
