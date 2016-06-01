//
//  SVXOddsViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXOddsViewController.h"
#import "SVXOddsTableViewCell.h"
#import <MJRefresh/MJRefresh.h>

static NSString * const kSVXOddsCell = @"kSVXOddsCell";

@interface SVXOddsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SVXOddsViewController

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
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        self.tableView.rowHeight = 400;
    } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        self.tableView.rowHeight = 250;
    }
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 5;
    self.tableView.sectionHeaderHeight = 5;
    
    //去掉头部默认加上的视图
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 4)];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-44);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXOddsTableViewCell class]) bundle:nil] forCellReuseIdentifier:kSVXOddsCell];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadHeadData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(p_loadFootData)];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SVXOddsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSVXOddsCell];
    
    NSDictionary *dic = @{@"imageName" : @"秋葵2f",
                          @"nameLabel" : @"今日特供--秋葵",
                          @"priceLabel" : @"¥15(斤)"};
    [cell dicForCellData:dic];
    
    return cell;
}

#pragma mark - 下拉刷新事件
- (void)p_loadHeadData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - 上拉加载事件
- (void)p_loadFootData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
    });
}

@end
