//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DYTools)
/*
 * 找相同类的视图
 */
- (UIView *)findView:(UIView *)view Clazz:(Class)clazz;

@end