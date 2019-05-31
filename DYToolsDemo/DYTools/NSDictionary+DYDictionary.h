//
//  NSDictionary+DYDictionary.h
//  RZYApp
//
//  Created by wdy on 2017/12/21.
//  Copyright © 2017年 RZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DYDictionary)

/**
 字典转JSON

 @return JSON字符串
 */
- (NSString *)dy_toJSSON;
/**
 预防取出空值导致程序崩溃

 @param key key
 @return id
 */
- (id)dy_objectForKey:(NSString *)key;
@end
