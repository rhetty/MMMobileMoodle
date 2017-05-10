//
//  AssignmentVO.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/5/10.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol IntroAttachmentVO;

@interface AssignmentVO : JSONModel
@property (nonatomic, strong) NSNumber *allowsubmissionsfromdate;
@property (nonatomic, strong) NSNumber *completionsubmit;
@property (nonatomic, strong) NSNumber *course;
@property (nonatomic, strong) NSNumber *duedate;
@property (nonatomic, strong) NSNumber *grade;
@property (nonatomic, copy) NSString *intro;
// 附件
@property (nonatomic, copy) NSArray<IntroAttachmentVO> *introattachments;
// 作业名称
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *timemodified;
@end
