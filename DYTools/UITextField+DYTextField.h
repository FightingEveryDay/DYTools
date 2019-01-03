//
//  UITextField+DYTextField.h
//  RZYApp
//
//  Created by wdy on 2018/2/9.
//  Copyright © 2018年 RZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DYTextField)
/**
 设置placeholder间距

 @param padding 间距
 */
- (void)dy_setPlaceholderLeftPadding:(CGFloat)padding;
/**
 设置placeholder字体大小

 @param font 字体
 */
- (void)dy_setPlaceholderFont:(UIFont *)font;
@end
