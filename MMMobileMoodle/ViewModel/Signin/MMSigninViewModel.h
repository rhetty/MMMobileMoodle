//
//  MMSigninViewModel.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMViewModel.h"

@protocol SigninDelegate <NSObject>
- (void)didSignin;
@end

@interface MMSigninViewModel : MMViewModel
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong, readonly) NSString *hint;
@property (nonatomic, assign, readonly) BOOL displayHint;
@property (nonatomic, strong, readonly) RACCommand *signinCommand;
@property (nonatomic, weak) id<SigninDelegate> delegate;
@end
