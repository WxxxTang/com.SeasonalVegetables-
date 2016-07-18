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

- (void)updateSkin {
    BOOL currentSkinModel = [[[NSUserDefaults standardUserDefaults] stringForKey:@"NightIsOnColor"] boolValue];
    if (currentSkinModel == YES) {
        self.contentView.backgroundColor = [UIColor colorWithRed:40/255.0 green:36/255.0  blue:40/255.0  alpha:1.0];
        self.hotButton1.backgroundColor = [UIColor darkGrayColor];
        self.hotButton2.backgroundColor = [UIColor darkGrayColor];
        self.hotButton3.backgroundColor = [UIColor darkGrayColor];
        self.hotButton4.backgroundColor = [UIColor darkGrayColor];
    } else {//日间模式
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.hotButton1.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0  blue:243/255.0  alpha:1.0];
        self.hotButton2.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0  blue:243/255.0  alpha:1.0];
        self.hotButton3.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0  blue:243/255.0  alpha:1.0];
        self.hotButton4.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0  blue:243/255.0  alpha:1.0];
    }
}

@end
