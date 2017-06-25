//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "NSString+DYTools.h"


@implementation NSString (DYTools)

- (NSString *)append:(NSString *)string {
    return [NSString stringWithFormat:@"%@%@", self, string];
}
- (NSString *)replace:(NSString *)v1 v:(NSString *)v2 {
    return [self stringByReplacingOccurrencesOfString:v1 withString:v2];
}

@end