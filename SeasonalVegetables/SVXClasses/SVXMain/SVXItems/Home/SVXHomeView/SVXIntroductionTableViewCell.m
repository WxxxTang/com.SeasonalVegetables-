//
//  SVXIntroductionTableViewCell.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/4.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXIntroductionTableViewCell.h"

@interface SVXIntroductionTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *containLabel;

@end

@implementation SVXIntroductionTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)dicForCellData:(NSDictionary *)dic {
    self.titleLabel.text = [dic objectForKey:@"titleLabel"];
    self.containLabel.text = [dic objectForKey:@"containLabel"];
}

@end
