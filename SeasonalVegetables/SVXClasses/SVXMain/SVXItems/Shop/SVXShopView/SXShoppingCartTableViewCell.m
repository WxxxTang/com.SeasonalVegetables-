//
//  SXShoppingCartTableViewCell.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/12.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SXShoppingCartTableViewCell.h"
@interface SXShoppingCartTableViewCell()
@property BOOL isLog;
@end
@implementation SXShoppingCartTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self!=nil) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
     }
    return self;
}


- (void)loadCell:(NSDictionary *)dic{
    UIImageView * btnchooseView =[[UIImageView alloc] init];
    [self.contentView addSubview:btnchooseView];
//    btnchooseView.backgroundColor = [UIColor grayColor];
    btnchooseView.userInteractionEnabled =YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(onClickImg)];
    [btnchooseView addGestureRecognizer:singleTap];
    
//    [btnchooseView removeGestureRecognizer:singleTap];
//    self.btnchoose =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Oval-2"]];
    self.btnchoose =[UIButton buttonWithType:UIButtonTypeCustom];
    [btnchooseView addSubview:self.btnchoose];
    [self.btnchoose  addTarget:self action:@selector(onClickImg) forControlEvents:UIControlEventTouchUpInside];
    [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2"] forState:UIControlStateNormal];
    [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2-select"] forState:UIControlStateSelected];
    
    UIImageView * goodsView = [[UIImageView alloc] init];
    [self.contentView addSubview:goodsView];
    goodsView.backgroundColor =[UIColor redColor];
    goodsView.image =[UIImage imageNamed:dic[@"goodsView"]];

    
    UILabel *goodsName = [[UILabel alloc] init];
    [self.contentView addSubview: goodsName];
    goodsName.textColor = [UIColor grayColor];
    goodsName.font = [UIFont fontWithName:@"PingFang SC" size:13];
    goodsName.text =dic[@"goodsName"];
    
    UILabel *goodsMoney = [[UILabel alloc] init];
    [self.contentView addSubview: goodsMoney];
    goodsMoney.textColor =[UIColor colorWithRed:239/255.0
                                          green:143/255.0
                                           blue:143/255.0 alpha:1];
    goodsMoney.font =[UIFont fontWithName:@"PingFang SC" size:13];
    goodsMoney.text =[NSString stringWithFormat:@"¥ %@",dic[@"goodsMoney"]]   ;
    NSLog(@"%@",dic[@"goodsMoney"]);

    UILabel *goodsCount = [[UILabel alloc] init];
    [self.contentView addSubview:goodsCount];
    goodsCount.textColor = [UIColor grayColor];
    goodsCount.font =[UIFont fontWithName:@"PingFang SC" size:11];
    goodsCount.text =@"11";
    goodsCount.text =[NSString stringWithFormat:@"x %@斤",dic[@"goodsCount"]]   ;
    
    UIView *whiteLine = [[UIView alloc] init];
    [self.contentView addSubview: whiteLine];
    whiteLine.backgroundColor = [UIColor whiteColor];
    
    UIView *editView =[[UIView alloc] init];
    [self.contentView addSubview:editView];
    
    UIButton *btnSubtract =[UIButton buttonWithType:UIButtonTypeCustom];
    [editView addSubview:btnSubtract];
//    btnSubtract.backgroundColor =[UIColor redColor];
    [btnSubtract setTitle:@"-" forState:UIControlStateNormal];
    [btnSubtract setTitleColor:[UIColor colorWithRed:152/255.0
                                           green:152/255.0
                                            blue:152/255.0 alpha:1]
                  forState:UIControlStateNormal];
    
    
    UILabel *labelCount = [[UILabel alloc] init];
    [editView addSubview:labelCount];
//    labelCount.backgroundColor =[UIColor greenColor];
    labelCount.textColor =[UIColor colorWithRed:152/255.0
                                          green:152/255.0
                                           blue:152/255.0 alpha:1];
    labelCount.font =[UIFont fontWithName:@"PingFang SC" size:11];
    labelCount.text =@"11";
    labelCount.textAlignment = NSTextAlignmentCenter;
    labelCount.text =[NSString stringWithFormat:@"%@",dic[@"goodsCount"]];
    
    UIButton *btnPlus =[UIButton buttonWithType:UIButtonTypeCustom];
    [editView addSubview:btnPlus];
    [btnPlus setTitle:@"+" forState:UIControlStateNormal];
    [btnPlus setTitleColor:[UIColor colorWithRed:152/255.0
                                           green:152/255.0
                                            blue:152/255.0 alpha:1]
                  forState:UIControlStateNormal];
    
    
    [btnchooseView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top);
        make.left.equalTo(self.contentView.left);
        make.bottom.equalTo(self.contentView.bottom);
        make.width.equalTo(53);
    }];
    
    [self.btnchoose makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btnchooseView.centerY);
        make.centerX.equalTo(btnchooseView.centerX);
    }];
    
    [goodsView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnchooseView.right);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        make.centerY.equalTo(self.contentView.centerY);
        
    }];
    [goodsName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodsView.top).offset(5);
        make.left.equalTo(goodsView.right).offset(@23);
        make.height.equalTo(@13);
        make.width.equalTo(100);
    }];
    
    [goodsMoney makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goodsView.right).offset(@23);
        make.bottom.equalTo(self.contentView.bottom).offset(-14);
        make.width.equalTo(@40);
        make.height.equalTo(@18);
    }];
    [goodsCount makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.right).offset(@-20);
        make.bottom.equalTo(self.contentView.bottom).offset(@-14);
        make.height.equalTo(goodsMoney.height);
        make.width.equalTo(goodsMoney.width);
    }];
    [whiteLine makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView.width);
        make.height.equalTo(@3);
        make.bottom.equalTo(self.contentView.bottom);
        
    }];
    
    [editView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goodsView.right);
        make.right.equalTo(self.contentView.right);
        make.top.equalTo(goodsName.bottom);
        make.bottom.equalTo(goodsMoney.top);
    }];
    
    [btnSubtract makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editView.centerY);
        make.right.equalTo(labelCount.left);
    }];
    
    [labelCount makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editView.centerY);
        make.centerX.equalTo(editView.centerX);
        make.width.equalTo(@100);
    }];
    [btnPlus makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelCount.right);
        make.centerY.equalTo(editView.centerY);
        
    }];
    
    NSLog(@"点一次 isedit%@",dic[@"isEdit"]);
    if ([dic[@"isEdit"] isEqual:@1]) {
        editView.hidden = NO;
        goodsMoney.hidden=YES;
        goodsCount.hidden=YES;

    
    }else if ([dic[@"isEdit"] isEqual:@0]){
        editView.hidden =YES;
     }
    
}
- (void)onClickImg {
//    NSLog(@"onClickImg %@",self.btnchoose.image);
//    if (self.btnchoose.image == [UIImage imageNamed:@"Oval-2"]) {
//        [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2-select"]];
//    }
//    
//    if (self.btnchoose.image == [UIImage imageNamed:@"Oval-2-select"]) {
//        [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2"]];
//        
//    }
    
    NSLog(@"onClickImg ");
    if (self.btnchoose.isSelected ==NO) {
        self.btnchoose.selected = YES;
        
    }else{
        self.btnchoose.selected = NO;

    }
    
    
}
@end

