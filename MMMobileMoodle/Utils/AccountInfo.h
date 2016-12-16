//
//  AccountInfo.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/16.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountInfo : NSObject
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *serverURL;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *remoteID;

+ (instancetype)localInstance;

+ (void)signin:(NSString *)serverURL username:(NSString *)username password:(NSString *)password callback:(void(^)(BOOL))callback;

+ (void)logout;

@end
