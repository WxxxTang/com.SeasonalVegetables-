//
//  SVXIndBottomView.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/5.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXIndBottomView.h"

@interface SVXIndBottomView ()

@property (nonatomic, strong) UIImageView   *starView;
@property (nonatomic, strong) UILabel       *shoucangLabel;

@end

@implementation SVXIndBottomView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self p_setupBottom];
    }
    return self;
}

- (void)p_setupBottom {
    
    self.starView = [[UIImageView alloc] init];
    self.starView.image = [UIImage imageNamed:@"shoucan"];
    self.starView.userInteractionEnabled = YES;
    [self addSubview:self.starView];
    
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(26);
        make.top.equalTo(self).offset(12);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];
    
    self.shoucangLabel = [[UILabel alloc] init];
    self.shoucangLabel.text = @"未收藏";
    self.shoucangLabel.textColor = [UIColor colorWithRed:165 / 255.0 green:165 / 255.0 blue:165 / 255.0 alpha:1];
    self.shoucangLabel.font = [UIFont fontWithName:@"PingFang SC" size:12];
    [self addSubview:self.shoucangLabel];
    
    [self.shoucangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.starView.mas_right).offset(8);
        make.top.equalTo(self.starView.mas_top).offset(3);
        make.height.equalTo(17);
        make.width.equalTo(80);
    }];
    
    UITapGestureRecognizer *shoucanTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(shoucanTapAction:)];
    [self.starView addGestureRecognizer:shoucanTapGesture];
    
    UIButton *buybutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buybutton.backgroundColor = [UIColor colorWithRed:241 / 255.0  green:165 / 255.0 blue:165 / 255.0 alpha:1];
    [buybutton setTitle:@"前去购买" forState:UIControlStateNormal];
    [buybutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buybutton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    [buybutton addTarget:self action:@selector(buyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buybutton];
    
    [buybutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.width.equalTo(100);
    }];
    
}

#pragma mark - 收藏按钮事件
- (void)shoucanTapAction:(UITapGestureRecognizer *)tap {
    if (self.isSave == NO) {
        self.starView.image = [UIImage imageNamed:@"shoucan-full"];
        self.shoucangLabel.text = @"已收藏";
        self.isSave = YES;
    } else {
        self.starView.image = [UIImage imageNamed:@"shoucan"];
        self.shoucangLabel.text = @"未收藏";
        self.isSave = NO;
    }
    
    [self.indDelegate getResult:self.isSave];
}

#pragma mark - 前去购买按钮事件
- (void)buyButtonAction:(UIButton *)sender {
    [self.indDelegate buyAction];
}

@end
