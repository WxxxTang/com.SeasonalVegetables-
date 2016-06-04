//
//  SVXShopListTableViewCell.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/1.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXShopListDelegate <NSObject>

- (void)buttonActionMethod:(NSString *)string;

@end

@interface SVXShopListTableViewCell : UITableViewCell

@property (nonatomic, weak) id<SVXShopListDelegate> shopDelegate;

- (void)dicForCellData:(NSDictionary *)dic;

@end
