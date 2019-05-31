//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "UIKit/UIKit.h"

@interface NSString (DYTools)
/*
 * 追加字符串
 */
- (NSString *)dy_append:(NSString *)string;
/*
 * 替换字符串
 * v1替换为v2
 */
- (NSString *)dy_replace:(NSString *)v1 v:(NSString *)v2;
/**
 正则匹配

 @param regex 正则表达式
 @return 是否正确
 */
- (BOOL)dy_isValidateByRegex:(NSString *)regex;
/**
 匹配11位手机号

 @return 是否为手机号
 */
- (BOOL)dy_isValidPhoneNumber;
/**
 获取字符串高度

 @param size 字符串宽高
 @param font 字体
 @return 高度
 */
- (CGFloat)dy_getStringHeightWithSize:(CGSize)size font:(UIFont *)font;
/**
 删除空格符

 @return 删除空格符后的字符
 */
- (NSString *)dy_deleteSpace;
/**
 string转为金额,默认保留2为小数

 @return 金额字符串
 */
- (NSString *)dy_stringToDecimalNumber;
@end
