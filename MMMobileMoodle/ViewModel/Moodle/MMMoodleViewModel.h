//
//  MMMoodleViewModel.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMViewModel.h"
#import "MMCourseViewModel.h"
#import "MMNotificationViewModel.h"
#import "MMAssignmentViewModel.h"
#import "MMForumViewModel.h"

@interface MMMoodleViewModel : MMViewModel
@property (nonatomic, strong, readonly) NSArray<MMCourseViewModel *> *courses;
@property (nonatomic, strong, readonly) MMNotificationViewModel *notificationViewModel;
@property (nonatomic, strong, readonly) MMAssignmentViewModel *assignmentViewModel;
@property (nonatomic, strong, readonly) MMForumViewModel *forumViewModel;

@property (nonatomic, assign) NSUInteger selectedCourse;
@end
