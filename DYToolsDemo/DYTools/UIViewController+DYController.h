//
//  UIViewController+DYController.h
//  DYToolsDemo
//
//  Created by wdy on 2019/5/30.
//  Copyright © 2019 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DYController)

- (void)dy_changeRootViewController:(UIViewController *)vc;

- (void)dy_changeRootViewController:(UIViewController *)vc style:(UIViewAnimationOptions)style;

@end

NS_ASSUME_NONNULL_END
