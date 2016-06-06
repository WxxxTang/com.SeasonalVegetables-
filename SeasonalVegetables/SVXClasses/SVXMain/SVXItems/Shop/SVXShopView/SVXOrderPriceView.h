//
//  SVXOrderPriceView.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/6.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXOrderBuyDelegate <NSObject>

- (void)orderBuyAction;

@end

@interface SVXOrderPriceView : UIView

@property (nonatomic, weak) id<SVXOrderBuyDelegate> orderBuyDelegate;

- (instancetype)initWithPrice:(NSString *)price;

@end
