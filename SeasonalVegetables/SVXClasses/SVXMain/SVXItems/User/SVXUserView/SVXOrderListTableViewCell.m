//
//  SVXOrderListTableViewCell.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/1.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXOrderListTableViewCell.h"

@implementation SVXOrderListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor =[UIColor colorWithRed:247/255.0
                                                    green:247/255.0
                                                     blue:247/255.0 alpha:1];
    }
    return self;
}



- (void)loadcellWithdic:(NSDictionary *)dic{
    

    UIView *view1 =[[UIView alloc] init];
    [self.contentView addSubview:view1];
    UIImageView *unpay =[[UIImageView alloc] init];
    [view1 addSubview:unpay];
    unpay.image =[UIImage imageNamed:dic[@"待付款"]];
    UILabel *unplayLabel =[[UILabel alloc] init];
    [view1 addSubview:unplayLabel];
    unplayLabel.text =@"待付款";
    unplayLabel.font =[UIFont fontWithName:@"PingFang SC" size:12];
    unplayLabel.textColor =[UIColor grayColor];
    unplayLabel.textAlignment = NSTextAlignmentCenter;

    UIView *view2 =[[UIView alloc] init];
    [self.contentView addSubview:view2];
    UIImageView *unuse =[[UIImageView alloc] init];
    [view2 addSubview:unuse];
    unuse.image =[UIImage imageNamed:dic[@"待使用"]];
    UILabel *unuseLabel =[[UILabel alloc] init];
    [view2 addSubview:unuseLabel];
    unuseLabel.text =@"待使用";
    unuseLabel.font =[UIFont fontWithName:@"PingFang SC" size:12];
    unuseLabel.textColor =[UIColor grayColor];
    unuseLabel.textAlignment = NSTextAlignmentCenter;

    
    UIView *view3 =[[UIView alloc] init];
    [self.contentView addSubview:view3];
    UIImageView *unsay =[[UIImageView alloc] init];
    [view3 addSubview:unsay];
    unsay.image =[UIImage imageNamed:dic[@"待评价"]];
    UILabel *unsayLabel =[[UILabel alloc] init];
    [view3 addSubview:unsayLabel];
    unsayLabel.text =@"待评价";
    unsayLabel.font =[UIFont fontWithName:@"PingFang SC" size:12];
    unsayLabel.textColor =[UIColor grayColor];
    unsayLabel.textAlignment = NSTextAlignmentCenter;
    

    UIView *view4 =[[UIView alloc] init];
    [self.contentView addSubview:view4];
    UIImageView *backpay =[[UIImageView alloc] init];
    [view4 addSubview:backpay];
    backpay.image =[UIImage imageNamed:dic[@"退款/售后"]];
    UILabel *backpayLabel =[[UILabel alloc] init];
    [view4 addSubview:backpayLabel];
    backpayLabel.text =@"退款/售后";
    backpayLabel.font =[UIFont fontWithName:@"PingFang SC" size:12];
    backpayLabel.textColor =[UIColor grayColor];
    backpayLabel.textAlignment = NSTextAlignmentCenter;

    
    [unpay makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view1.centerX);
        make.height.equalTo(view1.width).multipliedBy(0.30);
        make.width.equalTo(view1.width).multipliedBy(0.35);
        make.centerY.equalTo(self.contentView.centerY).offset(-5);

    }];
    [unplayLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view1.centerX);
        make.width.equalTo(view1.width);
        make.bottom.equalTo(view1.bottom).offset(-10);

    }];
   
    
    [unuse makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view2.centerX);
        make.centerY.equalTo(self.contentView.centerY).offset(-5);
        make.height.equalTo(view1.width).multipliedBy(0.35);
        make.width.equalTo(view1.width).multipliedBy(0.35);

    }];
    
    [unuseLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view2.bottom).offset(-10);
        make.centerX.equalTo(view2.centerX);
        make.width.equalTo(view1.width);

    }];
    
    
    [unsay makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view3.centerX);
        make.height.equalTo(view1.width).multipliedBy(0.35);
        make.width.equalTo(view1.width).multipliedBy(0.35);
        make.centerY.equalTo(self.contentView.centerY).offset(-5);
    }];
    [unsayLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view3.bottom).offset(-10);
        make.centerX.equalTo(view3.centerX);
        make.width.equalTo(view1.width);

    }];
    
    [backpay makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view4.centerX);
        make.height.equalTo(view1.width).multipliedBy(0.35);
        make.width.equalTo(view1.width).multipliedBy(0.35);
        make.centerY.equalTo(self.contentView.centerY).offset(-5);


    }];
    [backpayLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view4.bottom).offset(-10);
        make.centerX.equalTo(view4.centerX);
        make.width.equalTo(view1.width);

    }];
    
    
    /*
     View
     */
    
    [view1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top);
        make.left.equalTo(self.contentView.left);
        make.right.equalTo(view2.left).offset(@-10);
        make.height.equalTo(self.contentView.height);
        make.width.equalTo(view2);
    }];
    [view2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top);
        make.left.equalTo(view1.right).offset(@10);
        make.bottom.equalTo(view1);
        make.width.equalTo(view1);

    }];
    
    [view3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top);
        make.left.equalTo(view2.right).offset(10);
        make.bottom.equalTo(view1);
        make.width.equalTo(view1);
        make.right.equalTo(view4.left).offset(@-10);

    }];
    [view4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top);
        make.left.equalTo(view3.right).offset(10);
        make.bottom.equalTo(view1);
        make.width.equalTo(view1.width);

        make.right.equalTo(self.contentView.right).offset(-10);

    }];
    
    
}

@end










