//
//  SVXEditAddressViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXEditAddressViewController.h"
#import "SVXEditTableViewCell.h"
#import "SVXEditAddTableViewCell.h"
#import "SVXPickerViewViewController.h"

static NSString * const kSVXEditCell = @"kSVXEditCell";

@interface SVXEditAddressViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, SVXPickerViewDelegate>

@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, copy)   NSArray               *titleArray;
@property (nonatomic, copy)   NSString              *cityName;
@property (nonatomic, copy)   NSMutableDictionary   *addressDic;

@end

@implementation SVXEditAddressViewController

- (NSMutableDictionary *)addressDic {
    if (_addressDic == nil) {
        _addressDic = [NSMutableDictionary dictionary];
    }
    return _addressDic;
}

- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"姓名", @"手机号码", @"邮政编码", @"所在地区", @"详细地址"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self p_initWithNavigationBarItem];
    [self p_setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置navigationBar上的Item
- (void)p_initWithNavigationBarItem {
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    rightLabel.text = @"保存";
    rightLabel.textColor = [UIColor colorWithRed:126 / 255.0 green:122 / 255.0 blue:122 / 255.0 alpha:1];
    rightLabel.font = [UIFont fontWithName:@"PingFang SC" size:15.f];
    rightLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *recommendTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(saveAction:)];
    [rightLabel addGestureRecognizer:recommendTapGesture];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
}

#pragma mark - 初始化TableView
- (void)p_setupTableView {
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.rowHeight = 44;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 5)];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXEditTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:kSVXEditCell];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXEditAddTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:@"AddEditCell"];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        SVXEditAddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddEditCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.nameLabel.text = self.titleArray[indexPath.row];
        if (self.cityName == nil) {
            self.cityName = @"";
        }
        cell.cityLabel.text = self.cityName;
        return cell;
    }
    
    SVXEditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSVXEditCell];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLabel.text = self.titleArray[indexPath.row];
    cell.inputField.delegate = self;
    cell.inputField.tag = indexPath.row;
    cell.inputField.returnKeyType = UIReturnKeyDone;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        CGRect currentFrame = self.view.frame;
        currentFrame.origin.y = 64;
        self.view.frame = currentFrame;
        SVXPickerViewViewController *pick = [[SVXPickerViewViewController alloc] init];
        pick.pickDelegate = self;
        pick.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:pick animated:YES completion:nil];
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.tag == 0 || textField.tag == 1) {
        return;
    }
    
    CGRect currentFrame = self.view.frame;
    currentFrame.origin.y = currentFrame.origin.y - 64;
    self.view.frame = currentFrame;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    if (textField.tag == 0 || textField.tag == 1) {
        return;
    }

    CGRect currentFrame = self.view.frame;
    currentFrame.origin.y = 64;
    self.view.frame = currentFrame;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - SVXPickerViewDelegate
- (void)pickText:(NSString *)text {
    self.cityName = text;
    [self.tableView reloadData];
}

#pragma mark - 保存
- (void)saveAction:(UITapGestureRecognizer *)tap {
    NSIndexPath *path = nil;
    SVXEditTableViewCell *cell1;
    SVXEditAddTableViewCell *cell2;
    NSString *cityName = nil;
    
    for (int index = 0; index < 5; index++) {
        path = [NSIndexPath indexPathForRow:index inSection:0];
        if (index == 0) {
            cell1 = [self.tableView cellForRowAtIndexPath:path];
            [self.addressDic setObject:cell1.inputField.text forKey:@"nameLabel"];
        } else if (index == 1) {
            cell1 = [self.tableView cellForRowAtIndexPath:path];
            [self.addressDic setObject:cell1.inputField.text forKey:@"phoneLabel"];
        } else if (index == 2) {
            cell1 = [self.tableView cellForRowAtIndexPath:path];
            [self.addressDic setObject:cell1.inputField.text forKey:@"codeLabel"];
        }else if(index == 3) {
            cell2 = [self.tableView cellForRowAtIndexPath:path];
            cityName = cell2.cityLabel.text;
        } else {
            cell1 = [self.tableView cellForRowAtIndexPath:path];
            [self.addressDic setObject:[NSString stringWithFormat:@"%@%@", cityName, cell1.inputField.text] forKey:@"addressLabel"];
        }
    }
    
    if ([[self.addressDic objectForKey:@"nameLabel"] isEqualToString:@""] ||
        [[self.addressDic objectForKey:@"phoneLabel"] isEqualToString:@""] ||
        [[self.addressDic objectForKey:@"codeLabel"] isEqualToString:@""] ||
        [cell2.cityLabel.text isEqualToString:@""] ||
        [cell1.inputField.text isEqualToString:@""]) {
        NSLog(@"请完善信息");
    } else {
        [self.editDelegate addAddress:self.addressDic];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
