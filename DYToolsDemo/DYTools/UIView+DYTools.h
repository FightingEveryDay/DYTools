//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DY_ViewClick)(UIView *view);
typedef void(^DY_ViewClick_Action)(UIView *view, UIGestureRecognizer *gesture);
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
 寻找指定父视图

 @param clazz 父视图类
 @return 找到的父视图,没有为nil
 */
- (UIView *)dy_findSuperViewWithClazz:(Class)clazz;
/**
 增加view的点击事件 (下面两个方法只能择其一选择)

 @param block view点击事件的回调
 */
- (void)dy_addClick:(DY_ViewClick)block;
- (void)dy_addClickWithAction:(DY_ViewClick_Action)block;
@end
