//
//  SigninViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/17.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "SigninViewController.h"
#import "AccountInfo.h"

@interface SigninViewController ()
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signinButtonPressed:(id)sender
{
    self.hintLabel.hidden = YES;
    
    [AccountInfo signin:self.urlTextField.text
               username:self.usernameTextField.text
               password:self.passwordTextField.text
               callback:^(BOOL success) {
                   if (success) {
                       [self dismissViewControllerAnimated:YES completion:nil];
                   } else {
                       self.hintLabel.text = NSLocalizedString(@"fail bind", nil);
                       self.hintLabel.hidden = NO;
                   }
               }];
}

@end
