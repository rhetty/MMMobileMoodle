//
//  MMArchiveViewModel.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMArchiveViewModel.h"

@implementation MMArchiveViewModel
- (void)initialize
{
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(didSignin:)
                                               name:kSigninNotificationName
                                             object:nil];
}

- (void)didSignin:(NSNotification *)notification
{
  
}

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
