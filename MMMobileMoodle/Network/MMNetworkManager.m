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

- (void)getToken:(NSString *)username password:(NSString *)password completion:(void(^)(NSDictionary *))callback
{
    RequestParameter *parameter = [RequestParameter requestWithURL:[NSString stringWithFormat:@"%@/login/token.php", self.serverURL]
                                                               json:@{@"username" : username,
                                                                      @"password" : password,
                                                                      @"service" : @"moodle_mobile_app"}
                                   ];
    [self.sessionManager GET:parameter completion:callback];
}

- (void)invokeService:(NSString *)service callback:(void(^)(NSDictionary *))callback
{
    RequestParameter *parameter = [RequestParameter requestWithURL:[NSString stringWithFormat:@"%@/webservice/rest/server.php", self.serverURL]
                                                              json:@{@"wstoken":self.token,
                                                                     @"wsfunction":service,
                                                                     @"moodlewsrestformat":@"json",
                                                                     @"moodlewssettingfilter":@"true",
                                                                     @"moodlewssettingfileurl":@"true"
                                                                     }];
    [self.sessionManager GET:parameter completion:callback];
}

- (void)signin:(NSString *)username password:(NSString *)password callback:(void(^)(UserVO *uvo, NSString *token))callback
{
    [self getToken:username password:password completion:^(NSDictionary *res) {
        if ([res valueForKey:@"token"]) {
            self.token = [res valueForKey:@"token"];
            [self invokeService:@"core_webservice_get_site_info" callback:^(NSDictionary *res) {
                NSError *error;
                UserVO *uvo = [[UserVO alloc] initWithDictionary:res error:&error];
                if (error) {
                    debugLog(@"%@", error);
                }
                callback(uvo, self.token);
            }];
        } else {
            debugLog(@"%@", res);
            callback(nil, nil);
        }
    }];
}

- (void)userCourses:(NSString *)userid callback:(void (^)(NSArray *))callback
{
    [self invokeService:@"core_enrol_get_users_courses" callback:^(NSDictionary *res) {
        NSLog(@"%@", res);
    }];
}

@end
