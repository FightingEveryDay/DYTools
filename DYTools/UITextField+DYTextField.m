//
//  UITextField+DYTextField.m
//  RZYApp
//
//  Created by wdy on 2018/2/9.
//  Copyright © 2018年 RZY. All rights reserved.
//

#import "UITextField+DYTextField.h"

@implementation UITextField (DYTextField)

- (void)dy_setPlaceholderLeftPadding:(CGFloat)padding {
    NSAssert(padding, @"间距不能为空");
    CGRect frame = [self frame];
    frame.size.width = padding;
    [self setLeftView:[[UIView alloc]initWithFrame:frame]];
    [self setLeftViewMode:UITextFieldViewModeAlways];
}

@end
