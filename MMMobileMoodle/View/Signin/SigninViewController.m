//
//  SigninViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/17.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "SigninViewController.h"
#import "AccountInfo.h"
#import "ReactiveCocoa.h"
#import "MBProgressHUD.h"
#import "MMSigninViewModel.h"

@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;

@property (nonatomic, strong) MMSigninViewModel *viewModel;
@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  RAC(self.viewModel, url) = self.urlTextField.rac_textSignal;
  RAC(self.viewModel, username) = self.usernameTextField.rac_textSignal;
  RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
  
  [RACObserve(self.viewModel, hint) subscribeNext:^(NSString *text) {
    self.hintLabel.text = text;
  }];
  RAC(self.hintLabel, hidden) = RACObserve(self.viewModel, displayHint).not;

  self.signinButton.rac_command = self.viewModel.signinCommand;
  
  [self.viewModel.signinCommand.executing subscribeNext:^(NSNumber *executing) {
    if (executing.boolValue) {
      [self hideKeyboard];
      self.hintLabel.hidden = YES;
      [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    } else {
      [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
  }];
}

- (void)hideKeyboard
{
  [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
