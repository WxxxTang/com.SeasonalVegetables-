//
//  SVXOrderFootView.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/6.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXOrderFootView.h"

@interface SVXOrderFootView () {
    NSString    *_price;
    NSInteger   _number;
    NSString    *_boxPrice;
}

@end

@implementation SVXOrderFootView

- (instancetype)initWithPrice:(NSString *)price number:(NSInteger)number boxPrice:(NSString *)boxPrice {
    self = [super init];
    if (self) {
        _price = price;
        _number = number;
        _boxPrice = boxPrice;
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView {
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.text = @"单价：";
    priceLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    priceLabel.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:priceLabel];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.top.equalTo(self.mas_top).offset(10);
        make.width.equalTo(40);
        make.height.equalTo(20);
    }];
    
    UILabel *price = [[UILabel alloc] init];
    price.text = [NSString stringWithFormat:@"¥ %@", _price];
    price.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    price.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:price];
    
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(self.mas_top).offset(10);
        make.width.equalTo(40);
        make.height.equalTo(20);
    }];
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.text = @"数量：";
    numberLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    numberLabel.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:numberLabel];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.top.equalTo(priceLabel.mas_bottom).offset(10);
        make.width.equalTo(40);
        make.height.equalTo(20);
    }];
    
    UILabel *number = [[UILabel alloc] init];
    number.text = [NSString stringWithFormat:@"X %ld", _number];
    number.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    number.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:number];
    
    [number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(price.mas_bottom).offset(10);
        make.width.equalTo(40);
        make.height.equalTo(20);
    }];
    
    UILabel *boxLabel = [[UILabel alloc] init];
    boxLabel.text = @"运费：";
    boxLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    boxLabel.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:boxLabel];
    
    [boxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.top.equalTo(numberLabel.mas_bottom).offset(10);
        make.width.equalTo(40);
        make.height.equalTo(20);
    }];
    
    UILabel *box = [[UILabel alloc] init];
    box.text = [NSString stringWithFormat:@"¥ %@", _boxPrice];
    box.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    box.textColor = [UIColor colorWithRed:72 / 255.0 green:71 / 255.0 blue:71 / 255.0 alpha:1];
    [self addSubview:box];
    
    [box mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(number.mas_bottom).offset(10);
        make.width.equalTo(40);
        make.height.equalTo(20);
    }];
}

@end
