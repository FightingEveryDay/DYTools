//
// Created by wdy on 2017/7/14.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DY_HEXCOLOR(string) [UIColor dy_colorWithHexString:string]
@interface UIColor (DYColor)
/**
 * hexColor方法
 * @param hexColor hexColor的字符串
 * @return 返回一个颜色
 */
+ (UIColor *)dy_colorWithHexString:(NSString *)hexColor;

/**
 hex color alpha

 @param hexColor 哈希z字符串
 @param alpha 透明度
 @return 返回一个颜色
 */
+ (UIColor *)dy_alphaHexColor:(NSString *)hexColor alpha:(CGFloat)alpha;
@end
