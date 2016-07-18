//
//  SVXDetailShopView.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/4.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXDetailDelegate <NSObject>

- (void)picAction;

@end

@interface SVXDetailShopView : UIView

@property (nonatomic, weak) id<SVXDetailDelegate> detailDelegate;

- (instancetype)initHeadWithImageArray:(NSArray *)imageArray;

@end
