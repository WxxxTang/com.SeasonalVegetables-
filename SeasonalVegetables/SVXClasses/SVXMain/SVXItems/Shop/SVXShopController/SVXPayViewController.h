//
//  SVXPayViewController.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXPayDelegate <NSObject>

- (void)payResult;

@end

@interface SVXPayViewController : UIViewController

@property (nonatomic, weak) id<SVXPayDelegate> payDelegate;

@end
