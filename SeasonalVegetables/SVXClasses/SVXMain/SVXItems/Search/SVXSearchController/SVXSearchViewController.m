//
//  SVXSearchViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/29.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXSearchViewController.h"
#import "SVXHotSearchTableViewCell.h"

static NSString * const kHotSearchCell = @"kHotSearchCell";

@interface SVXSearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, SVXHotDelegate>

@property (nonatomic, strong) UISearchBar   *searchBar;
@property (nonatomic, strong) UITableView   *tableView;

@end

@implementation SVXSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self p_initWithNavigationBarItem];
    [self p_setupSearchBar];
    [self p_setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置navigationBar上的Item
- (void)p_initWithNavigationBarItem {
    UITapGestureRecognizer *saoyisaoTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(soayisaoTapAction:)];
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    leftView.image = [UIImage imageNamed:@"saoyisao"];
    leftView.userInteractionEnabled = YES;
    [leftView addGestureRecognizer:saoyisaoTapGesture];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    rightLabel.text = @"取消";
    rightLabel.textColor = [UIColor colorWithRed:126 / 255.0 green:122 / 255.0 blue:122 / 255.0 alpha:1];
    rightLabel.font = [UIFont fontWithName:@"PingFang SC" size:15.f];
    rightLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *recommendTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(cancelAction:)];
    [rightLabel addGestureRecognizer:recommendTapGesture];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
}

#pragma mark - 设置搜索栏
- (void)p_setupSearchBar {
    UIView *searchView = nil;
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 4, 580, 21)];
        searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 580, 30)];
    } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 4, self.view.frame.size.width - 130, 21)];
        searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 130, 30)];
    }
    
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜你想搜";
    searchView.backgroundColor = [UIColor whiteColor];
    searchView.layer.cornerRadius = 10;
    [searchView addSubview:self.searchBar];
    
    self.navigationItem.titleView = searchView;
}

#pragma mark - setupTableView
- (void)p_setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                  style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.rowHeight = 57;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 2;
    self.tableView.sectionHeaderHeight = 2;
    
    //去掉头部默认加上的视图
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 4)];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXHotSearchTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:kHotSearchCell];
    
    //约束tableView
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
    
}

#pragma mark - 扫一扫
- (void)soayisaoTapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"saoyisao");
}

#pragma mark - 取消按钮
- (void)cancelAction:(UITapGestureRecognizer *)tap {
    [self.searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SVXHotSearchTableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:kHotSearchCell];
        cell.hotDelegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0 ? @"热门搜索" : @"搜索";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2.0;
}

#pragma mark - HotDelegate
- (void)detailHotButtonAction:(UIButton *)sender {
    NSLog(@"%@", sender.titleLabel.text);
}

#pragma mark - SearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

@end
