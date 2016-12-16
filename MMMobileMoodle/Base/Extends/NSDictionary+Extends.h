//
//  NSDictionary+Extends.h
//  MicroSchool-Teacher
//
//  Created by macbook on 15/12/21.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extends)

-(NSString *)toJsonString;


+(NSMutableDictionary *)dicRemoveNull:(id)dic;

@end
