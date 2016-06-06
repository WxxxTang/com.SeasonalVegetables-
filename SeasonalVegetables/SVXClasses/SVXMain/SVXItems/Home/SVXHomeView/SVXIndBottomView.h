//
//  SVXIndBottomView.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/5.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXIndBottomDelegate <NSObject>

- (void)getResult:(BOOL)isSave;
- (void)buyAction;

@end

@interface SVXIndBottomView : UIView

@property (nonatomic, weak) id<SVXIndBottomDelegate> indDelegate;
@property (nonatomic ,assign) BOOL isSave;

@end
