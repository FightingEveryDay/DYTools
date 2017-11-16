//
// Created by wdy on 2017/7/14.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DYColor)
/**
 * hexColor方法
 * @param hexColor hexColor的字符串
 * @return 返回一个颜色
 */
+ (UIColor *)dy_colorWithHexString:(NSString *)hexColor;
@end