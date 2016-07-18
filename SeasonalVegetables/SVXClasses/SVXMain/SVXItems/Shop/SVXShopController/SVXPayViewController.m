//
//  SVXPayViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXPayViewController.h"

static NSString * const kSVXPayCell = @"kSVXPayCell";

@interface SVXPayViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, copy)   NSArray       *images;
@property (nonatomic, copy)   NSArray       *titles;

@end

@implementation SVXPayViewController

- (NSArray *)images {
    if (_images == nil) {
        _images = @[@"zhifubao", @"weixin2"];
    }
    return _images;
}

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = @[@"支付宝", @"微信"];
    }
    return _titles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
 
    [self p_setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)p_setupTableView {
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor colorWithRed:255 / 255.0  green:253 / 255.0 blue:245 / 255.0 alpha:1];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.height.equalTo(@300);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"请选择支付方式";
    titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:14.f];
    titleLabel.textColor = [UIColor lightGrayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(backView);
        make.top.equalTo(backView.mas_top).offset(5);
        make.height.equalTo(30);
    }];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor colorWithRed:255 / 255.0  green:253 / 255.0 blue:245 / 255.0 alpha:1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    self.tableView.sectionFooterHeight = 4;
    self.tableView.sectionHeaderHeight = 4;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [backView addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSVXPayCell];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    [cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    cancelButton.layer.borderWidth = 1.f;
    cancelButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cancelButton.layer.cornerRadius = 5.f;
    [cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:cancelButton];
    
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).offset(14);
        make.right.equalTo(backView).offset(-14);
        make.bottom.equalTo(backView).offset(-15);
        make.height.equalTo(44);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).offset(14);
        make.right.equalTo(backView).offset(-14);
        make.bottom.equalTo(cancelButton.mas_top).offset(-5);
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSVXPayCell];
    cell.backgroundColor = [UIColor colorWithRed:255 / 255.0  green:253 / 255.0 blue:245 / 255.0 alpha:1];
    cell.textLabel.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.imageView.image = [UIImage imageNamed:self.images[indexPath.section]];
    cell.textLabel.text = self.titles[indexPath.section];
    cell.contentView.layer.borderWidth = 1.f;
    cell.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.contentView.layer.cornerRadius = 5.f;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSLog(@"支付宝");
        
    } else if(indexPath.section == 1 && indexPath.row == 0){
        NSLog(@"微信");
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.payDelegate payResult];
}

#pragma mark - cancelButtonAction
- (void)cancelButtonAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 点击背景去掉支付页面
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
