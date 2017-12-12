//
// Created by wdy on 2017/11/17.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;
@interface DYTools : NSObject
/**
 * 创建单例
 * @return 返回类对象
 */
+ (instancetype)share;
/**
 ios 机型

 @return 机型字符串
 */
+ (NSString *)dy_platformModel;
/**
 获取通讯录 ### 需要在plist文件中同意此需求

 @param block 通讯录name:number
 */
+ (void)dy_getAdressBook:(void(^)(NSDictionary *dict))block;
@end