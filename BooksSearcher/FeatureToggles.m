//
//  FeatureToggles.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/29/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "FeatureToggles.h"

@implementation FeatureToggles

+ (instancetype)shareInstance {
    static FeatureToggles *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FeatureToggles alloc] init];
    });
    return instance;
}

- (BOOL)isAutoSeperateStringWhenAppendToggleOn {
    return YES;
}

@end
