//
// Created by wdy on 2017/11/17.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

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
//+ (void)dy_getAdressBook:(void(^)(NSDictionary *dict))block;
/**
 生成一个uuid随机字符串(小写)

 @return uuid字符串
 */
+ (NSString *)dy_uuid;
/**
 获取缓存

 @return 缓存大小 单位MB
 */
+ (CGFloat)dy_getCache;
/**
 获取某一路经下的文件大小

 @param folderPath 文件路径
 @return 缓存大小 单位MB
 */
+ (CGFloat)folderSizeAtPath:(NSString *)folderPath;
/**
 清除缓存
 */
+ (void)dy_clearFile;
@end
