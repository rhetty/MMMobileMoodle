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
@property (nonatomic, strong, readwrite) MMNotificationViewModel *notificationViewModel;
@property (nonatomic, strong, readwrite) MMAssignmentViewModel *assignmentViewModel;
@property (nonatomic, strong, readwrite) MMForumViewModel *forumViewModel;
@end

@implementation MMMoodleViewModel
- (void)initialize
{
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(didSignin:)
                                               name:kSigninNotificationName
                                             object:nil];
  
  self.courses = @[[MMCourseViewModel defaultCourseViewModel]];
  
  self.notificationViewModel = [[MMNotificationViewModel alloc] init];
  self.assignmentViewModel = [[MMAssignmentViewModel alloc] init];
  self.forumViewModel = [[MMForumViewModel alloc] init];
}

- (void)didSignin:(NSNotification *)notification
{
  [[[MMNetworkManager sharedInstance] userCourses:[AccountInfo sharedInstance].remoteID] subscribeNext:^(NSDictionary *response) {
    if (response) {
      NSMutableArray *courseList = [NSMutableArray arrayWithCapacity:response.count + 1];
      [courseList addObject:[MMCourseViewModel defaultCourseViewModel]];
      
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

- (void)setSelectedCourse:(NSUInteger)selectedCourse
{
  self.notificationViewModel.course = self.courses[selectedCourse].course;
  self.forumViewModel.course = self.courses[selectedCourse].course;
  self.assignmentViewModel.course = self.courses[selectedCourse].course;
}
@end
