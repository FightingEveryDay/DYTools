//
//  NSDate+DYDate.m
//  RZYApp
//
//  Created by wdy on 2018/4/9.
//  Copyright © 2018年 RZY. All rights reserved.
//

#import "NSDate+DYDate.h"
#import "NSString+DYTools.h"

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
    if(secs > 0) {
        return 1;
    }else if (secs < 0) {
        return -1;
    }
    return 0;
}

+ (NSDate *)stringToDate:(NSString *)str {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:str];
    if (!date) {
        date = [dateFormatter dateFromString:[str stringByAppendingString:@":00"]];
    }
    return date;
}
+ (NSDateComponents *)dy_lessWithStartTime:(NSString *)startDate endTime:(NSString *)endDate unit:(NSCalendarUnit)unit {
    if (!startDate || !endDate) return 0;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    NSDate *startTime = [formatter dateFromString:startDate]; // startTime
    NSDate *endTime = [formatter dateFromString:endDate]; // endTime
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:unit fromDate:endTime toDate:startTime options:0];
}

+ (NSDateComponents *)dy_lessSecondToDays:(NSString *)endDate unit:(NSCalendarUnit)unit {
    NSDate *nowDate = [NSDate date]; // 当前时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    return [self dy_lessWithStartTime:[formatter stringFromDate:nowDate] endTime:endDate unit:unit];
}
+ (NSUInteger)dy_getCountDownStringWithEndTime:(NSString *)endTime {
    NSDateComponents *comp = [self dy_lessSecondToDays:endTime unit:NSCalendarUnitSecond];
    NSUInteger second = labs(comp.second);
    return second;
}
+ (NSUInteger)dy_getCountDownStringWithStartTime:(NSString *)startTime endTime:(NSString *)endTime {
    NSDateComponents *comp = [self dy_lessWithStartTime:startTime endTime:endTime unit:NSCalendarUnitSecond];
    return comp.second;
}
+ (NSString *)dy_getMMSSFromSS:(NSInteger)seconds {
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}
@end
