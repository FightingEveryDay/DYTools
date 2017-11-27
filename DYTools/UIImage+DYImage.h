//
// Created by wdy on 2017/11/21.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DYImage)
/**
 * 压缩图片后的最小宽度
 */
@property(nonatomic, assign) NSInteger dy_compressImageMinW;
/**
 * 压缩图片后的最小高度
 */
@property(nonatomic, assign) NSInteger dy_compressImageMinH;
/**
 * 压缩图片(先压缩宽高，满足就返回图片，如果还是大，则压缩质量）
 * @param image 源图片
 * @param maxLength 压缩大小，kb为单位
 * @return 返回图片的Data数据
 */
+ (NSData *)dy_compressImageToData:(UIImage *)image Byte:(NSUInteger)maxLength;
/**
 * 压缩图片(先压缩宽高，满足就返回图片，如果还是大，则压缩质量）
 * @param image 源图片
 * @param maxLength 压缩大小，kb为单位
 * @return 返回图片UIImage类型
 */
+ (UIImage *)dy_compressImageToImage:(UIImage *)image Byte:(NSUInteger)maxLength;
@end