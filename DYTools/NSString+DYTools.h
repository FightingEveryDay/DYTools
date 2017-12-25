//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DYTools)
/*
 * 追加字符串
 */
- (NSString *)dy_append:(NSString *)string;
/*
 * 替换字符串
 * v1替换为v2
 */
- (NSString *)dy_replace:(NSString *)v1 v:(NSString *)v2;
/**
 正则匹配

 @param regex 正则表达式
 @return 是否正确
 */
- (BOOL)dy_isValidateByRegex:(NSString *)regex;
/**
 匹配11位手机号

 @return 是否为手机号
 */
- (BOOL)dy_isValidPhoneNumber;
@end
