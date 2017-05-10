//
//  MMAssignmentViewModel.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/20.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMViewModel.h"

@class CourseVO;
@class MMAssignmentItemViewModel;

@interface MMAssignmentViewModel : MMViewModel
@property (nonatomic, strong) CourseVO *course;
@property (nonatomic, copy) NSArray<MMAssignmentItemViewModel *> *assignments;
@property (nonatomic, strong, readonly) RACCommand *refreshCommand;
@end
