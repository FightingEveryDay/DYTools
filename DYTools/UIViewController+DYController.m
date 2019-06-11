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
    [self dy_changeRootViewController:vc style:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
}

- (void)dy_changeRootViewController:(UIViewController *)vc style:(UIViewAnimationOptions)style completion:(void (^ __nullable)(BOOL finished))completion {
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:style animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        [UIView setAnimationsEnabled:oldState];
    } completion:completion];
}

- (BOOL)dy_isMobileNumber:(NSString *)mobileNum {
    if (mobileNum.length != 11){
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
     * 电信号段: 133,149,153,170,173,177,180,181,189
     */
    
    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|16[6]|7[0135678]|8[0-9]|19[89])\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,170,171,175,176,185,186
     */
    
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    
    /**
     * 中国电信：China Telecom
     * 133,149,153,170,173,177,180,181,189
     */
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }else{
        return NO;
    }
}

@end
