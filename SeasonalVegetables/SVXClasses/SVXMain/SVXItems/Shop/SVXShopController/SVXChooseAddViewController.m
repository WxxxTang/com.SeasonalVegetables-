//
//  SVXChooseAddViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/6.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXChooseAddViewController.h"
#import "SVXChooseAddTableViewCell.h"
#import "SVXEditAddressViewController.h"

static NSString * const kChooseAddCell = @"kChooseAddCell";

@interface SVXChooseAddViewController ()<UITableViewDelegate, UITableViewDataSource, SVXEditDelegate>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, copy)   NSMutableArray    *addressArray;

@end

@implementation SVXChooseAddViewController

- (NSMutableArray *)addressArray {
    if (_addressArray == nil) {
        _addressArray = [NSMutableArray array];
    }
    return _addressArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = @{@"nameLabel" : @"小唐",
                          @"codeLabel" : @"351100",
                          @"phoneLabel" : @"15080116773",
                          @"addressLabel" : @"福建省莆田市荔城区新度镇南梧塘村"};
    [self.addressArray addObject:dic];
    
    [self p_setupTableView];
    [self p_setupAddButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化TableView
- (void)p_setupTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.rowHeight = 73;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 5)];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-51);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXChooseAddTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:kChooseAddCell];
}

#pragma mark - 初始化底部新增button
- (void)p_setupAddButton {
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addButton setTitle:@"新增地址" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor colorWithRed:166 / 255.0 green:163 / 255.0 blue:163 / 255.0 alpha:1] forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    addButton.backgroundColor = [UIColor whiteColor];
    addButton.layer.borderWidth = 1.f;
    addButton.layer.borderColor = [UIColor colorWithRed:166 / 255.0 green:163 / 255.0 blue:163 / 255.0 alpha:1].CGColor;
    [addButton addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(180);
        make.height.equalTo(35);
        make.left.equalTo(self.view.mas_left).offset(self.view.frame.size.width / 2.0 - 90);
        make.bottom.equalTo(self.view.mas_bottom).offset(-8);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.addressArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SVXChooseAddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kChooseAddCell];
    
    [cell dataForCell:self.addressArray[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.chooseDelegate getAddress:self.addressArray[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否删除？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.addressArray removeObjectAtIndex:indexPath.row];
        NSArray *deleteItems = @[indexPath];
        [self.tableView deleteRowsAtIndexPaths:deleteItems withRowAnimation:UITableViewRowAnimationMiddle];
    }];
    [alert addAction:yesAction];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:noAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - ButtonAction
- (void)addButtonAction:(UIButton *)sender {
    SVXEditAddressViewController *svxEdit = [[SVXEditAddressViewController alloc] init];
    svxEdit.title = @"编辑地址";
    svxEdit.editDelegate = self;
    [self.navigationController pushViewController:svxEdit animated:YES];
}

- (void)addAddress:(NSDictionary *)dic {
    [self.addressArray addObject:dic];
    [self.tableView reloadData];
}

@end
