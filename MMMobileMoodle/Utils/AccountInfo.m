//
//  AccountInfo.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "AccountInfo.h"
#import "MMNetworkManager.h"
#import "UserVO.h"
#import "ReactiveCocoa.h"

#define ACCOUNT_KEY @"account"
#define USERNAME_KEY @"username"
#define PASSWORD_KEY @"password"
#define SERVER_URL_KEY @"server_url"
#define FULL_NAME_KEY @"full_name"
#define REMOTE_ID_KEY @"remote_id"

NSString *const kSigninNotificationName = @"Signin";

@interface AccountInfo()
@property (nonatomic, copy, readwrite) NSString *username;
@property (nonatomic, copy, readwrite) NSString *password;
@property (nonatomic, copy, readwrite) NSString *serverURL;
@property (nonatomic, copy, readwrite) NSString *fullName;
@property (nonatomic, copy, readwrite) NSString *remoteID;
@end

@implementation AccountInfo

static AccountInfo *instance = nil;

+ (instancetype)sharedInstance
{
  if (instance) {
    return instance;
  } else {
    return [self localInstance];
  }
}

+ (instancetype)localInstance
{
  NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:ACCOUNT_KEY];
  instance =  data ? [NSKeyedUnarchiver unarchiveObjectWithData:data] : nil;
  return instance;
}

+ (RACSignal *)autoSignin
{
  AccountInfo *instance = [self localInstance];
  if (instance) {
    return [self signinSignal:instance.serverURL username:instance.username password:instance.password];
  } else {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [subscriber sendNext:nil];
      [subscriber sendCompleted];
      return nil;
    }];
  }
}

+ (RACSignal *)signinSignal:(NSString *)serverURL username:(NSString *)username password:(NSString *)password
{
  [MMNetworkManager sharedInstance].serverURL = serverURL;
  return [[[MMNetworkManager sharedInstance] signin:username password:password]
          map:^id(UserVO *uvo) {
            if (uvo) {
              AccountInfo *account = [[AccountInfo alloc] init];
              account.username = username;
              account.password = password;
              account.serverURL = serverURL;
              account.fullName = uvo.fullname;
              account.remoteID = uvo.userid;
              [account persist];
              
              [[NSNotificationCenter defaultCenter] postNotificationName:kSigninNotificationName object:account];
              
              return @YES;
            } else {
              return @NO;
            }
          }];
}

+ (void)logout
{
  [self remove];
  instance = nil;
}

- (void)persist
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:data forKey:ACCOUNT_KEY];
    [userDefaults synchronize];
}

+ (void)remove
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ACCOUNT_KEY];
}

#pragma mark - Coder

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super init]) {
        self.username = [aDecoder decodeObjectForKey:USERNAME_KEY];
        self.password = [aDecoder decodeObjectForKey:PASSWORD_KEY];
        self.serverURL = [aDecoder decodeObjectForKey:SERVER_URL_KEY];
        self.fullName = [aDecoder decodeObjectForKey:FULL_NAME_KEY];
        self.remoteID = [aDecoder decodeObjectForKey:REMOTE_ID_KEY];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:USERNAME_KEY];
    [aCoder encodeObject:self.password forKey:PASSWORD_KEY];
    [aCoder encodeObject:self.serverURL forKey:SERVER_URL_KEY];
    [aCoder encodeObject:self.remoteID forKey:REMOTE_ID_KEY];
    [aCoder encodeObject:self.fullName forKey:FULL_NAME_KEY];
}

@end
