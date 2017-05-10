//
//  IntroAttachmentVO.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/5/10.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface IntroAttachmentVO : JSONModel
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *fileurl;
@property (nonatomic, copy) NSString *mimetype;
@end
