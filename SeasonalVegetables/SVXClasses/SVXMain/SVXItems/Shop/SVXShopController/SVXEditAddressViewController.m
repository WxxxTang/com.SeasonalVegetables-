//
//  SVXEditAddressViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXEditAddressViewController.h"

@interface SVXEditAddressViewController ()

@end

@implementation SVXEditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self p_initWithNavigationBarItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置navigationBar上的Item
- (void)p_initWithNavigationBarItem {
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    rightLabel.text = @"保存";
    rightLabel.textColor = [UIColor colorWithRed:126 / 255.0 green:122 / 255.0 blue:122 / 255.0 alpha:1];
    rightLabel.font = [UIFont fontWithName:@"PingFang SC" size:15.f];
    rightLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *recommendTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(saveAction:)];
    [rightLabel addGestureRecognizer:recommendTapGesture];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
}

#pragma mark - 推荐
- (void)saveAction:(UITapGestureRecognizer *)tap {
    NSLog(@"保存");
}

@end
