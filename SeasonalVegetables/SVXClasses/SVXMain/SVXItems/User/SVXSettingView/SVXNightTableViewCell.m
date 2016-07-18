//
//  SVXNightTableViewCell.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/2.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXNightTableViewCell.h"

@implementation SVXNightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadNight];
    }
    return self;
}
- (void)loadNight{
    self.labelmod =[[UILabel alloc] init];
    [self.contentView addSubview:self.labelmod];
    self.labelmod.textColor =[UIColor grayColor];
    self.labelmod.font =[UIFont fontWithName:@"PingFang SC" size:15];
    
    self.Nigthswitch =[[UISwitch alloc] init];
    [self.contentView addSubview:self.Nigthswitch];
    
    
    [self.labelmod makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(17);
        make.centerY.equalTo(self.contentView.centerY);
        make.width.equalTo(@100);
    }];
    
    [self.Nigthswitch makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.width.equalTo(50);
        make.centerY.equalTo(self.contentView.centerY);
    }];
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
