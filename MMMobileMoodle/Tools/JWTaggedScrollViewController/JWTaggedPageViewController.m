//
//  JWTaggedPageViewController.m
//  JWTaggedScrollView
//
//  Created by 黄嘉伟 on 2017/3/20.
//  Copyright © 2017年 huangjw. All rights reserved.
//

#import "JWTaggedPageViewController.h"
#import "JWTaggedScrollView.h"

@interface JWTaggedPageViewController () <UIScrollViewDelegate, JWTaggedScrollViewDataSource, JWTaggedScrollViewDelegate>
@property (nonatomic, weak) JWTaggedScrollView *taggedScrollView;
@property (nonatomic, strong) NSMutableArray *titles;
@end

@implementation JWTaggedPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  JWTaggedScrollView *view = [[JWTaggedScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:view];
  view.dataSource = self;
  view.delegate = self;
  self.taggedScrollView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.titles = [NSMutableArray array];
    self.canSwipe = YES;
    self.tagHeight = 44.0;
  }
  return self;
}

- (void)addChildViewController:(UIViewController *)childViewController title:(NSString *)title
{
  [self.titles addObject:title];
  
  [self addChildViewController:childViewController];
  [childViewController didMoveToParentViewController:self];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
  self.taggedScrollView.selectedIndex = selectedIndex;
}

- (NSUInteger)selectedIndex
{
  return self.taggedScrollView.selectedIndex;
}

#pragma mark - JWTaggedScrollViewDataSource

- (NSInteger)numberOfTags:(JWTaggedScrollView *)taggedScrollView
{
  return self.titles.count;
}

- (NSString *)taggedScrollView:(JWTaggedScrollView *)taggedScrollView textForTag:(NSUInteger)index
{
  return self.titles[index];
}

- (UIView *)taggedScrollView:(JWTaggedScrollView *)taggedScrollView viewForTag:(NSUInteger)index
{
  return self.childViewControllers[index].view;
}

- (UIColor *)colorForSelectedTag:(JWTaggedScrollView *)taggedScrollView
{
  return self.selectedColor ?: self.view.tintColor;
}

- (CGFloat)tagHeight:(JWTaggedScrollView *)taggedScrollView
{
  return self.tagHeight;
}

- (BOOL)canSwipe:(JWTaggedScrollView *)taggedScrollView
{
  return self.canSwipe;
}

@end
