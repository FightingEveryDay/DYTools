//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "NSString+DYTools.h"


@implementation NSString (DYTools)

- (NSString *)dy_append:(NSString *)string {
    return [NSString stringWithFormat:@"%@%@", self, string];
}
- (NSString *)dy_replace:(NSString *)v1 v:(NSString *)v2 {
    return [self stringByReplacingOccurrencesOfString:v1 withString:v2];
}
- (BOOL)dy_isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}
- (BOOL)dy_isValidPhoneNumber {
    NSString *regex = @"^[0-9]{11}";
    return [self dy_isValidateByRegex:regex];
}
@end
