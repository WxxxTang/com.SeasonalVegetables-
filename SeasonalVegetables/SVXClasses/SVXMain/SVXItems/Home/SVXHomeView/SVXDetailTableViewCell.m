//
//  SVXDetailTableViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/29.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXDetailTableViewCell.h"

@interface SVXDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *picImage;
@property (weak, nonatomic) IBOutlet UILabel *seasonLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moreLabel;


@end

@implementation SVXDetailTableViewCell

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
    self.picImage.image = [UIImage imageNamed:[dic objectForKey:@"imageName"]];
    self.seasonLabel.text = [dic objectForKey:@"seasonName"];
    self.nameLabel.text = [dic objectForKey:@"vetaName"];
    self.moreLabel.text = [dic objectForKey:@"moreName"];
}

@end
