//
//  NSString+Append.h
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Append)
- (NSString *)appendAnotherString:(NSString *)other;
- (void)appendString:(NSString *)other resultHandler:(void(^)(NSString *result))handler;
@end
