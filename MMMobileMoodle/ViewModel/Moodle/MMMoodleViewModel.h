//
//  MMMoodleViewModel.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMViewModel.h"
#import "MMCourseViewModel.h"

@interface MMMoodleViewModel : MMViewModel
@property (nonatomic, strong, readonly) NSArray<MMCourseViewModel *> *courses;
@end
