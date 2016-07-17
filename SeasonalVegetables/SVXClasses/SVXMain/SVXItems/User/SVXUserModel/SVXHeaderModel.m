//
//  SVXHeaderModel.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXHeaderModel.h"

@implementation SVXHeaderModel
    /*
     网络加载数据dic
     */

- (instancetype)init{
    self = [super init];
    NSNotificationCenter *center =[NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(notiece:) name:@"reloaddata" object:nil];
    return self;
}
- (id)WithDic{
 
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        //获取NSUserDefaults对象
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        //保存数据
//        [defaults setBool:YES forKey:@"isLogin"];
//        [defaults setObject:@"游客13801" forKey:@"昵称"];
//        [defaults setObject:@"西安" forKey:@"所在城市"];
//        [defaults setObject:@"你既知人生如戏，更应该尽力演出，搭起的舞台过了一幕又沉入暗中。此刻你在台下仰望，且把你的艳美哀伤毫不吝惜交给我" forKey:@"个人签名"];
//        
//        UIImage *img =[UIImage imageNamed:@"Oval-1"];
//        NSData *imgData =UIImagePNGRepresentation(img);
//        [defaults setObject:imgData forKey:@"usericon"];
//        [defaults setInteger:20 forKey:@"age"];
//        [defaults setObject:@"男"  forKey:@"性别"];//YES表示性别为男性
//        //同步数据
//        [defaults synchronize];
//        
//        
//        
//    });
//
    
    
    //获取NSUserDefaults对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogin =[defaults boolForKey:@"isLogin"];
    NSData *data = [defaults objectForKey:@"usericon"];
    NSString *nickname = [defaults stringForKey:@"昵称"];
    NSString *qianming  =[defaults stringForKey:@"个人签名"];
    NSString *sex =[defaults stringForKey:@"性别"];
    NSString *city =[defaults stringForKey:@"所在城市"];
    
    if (isLogin==NO) {
        NSDictionary *dic = [[NSDictionary alloc] init];
        dic = @{@"昵称":@"游客13801",@"个人签名":@"你既知人生如戏，更应该尽力演出，搭起的舞台过了一幕又沉入暗中。此刻你在台下仰望，且把你的艳美哀伤毫不吝惜交给我",@"usericon":@"Oval-1",@"性别":@"男",@"所在城市":@"西安",@"isLogin":@YES};
//        
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            
//            //获取NSUserDefaults对象
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            //保存数据
//            [defaults setBool:YES forKey:@"isLogin"];
//            [defaults setObject:@"游客13801" forKey:@"昵称"];
//            [defaults setObject:@"西安" forKey:@"所在城市"];
//            [defaults setObject:@"你既知人生如戏，更应该尽力演出，搭起的舞台过了一幕又沉入暗中。此刻你在台下仰望，且把你的艳美哀伤毫不吝惜交给我" forKey:@"个人签名"];
//            
//            UIImage *img =[UIImage imageNamed:@"Oval-1"];
//            NSData *imgData =UIImagePNGRepresentation(img);
//            [defaults setObject:imgData forKey:@"usericon"];
//            [defaults setInteger:20 forKey:@"age"];
//            [defaults setObject:@"男"  forKey:@"性别"];//YES表示性别为男性
//            //同步数据
//            [defaults synchronize];
//            
//            
//            
//        });
        

        
        
        return dic;

    }else{
        
        
        //假装请求到了数据
        NSDictionary *dic = [[NSDictionary alloc] init];
        dic = @{@"昵称":nickname,@"个人签名":qianming,@"usericon":data,@"性别": sex,@"所在城市":city};
//        NSLog(@"%@",dic);
        
        return dic;
        

    }
    
  

}

- (void)notiece:(id)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    NSData *data = [defaults objectForKey:@"usericon"];
//    [self.headview.buttonhead setBackgroundImage:[UIImage imageWithData:data]
//                                        forState:UIControlStateNormal];
//    
//    
//    self.headview.namelabel.text = [defaults objectForKey:@"昵称"];
//    self.headview.detaillabel.text = [defaults objectForKey:@"个人签名"];
    
//    NSLog(@"%@",self.headview.namelabel.text);
    
//    [self WithDic];
    NSLog(@"通知");
}




@end
