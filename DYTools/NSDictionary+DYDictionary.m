//
//  NSDictionary+DYDictionary.m
//  RZYApp
//
//  Created by wdy on 2017/12/21.
//  Copyright © 2017年 RZY. All rights reserved.
//

#import "NSDictionary+DYDictionary.h"

@implementation NSDictionary (DYDictionary)

- (NSString *)dy_toJSSON {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (!jsonData) {
#if DEBUG
        NSLog(@"Got an error: %@", error);
#endif
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
- (id)dy_objectForKey:(NSString *)key {
    
    if ([self.allKeys containsObject:key]) {
        return [self valueForKey:key];
    }
    return @"";
}
@end
