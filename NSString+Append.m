//
//  NSString+Append.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "NSString+Append.h"
#import "FeatureToggles.h"

@implementation NSString (Append)

- (NSString *)appendAnotherString:(NSString *)other {
    return [[FeatureToggles shareInstance] isAutoSeperateStringWhenAppendToggleOn] ?
            [self stringByAppendingString:[NSString stringWithFormat:@"-%@", other]] :
            [self stringByAppendingString:other];
}


- (void)appendString:(NSString *)other resultHandler:(void(^)(NSString *result))handler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *resultString = [self stringByAppendingString:other];
        if (handler) {
            sleep(1);
            handler(resultString);
        }
    });
}

@end
