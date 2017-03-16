//
//  AccountInfo.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface AccountInfo : NSObject
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *serverURL;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *remoteID;

+ (instancetype)localInstance;

+ (RACSignal *)signinSignal:(NSString *)serverURL username:(NSString *)username password:(NSString *)password;

+ (void)logout;

@end
