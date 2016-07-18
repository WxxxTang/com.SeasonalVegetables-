//
//  SVXOrderTitleTableViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/5.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXOrderTitleTableViewCell.h"

@interface SVXOrderTitleTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


@end

@implementation SVXOrderTitleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dataForCell:(NSDictionary *)dic {
    self.headImage.image = [UIImage imageNamed:[dic objectForKey:@"headImage"]];
    self.nameLabel.text = [dic objectForKey:@"nameLabel"];
    self.priceLabel.text = [dic objectForKey:@"priceLabel"];
    self.numberLabel.text = [dic objectForKey:@"numberLabel"];
}

@end
