//
//  SVXOddsTableViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/1.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXOddsTableViewCell.h"

@interface SVXOddsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation SVXOddsTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dicForCellData:(NSDictionary *)dic {
    self.headImage.image = [UIImage imageNamed:[dic objectForKey:@"imageName"]];
    self.nameLabel.text = [dic objectForKey:@"nameLabel"];
    self.priceLabel.text = [dic objectForKey:@"priceLabel"];
}

@end
