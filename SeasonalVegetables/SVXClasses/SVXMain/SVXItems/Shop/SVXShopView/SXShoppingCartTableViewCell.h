//
//  SXShoppingCartTableViewCell.h
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/12.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXShoppingCartTableViewCell : UITableViewCell

@property (nonatomic ,strong)UIButton *btnchoose;
- (void)loadCell:(NSDictionary *)dic;

@end