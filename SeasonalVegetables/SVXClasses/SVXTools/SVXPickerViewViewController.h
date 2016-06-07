//
//  SVXPickerViewViewController.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXPickerViewDelegate <NSObject>

- (void)pickText:(NSString *)text;

@end

@interface SVXPickerViewViewController : UIViewController

@property (nonatomic, strong) id<SVXPickerViewDelegate> pickDelegate;

@end
