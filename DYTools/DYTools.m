//
// Created by wdy on 2017/11/17.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "DYTools.h"


@implementation DYTools

+ (instancetype)share {
    static DYTools *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        obj = [[DYTools alloc] init];
    });
    return obj;
}

@end