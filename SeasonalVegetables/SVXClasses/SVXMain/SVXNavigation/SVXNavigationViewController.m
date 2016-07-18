//
//  SVXNavigationViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/26.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXNavigationViewController.h"

@interface SVXNavigationViewController ()

@end

@implementation SVXNavigationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateSkinModel];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSkinModel) name:SVXNotification object:nil];
    
}

-(void)updateSkinModel {
    BOOL currentSkinModel = [[[NSUserDefaults standardUserDefaults] stringForKey:@"NightIsOnColor"] boolValue];
    if (currentSkinModel == YES) {
        self.navigationBar.barTintColor = [UIColor colorWithRed:34/255.0 green:30/255.0 blue:33/255.0 alpha:1.0];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    } else {//日间模式
        self.navigationBar.barTintColor = [UIColor colorWithRed:249/255.0 green:242/255.0 blue:222/255.0 alpha:1];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
