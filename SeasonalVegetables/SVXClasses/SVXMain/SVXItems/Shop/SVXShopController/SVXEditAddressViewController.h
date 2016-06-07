//
//  SVXEditAddressViewController.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXEditDelegate <NSObject>

- (void)addAddress:(NSDictionary *)dic;

@end

@interface SVXEditAddressViewController : UIViewController

@property (nonatomic, weak) id<SVXEditDelegate> editDelegate;

@end
