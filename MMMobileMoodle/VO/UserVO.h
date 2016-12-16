//
//  UserVO.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/17.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserVO : JSONModel
@property (nonatomic, copy) NSString *fullname;
@property (nonatomic, copy) NSString *userid;
@end
