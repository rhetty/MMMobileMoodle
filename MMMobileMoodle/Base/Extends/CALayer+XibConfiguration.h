//
//  CALayer+XibConfiguration.h
//  mycloud.mapmark
//
//  Created by huhk.fnst@g08 on 15/7/16.
//  Copyright © 2015年 fujitsu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (XibConfiguration)

@property(nonatomic, assign) UIColor* borderUIColor;

@property (nonatomic,assign) UIColor *shadowUIColor;

@end
