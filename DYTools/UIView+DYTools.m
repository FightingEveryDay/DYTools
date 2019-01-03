//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "UIView+DYTools.h"
#import <objc/runtime.h>

@implementation UIView (DYTools)
static char ViewClickBlock;
- (UIView *)dy_findView:(UIView *)view Clazz:(Class)clazz {
    if ([view isKindOfClass:clazz]) return view;
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:clazz]) return subview;
        [self dy_findView:subview Clazz:clazz];
    }
    return nil;
}
- (UIView *)dy_findWithClazz:(Class)clazz {
    if ([self isKindOfClass:clazz]) return self;
    return [self dy_findView:self Clazz:clazz];
}
- (void)dy_addClick:(DY_ViewClick)block {
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, &ViewClickBlock, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
    [self addGestureRecognizer:tap];
}
- (void)dy_addClickWithAction:(DY_ViewClick_Action)block {
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, &ViewClickBlock, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClickWithAction:)];
    [self addGestureRecognizer:tap];
}
- (UIView *)dy_findSuperViewWithClazz:(Class)clazz {
    UIView *superView = self.superview;
    if ([superView isKindOfClass:clazz]) {
        return superView;
    }else {
        return [superView dy_findSuperViewWithClazz:clazz];
    }
}
- (void)viewClick:(UITapGestureRecognizer *)tap {
    DY_ViewClick block = objc_getAssociatedObject(self, &ViewClickBlock);
    if (block) {
        block(self);
    }
}
- (void)viewClickWithAction:(UIGestureRecognizer *)tap {
    DY_ViewClick_Action block = objc_getAssociatedObject(self, &ViewClickBlock);
    if (block) {
        block(self, tap);
    }
}
@end
