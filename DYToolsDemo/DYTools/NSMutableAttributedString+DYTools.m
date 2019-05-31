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

- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font expansion:(NSNumber *)expansion {
    [self dy_appendString:string withColor:color font:font Underline:NO expansion:expansion];
}

- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font Underline:(BOOL)underline {
    [self dy_appendString:string withColor:color font:font Underline:underline expansion:0];
}

- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font Underline:(BOOL)underline expansion:(NSNumber *)expansion {
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange range = NSMakeRange(0, string.length);
    [attString addAttribute:NSFontAttributeName value:font range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
    if (underline) {
        [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    }
    
    if (expansion && ![expansion isEqualToNumber:@0]) {
        [attString addAttribute:NSExpansionAttributeName value:expansion range:range];
    }
    
    [self appendAttributedString:attString];
}
-(CGFloat)dy_getSpaceLabelHeightWithWidth:(CGFloat)width {
    return [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
}
@end
