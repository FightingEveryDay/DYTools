//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DYTools)
/**
 * 寻找对应类的视图
 * @param view 父视图
 * @param clazz 寻找视图所需的类
 * @return 找到的视图,没有没nil
 */
- (UIView *)dy_findView:(UIView *)view Clazz:(Class)clazz;

@end