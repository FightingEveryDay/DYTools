//
//  UITextView+DYTextView.h
//  BXApp
//
//  Created by wdy on 2019/5/16.
//  Copyright © 2019 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (DYTextView)
/**
 * 给textview添加paceholder属性
 * @param placeholdStr 提示文字
 */
- (void)dy_setPlaceholder:(NSString *)placeholdStr;
/**
 给textview添加placeholer属性
 */
- (void)dy_setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor;
@end

NS_ASSUME_NONNULL_END
