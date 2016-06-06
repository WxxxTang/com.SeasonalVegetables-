//
//  SVXBuyView.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/4.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXBuyView.h"

@interface SVXBuyView () {
    double _basePrice;
}

@end

@implementation SVXBuyView

- (instancetype)initWithPrice:(NSString *)price {
    self = [super init];
    if (self) {
        [self p_setupBottomBuyView:price];
        [self p_setupTopBuyView];
    }
    return self;
}

#pragma mark - 添加底部视图
- (void)p_setupBottomBuyView:(NSString *)price {
    UIImageView *image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:@"gouwuche"];
    [self addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(17);
        make.bottom.equalTo(self.mas_bottom).offset(-12);
        make.width.equalTo(25);
        make.height.equalTo(25);
    }];
    
    UILabel *markLabel = [[UILabel alloc] init];
    markLabel.text = @"¥";
    markLabel.font = [UIFont fontWithName:@"PingFang SC" size:17.f];
    markLabel.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:markLabel];
    
    [markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(image.mas_right).offset(10);
        make.bottom.equalTo(image.mas_bottom);
        make.width.equalTo(10);
        make.height.equalTo(25);
    }];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.tag = 2001;
    priceLabel.text = price;
    priceLabel.font = [UIFont fontWithName:@"PingFang SC" size:17.f];
    priceLabel.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:priceLabel];
    
    _basePrice = [price doubleValue];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.backgroundColor = [UIColor colorWithRed:192 / 255.0 green:192 / 255.0 blue:192 / 255.0 alpha:1];
    [addButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addButton];
    
    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buyButton.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:159 / 255.0 blue:159 / 255.0 alpha:1];
    [buyButton setTitle:@"购买" forState:UIControlStateNormal];
    [buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buyButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buyButton];
    
    [buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self);
        make.width.equalTo(self.mas_width).multipliedBy(0.25);
        make.height.equalTo(44);
    }];
    
    [addButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(buyButton.mas_left).offset(0);
        make.bottom.equalTo(buyButton);
        make.width.equalTo(self.mas_width).multipliedBy(0.3);
        make.height.equalTo(44);
    }];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(markLabel.mas_right).offset(10);
        make.bottom.equalTo(image.mas_bottom);
        make.right.equalTo(addButton.mas_left).offset(-5);
        make.height.equalTo(25);
    }];
    
}

#pragma mark - 添加上部视图
- (void)p_setupTopBuyView {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"购买数量(斤)";
    titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:17.f];
    titleLabel.textColor = [UIColor colorWithRed:131 / 255.0 green:131 / 255.0 blue:131 / 255.0 alpha:1];
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(13);
        make.left.equalTo(self).offset(17);
        make.width.equalTo(104);
        make.height.equalTo(25);
    }];
    
    //减号按钮
    UIButton *delButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    delButton.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    [delButton setTitle:@"-" forState:UIControlStateNormal];
    [delButton setTitleColor:[UIColor colorWithRed:131 / 255.0 green:131 / 255.0 blue:131 / 255.0 alpha:1] forState:UIControlStateNormal];
    [delButton addTarget:self action:@selector(delButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:delButton];
    
    [delButton mas_makeConstraints:^(MASConstraintMaker *make) {
        if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
            make.left.equalTo(titleLabel.mas_right).offset(250);
        } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
            make.left.equalTo(titleLabel.mas_right).offset(55);
        }
        
        make.top.equalTo(self.mas_top).offset(8);
        make.width.equalTo(34);
        make.height.equalTo(34);
    }];
    
    //加号按钮
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor colorWithRed:131 / 255.0 green:131 / 255.0 blue:131 / 255.0 alpha:1] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addButton];
    
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-5);
        make.top.equalTo(self.mas_top).offset(8);
        make.width.equalTo(34);
        make.height.equalTo(34);
    }];
    
    //显示数字按钮
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1];
    numberLabel.tag = 2000;
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.text = @"1";
    numberLabel.font = [UIFont fontWithName:@"PingFang SC" size:17.f];
    numberLabel.textColor = [UIColor colorWithRed:131 / 255.0 green:131 / 255.0 blue:131 / 255.0 alpha:1];
    [self addSubview:numberLabel];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(delButton.mas_right).offset(2);
        make.right.equalTo(addButton.mas_left).offset(-2);
        make.top.equalTo(addButton);
        make.bottom.equalTo(addButton);
    }];
}

#pragma mark - 按钮事件
- (void)buttonAction:(UIButton *)sender {
    [self.buyDelegate buyAction:sender.titleLabel.text];
}

- (void)delButtonAction {
    UILabel *label = [self viewWithTag:2000];
    UILabel *priceLabel = [self viewWithTag:2001];
    int number = [label.text intValue];
    double price = [priceLabel.text doubleValue];
    if (number > 1) {
        number--;
        price = _basePrice * number;
    }
    label.text = [NSString stringWithFormat:@"%d", number];
    priceLabel.text = [NSString stringWithFormat:@"%.2f", price];
    [self.buyDelegate buyAction:priceLabel.text];
}

- (void)addButtonAction {
    UILabel *label = [self viewWithTag:2000];
    UILabel *priceLabel = [self viewWithTag:2001];
    int number = [label.text intValue];
    double price = [priceLabel.text doubleValue];
    number++;
    price = _basePrice * number;
    label.text = [NSString stringWithFormat:@"%d", number];
    priceLabel.text = [NSString stringWithFormat:@"%.2f", price];
    [self.buyDelegate buyAction:priceLabel.text];
}

@end
