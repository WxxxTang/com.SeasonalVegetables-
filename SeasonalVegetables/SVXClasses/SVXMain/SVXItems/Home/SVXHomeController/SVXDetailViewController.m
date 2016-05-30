//
//  SVXDetailViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/29.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXDetailViewController.h"
#import "SVXDetailTableViewCell.h"
#import <MJRefresh/MJRefresh.h>

static NSString * const kSVXDetailCell = @"kSVXDetailCell";

@interface SVXDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SVXDetailViewController

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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 152)
                                                  style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.rowHeight = 150;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 2;
    self.tableView.sectionHeaderHeight = 2;
    
    //去掉头部默认加上的视图
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 4)];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:kSVXDetailCell];
    
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
    SVXDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSVXDetailCell];
    
    NSDictionary *dic = @{@"imageName" : @"秋葵2f",
                          @"seasonName" : @"[春]",
                          @"vetaName" : @"秋葵",
                          @"moreName" : @"秋葵(学名：Abelmoschus esculentus)亦称黄秋葵、咖啡黄葵，俗名羊角豆、潺茄，性喜温暖，原产地为非洲今日埃塞俄比亚附近以及亚洲热带，当今黄秋葵已成为人们所热追高档营养保健蔬菜，风靡全球。它的可食用部分是果荚，又分绿色和红色两种，其脆嫩多汁，滑润不腻，香味独特，深受百姓青睐"};
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
