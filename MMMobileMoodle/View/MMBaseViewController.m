//
//  MMBaseViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMBaseViewController.h"
#import "MMViewModel.h"

@interface MMBaseViewController ()
@property (nonatomic, strong) MMViewModel *viewModel;
@end

@implementation MMBaseViewController

- (instancetype)initWithViewModel:(MMViewModel *)viewModel
{
  self = [super init];
  if (self) {
    self.viewModel = viewModel;
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [RACObserve(self.viewModel, dismiss) subscribeNext:^(NSNumber *shouldDismiss) {
      if ([shouldDismiss boolValue]) {
        [self dismissViewControllerAnimated:YES completion:nil];
      }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
