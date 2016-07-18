//
//  SVXUserTableViewCell.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/29.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXUserTableViewCell.h"

@implementation SVXUserTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self loadcell];
    }
    return self;
}
- (void)loadcell{
    
    self.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.font =[UIFont fontWithName:@"PingFang SC" size:15];

}

@end
