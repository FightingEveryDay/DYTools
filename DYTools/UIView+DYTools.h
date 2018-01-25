//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DY_ViewClick)(UIView *view);
@interface UIView (DYTools)
/**
 寻找对应类的视图
 
 @param clazz 寻找视图所需的类
 @return 找到的视图,没有没nil
 */
- (UIView *)dy_findWithClazz:(Class)clazz;
/**
 * 寻找对应类的视图
 * @param view 父视图
 * @param clazz 寻找视图所需的类
 * @return 找到的视图,没有没nil
 */
- (UIView *)dy_findView:(UIView *)view Clazz:(Class)clazz;
/**
 增加view的点击事件

 @param block view点击事件的回调
 */
- (void)dy_addClick:(DY_ViewClick)block;
@end
