//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DY_ButtonClick)(UIButton *button);

typedef NS_ENUM(NSUInteger, DYButtonPositionType) {
    DYButtonImageTopTextBottom,    //图上文下
    DYButtonImageBottomTextTop,    //图下文上
    DYButtonImageLeftTextRight,    //图左文右
    DYButtonImageRightTextLeft     //图右文左
};
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
/**
 按钮的图文排列顺序

 @param type 枚举值
 */
- (void)dy_buttonImageTextPositionType:(DYButtonPositionType)type;
/**
 按钮的图文排列顺序

 @param type 枚举值
 @param space 图文间距,默认为5
 */
- (void)dy_buttonImageTextPositionType:(DYButtonPositionType)type imageTitleSpace:(CGFloat)space;
@end
