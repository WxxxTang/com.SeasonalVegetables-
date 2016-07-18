//
//  SVXUserViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/26.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXUserViewController.h"
#import "SVXUserTableViewCell.h"
#import "SVXOrderListTableViewCell.h"
#import "SVXHeaderModel.h"
#import "SVXHeaderView.h"
#import "SVXSettingViewController.h"
#import "SVXShoppingCartViewController.h"

@interface SVXUserViewController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) SVXHeaderView *headview ;
@property (nonatomic,copy) NSArray *array;
@property (nonatomic,copy) NSDictionary *userdic;
@property (nonatomic,copy) NSDictionary *listdic;


@end
static  NSString *cellId = @"USERCELL";

@implementation SVXUserViewController


- (void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"usericon"];
    [self.headview.buttonhead setBackgroundImage:[UIImage imageWithData:data]
                                        forState:UIControlStateNormal];
    self.headview.namelabel.text = [defaults objectForKey:@"昵称"];
    self.headview.detaillabel.text = [defaults objectForKey:@"个人签名"];
    
}
- (SVXHeaderView *)headview{
    if (_headview ==nil) {
        _headview =[[SVXHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
        SVXHeaderModel *headermodel =[[SVXHeaderModel alloc] init];
        NSDictionary *dic = [headermodel WithDic];
        _headview.namelabel.text = dic[@"昵称"];
        [_headview.buttonhead setBackgroundImage:[UIImage imageWithData:dic[@"usericon"]]
                                        forState:UIControlStateNormal];
        _headview.detaillabel.text = dic[@"个人签名"];
        _headview.backgroundColor =[UIColor colorWithRed:247/255.0
                                                   green:247/255.0
                                                    blue:247/255.0 alpha:1];
        
        
    }
    return _headview;
}

- (UITableView *)tableview{
    if (_tableview ==nil) {
        _tableview = [[UITableView alloc] init];
        _tableview.delegate =self;
        _tableview.dataSource =self;
        [self.view addSubview:_tableview];
        [_tableview registerClass:[SVXOrderListTableViewCell class] forCellReuseIdentifier:@"listcell"];
        [_tableview registerClass:[SVXUserTableViewCell class] forCellReuseIdentifier:cellId];
        
        _tableview.separatorStyle =UITableViewCellSeparatorStyleNone;
        _tableview.backgroundColor =[UIColor colorWithRed:247/255.0
                                                    green:247/255.0
                                                     blue:247/255.0 alpha:1];
        [_tableview setTableHeaderView:self.headview];
        _tableview.tableFooterView =[[UIView alloc] init];
        
        [_tableview makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.top);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.bottom).offset(@-44);
            
        }];
        
    }
    return _tableview;
}

- (NSArray *)array{
    if (_array ==nil) {
        _array =[[NSArray alloc] init];
        _array = @[@"我的订单",@"",@"我的收藏",@"我要合作",@"设置"];
        
        
    }
    return _array;
}

- (NSDictionary *)userdic{
    if (_userdic ==nil) {
        _userdic = [[NSDictionary alloc] init];
        _userdic =@{@"name":@"个人昵称",@"个人简介":@"个人简介今天天气不错"};
        
    }
    return _userdic;
}
- (NSDictionary *)listdic{
    if (_listdic ==nil) {
        _listdic = [[NSDictionary alloc] init];
        _listdic =@{@"待付款":@"unpay",@"待使用":@"unuse",@"待评价":@"unsay",@"退款/售后":@"backpay"};
    }
    return _listdic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    //    //通知 用于更新头视图 观察设置在 设置那个边的那个 个人设置vc那
    //    NSNotificationCenter *center =[NSNotificationCenter defaultCenter];
    //    [center addObserver:self selector:@selector(notiece:) name:@"reloaddata" object:nil];
    
    [self tableview];
    
    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gouwuche"]
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(goToShoppingCart)];
    
    [self.navigationItem setRightBarButtonItem:rightButton];
    
    
    
    
    
}

- (void)goToShoppingCart{
    SVXShoppingCartViewController *vc = [[SVXShoppingCartViewController alloc] init];
    vc.title =@"购物车";
    self.hidesBottomBarWhenPushed=YES;//push时隐藏tabbar;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed=NO;//bACK时出现tabbar;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row ==1){
        return 80;
    }
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==1) {
        SVXOrderListTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"listcell" ];
        
        /*
         model
         */
        
        [cell loadcellWithdic:self.listdic];
        
        
        return cell;
    }
    else{
        SVXUserTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId ];
        
        cell.textLabel.text = self.array[indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==4) {
        
        SVXSettingViewController *settingVC = [[SVXSettingViewController alloc] init];
        settingVC.title =self.array[indexPath.row];
        
        self.hidesBottomBarWhenPushed=YES;//push时隐藏tabbar;
        [self.navigationController pushViewController:settingVC animated:YES ];
        self.hidesBottomBarWhenPushed=NO;//back时显现tabbar;
        
        
        
    }
    
}

//- (void)notiece:(id)sender{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//
//    NSData *data = [defaults objectForKey:@"usericon"];
//    [self.headview.buttonhead setBackgroundImage:[UIImage imageWithData:data]
//                                        forState:UIControlStateNormal];
//
//
//    self.headview.namelabel.text = [defaults objectForKey:@"昵称"];
//    self.headview.detaillabel.text = [defaults objectForKey:@"个人签名"];
//
//     NSLog(@"%@",self.headview.namelabel.text);
//     
//    NSLog(@"通知");
//}


@end
