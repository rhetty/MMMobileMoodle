//
//  MMCourseViewModel.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/19.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMViewModel.h"

@class CourseVO;

@interface MMCourseViewModel : MMViewModel
@property (nonatomic, strong, readonly) NSString *displayContent;
@property (nonatomic, strong, readonly) CourseVO *course;
- (instancetype)initWithCourse:(CourseVO *)course;
+ (instancetype)defaultCourseViewModel;
@end
