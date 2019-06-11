//
// Created by wdy on 2017/11/21.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "UIImage+DYImage.h"
#import <objc/runtime.h>

static const void *minW = &minW;
static const void *minH = &minH;
@implementation UIImage (DYImage)

#pragma mark ----------- public method
+ (NSData *)dy_compressImageToData:(UIImage *)image Byte:(NSUInteger)maxLength {
    if (!image || !maxLength) {
        return nil;
    }
    image = [self compressWH:image];

    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return data;

    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    return data;
}
+ (UIImage *)dy_compressImageToImage:(UIImage *)image Byte:(NSUInteger)maxLength {
    return [UIImage imageWithData:[self dy_compressImageToData:image Byte:maxLength]];
}
+ (UIImage *)dy_compressSourceImage:(UIImage *)image size:(CGSize)size {
    CGFloat scale = [[UIScreen mainScreen] scale];
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (UIImage *)dy_compressImageWithSize:(CGSize)size {
    return [UIImage dy_compressSourceImage:self size:size];
}
- (UIImage *)dy_imageWithColor:(UIColor *)color {
    return [self dy_imageWithColor:color scale:1];
}
- (UIImage *)dy_imageWithColor:(UIColor *)color scale:(CGFloat)scale {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale * scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (UIImage *)dy_imageWithBackgroundColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawInRect:rect];
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (UIImage *)dy_imageWithMultiple:(CGFloat)multiple {
    CGFloat newMultiple = multiple;
    if (multiple == 0) {
        newMultiple = 1;
    }else if((fabs(multiple) > 0 && fabs(multiple) < 1) || (fabs(multiple)>1 && fabs(multiple)<2)) {
        newMultiple = multiple;
    }else {
        newMultiple = 1;
    }
    CGFloat w = self.size.width*newMultiple;
    CGFloat h = self.size.height*newMultiple;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIImage *tempImage = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:0] addClip];
    [self drawInRect:imageFrame];
    tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempImage;
}
#pragma mark --------- private method
+ (UIImage *)compressWH:(UIImage *)image {
    if (image.size.width < 2000 && image.size.height < 1500) return image;
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    CGFloat k = 0.0f;
    CGSize size = CGSizeMake(2000, 1500);
    if (image.size.width > 2000) {
        k = image.size.width / 2000;
        imageH = image.size.height / k;
        size = CGSizeMake(2000, imageH);
    }
    if (imageH > 1500) {
        k = image.size.height / 1500;
        imageW = image.size.width / k;
        size = CGSizeMake(imageW, 1500);
    }
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    return image;
}
- (void)setDy_compressImageMinW:(NSInteger)dy_compressImageMinW {
    objc_setAssociatedObject(self, minW, @(dy_compressImageMinW), OBJC_ASSOCIATION_ASSIGN);
}
- (NSInteger)dy_compressImageMinW {
    NSInteger min_w = [objc_getAssociatedObject(self, minW) integerValue];
    if (!min_w) {
        min_w = 2000;
    }
    return min_w;
}
- (void)setDy_compressImageMinH:(NSInteger)dy_compressImageMinH {
    objc_setAssociatedObject(self, minH, @(dy_compressImageMinH), OBJC_ASSOCIATION_ASSIGN);
}
- (NSInteger)dy_compressImageMinH {
    NSInteger min_h = [objc_getAssociatedObject(self, minH) integerValue];
    if (!min_h) {
        min_h = 1500;
    }
    return min_h;
}
@end
