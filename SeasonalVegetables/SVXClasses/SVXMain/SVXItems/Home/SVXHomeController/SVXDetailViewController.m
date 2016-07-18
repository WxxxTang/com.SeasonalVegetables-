//
//  SVXDetailViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/29.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXDetailViewController.h"
#import "SVXDetailTableViewCell.h"
#import "SVXIntroduceViewController.h"
#import <MJRefresh/MJRefresh.h>

static NSString * const kSVXDetailCell = @"kSVXDetailCell";

@interface SVXDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SVXDetailViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSkinModel) name:SVXNotification object:nil];
    
    [self p_setupTableView];
    [self updateSkinModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSkinModel {
    BOOL currentSkinModel = [[[NSUserDefaults standardUserDefaults] stringForKey:@"NightIsOnColor"] boolValue];
    if (currentSkinModel == YES) {
        self.tableView.backgroundColor = [UIColor blackColor];
    } else {//日间模式
        self.tableView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    }
    [self.tableView reloadData];
}

#pragma mark - setupTableView
- (void)p_setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
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
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-44);
    }];
    
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
    [cell updateSkin];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SVXIntroduceViewController *svxIntro = [[SVXIntroduceViewController alloc] init];
    svxIntro.hidesBottomBarWhenPushed = YES;
    svxIntro.title = @"秋葵";
    [self.navigationController pushViewController:svxIntro animated:YES];
}

#pragma mark - 下拉刷新事件
- (void)p_loadHeadData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - 上拉加载事件
- (void)p_loadFootData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
    });
}

@end
