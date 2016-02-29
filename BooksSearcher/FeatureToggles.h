//
//  FeatureToggles.h
//  BooksSearcher
//
//  Created by Heng Zeng on 2/29/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatureToggles : NSObject

+ (instancetype)shareInstance;

- (BOOL)isAutoSeperateStringWhenAppendToggleOn;

@end
