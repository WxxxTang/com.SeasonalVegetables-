//
//  SVXPersonalCell2.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/5.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXPersonalCell2.h"

@implementation SVXPersonalCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadCellWithdic];
    }
    return self;
}
- (void)loadCellWithdic{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle =UITableViewCellSelectionStyleNone;

    self.headicon =[[UIImageView alloc] init];
    self.headicon.layer.cornerRadius = 40.f;
    self.headicon.layer.masksToBounds =YES;

    [self.contentView addSubview:self.headicon];
    
    [self.headicon makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView.centerY);
        make.right.equalTo(self.contentView).offset(-10);

        make.width.equalTo(80);
        make.height.equalTo(80);
    }];
    
     
}

@end
