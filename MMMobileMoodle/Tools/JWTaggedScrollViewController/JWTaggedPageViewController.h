//
//  JWTaggedPageViewController.h
//  JWTaggedScrollView
//
//  Created by 黄嘉伟 on 2017/3/20.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWTaggedPageViewController : UIViewController
@property (nonatomic, strong) UIColor *selectedColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger selectedIndex;
@property (nonatomic, assign) CGFloat tagHeight;
@property (nonatomic, assign) BOOL canSwipe;
- (void)addChildViewController:(UIViewController *)childViewController title:(NSString *)title;
@end
