//
//  MMBaseViewController.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroUtils.h"
#import "MBProgressHUD.h"

@class MMViewModel;

@interface MMBaseViewController : UIViewController
- (instancetype)initWithViewModel:(MMViewModel *)viewModel;
@end
