//
//  MMCourseViewModel.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/19.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMCourseViewModel.h"
#import "CourseVO.h"

@interface MMCourseViewModel()
@property (nonatomic, strong, readwrite) CourseVO *course;
@end

@implementation MMCourseViewModel
- (instancetype)initWithCourse:(CourseVO *)course
{
  self = [super init];
  if (self) {
    self.course = course;
  }
  return self;
}

+ (instancetype)defaultCourseViewModel
{
  static MMCourseViewModel *defaultCourseViewModel;
  if (!defaultCourseViewModel) {
    CourseVO *defaultCourse = [[CourseVO alloc] init];
    defaultCourse.fullname = NSLocalizedString(@"All", nil);
    defaultCourseViewModel = [[self alloc] initWithCourse:defaultCourse];
  }

  return defaultCourseViewModel;
}

- (NSString *)displayContent
{
  return self.course.fullname;
}
@end
