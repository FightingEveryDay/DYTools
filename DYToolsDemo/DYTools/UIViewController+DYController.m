//
//  UIViewController+DYController.m
//  DYToolsDemo
//
//  Created by wdy on 2019/5/30.
//  Copyright © 2019 wdy. All rights reserved.
//

#import "UIViewController+DYController.h"

@implementation UIViewController (DYController)

- (void)dy_changeRootViewController:(UIViewController *)vc {
    [self dy_changeRootViewController:vc style:UIViewAnimationOptionTransitionCrossDissolve];
    
}

- (void)dy_changeRootViewController:(UIViewController *)vc style:(UIViewAnimationOptions)style {
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:style animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        
    }];
}

@end
