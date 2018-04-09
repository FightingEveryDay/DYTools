//
//  NSDate+DYDate.m
//  RZYApp
//
//  Created by wdy on 2018/4/9.
//  Copyright © 2018年 RZY. All rights reserved.
//

#import "NSDate+DYDate.h"

@implementation NSDate (DYDate)
+ (int)dy_compareDate:(NSString *)aDate {
    NSDate *date = [NSDate date];
    return [self dy_compareDate:aDate otherDate:date];
}
+ (int)dy_compareDate:(id)aDate otherDate:(id)otherDate {
    if ([aDate isKindOfClass:[NSString class]]) {
        aDate = [self stringToDate:aDate];
    }
    if ([otherDate isKindOfClass:[NSString class]]) {
        otherDate = [self stringToDate:otherDate];
    }
    if (![aDate isKindOfClass:[NSDate class]]) {
        return -2;
    }
    if (![otherDate isKindOfClass:[NSDate class]]) {
        return -3;
    }
    
    NSTimeInterval secs = [aDate timeIntervalSinceDate:otherDate];
    if (secs == 0) {
        return 0;
    }else if(secs > 0) {
        return 1;
    }else if (secs < 0) {
        return -1;
    }
    return -4;
}

+ (NSDate *)stringToDate:(NSString *)str {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:str];
    return date;
}
@end
