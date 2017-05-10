//
//  MMAssignmentViewModel.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/20.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMAssignmentViewModel.h"
#import "MMNetworkManager.h"

@interface MMAssignmentViewModel()

@end

@implementation MMAssignmentViewModel

- (void)initialize
{
  _refreshCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
    return [[MMNetworkManager sharedInstance] assignments];
  }];
  
  [[[_refreshCommand executionSignals] flattenMap:^id(RACSignal *signal) {
    return signal;
  }] subscribeNext:^(NSDictionary *response) {
    debugLog(@"%@", response);
  }];
}

#pragma mark - Properties

- (void)setCourse:(CourseVO *)course
{
  _course = course;
  // do refresh
}

@end
