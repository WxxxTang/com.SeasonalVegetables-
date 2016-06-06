//
//  SVXChooseAddTableViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/6.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXChooseAddTableViewCell.h"

@interface SVXChooseAddTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *codeLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;


@end

@implementation SVXChooseAddTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dataForCell:(NSDictionary *)dic {
    self.nameLabel.text = [dic objectForKey:@"nameLabel"];
    self.codeLabel.text = [dic objectForKey:@"codeLabel"];
    self.phoneLabel.text = [dic objectForKey:@"phoneLabel"];
    self.addressLabel.text = [dic objectForKey:@"addressLabel"];
}

@end
