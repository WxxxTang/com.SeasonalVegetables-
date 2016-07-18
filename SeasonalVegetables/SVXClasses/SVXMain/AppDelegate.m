//
//  AppDelegate.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/5/26.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "AppDelegate.h"
#import "SVXTabBarViewController.h"
#import "SVXLoginViewController.h"//测试登陆
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //这里初始化判断变量
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    //这里判断是否为第一次
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        NSLog( @"firstLaunch!");
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:YES forKey:@"isLogin"];
        [defaults setObject:@"游客13801" forKey:@"昵称"];
        [defaults setObject:@"西安" forKey:@"所在城市"];
        [defaults setObject:@"你既知人生如戏，更应该尽力演出，搭起的舞台过了一幕又沉入暗中。此刻你在台下仰望，且把你的艳美哀伤毫不吝惜交给我" forKey:@"个人签名"];
        UIImage *img =[UIImage imageNamed:@"Oval-1"];
        NSData *imgData =UIImagePNGRepresentation(img);
        [defaults setObject:imgData forKey:@"usericon"];
        [defaults setInteger:20 forKey:@"age"];
        [defaults setObject:@"男"  forKey:@"性别"];//YES表示性别为男性
        
        [defaults synchronize];
    }

    SVXLoginViewController *vc =[[SVXLoginViewController alloc] init];
    self.window.rootViewController = vc;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
