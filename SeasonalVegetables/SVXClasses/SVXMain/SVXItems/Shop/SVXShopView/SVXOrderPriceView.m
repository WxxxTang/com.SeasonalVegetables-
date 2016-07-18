//
//  SVXOrderPriceView.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/6.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXOrderPriceView.h"

@interface SVXOrderPriceView () {
    NSString *_price;
}

@end

@implementation SVXOrderPriceView

- (instancetype)initWithPrice:(NSString *)price {
    self = [super init];
    if (self) {
        _price = price;
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView {
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.text = [NSString stringWithFormat:@"合计 ¥ %@", _price];
    priceLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    priceLabel.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:priceLabel];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(17);
        make.top.equalTo(self.mas_top).offset(13);
        make.width.equalTo(120);
        make.height.equalTo(17);
    }];
    
    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buyButton.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:159 / 255.0 blue:159 / 255.0 alpha:1];
    [buyButton setTitle:@"去结算" forState:UIControlStateNormal];
    [buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buyButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buyButton];
    
    [buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(44);
        make.width.equalTo(100);
    }];
}

#pragma mark - 按钮事件
- (void)buttonAction:(UIButton *)sender {
    [self.orderBuyDelegate orderBuyAction];
}

@end
