//
//  MMNetworkManager.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserVO;
@class RACSignal;

@interface MMNetworkManager : NSObject
@property (nonatomic, copy) NSString *serverURL;
@property (nonatomic, copy) NSString *token;

+ (instancetype)sharedInstance;
- (RACSignal *)signin:(NSString *)username password:(NSString *)password;
- (RACSignal *)userCourses:(NSString *)userid;
- (RACSignal *)courseContent:(NSString *)courseid;
- (RACSignal *)assignments;
- (RACSignal *)discussions:(NSString *)forumid;
@end
