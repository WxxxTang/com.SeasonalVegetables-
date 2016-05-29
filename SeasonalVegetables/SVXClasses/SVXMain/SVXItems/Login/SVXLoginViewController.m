//
//  SVXLoginViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/28.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXLoginViewController.h"
#import "SVXTabBarViewController.h"

@interface SVXLoginViewController ()

@end

@implementation SVXLoginViewController

- (void)loadLogin{
    self.view.backgroundColor =[UIColor whiteColor];
    
    UIImageView *backgroundView =[[UIImageView alloc] init];
    backgroundView.image =[UIImage imageNamed:@"login-background"];
    backgroundView.userInteractionEnabled =YES;
    [self.view addSubview:backgroundView];
    
    [backgroundView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(@70);
        make.right.bottom.equalTo(self.view).offset(@(-50));
        
    }];
    
    UIImageView *iconImg = [[UIImageView alloc] init];
    iconImg.image =[UIImage imageNamed:@"appicon"];
    [backgroundView addSubview: iconImg];
    [iconImg makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@100);
        make.centerX.equalTo(backgroundView.centerX);
        make.top.equalTo(backgroundView);
    }];
    
    UIButton *btnclose =[UIButton buttonWithType:UIButtonTypeCustom];
    [btnclose setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [btnclose addTarget:self
                action:@selector(btnClose) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnclose];
    [btnclose makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(30);
        make.bottom.equalTo(backgroundView.top).offset(@-20);
        make.left.equalTo(backgroundView.right);
        make.right.equalTo(self.view).offset(@(-30));
        
    }];
    
    
    
    UITextField *account =[[UITextField alloc] init];
    account.placeholder =@"手机号";
    account.background =[UIImage imageNamed:@"Rectangle 110"];
    account.font =[UIFont fontWithName:@"" size:10];
    [backgroundView addSubview:account];
    [account makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(iconImg.bottom).offset(@50);
        make.height.equalTo(@40);
        make.centerX.equalTo(backgroundView.centerX);
        make.left.right.equalTo(backgroundView);
    }];
    
    
    UITextField *passwords =[[UITextField alloc] init];
    passwords.placeholder =@"密码";
    passwords.font =[UIFont fontWithName:@"" size:10];
    passwords.enabled =YES;
    passwords.background =[UIImage imageNamed:@"Rectangle 110"];
    [backgroundView addSubview:passwords];
    [passwords makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(account.bottom).offset(@30);
        make.height.equalTo(@40);
        make.centerX.equalTo(backgroundView.centerX);
        make.left.right.equalTo(backgroundView);
    }];

    UIButton *btnlogin =[UIButton buttonWithType:UIButtonTypeCustom];
    [btnlogin setImage:[UIImage imageNamed:@"btnlogin"] forState:UIControlStateNormal];
    [btnlogin addTarget:self
                 action:@selector(btnLogin) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:btnlogin];
    [btnlogin makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwords.bottom).offset(@30);
        make.height.equalTo(@40);
        make.centerX.equalTo(backgroundView.centerX);
        make.left.right.equalTo(backgroundView);
        
    }];
    
    UIButton *registbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    [backgroundView addSubview:registbtn];
    [registbtn addTarget:self
                  action:@selector(registAccount) forControlEvents:UIControlEventTouchUpInside];
    [registbtn setTintColor:[UIColor grayColor]];
    
    [registbtn setTitle:@"注册账号" forState:UIControlStateNormal];
     [registbtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(btnlogin).offset(@60);
        make.left.equalTo(backgroundView.left);
        make.height.equalTo(@20);
        make.width.equalTo(@80);
        
    }];

    
    UIButton *lostbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    [backgroundView addSubview:lostbtn];
    [lostbtn addTarget:self
                  action:@selector(lostPassWord) forControlEvents:UIControlEventTouchUpInside];
    [lostbtn setTintColor:[UIColor grayColor]];
    [lostbtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [lostbtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnlogin).offset(@60);
        make.right.equalTo(backgroundView.right);
        make.height.equalTo(@20);
        make.width.equalTo(@80);
        
    }];

    UILabel *thirdloginlabel = [[UILabel alloc] init];
    [backgroundView addSubview:thirdloginlabel];
    [thirdloginlabel setText:@"第三方登陆"];
    [thirdloginlabel setTextColor:[UIColor grayColor]];
    [thirdloginlabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registbtn.bottom).offset(@50);
        make.centerX.equalTo(backgroundView.centerX);
        make.width.equalTo(@100);
        make.height.equalTo(30);
    }];
    
    
    UIButton *qqbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundView addSubview:qqbtn];
//    [qqbtn addTarget:self
//                action:@selector() forControlEvents:UIControlEventTouchUpInside];
    [qqbtn setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    [qqbtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(thirdloginlabel.bottom).offset(@20);
        make.left.equalTo(backgroundView.left).offset(10);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
    }];
    
    
    UIButton *wechatbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundView addSubview:wechatbtn];
//    [wechatbtn addTarget:self
//              action:@selector() forControlEvents:UIControlEventTouchUpInside];
    [wechatbtn setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    [wechatbtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(thirdloginlabel.bottom).offset(@20);
        make.centerX.equalTo(backgroundView.centerX);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
        
    }];

    UIButton *weibobtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundView addSubview:weibobtn];
//    [weibobtn addTarget:self
//                  action:@selector() forControlEvents:UIControlEventTouchUpInside];
    [weibobtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    [weibobtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(thirdloginlabel.bottom).offset(@20);
        make.right.equalTo(backgroundView.right).offset(-10);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
        
    }];

    
    
    
}
- (void)btnClose{
    NSLog(@"btnclose");
    SVXTabBarViewController * tab =[[SVXTabBarViewController alloc] init];
    [self presentViewController:tab animated:YES completion:nil];

}

- (void)btnLogin{
    NSLog(@"btnLogin");
    
}

- (void)registAccount{
    NSLog(@"registAccount");

}
- (void)lostPassWord{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLogin];
}




@end
