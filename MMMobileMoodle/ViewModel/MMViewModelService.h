//
//  MMViewModelService.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMViewModel;

@protocol MMViewModelService <NSObject>
- (void)pushViewModel:(MMViewModel *)viewModel;
+ (void)presentViewModel:(MMViewModel *)viewModel;
@end
