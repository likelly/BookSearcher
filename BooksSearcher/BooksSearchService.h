//
//  BooksSearchService.h
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BooksSearchService : NSObject

+ (void)searchBookWithKeyword:(NSString *)keyword success:(void (^)(NSArray *books))success failure:(void (^)(NSError *error))failure;

@end
