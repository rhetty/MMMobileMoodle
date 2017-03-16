//
//  MMViewModelServiceImpl.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMViewModelServiceImpl.h"

@interface MMViewModelServiceImpl()
@end

@implementation MMViewModelServiceImpl

- (void)pushViewModel:(MMViewModel *)viewModel
{
  [self.navigationController pushViewController:[[self class] viewControllerForViewModel:viewModel]
                                       animated:YES];
}

+ (void)presentViewModel:(MMViewModel *)viewModel
{
  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[self viewControllerForViewModel:viewModel]
                                                                               animated:YES
                                                                             completion:nil];
}

+ (UIViewController *)viewControllerForViewModel:(MMViewModel *)viewModel
{
  return nil;
}
@end
