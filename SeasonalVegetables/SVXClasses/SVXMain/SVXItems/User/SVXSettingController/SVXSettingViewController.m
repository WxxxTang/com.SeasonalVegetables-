//
//  SVXSettingViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/2.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXSettingViewController.h"
#import "SVXNightTableViewCell.h"
#import "SVXPersonalViewController.h"
#import "SVXBindingViewController.h"
#import "SVXPasswordViewController.h"
#import "SVXFeedBackViewController.h"

@interface SVXSettingViewController ()
@property (nonatomic,copy)NSArray *settingarr;
@property (nonatomic,strong) UIButton *btnexit;
@end

@implementation SVXSettingViewController

static NSString *cellID =@"settingCell";
static NSString *cellSwitchID =@"nightCell";

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView  registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView  registerClass:[SVXNightTableViewCell class] forCellReuseIdentifier:cellSwitchID];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.separatorColor =[UIColor clearColor];
    [self.tableView setTableFooterView:self.btnexit];
    
    [self updateSkinModel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSkinModel) name:SVXNotification object:nil];

}
- (NSArray *)settingarr{
    if (_settingarr==nil) {
        _settingarr =[[NSArray alloc] init];
        _settingarr =@[@"个人资料",@"手机绑定",@"密码修改",@"夜间模式",@"清理缓存",@"意见反馈",@"关于我们"];
    }
    return _settingarr;
}

- (UIButton *)btnexit{
    if (_btnexit ==nil) {
        _btnexit = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnexit.backgroundColor =[UIColor colorWithRed:254/255.0
                                                  green:178/255.0
                                                   blue:178/255.0 alpha:1];

        [_btnexit setTitle:@"退出登陆" forState: UIControlStateNormal];
        [_btnexit setTintColor:[UIColor whiteColor]];
        _btnexit.frame =CGRectMake(0, 0, self.view.bounds.size.width, 40);
        
    }
    return _btnexit;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL isNight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"NightIsOnColor"] boolValue];
    
    if (indexPath.row==3) {
        SVXNightTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellSwitchID];
        [cell.Nigthswitch addTarget:self action:@selector(changeNight:) forControlEvents:UIControlEventValueChanged];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.labelmod.text = @"夜间模式";
        cell.Nigthswitch.on = isNight;
        
        if (isNight == YES) {
            cell.backgroundColor = [UIColor colorWithRed:40/255.0 green:36/255.0  blue:40/255.0  alpha:1.0];
            cell.labelmod.textColor = [UIColor lightGrayColor];
        } else {
            cell.backgroundColor = [UIColor whiteColor];
            cell.labelmod.textColor = [UIColor grayColor];
        }
        
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.textLabel.text =self.settingarr[indexPath.row];
        cell.textLabel.textColor =[UIColor grayColor];
        cell.textLabel.font =[UIFont fontWithName:@"PingFang SC" size:15];
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        if (isNight == YES) {
            cell.backgroundColor = [UIColor colorWithRed:40/255.0 green:36/255.0  blue:40/255.0  alpha:1.0];
            cell.textLabel.textColor = [UIColor lightGrayColor];
        } else {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.textColor = [UIColor grayColor];
        }
        
        return cell;

    }
}
- (void)changeNight:(id)sender{
    
    if ([sender isOn] == 1) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"NightIsOnColor"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    } else {
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"NightIsOnColor"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter] postNotificationName:SVXNotification object:self];
    
}

- (void)updateSkinModel {
    BOOL currentSkinModel = [[[NSUserDefaults standardUserDefaults] stringForKey:@"NightIsOnColor"] boolValue];
    if (currentSkinModel == YES) {
        self.tableView.backgroundColor = [UIColor colorWithRed:34/255.0 green:30/255.0 blue:33/255.0 alpha:1.0];
        self.btnexit.backgroundColor = [UIColor colorWithRed:254/255.0 green:178/255.0 blue:178/255.0 alpha:0.7];
    } else {//日间模式
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.btnexit.backgroundColor = [UIColor colorWithRed:254/255.0 green:178/255.0 blue:178/255.0 alpha:1];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        SVXPersonalViewController *personalVC =[[SVXPersonalViewController alloc] init];
        personalVC.title =@"个人资料";
        self.hidesBottomBarWhenPushed= YES;
        [self.navigationController pushViewController:personalVC animated:YES];

    }
    
    if (indexPath.row==1) {
        
        SVXBindingViewController *bindingVC=[[SVXBindingViewController alloc] init];
        bindingVC.title = @"手机绑定";
        
        self.hidesBottomBarWhenPushed= YES;  
        [self.navigationController pushViewController:bindingVC animated:YES];
    }
    else if (indexPath.row ==2){
        SVXPasswordViewController * passwordVC =[[SVXPasswordViewController alloc] init];
        passwordVC.title = @"密码修改";
        self.hidesBottomBarWhenPushed= YES;
        [self.navigationController pushViewController:passwordVC animated:YES];

    } else if (indexPath.row == 5) {
        SVXFeedBackViewController* userVC = [[SVXFeedBackViewController alloc] init];
        self.hidesBottomBarWhenPushed= YES;
        [self.navigationController pushViewController:userVC animated:YES];
    }
    
}

@end
