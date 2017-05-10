//
//  MMMeViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2017/3/12.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "MMMeViewController.h"
#import "MMMeViewModel.h"

@interface MMMeViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) MMMeViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;
@end

@implementation MMMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  
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

static NSString *const cellIdentifier = @"Cell";

- (void)setContentTableView:(UITableView *)contentTableView
{
  contentTableView.dataSource = self;
  contentTableView.delegate = self;
  [contentTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
  _contentTableView = contentTableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  cell.textLabel.text = NSLocalizedString(@"退出登录", nil);
}

@end
