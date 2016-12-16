//
//  NSDate+Extends.m
//  Wandant
//
//  Created by laker hoo on 15/9/15.
//  Copyright © 2015年 fnst. All rights reserved.
//

#import "NSDate+Extends.h"

@implementation NSDate (Extends)

-(NSString *)dateString{
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    if(![[NSCalendar currentCalendar] isDateInToday:self]){
        dateFormate.dateFormat = @"yyyy / M / d HH:mm";
    }
    else{
        dateFormate.dateFormat = @"HH:mm";
    }
    return [dateFormate stringFromDate:self];
}

-(NSString *)dateString:(NSString *)formate{
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    dateFormate.dateFormat = formate;
    return [dateFormate stringFromDate:self];
}

-(NSString *)ymdDateString{
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    dateFormate.dateFormat = @"yyyy / M / d";
    return [dateFormate stringFromDate:self];
}

-(NSString *)monthAndDayString{
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    if(![[NSCalendar currentCalendar] isDateInToday:self]){
        dateFormate.dateFormat = @"M/d";
    }
    else{
        return NSLocalizedString(@"Today", nil);
    }
    return [dateFormate stringFromDate:self];
}


-(NSDate *)addDay:(int)day{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:day];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *newDate = [calendar dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

//-(NSString *)getWeekDayString{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *component = [calendar components:NSCalendarUnitWeekday fromDate:self];
//    NSInteger weekday =  component.weekday;
//    return WeekDayTAG[ ( weekday - 1 ) %weekday];
//}

-(NSInteger)getDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitDay fromDate:self];
    return component.day;
}

-(NSString*)getISO8601String {
    NSDateFormatter *format =  [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    return [format stringFromDate:self];
}

-(BOOL)isSameDay:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compent1 = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:self];
    NSDateComponents *compent2 = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:date];
    return (compent1.year == compent2.year) && (compent1.month == compent2.month) && (compent1.day == compent2.day);
}

@end
