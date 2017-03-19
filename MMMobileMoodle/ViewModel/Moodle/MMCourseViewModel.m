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
@property (nonatomic, strong) CourseVO *course;
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

- (NSString *)displayContent
{
  return self.course.fullname;
}
@end
