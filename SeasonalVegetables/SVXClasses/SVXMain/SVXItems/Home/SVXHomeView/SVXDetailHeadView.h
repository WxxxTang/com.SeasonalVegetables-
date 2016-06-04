//
//  SVXDetailHeadView.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/4.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXHeadDelegate <NSObject>

- (void)tapAction;

@end

@interface SVXDetailHeadView : UIView

@property (nonatomic, weak) id<SVXHeadDelegate> headDelegate;

- (instancetype)initHeadWithImageArray:(NSArray *)imageArray seasonStr:(NSString *)str;

@end
