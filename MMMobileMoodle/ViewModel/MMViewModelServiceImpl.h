//
//  MMViewModelServiceImpl.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMViewModelService.h"
#import <UIKit/UIKit.h>

@interface MMViewModelServiceImpl : NSObject <MMViewModelService>
@property (nonatomic, weak) UINavigationController *navigationController;
@end
