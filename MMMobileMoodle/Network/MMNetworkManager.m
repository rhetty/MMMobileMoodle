//
//  MMNetworkManager.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "MMNetworkManager.h"
#import "JWHTTPSessionManager.h"
#import "UserVO.h"
#import "ReactiveCocoa.h"

@interface MMNetworkManager()
@property (strong, nonatomic) JWHTTPSessionManager *sessionManager;
@end

@implementation MMNetworkManager

- (void)setServerURL:(NSString *)serverURL
{
    _serverURL = serverURL;
    self.sessionManager = [[JWHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:serverURL]];
}

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (RACSignal *)tokenSignal:(NSString *)username password:(NSString *)password
{
  if (self.token) {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [subscriber sendCompleted];
      return nil;
    }];
  } else {
    @weakify(self)
    return [[self.sessionManager httpRequest:HTTPMethodGET
                                        url:@"/login/token.php"
                                     params:@{@"username" : username,
                                              @"password" : password,
                                              @"service" : @"moodle_mobile_app"}]
            map:^id(NSDictionary *response) {
              @strongify(self)
              self.token = [response objectForKey:@"token"];
              return nil;
            }];
  }
}

- (RACSignal *)invokeService:(NSString *)service
{
  return [self.sessionManager httpRequest:HTTPMethodGET
                                      url:@"/webservice/rest/server.php"
                                   params:@{@"wstoken":self.token,
                                            @"wsfunction":service,
                                            @"moodlewsrestformat":@"json",
                                            @"moodlewssettingfilter":@"true",
                                            @"moodlewssettingfileurl":@"true"
                                            }];
}

- (RACSignal *)signin:(NSString *)username password:(NSString *)password
{
  @weakify(self)
  return [[self tokenSignal:username password:password] then:^RACSignal *{
    @strongify(self)
    if (self.token) {
      return [[self invokeService:@"core_webservice_get_site_info"]
              map:^id(NSDictionary *response) {
                NSError *error;
                UserVO *uvo = [[UserVO alloc] initWithDictionary:response error:&error];
                if (error) {
                  debugLog(@"%@", error);
                }
                return uvo;
              }];
    } else {
      return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:nil];
        [subscriber sendCompleted];
        return nil;
      }];
    }
  }];
}

- (RACSignal *)userCourses:(NSString *)userid
{
  return [[self invokeService:@"core_enrol_get_users_courses"]
          map:^id(NSDictionary *response) {
            debugLog(@"%@", response);
            return nil;
          }];
}

@end
