//
//  SVXShopNextCollectionViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/1.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXShopNextCollectionViewCell.h"

@interface SVXShopNextCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation SVXShopNextCollectionViewCell

- (void)dicForCellData:(NSDictionary *)dic {
    self.headImage.image = [UIImage imageNamed:[dic objectForKey:@"headImage"]];
    self.nameLabel.text = [dic objectForKey:@"nameLabel"];
    self.priceLabel.text = [dic objectForKey:@"priceLabel"];
}

@end
