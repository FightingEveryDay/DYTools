//
//  NSDate+DYDate.h
//  RZYApp
//
//  Created by wdy on 2018/4/9.
//  Copyright © 2018年 RZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DYDate)

/**
 与当前时间比较 (可传入类型为NSString)
 2000年       now
  -1     0     1

 @param aDate 传入时间
 @return (以现在时间为基准) 0相等 1传入时间靠前 -1传入时间靠后 -3传入参数错误
 */
+ (int)dy_compareDate:(NSString *)aDate;
/**
 比较两个时间 (可传入类型为 NSDate 或者 NSString)

 @param aDate 第一个时间
 @param otherDate 第二个时间
 @return 0相等 1第一个时间大 -1传入时间大 -2第一个参数错误 -3第二个参数错误
 */
+ (int)dy_compareDate:(id)aDate otherDate:(id)otherDate;
/**
 返回时间相差多少,例如活动时间 返回跟unit有关
 记得在取值时 加上 labs() 函数,有可能是负值

 @param endDate 结束时间
 @param unit 返回单位
 @return NSDateComponents对象 里面包含时间,具体看里面属性
 */
+ (NSDateComponents *)dy_lessSecondToDays:(NSString *)endDate unit:(NSCalendarUnit)unit;
/**
 返回时间相差多少,例如活动时间 返回跟unit有关
 记得在取值时 加上 labs() 函数,有可能是负值

 @param startDate 开始时间
 @param endDate 结束时间
 @param unit 返回单位
 @return NSDateComponents对象 里面包含时间,具体看里面属性
 */
+ (NSDateComponents *)dy_lessWithStartTime:(NSString *)startDate endTime:(NSString *)endDate unit:(NSCalendarUnit)unit;
/**
 获取和指定时间相差秒数

 @param endTime 指定时间
 @return 秒数
 */
+ (NSUInteger)dy_getCountDownStringWithEndTime:(NSString *)endTime;
/**
 获取和指定时间相差秒数

 @param startTime 开始时间
 @param endTime 结束时间
 @return 相差时间
 */
+ (NSUInteger)dy_getCountDownStringWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
/**
 根据秒数获取时间

 @param seconds 秒数
 @return 获取的时间字符串
 */
+ (NSString *)dy_getMMSSFromSS:(NSInteger)seconds;
@end
