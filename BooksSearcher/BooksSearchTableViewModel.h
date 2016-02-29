//
//  BooksSearchTableViewModel.h
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BooksSearchTableViewModel : NSObject

@property (nonatomic, readonly) NSArray *cellModels;

- (void)searchBooksWithKeyword:(NSString *)keyword completion:(void (^)(NSError *error))completion;

@end
