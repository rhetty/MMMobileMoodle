//
//  NSDate+Extends.h
//  Wandant
//
//  Created by laker hoo on 15/9/15.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extends)


-(NSString *)dateString;

-(NSString *)dateString:(NSString *)formate;

-(NSString *)ymdDateString;

-(NSString *)monthAndDayString;

-(NSDate *)addDay:(int)day;

-(NSString *)getWeekDayString;

-(NSInteger)getDay;

-(BOOL)isSameDay:(NSDate *)date;

//add by wuyq
-(NSString*)getISO8601String;

@end
