//
//  ArrayDataSource.h
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/5/10.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMViewModel.h"

@interface ArrayDataSource : NSObject <UITableViewDataSource>
@property (nonatomic, copy) NSArray *items;

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier
                    configureCellBlock:(void (^)(UITableViewCell *cell, id item))block;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
@end
