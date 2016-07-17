//
//  SexTableViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/12.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SexTableViewController.h"

@interface SexTableViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSString *saveStr;
@end

@implementation SexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SexCell"];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    self.tableView.tableFooterView =[[UIView alloc] init];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SexCell"forIndexPath:indexPath];
    
    if (indexPath.row ==0) {
        cell.textLabel.text = @"男";

    }
    else if (indexPath.row==1){
        cell.textLabel.text = @"女";
    }
    else if (indexPath.row ==2){
        cell.textLabel.text =@"保密";
 
    }
    cell.textLabel.font =[UIFont fontWithName:@"PingFang SC" size:15];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        //存NSUserDefaults对象
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"男"
                     forKey:@"性别"];
        [defaults synchronize];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if (indexPath.row==1){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"女"
                     forKey:@"性别"];
        [defaults synchronize];
        [self.navigationController popToRootViewControllerAnimated:YES];

    }else if (indexPath.row==2){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"保密"
                     forKey:@"性别"];
        [defaults synchronize];
        [self.navigationController popToRootViewControllerAnimated:YES];

    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

@end
