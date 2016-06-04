//
//  SVXRecomViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXRecomViewController.h"
#import "SVXDetailTableViewCell.h"
#import "SVXIntroduceViewController.h"
#import <MJRefresh/MJRefresh.h>

static NSString * const kSVXRecomCell = @"kSVXRecomCell";

@interface SVXRecomViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, copy)   NSArray       *titleArrays;

@end

@implementation SVXRecomViewController

- (NSArray *)titleArrays {
    if (_titleArrays == nil) {
        _titleArrays = @[@"今日适宜", @"养生必备", @"老年推荐", @"小孩推荐"];
    }
    return _titleArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    self.tableView.rowHeight = 150;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:kSVXRecomCell];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadHeadData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(p_loadFootData)];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArrays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SVXDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSVXRecomCell];
    
    NSDictionary *dic = @{@"imageName" : @"莲藕2",
                          @"seasonName" : @"[夏]",
                          @"vetaName" : @"莲藕",
                          @"moreName" : @"藕是莲藕的地下茎的膨大部分，莲藕属睡莲科。莲藕主要分布于长江流域和南方各省、秋、冬及春初均可采挖。 藕呈短圆柱形，外皮粗厚，光滑为灰白色或银灰色，内部白色；节部中央膨大，内有大小不同的孔道若干条，排列左右对称；体较重，质脆嫩，在我国食用栽培的莲 藕，可分为两大类：第一类为藕用种。其根茎较肥大，外皮白色，肉质脆嫩，味甜，产量高，结莲子不多；第二类为莲用种，莲较小，肉质稍带灰色，品质较差，但 结果多，主要采收莲子。 作为蔬菜食用以藕用种为主。莲藕，微甜而脆，十分爽口，可生食也可做菜，而且药用价值相当高，是老幼妇孺、体弱多病者上好的食品和滋补佳珍。"};
    [cell dicForCellData:dic];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SVXIntroduceViewController *svxIntro = [[SVXIntroduceViewController alloc] init];
    svxIntro.hidesBottomBarWhenPushed = YES;
    svxIntro.title = @"莲藕";
    [self.navigationController pushViewController:svxIntro animated:YES];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.titleArrays[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2.0;
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
