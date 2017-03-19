//
//  CourseVO.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/19.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CourseVO : JSONModel
@property (nonatomic, strong) NSNumber *enablecompletion;
// 学生人数
@property (nonatomic, strong) NSNumber *enrolledusercount;
@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *id;
// 课程名称
@property (nonatomic, copy) NSString *fullname;
@property (nonatomic, copy) NSString *idnumber;
@property (nonatomic, copy) NSString *lang;
// 课程简称
@property (nonatomic, copy) NSString *shortname;
@property (nonatomic, strong) NSNumber *showgrades;
// 课程简介
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, strong) NSNumber *summaryformat;
@property (nonatomic, strong) NSNumber *visible;
@end
