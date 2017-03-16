//
//  MMViewModel.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"
#import "MacroUtils.h"

@protocol MMViewModelService;

@interface MMViewModel : NSObject
@property (nonatomic, weak) id<MMViewModelService> service;
@property (nonatomic, assign) BOOL dismiss;
- (instancetype)initWithService:(id<MMViewModelService>)service;
@end
