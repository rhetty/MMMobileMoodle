//
//  NSDictionary+Extends.m
//  MicroSchool-Teacher
//
//  Created by macbook on 15/12/21.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import "NSDictionary+Extends.h"

@implementation NSDictionary (Extends)

-(NSString *)toJsonString{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


+(NSMutableDictionary *)dicRemoveNull:(id)dic{
    if (![[[dic class] description] containsString:@"NSMutableDictionary"]) {
        dic = [NSMutableDictionary dictionaryWithDictionary:dic];
    }
    for (NSString *key in [dic allKeys]) {
        if ([dic[key] isKindOfClass:[NSNull class]]) {
            [dic removeObjectForKey:key];
        }
        if ([dic[key] isKindOfClass:[NSDictionary class]]) {
            [dic setObject:[self dicRemoveNull:dic[key]] forKey:key];
        }
    }
    return dic;
}
@end