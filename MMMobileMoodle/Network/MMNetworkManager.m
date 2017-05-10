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

- (RACSignal *)invokeService:(NSString *)service data:(NSDictionary *)data
{
  return [self.sessionManager httpRequest:HTTPMethodGET
                                      url:[NSString stringWithFormat:@"/webservice/rest/server.php?moodlewsrestformat=json&moodlewssettingfilter=true&moodlewssettingfileurl=true&wstoken=%@&wsfunction=%@", self.token, service]
                                   params:data];
}

- (RACSignal *)signin:(NSString *)username password:(NSString *)password
{
  @weakify(self)
  return [[self tokenSignal:username password:password] then:^RACSignal *{
    @strongify(self)
    if (self.token) {
      return [[self invokeService:@"core_webservice_get_site_info" data:nil]
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
  return [self invokeService:@"core_enrol_get_users_courses" data:@{@"userid": userid}];
}

- (RACSignal *)courseContent:(NSString *)courseid
{
  return [self invokeService:@"core_course_get_contents" data:@{@"courseid": courseid}];
}

- (RACSignal *)assignments
{
  return [self invokeService:@"mod_assign_get_assignments" data:nil];
}

- (RACSignal *)discussions:(NSString *)forumid
{
  return [self invokeService:@"mod_forum_get_forum_discussions_paginated" data:@{@"forumid": forumid}];
}

@end
