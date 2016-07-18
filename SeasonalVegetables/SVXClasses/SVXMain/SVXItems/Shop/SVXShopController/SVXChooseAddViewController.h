//
//  SVXChooseAddViewController.h
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/6.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVXChooseDelegate <NSObject>

- (void)getAddress:(NSDictionary *)dic;

@end

@interface SVXChooseAddViewController : UIViewController

@property (nonatomic, weak) id<SVXChooseDelegate> chooseDelegate;

@end
