//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ButtonClick)(UIButton *button);
@interface UIButton (DYTools)
/*
 * 为按钮添加点击事件
 */
- (void)addClick:(ButtonClick)block;
/*
 * 为按钮添加自定义事件
 */
- (void)addAction:(ButtonClick)block action:(UIControlEvents)events;
@end