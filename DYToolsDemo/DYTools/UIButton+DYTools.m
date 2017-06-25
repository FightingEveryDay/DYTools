//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "UIButton+DYTools.h"
#import <objc/runtime.h>

@implementation UIButton (DYTools)
static char Action;
- (void)addClick:(void(^)(UIButton *button))block {
    [self addAction:block action:UIControlEventTouchUpInside];
}
- (void)addAction:(ButtonClick)block action:(UIControlEvents)events {
    objc_setAssociatedObject(self, &Action, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClick:) forControlEvents:events];
}

- (void)buttonClick:(UIButton *)sender {
    ButtonClick buttonClick = objc_getAssociatedObject(self, &Action);
    if (buttonClick) buttonClick(self);
}
@end