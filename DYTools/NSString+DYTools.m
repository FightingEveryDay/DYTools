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
- (NSString *)dy_replaceSpecialCharacters:(NSArray <NSString *>*)array {
    for (NSString *str in array) {
        [self dy_replace:str v:@""];
    }
    return self;
}
- (BOOL)dy_isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}
- (BOOL)dy_isValidPhoneNumber {
    NSString *regex = @"^[0-9]{11}";
    return [self dy_isValidateByRegex:regex];
}
- (CGFloat)dy_getStringHeightWithSize:(CGSize)size font:(UIFont *)font   {
    NSDictionary *attrs = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    return rect.size.height;
}
- (NSString *)dy_deleteSpace {
    if ([self isEqualToString:@""] || !self) {
        return @"";
    }
    return [self dy_replaceSpecialCharacters:@[@" ",@"\r",@"\\",@"\n",@"\t"]];
}
- (NSString *)dy_stringToDecimalNumber {
    NSDecimalNumber *dec = [NSDecimalNumber decimalNumberWithString:self];
    
    if (dec) return [NSString stringWithFormat:@"%.2f", dec.doubleValue];
    return @"0.00";
}
@end
