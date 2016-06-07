//
//  SVXOrderViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/5.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXOrderViewController.h"
#import "SVXOrderTitleTableViewCell.h"
#import "SVXNoteTableViewCell.h"
#import "SVXGetGoodsTableViewCell.h"
#import "SVXOrderFootView.h"
#import "SVXOrderPriceView.h"
#import "SVXChooseAddViewController.h"
#import "SVXPayViewController.h"

@interface SVXOrderViewController () <UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, SVXOrderBuyDelegate, SVXChooseDelegate>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, copy)   NSDictionary  *addDic;
@property (nonatomic, strong) UITextView    *textView;
@property (nonatomic, assign) CGFloat       keyBorderNumber;

@end

@implementation SVXOrderViewController

- (UITextView *)textView {
    if (_textView == nil) {
        //添加textView
        self.textView = [[UITextView alloc] init];
        self.textView.backgroundColor = [UIColor whiteColor];
        self.textView.scrollEnabled = YES;
        self.textView.layer.borderWidth = 1;
        self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        //允许编辑内容
        self.textView.editable = YES;
        self.textView.delegate = self;
        self.textView.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
        self.textView.textColor = [UIColor colorWithRed:166 / 255.0 green:163 / 255.0 blue:163 / 255.0 alpha:1];
        self.textView.text = @"在此处添加备注";
        //自适应高度
        self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return _textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册键盘监听事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    self.addDic = @{@"nameLabel" : @"姓名(无)",
                    @"codeLabel" : @"邮政编码(无)",
                    @"phoneLabel" : @"手机号码(无)",
                    @"addressLabel" : @"详细地址(无)"};
    
    [self p_setupTableView];
    [self p_setupOrderBuyView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    self.tableView.sectionFooterHeight = 10;
    self.tableView.sectionHeaderHeight = 10;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-44);
    }];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
    
    SVXOrderFootView *foot = [[SVXOrderFootView alloc] initWithPrice:self.onePrice number:self.number boxPrice:@"0"];
    foot.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    self.tableView.tableFooterView = foot;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXOrderTitleTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:@"titleCell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXGetGoodsTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:@"goodsCell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXNoteTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:@"noteCell"];
}

#pragma mark - buyView
- (void)p_setupOrderBuyView {
    SVXOrderPriceView *orderBuyView = [[SVXOrderPriceView alloc] initWithPrice:[NSString stringWithFormat:@"%ld", [self.onePrice integerValue] * self.number]];
    orderBuyView.backgroundColor = [UIColor whiteColor];
    orderBuyView.orderBuyDelegate = self;
    [self.view addSubview:orderBuyView];
    
    [orderBuyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(44);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SVXOrderTitleTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        NSDictionary *dic = @{@"headImage" : @"秋葵2f",
                              @"nameLabel" : @"秋葵",
                              @"priceLabel" : [NSString stringWithFormat:@"¥ %@", self.onePrice],
                              @"numberLabel" : [NSString stringWithFormat:@"X %ld", self.number]};
        [cell1 dataForCell:dic];
        return cell1;
    } else if (indexPath.section == 1) {
        SVXGetGoodsTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"goodsCell"];
        cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell2 dataForCell:self.addDic];
        return cell2;
    } else {
        SVXNoteTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"noteCell"];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell3.contentView addSubview:self.textView];
        
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell3.contentView).offset(16);
            make.right.equalTo(cell3.contentView).offset(-16);
            make.bottom.equalTo(cell3.contentView).offset(-8);
            make.top.equalTo(cell3.contentView).offset(34);
        }];
        
        return cell3;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    } else if (indexPath.section == 1) {
        return 112;
    } else {
        return 120;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        SVXChooseAddViewController *svxChooseVC = [[SVXChooseAddViewController alloc] init];
        svxChooseVC.title = @"选择地址";
        svxChooseVC.chooseDelegate = self;
        [self.navigationController pushViewController:svxChooseVC animated:YES];
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([self.textView.text isEqualToString:@"在此处添加备注"]) {
        self.textView.text = @"";
    }
    CGRect currentFrame = self.view.frame;
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        currentFrame.origin.y = currentFrame.origin.y - 150;
    } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        currentFrame.origin.y = currentFrame.origin.y - self.keyBorderNumber + 64;
    }
    
    self.view.frame = currentFrame;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.textView.text.length<1) {
        self.textView.text = @"在此处添加备注";
    }
    CGRect currentFrame = self.view.frame;
    currentFrame.origin.y = 64;
    self.view.frame = currentFrame;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //滑动取消第一响应者
    [self.textView resignFirstResponder];
}

#pragma mark - SVXOrderBuyDelegate
- (void)orderBuyAction {
    if ([[self.addDic objectForKey:@"nameLabel"] isEqualToString:@"姓名(无)"]) {
        NSLog(@"请添加收货地址");
        return;
    }
    SVXPayViewController *payVC = [[SVXPayViewController alloc] init];
    payVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:payVC animated:YES completion:nil];
}

#pragma mark - SVXChooseDelegate
- (void)getAddress:(NSDictionary *)dic {
    self.addDic = dic;
    [self.tableView reloadData];
}

#pragma mark 计算键盘的高度
- (CGFloat)keyboardEndingFrameHeight:(NSDictionary *)userInfo {
    CGRect keyboardEndingUncorrectedFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGRect keyboardEndingFrame = [self.view convertRect:keyboardEndingUncorrectedFrame fromView:nil];
    return keyboardEndingFrame.size.height;
}

- (void)keyboardWillAppear:(NSNotification *)notification {
    CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
    self.keyBorderNumber = change;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

@end
