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
    if (!padding) padding = 1.f;
    CGRect frame = [self frame];
    frame.size.width = padding;
    [self setLeftView:[[UIView alloc]initWithFrame:frame]];
    [self setLeftViewMode:UITextFieldViewModeAlways];
}

- (void)dy_setPlaceholderFont:(UIFont *)font {
    
    [self setValue:font forKeyPath:@"_placeholderLabel.font"];
}

@end
