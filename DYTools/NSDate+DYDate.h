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

 @param aDate 需要比较的时间
 @return 0相等 1传入时间大 -1当前时间大 -2第一个参数错误 -3第二个参数错误 -4比较错误
 */
+ (int)dy_compareDate:(NSString *)aDate;
/**
 比较两个时间 (可传入类型为 NSDate 或者 NSString)

 @param aDate 第一个时间
 @param otherDate 第二个时间
 @return 0相等 1第一个时间大 -1第二个时间大 -2第一个参数错误 -3第二个参数错误 -4比较错误
 */
+ (int)dy_compareDate:(id)aDate otherDate:(id)otherDate;
@end
