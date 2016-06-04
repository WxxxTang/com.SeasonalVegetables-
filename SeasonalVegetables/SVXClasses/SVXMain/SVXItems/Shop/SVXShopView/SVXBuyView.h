//
//  SVXBuyView.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/4.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXBuyDelegate <NSObject>

- (void)buyAction:(NSString *)str;

@end

@interface SVXBuyView : UIView

@property (nonatomic, weak) id<SVXBuyDelegate>  buyDelegate;

- (instancetype)initWithPrice:(NSString *)price;

@end
