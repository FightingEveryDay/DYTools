//
//  UITextView+DYTextView.m
//  BXApp
//
//  Created by wdy on 2019/5/16.
//  Copyright © 2019 wdy. All rights reserved.
//

#import "UITextView+DYTextView.h"

//系统版本
#define HKVersion [[[UIDevice currentDevice] systemVersion] floatValue]

@implementation UITextView (DYTextView)

- (void)dy_setPlaceholder:(NSString *)placeholdStr {
    [self dy_setPlaceholder:placeholdStr placeholdColor:DY_HEXCOLOR(@"#999999")];
}

- (void)dy_setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor {
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholdStr;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    /*
     [self setValue:(nullable id) forKey:(nonnull NSString *)]
     ps: KVC键值编码，对UITextView的私有属性进行修改
     */
    if (HKVersion >= 8.3) {
        UILabel *placeholder = [self valueForKey:@"_placeholderLabel"];
        //防止重复
        if (placeholder) {
            [placeholder removeFromSuperview];
        }
        [self addSubview:placeHolderLabel];
        [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
}
@end
