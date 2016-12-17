//
//  MoodleViewController.m
//  MMMobileMoodle
//
//  Created by 黄嘉伟 on 2016/12/17.
//  Copyright © 2016年 huangjw. All rights reserved.
//

#import "MoodleViewController.h"
#import "JWTaggedScrollView.h"
#import "MMMobileMoodle-Bridging-Header.h"

@interface MoodleViewController () <JWTaggedScrollViewDataSource, JWTaggedScrollViewDelegate>
@property (weak, nonatomic) IBOutlet JWTaggedScrollView *taggedScrollView;
@property (strong, nonatomic) UIView *courseView;
@end

@implementation MoodleViewController

- (UIView *)courseView
{
    if (!_courseView) {
        _courseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
    }
    return _courseView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taggedScrollView.dataSource = self;
    self.taggedScrollView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JWTaggedScrollViewDataSource

- (NSInteger)numberOfTags
{
    return 3;
}

- (NSString *)textForTag:(NSUInteger)index
{
    switch (index) {
        case 0:
            return NSLocalizedString(@"Assignment", nil);
        case 1:
            return NSLocalizedString(@"Notification", nil);
        case 2:
            return NSLocalizedString(@"Forum", nil);
        default:
            return EMPTY_STRING;
    }
}

- (UIView *)viewForTag:(NSUInteger)index
{
    UIView *view = [[UIView alloc] init];
    switch (index) {
        case 0:
            view.backgroundColor = [UIColor redColor];
            break;
        case 1:
            view.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            view.backgroundColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
    return view;
}

#pragma mark - JWTaggedScrollViewDelegate

- (void)didSelectTag:(NSUInteger)index
{
    
}

#pragma mark - Action

- (IBAction)courseButtonPressed:(id)sender
{
    CGPoint startPoint = CGPointMake(self.view.frame.size.width - 60, 64);
    Popover *popover = [[Popover alloc] init];
    [popover show:self.courseView point:startPoint];
}

@end
