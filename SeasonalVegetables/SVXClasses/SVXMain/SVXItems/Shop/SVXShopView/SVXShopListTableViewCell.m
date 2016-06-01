//
//  SVXShopListTableViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/1.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXShopListTableViewCell.h"

@interface SVXShopListTableViewCell ()

@property (nonatomic, strong) UIView        *view1;
@property (nonatomic, strong) UIView        *view2;

@property (nonatomic, strong) UIImageView   *firstImage;
@property (nonatomic, strong) UILabel       *firstNameLabel;
@property (nonatomic, strong) UILabel       *firstPriceLabel;

@property (nonatomic, strong) UIImageView   *secondImage;
@property (nonatomic, strong) UILabel       *secondNameLabel;
@property (nonatomic, strong) UILabel       *secondPriceLabel;

@end

@implementation SVXShopListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self p_setupView];
        [self p_setupView1];
        [self p_setupView2];
        [self p_setupGes];
    }
    return self;
}

- (void)p_setupView {
    self.view1 = [[UIView alloc] init];
    [self.contentView addSubview:self.view1];
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.46);
        make.height.equalTo(self.contentView.mas_height);
    }];
    
    self.view2 = [[UIView alloc] init];
    [self.contentView addSubview:self.view2];
    
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.left.equalTo(self.view1.mas_right).offset(10);
        make.height.equalTo(self.contentView.mas_height);
    }];
}

#pragma mark - 初始化第一个view的控件
- (void)p_setupView1 {
    self.firstImage = [[UIImageView alloc] init];
    self.firstImage.backgroundColor = [UIColor colorWithRed:216 / 255.0 green:216 / 255.0 blue:216 / 255.0 alpha:1];
    self.firstImage.userInteractionEnabled = YES;
    [self.view1 addSubview:self.firstImage];
    
    [self.firstImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view1);
        make.bottom.equalTo(self.view1.mas_bottom).offset(-40);
    }];
    
    self.firstNameLabel = [[UILabel alloc] init];
    self.firstNameLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    self.firstNameLabel.textColor = [UIColor colorWithRed:85 / 255.0 green:85 / 255.0 blue:85 / 255.0 alpha:1];
    [self.view1 addSubview:self.firstNameLabel];
    
    [self.firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view1.mas_left).offset(8);
        make.top.equalTo(self.firstImage.mas_bottom).offset(-10);
        make.bottom.equalTo(self.view1.mas_bottom).offset(10);
        make.width.equalTo(self.view1.mas_width).multipliedBy(0.45);
    }];
    
    self.firstPriceLabel = [[UILabel alloc] init];
    self.firstPriceLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    self.firstPriceLabel.textColor = [UIColor colorWithRed:237 / 255.0 green:110 / 255.0 blue:110 / 255.0 alpha:1];
    self.firstPriceLabel.textAlignment = NSTextAlignmentRight;
    [self.view1 addSubview:self.firstPriceLabel];
    
    [self.firstPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view1.mas_right).offset(-8);
        make.top.equalTo(self.firstImage.mas_bottom).offset(-10);
        make.bottom.equalTo(self.view1.mas_bottom).offset(10);
        make.width.equalTo(self.view1.mas_width).multipliedBy(0.5);
    }];
}

#pragma mark - 初始化第二个view的控件
- (void)p_setupView2 {
    self.secondImage = [[UIImageView alloc] init];
    self.secondImage.backgroundColor = [UIColor colorWithRed:216 / 255.0 green:216 / 255.0 blue:216 / 255.0 alpha:1];
    self.secondImage.userInteractionEnabled = YES;
    [self.view1 addSubview:self.secondImage];
    
    [self.secondImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view2);
        make.bottom.equalTo(self.view2.mas_bottom).offset(-40);
    }];
    
    self.secondNameLabel = [[UILabel alloc] init];
    self.secondNameLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    self.secondNameLabel.textColor = [UIColor colorWithRed:85 / 255.0 green:85 / 255.0 blue:85 / 255.0 alpha:1];
    [self.view2 addSubview:self.secondNameLabel];
    
    [self.secondNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view2.mas_left).offset(8);
        make.top.equalTo(self.secondImage.mas_bottom).offset(-10);
        make.bottom.equalTo(self.view2.mas_bottom).offset(10);
        make.width.equalTo(self.view2.mas_width).multipliedBy(0.45);
    }];
    
    self.secondPriceLabel = [[UILabel alloc] init];
    self.secondPriceLabel.font = [UIFont fontWithName:@"PingFang SC" size:12.f];
    self.secondPriceLabel.textColor = [UIColor colorWithRed:237 / 255.0 green:110 / 255.0 blue:110 / 255.0 alpha:1];
    self.secondPriceLabel.textAlignment = NSTextAlignmentRight;
    [self.view2 addSubview:self.secondPriceLabel];
    
    [self.secondPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view2.mas_right).offset(-8);
        make.top.equalTo(self.secondImage.mas_bottom).offset(-10);
        make.bottom.equalTo(self.view2.mas_bottom).offset(10);
        make.width.equalTo(self.view2.mas_width).multipliedBy(0.5);
    }];
}

#pragma mark - 初始化手势
- (void)p_setupGes {
    //初始化手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
    tap1.numberOfTouchesRequired = 1;
    [self.view1 addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2:)];
    tap2.numberOfTouchesRequired = 1;
    [self.view2 addGestureRecognizer:tap2];
}

#pragma mark - 添加数据方法
- (void)dicForCellData:(NSDictionary *)dic {
    self.firstImage.image = [UIImage imageNamed:[dic objectForKey:@"firstImage"]];
    self.firstNameLabel.text = [dic objectForKey:@"firstNameLabel"];
    self.firstPriceLabel.text = [dic objectForKey:@"firstPriceLabel"];
    
    self.secondImage.image = [UIImage imageNamed:[dic objectForKey:@"secondImage"]];
    self.secondNameLabel.text = [dic objectForKey:@"secondNameLabel"];
    self.secondPriceLabel.text = [dic objectForKey:@"secondPriceLabel"];
}

#pragma mark - buttonAction
- (void)tapAction1:(UITapGestureRecognizer *)tap {
    [self.shopDelegate buttonActionMethod:1];
}

- (void)tapAction2:(UITapGestureRecognizer *)tap {
    [self.shopDelegate buttonActionMethod:2];
}

@end
