//
//  UINavigationItem+NoMarginItem.m
//  mycloud.mapmark
//
//  Created by huhk.fnst@g08 on 15/7/14.
//  Copyright © 2015年 fujitsu. All rights reserved.
//

#import "UINavigationItem+NoMarginItem.h"

@implementation UINavigationItem (NoMarginItem)

-(void)setNoMarginLeftItems:(NSArray *)items{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -16;
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:negativeSpacer];
    [array addObjectsFromArray:items];
    [self setLeftBarButtonItems:array animated:NO];
    
}


-(void)setNoMarginRightItems:(NSArray *)items{
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -16;
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:negativeSpacer];
    [array addObjectsFromArray:items];
    [self setRightBarButtonItems:array animated:NO];
    
    
}
@end

