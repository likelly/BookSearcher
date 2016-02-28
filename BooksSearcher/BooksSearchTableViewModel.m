//
//  BooksSearchTableViewModel.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "BooksSearchTableViewModel.h"

@interface BooksSearchTableViewModel()
@property (nonatomic) NSArray *cellModels;
@end

@implementation BooksSearchTableViewModel

- (void)searchBooksWithKeyword:(NSString *)keyword completion:(void (^)(void))completion {
    NSArray *books = @[@{@"id":@"111", @"origin_title": @"Le Petit Prince", @"author":@[@"[法] 圣埃克苏佩里"]},@{@"id":@"122", @"origin_title": @"Swift practise", @"author":@[@"some author"]}];
    
    
    
    if (completion) {
        completion();
    }
}

@end
