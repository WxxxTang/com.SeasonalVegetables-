//
//  SVXTabBarViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/26.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXTabBarViewController.h"
#import "SVXNavigationViewController.h"
#import "SVXHomeViewController.h"
#import "SVXShopViewController.h"
#import "SVXUserViewController.h"

@interface SVXTabBarViewController ()<UITabBarDelegate>
@property (nonatomic,strong) SVXHomeViewController* homeVC;
@property (nonatomic,strong) SVXShopViewController* shopVC;
@property (nonatomic,strong) SVXUserViewController* userVC;

@end

@implementation SVXTabBarViewController

- (void)loadTabBar{
    
    _homeVC = [[SVXHomeViewController alloc] init];
    [self addChildViewController:_homeVC
                     normalImage:[UIImage imageNamed:@"qindou-1"]
                     selectImage:[UIImage imageNamed:@"qindou-2"]
                           title:@"时蔬"];
    _shopVC =[[SVXShopViewController alloc] init];
    [self addChildViewController:_shopVC
                     normalImage:[UIImage imageNamed:@"shoping-1"]
                     selectImage:[UIImage imageNamed:@"shoping-2"]
                           title:@"商城"];
    _userVC =[[SVXUserViewController alloc] init];
    [self addChildViewController:_userVC
                     normalImage:[UIImage imageNamed:@"user-unchoose-1"]
                     selectImage:[UIImage imageNamed:@"user-unchoose-2"]
                           title:@"我的"];
    
    
    
    
    //    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:255/255.0
    //                                                               green:192/255.0 blue:203/255.0 alpha:0.5]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:249/255.0
                                                                  green:242/255.0 blue:222/255.0 alpha:1]];
    
    
//    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:202/255.0
//                                                           green:193/255.0 blue:104/255.0 alpha:1]];
    
    /* //在下面设置字体和颜色
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:202/255.0
                                                       green:193/255.0 blue:104/255.0 alpha:1]];
     */
    
    
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTabBar];
}

- (void)addChildViewController:(UIViewController *)childController
                   normalImage:(UIImage*) image
                   selectImage:(UIImage*) seleceImage
                         title:(NSString *) title{
    SVXNavigationViewController * nav = [[SVXNavigationViewController alloc]
                                         initWithRootViewController:childController];
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = seleceImage;
    nav.tabBarItem.title = title;
    childController.title =title;
    
    self.tabBar.tintColor = [UIColor colorWithRed:202/255.0
                                            green:193/255.0
                                             blue:104/255.0 alpha:1];

    
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:202/255.0
                                                                                            green:193/255.0
                                                                                             blue:104/255.0
                                                                                            alpha:1],
                                             NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:1.0]} forState:UIControlStateSelected];

//    nav.tabBarItem.badgeValue =@"111";
    
    [self addChildViewController: nav];
}

@end
