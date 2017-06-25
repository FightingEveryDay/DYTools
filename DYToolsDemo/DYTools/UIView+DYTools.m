//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "UIView+DYTools.h"


@implementation UIView (DYTools)
- (UIView *)findView:(UIView *)view Clazz:(Class)clazz {
    if ([view isKindOfClass:clazz]) return view;
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:clazz]) return subview;
        [self findView:subview Clazz:clazz];
    }
    return nil;
}
@end