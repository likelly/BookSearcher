//
//  BooksSearchTableViewModel.h
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BooksSearchTableViewModel : NSObject

- (void)searchBooksWithKeyword:(NSString *)keyword completion:(void (^)(NSArray *books))completion;

@end
