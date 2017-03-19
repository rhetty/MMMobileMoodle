//
//  MMMoodleViewModel.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMMoodleViewModel.h"
#import "AccountInfo.h"
#import "MMNetworkManager.h"
#import "CourseVO.h"

@interface MMMoodleViewModel()
@property (nonatomic, strong, readwrite) NSArray *courses;
@end

@implementation MMMoodleViewModel
- (void)initialize
{
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(didSignin:)
                                               name:kSigninNotificationName
                                             object:nil];
}

- (void)didSignin:(NSNotification *)notification
{
  [[[MMNetworkManager sharedInstance] userCourses:[AccountInfo sharedInstance].remoteID] subscribeNext:^(NSDictionary *response) {
    if (response) {
      NSMutableArray *courseList = [NSMutableArray arrayWithCapacity:response.count];
      for (NSDictionary *dict in response) {
        NSError *error;
        CourseVO *cvo = [[CourseVO alloc] initWithDictionary:dict error:&error];
        if (error) {
          debugLog(@"%@", error);
        }
        MMCourseViewModel *cvm = [[MMCourseViewModel alloc] initWithCourse:cvo];
        [courseList addObject:cvm];
      }
      self.courses = courseList;
    }
  }];
}

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
