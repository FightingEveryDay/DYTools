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