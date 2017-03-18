//
//  MMViewModel.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMViewModel.h"

@implementation MMViewModel
- (instancetype)initWithService:(id<MMViewModelService>)service
{
  self = [super init];
  if (self) {
    self.service = service;
    [self initialize];
  }
  return self;
}

- (void)initialize
{
  NSAssert(NO, @"[MMViewModel - initialize] should be implemented.");
}
@end
