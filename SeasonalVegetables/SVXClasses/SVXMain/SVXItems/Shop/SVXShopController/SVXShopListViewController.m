//
//  SVXShopListViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXShopListViewController.h"
#import "SVXShopListTableViewCell.h"
#import <MJRefresh/MJRefresh.h>

static NSString * const kSVXShopListCell1 = @"kSVXShopListCell1";
static NSString * const kSVXShopListCell2 = @"kSVXShopListCell2";

@interface SVXShopListViewController ()<UITableViewDelegate, UITableViewDataSource, SVXShopListDelegate>

@property (nonatomic, strong)   UITableView   *tableView;
@property (nonatomic, copy)     NSArray       *titlePicArray;
@property (nonatomic, copy)     NSArray       *titleArray;

@end

@implementation SVXShopListViewController

- (NSArray *)titlePicArray {
    if (_titlePicArray == nil) {
        _titlePicArray = @[@"gong", @"seed", @"gongju"];
    }
    return _titlePicArray;
}

- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"今日特供", @"种子供应", @"工具代售"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self p_setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setupTableView
- (void)p_setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                  style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 3;
    self.tableView.sectionHeaderHeight = 3;
    
    //去掉头部默认加上的视图
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 4)];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-44);
    }];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSVXShopListCell1];
    [self.tableView registerClass:[SVXShopListTableViewCell class] forCellReuseIdentifier:kSVXShopListCell2];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadHeadData)];
    [self.tableView.mj_header beginRefreshing];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSVXShopListCell1];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:self.titlePicArray[indexPath.section]];
        cell.textLabel.text = self.titleArray[indexPath.section];
        
        return cell;
    } else if(indexPath.row == 1) {
        SVXShopListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSVXShopListCell2];
    
        NSDictionary *dic = @{@"firstImage" : @"秋葵2f",
                              @"firstNameLabel" : @"秋葵",
                              @"firstPriceLabel" : @"¥ 20(斤)",
                              @"secondImage" : @"莲藕2",
                              @"secondNameLabel" : @"莲藕",
                              @"secondPriceLabel" : @"¥ 15(斤)"};
        [cell dicForCellData:dic];
        
        cell.shopDelegate = self;
        
        return cell;
    } else {
        return nil;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 44;
    }
    CGFloat height;
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        height = 320;
    } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        height = 205;
    }
    
    return height;
}

#pragma mark - 下拉刷新事件
- (void)p_loadHeadData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - SVXShopListDelegate
- (void)buttonActionMethod:(NSUInteger)index {
    NSLog(@"%lu", (unsigned long)index);
}

@end
