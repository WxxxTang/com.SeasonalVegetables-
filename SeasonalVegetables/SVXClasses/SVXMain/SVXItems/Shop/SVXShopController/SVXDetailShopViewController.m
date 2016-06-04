//
//  SVXDetailShopViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/2.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXDetailShopViewController.h"

@interface SVXDetailShopViewController ()

@end

@implementation SVXDetailShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self p_initWithNavigationBarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)p_initWithNavigationBarItem {
    UITapGestureRecognizer *shoucanTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(shoucanTapAction:)];
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 23, 22)];
    leftView.image = [UIImage imageNamed:@"shoucan"];
    leftView.userInteractionEnabled = YES;
    [leftView addGestureRecognizer:shoucanTapGesture];
    UIBarButtonItem *shoucanItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    rightView.image = [UIImage imageNamed:@"share"];
    rightView.userInteractionEnabled = YES;
    UITapGestureRecognizer *shareTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(shareAction:)];
    [rightView addGestureRecognizer:shareTap];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    
    self.navigationItem.rightBarButtonItems = @[shareItem, shoucanItem];
}

#pragma mark - 收藏按钮事件
- (void)shoucanTapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"shoucan");
}

#pragma mark - 分享按钮事件
- (void)shareAction:(UITapGestureRecognizer *)tap {
    NSLog(@"share");
}

@end
