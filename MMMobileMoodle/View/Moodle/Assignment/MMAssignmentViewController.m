//
//  MMAssignmentViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/20.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMAssignmentViewController.h"
#import "MMAssignmentViewModel.h"
#import "ArrayDataSource.h"

@interface MMAssignmentViewController () <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *assignmentTableView;
@property (nonatomic, strong) MMAssignmentViewModel *viewModel;
@property (nonatomic, strong) ArrayDataSource *assDataSource;
@end

@implementation MMAssignmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  [self.viewModel.refreshCommand.executing subscribeNext:^(NSNumber *executing) {
    if (!executing.boolValue) {
      [self.assignmentTableView.refreshControl endRefreshing];
    } else {
      [self.assignmentTableView.refreshControl beginRefreshing];
    }
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Properties

- (ArrayDataSource *)assDataSource
{
  if (!_assDataSource) {
    _assDataSource = [[ArrayDataSource alloc] initWithCellIdentifier:@"Cell"
                                                  configureCellBlock:^(UITableViewCell *cell, MMViewModel *viewModel) {
                                                    
                                                  }];
  }
  return _assDataSource;
}

- (void)setAssignmentTableView:(UITableView *)assignmentTableView
{
  assignmentTableView.dataSource = self.assDataSource;
  assignmentTableView.delegate = self;
  assignmentTableView.refreshControl = [[UIRefreshControl alloc] init];
  assignmentTableView.refreshControl.rac_command = self.viewModel.refreshCommand;
  _assignmentTableView = assignmentTableView;
}

@end
