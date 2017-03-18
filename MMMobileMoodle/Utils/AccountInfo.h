//
//  AccountInfo.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kSigninNotificationName;

@class RACSignal;

@interface AccountInfo : NSObject
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *password;
@property (nonatomic, copy, readonly) NSString *serverURL;
@property (nonatomic, copy, readonly) NSString *fullName;
@property (nonatomic, copy, readonly) NSString *remoteID;

+ (instancetype)localInstance;

+ (RACSignal *)autoSignin;

+ (RACSignal *)signinSignal:(NSString *)serverURL username:(NSString *)username password:(NSString *)password;

+ (void)logout;

@end
