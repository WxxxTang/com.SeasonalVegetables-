//
//  SVXHotSearchTableViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXHotSearchTableViewCell.h"

@interface SVXHotSearchTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *hotButton1;

@property (weak, nonatomic) IBOutlet UIButton *hotButton2;

@property (weak, nonatomic) IBOutlet UIButton *hotButton3;

@property (weak, nonatomic) IBOutlet UIButton *hotButton4;

@end

@implementation SVXHotSearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)hotButtonAction:(id)sender {
    [self.hotDelegate detailHotButtonAction:(UIButton *)sender];
}

@end
