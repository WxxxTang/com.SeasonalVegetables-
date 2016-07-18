//
//  SVXHotSearchTableViewCell.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXHotDelegate <NSObject>

- (void)detailHotButtonAction:(UIButton *)sender;

@end

@interface SVXHotSearchTableViewCell : UITableViewCell

@property (nonatomic, weak) id<SVXHotDelegate> hotDelegate;

- (void)updateSkin;

@end
