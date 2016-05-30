//
//  SVXShopViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/26.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXShopViewController.h"
#import "SVXOddsViewController.h"
#import "SVXShopListViewController.h"
#import "SVXSearchViewController.h"

@interface SVXShopViewController ()

@property (nonatomic, strong) UISegmentedControl        *segmented;
@property (nonatomic, strong) SVXOddsViewController     *oddVC;
@property (nonatomic, strong) SVXShopListViewController *shopListVC;

@end

@implementation SVXShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self p_setupNavigationBarItem];
    [self p_setupChildViewController];
    [self p_setupSegmented];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置segmented
- (void)p_setupSegmented {
    NSArray *segArray = @[@"今日特惠", @"全部商品"];
    self.segmented = [[UISegmentedControl alloc] initWithItems:segArray];
    self.segmented.frame = CGRectMake(0, 0, 150, 30);
    self.segmented.selectedSegmentIndex = 0;
    self.segmented.tintColor = [UIColor colorWithRed:140 / 255.0 green:139 / 255.0 blue:139 / 255.0 alpha:1];
    [self.segmented addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = self.segmented;
}

#pragma mark - 添加子视图
- (void)p_setupChildViewController {
    self.oddVC = [[SVXOddsViewController alloc] init];
    [self addChildViewController:self.oddVC];
    
    self.shopListVC = [[SVXShopListViewController alloc] init];
    [self addChildViewController:self.shopListVC];
    
    //添加第一个视图
    [self.view addSubview:self.oddVC.view];
    [self.oddVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(0);
        make.right.equalTo(self.view.right).offset(0);
        make.top.equalTo(self.view.top).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
    }];
}

#pragma mark - 设置navigationBar上的Item
- (void)p_setupNavigationBarItem {
    UITapGestureRecognizer *saoyisaoTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(soayisaoTapAction:)];
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    leftView.image = [UIImage imageNamed:@"saoyisao"];
    leftView.userInteractionEnabled = YES;
    [leftView addGestureRecognizer:saoyisaoTapGesture];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    rightView.image = [UIImage imageNamed:@"sousuo"];
    rightView.userInteractionEnabled = YES;
    UITapGestureRecognizer *searchTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(searchAction:)];
    [rightView addGestureRecognizer:searchTapGesture];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
}

#pragma mark - 切换视图方法
- (void)changeView:(UISegmentedControl *)segment {
    switch (segment.selectedSegmentIndex) {
        case 0: {
            [self.shopListVC.view removeFromSuperview];
            [self.view addSubview:self.oddVC.view];
            [self.oddVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.left).offset(0);
                make.right.equalTo(self.view.right).offset(0);
                make.top.equalTo(self.view.top).offset(0);
                make.bottom.equalTo(self.view.bottom).offset(0);
            }];
        }
            break;
        case 1: {
            [self.oddVC.view removeFromSuperview];
            [self.view addSubview:self.shopListVC.view];
            [self.shopListVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.left).offset(0);
                make.right.equalTo(self.view.right).offset(0);
                make.top.equalTo(self.view.top).offset(0);
                make.bottom.equalTo(self.view.bottom).offset(0);
            }];
        }
            break;
        default:
            break;
    }
}

#pragma mark - 扫一扫
- (void)soayisaoTapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"saoyisao");
}

#pragma mark - 推荐
- (void)searchAction:(UITapGestureRecognizer *)tap {
    SVXSearchViewController *search = [[SVXSearchViewController alloc] init];
    search.isShop = YES;
    search.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:search animated:YES];
}

@end
