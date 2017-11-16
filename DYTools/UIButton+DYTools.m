//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "UIButton+DYTools.h"
#import <objc/runtime.h>

@implementation UIButton (DYTools)
static char Action;
- (void)dy_addClick:(void(^)(UIButton *button))block {
    [self dy_addAction:block action:UIControlEventTouchUpInside];
}
- (void)dy_addAction:(DY_ButtonClick)block action:(UIControlEvents)events {
    objc_setAssociatedObject(self, &Action, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClick:) forControlEvents:events];
}
- (void)buttonClick:(UIButton *)sender {
    DY_ButtonClick buttonClick = objc_getAssociatedObject(self, &Action);
    if (buttonClick) buttonClick(self);
}
@end
