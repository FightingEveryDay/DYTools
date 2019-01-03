//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "UIButton+DYTools.h"
#import <objc/runtime.h>

@implementation UIButton (DYTools)
static char Action;
static char CountDownTimer;
static char DY_count_down_time;
- (void)dy_addClick:(DY_ButtonClick)block {
    [self dy_addAction:block action:UIControlEventTouchUpInside];
}
- (void)dy_addAction:(DY_ButtonClick)block action:(UIControlEvents)events {
    objc_setAssociatedObject(self, &Action, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClick:) forControlEvents:events];
}
- (void)buttonClick:(UIButton *)sender {
    __weak DY_ButtonClick buttonClick = objc_getAssociatedObject(self, &Action);
    if (buttonClick) buttonClick(self);
}
- (void)dy_setAgainSendMessaageWithTime:(NSInteger)time {
    [self setEnabled:NO];
    [self setDy_time:@(time)];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    objc_setAssociatedObject(self, &CountDownTimer, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)countDown {
    NSInteger time = [[self dy_time] integerValue];
    time --;
    [self setDy_time:@(time)];
    if (self.isEnabled == NO) {
        [self setTitle:[NSString stringWithFormat:@"%ld秒重发", (long)time] forState:UIControlStateNormal];
    }
    if (time == 0) {
        //关闭定时器
        [self dy_closeCountDown];
    }
}
- (void)dy_closeCountDown {
    [self dy_closeCountDownWithTitle:@"获取验证码"];
}
- (void)dy_closeCountDownWithTitle:(NSString *)title {
    NSTimer *timer = objc_getAssociatedObject(self, &CountDownTimer);
    [timer setFireDate:[NSDate distantFuture]];
    [timer invalidate];
    timer = nil;
    [self setEnabled:YES];
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)setDy_time:(NSNumber *)dy_time {
    objc_setAssociatedObject(self, &DY_count_down_time, dy_time, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)dy_time {
    return objc_getAssociatedObject(self, &DY_count_down_time);
}
- (void)dy_buttonImageTextPositionType:(DYButtonPositionType)type {
    [self dy_buttonImageTextPositionType:type imageTitleSpace:5.f];
}
- (void)dy_buttonImageTextPositionType:(DYButtonPositionType)type
                        imageTitleSpace:(CGFloat)space {
    // 1. 得到imageView和titleLabel的宽、高
    //    CGFloat imageWith = self.imageView.frame.size.width;
    //    CGFloat imageHeight = self.imageView.frame.size.height;
    CGFloat imageWith = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (type) {
        case DYButtonImageTopTextBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space, 0);
        }
            break;
        case DYButtonImageLeftTextRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space, 0, space);
            labelEdgeInsets = UIEdgeInsetsMake(0, space, 0, -space);
        }
            break;
        case DYButtonImageBottomTextTop: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space, -imageWith, 0, 0);
        }
            break;
        case DYButtonImageRightTextLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space, 0, -labelWidth-space);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space, 0, imageWith+space);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
@end
