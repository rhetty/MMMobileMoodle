//
//  MMNetworkManager.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserVO;

@interface MMNetworkManager : NSObject
@property (nonatomic, copy) NSString *serverURL;
@property (nonatomic, copy) NSString *token;

+ (instancetype)sharedInstance;
- (void)signin:(NSString *)username password:(NSString *)password callback:(void(^)(UserVO *uvo, NSString *token))callback;
- (void)userCourses:(NSString *)userid callback:(void(^)(NSArray *courses))callback;
@end
