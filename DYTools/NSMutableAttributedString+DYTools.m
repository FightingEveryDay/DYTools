//
//  NSMutableAttributedString+DYTools.m
//  RZYApp
//
//  Created by wdy on 2017/12/12.
//  Copyright © 2017年 RZY. All rights reserved.
//

#import "NSMutableAttributedString+DYTools.h"

@implementation NSMutableAttributedString (DYTools)
- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font {
    [self dy_appendString:string withColor:color font:font Underline:NO];
}

- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font Underline:(BOOL)underline {
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange range = NSMakeRange(0, string.length);
    [attString addAttribute:NSFontAttributeName value:font range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
    if (underline) {
        [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    }
    
    [self appendAttributedString:attString];
}
@end
