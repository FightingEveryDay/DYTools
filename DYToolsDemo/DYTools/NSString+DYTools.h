//
// Created by wdy on 2017/6/26.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DYTools)
/*
 * 追加字符串
 */
- (NSString *)append:(NSString *)string;
/*
 * 替换字符串
 * v1替换为v2
 */
- (NSString *)replace:(NSString *)v1 v:(NSString *)v2;
@end