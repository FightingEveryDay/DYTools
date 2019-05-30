//
//  NSMutableAttributedString+DYTools.h
//  RZYApp
//
//  Created by wdy on 2017/12/12.
//  Copyright © 2017年 RZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (DYTools)
/**
 组装富文本
 
 @param string 富文本内容
 @param color 富文本颜色
 @param font 富文本字体
 */
- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font;
/**
 组装富文本
 
 @param string 富文本内容
 @param color 富文本颜色
 @param font 富文本字体
 @param underline 是否下划线
 */
- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font Underline:(BOOL)underline;
/**
 组装富文本

 @param string 富文本内容
 @param color 富文本颜色
 @param font 富文本字体
 @param expansion 富文本扩展 正数为横向扩展
 */
- (void)dy_appendString:(NSString *)string withColor:(UIColor *)color font:(UIFont *)font expansion:(NSNumber *)expansion;
/**
 计算富文本字体高度

 @param width 文本宽度
 @return 文本高度
 */
-(CGFloat)dy_getSpaceLabelHeightWithWidth:(CGFloat)width;
@end
