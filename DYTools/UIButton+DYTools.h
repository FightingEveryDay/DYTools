//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DY_ButtonClick)(UIButton *button);
@interface UIButton (DYTools)
/*
 * 为按钮添加点击事件
 */
- (void)dy_addClick:(DY_ButtonClick)block;
/*
 * 为按钮添加自定义事件
 */
- (void)dy_addAction:(DY_ButtonClick)block action:(UIControlEvents)events;
/**
 设置倒计时(多少秒后重发)

 @param time 时间设置
 */
- (void)dy_setAgainSendMessaageWithTime:(NSInteger)time;
/**
 关闭倒计时(默认为 获取验证码)
 */
- (void)dy_closeCountDown;
/**
 关闭倒计时

 @param title 结束后标题
 */
- (void)dy_closeCountDownWithTitle:(NSString *)title;
@end
