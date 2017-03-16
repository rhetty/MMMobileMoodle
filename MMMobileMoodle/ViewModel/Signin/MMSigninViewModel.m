//
//  MMSigninViewModel.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMSigninViewModel.h"
#import "AccountInfo.h"

@interface MMSigninViewModel()
@property (nonatomic, strong) RACSignal *canSigninSignal;
@property (nonatomic, assign, readwrite) BOOL displayHint;
@property (nonatomic, strong, readwrite) NSString *hint;
@end

@implementation MMSigninViewModel

- (void)initialize
{
  @weakify(self)
  RACSignal *validURLSignal = [[RACObserve(self, url) map:^id(NSString *text) {
    @strongify(self)
    return @([self isValidURL:text]);
  }] distinctUntilChanged];
  
  RACSignal *validUsernameSignal = [[RACObserve(self, username) map:^id(NSString *text) {
    @strongify(self)
    return @([self isValidUsername:text]);
  }] distinctUntilChanged];
  
  RACSignal *validPasswordSignal = [[RACObserve(self, password) map:^id(NSString *text) {
    @strongify(self)
    return @([self isValidPassword:text]);
  }] distinctUntilChanged];
  
  self.canSigninSignal = [RACSignal combineLatest:@[validURLSignal, validUsernameSignal, validPasswordSignal]
                                                 reduce:^id(NSNumber *validURL, NSNumber *validUsername, NSNumber *validPassword){
                                                   return @([validURL boolValue] && [validUsername boolValue] && [validPassword boolValue]);
                                                 }];
  
  _signinCommand = [[RACCommand alloc] initWithEnabled:self.canSigninSignal
                                               signalBlock:^RACSignal *(id input) {
                                                 @strongify(self)
                                                 return [AccountInfo signinSignal:self.url username:self.username password:self.password];
  }];

  [self.signinCommand.executionSignals subscribeNext:^(RACSignal *signal) {
    [signal subscribeNext:^(NSNumber *success) {
      if (success.boolValue) {
        self.dismiss = YES;
      } else {
        self.hint = NSLocalizedString(@"Invalid info", nil);
        self.displayHint = YES;
      }
    }];
  }];
}

- (BOOL)isValidURL:(NSString *)url
{
  return url.length > 0;
}

- (BOOL)isValidUsername:(NSString *)username
{
  return username.length > 0;
}

- (BOOL)isValidPassword:(NSString *)password
{
  return password.length > 0;
}
@end
