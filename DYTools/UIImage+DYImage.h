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
/**
 压缩图片到指定大小

 @param image 源图片
 @param size 指定大小
 @return 压缩过的图片
 */
+ (UIImage *)dy_compressSourceImage:(UIImage *)image size:(CGSize)size;
/**
 压缩图片到指定大小
 
 @param size 指定大小
 @return 压缩过的图片
 */
- (UIImage *)dy_compressImageWithSize:(CGSize)size;
/**
 修改图片的填充颜色

 @param color 图片填充新颜色
 @return 填充新颜色的图片
 */
- (UIImage *)dy_imageWithColor:(UIColor *)color;
/**
 修改图片填充颜色,并放大或缩小

 @param color 填充颜色
 @param scale 放大/缩小 倍数
 @return 新图片
 */
- (UIImage *)dy_imageWithColor:(UIColor *)color scale:(CGFloat)scale;
/**
 修改图片的背景颜色

 @param color 图片的背景颜色
 @return 带背景颜色的图片
 */
- (UIImage *)dy_imageWithBackgroundColor:(UIColor *)color;
/**
 放大/缩小图片

 @param multiple 倍数
 @return 新图片
 */
- (UIImage *)dy_imageWithMultiple:(CGFloat)multiple;
@end
