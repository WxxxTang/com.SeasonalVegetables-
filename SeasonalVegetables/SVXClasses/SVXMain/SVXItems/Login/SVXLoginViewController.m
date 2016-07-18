//
//  SVXLoginViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/28.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXLoginViewController.h"
#import "SVXTabBarViewController.h"

@interface SVXLoginViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) UITextField *account;
@property (nonatomic ,strong) UITextField *passwords;

@end

@implementation SVXLoginViewController

- (void)loadLogin{
    self.view.backgroundColor =[UIColor whiteColor];
    
    UIImageView *backgroundView =[[UIImageView alloc] init];
    backgroundView.image =[UIImage imageNamed:@"login-background"];
    backgroundView.userInteractionEnabled =YES;
    [self.view addSubview:backgroundView];
    
    
    UIImageView *iconImg = [[UIImageView alloc] init];
    iconImg.image =[UIImage imageNamed:@"appicon"];
    [backgroundView addSubview: iconImg];
    
    
    UIButton *btnclose =[UIButton buttonWithType:UIButtonTypeCustom];
    [btnclose setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [btnclose addTarget:self
                 action:@selector(btnClose) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnclose];
    
    
    
    self.account =[[UITextField alloc] init];
    _account.placeholder =@" 手机号";
    _account.backgroundColor =[UIColor colorWithRed:243/255.0
                                              green:243/255.0
                                               blue:243/255.0 alpha:1];
    
    [backgroundView addSubview:_account];
    UIImageView *accountView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone"]];
    accountView.frame = CGRectMake(0, 0, 35, 35);
    accountView.contentMode = UIViewContentModeCenter;
    _account.leftView = accountView;
    _account.leftViewMode = UITextFieldViewModeAlways;
    _account.clearButtonMode = YES;
    _account.delegate = self;
    _account.font = [UIFont fontWithName:@"PingFang SC" size:13.0];
    _account.layer.cornerRadius = 5;
    
    
    self.passwords =[[UITextField alloc] init];
    [backgroundView addSubview:_passwords];
    _passwords.placeholder =@" 密码";
    _passwords.enabled =YES;
    _passwords.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;//设置其输入内容竖直居中
    UIImageView *lock = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock"]];
    lock.frame = CGRectMake(0, 0, 35, 35);
    lock.contentMode = UIViewContentModeCenter;
    _passwords.leftView = lock;
    _passwords.leftViewMode =UITextFieldViewModeAlways;
    _passwords.secureTextEntry =YES;
    _passwords.clearButtonMode =YES;
    _passwords.delegate =self;
    _passwords.font =[UIFont fontWithName:@"PingFang SC" size:13.0];
    _passwords.backgroundColor =[UIColor colorWithRed:243/255.0
                                                green:243/255.0
                                                 blue:243/255.0 alpha:1];
    _passwords.layer.cornerRadius = 5;
    
    
    
    UIButton *btnlogin =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnlogin.backgroundColor =[UIColor colorWithRed:214/255.0
                                              green:214/255.0
                                               blue:214/255.0 alpha:1];
    [btnlogin addTarget:self
                 action:@selector(btnLogin) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:btnlogin];
    [btnlogin setTitle:@"登陆" forState:UIControlStateNormal];
    [btnlogin setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnlogin.layer.cornerRadius =5;
    
    
    UIButton *registbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    [backgroundView addSubview:registbtn];
    [registbtn addTarget:self
                  action:@selector(registAccount) forControlEvents:UIControlEventTouchUpInside];
    [registbtn setTintColor:[UIColor grayColor]];
    [registbtn setTitle:@"注册账号" forState:UIControlStateNormal];
    registbtn.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:11.0];
    
    UIButton *lostbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    [backgroundView addSubview:lostbtn];
    [lostbtn addTarget:self
                action:@selector(lostPassWord) forControlEvents:UIControlEventTouchUpInside];
    [lostbtn setTintColor:[UIColor grayColor]];
    [lostbtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    lostbtn.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:11.0];
    
    
    
    
    UILabel *thirdloginlabel = [[UILabel alloc] init];
    [backgroundView addSubview:thirdloginlabel];
    [thirdloginlabel setText:@"第三方登陆"];
    thirdloginlabel.font =[UIFont fontWithName:@"PingFang SC" size:13.0];
    [thirdloginlabel setTextColor:[UIColor grayColor]];
    thirdloginlabel.textAlignment =NSTextAlignmentCenter;
    
    
    UIButton *qqbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundView addSubview:qqbtn];
    [qqbtn addTarget:self action:@selector(qqLogin) forControlEvents:UIControlEventTouchUpInside];
    [qqbtn setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    
    
    
    UIButton *wechatbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundView addSubview:wechatbtn];
    [wechatbtn addTarget:self action:@selector(weChatLogin) forControlEvents:UIControlEventTouchUpInside];
    [wechatbtn setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    
    
    UIButton *weibobtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundView addSubview:weibobtn];
    [weibobtn addTarget:self action:@selector(weiBoLogin) forControlEvents:UIControlEventTouchUpInside];
    [weibobtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    
    
    
    
    //update ---------
    [backgroundView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [iconImg makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backgroundView.centerX);
        make.top.equalTo(backgroundView).offset(50);
        make.height.equalTo(self.view.width).multipliedBy(0.25);
        make.width.equalTo(self.view.width).multipliedBy(0.25);
    }];
    
    [btnclose makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backgroundView.top).offset(50);
        make.height.equalTo(@20);
        make.right.equalTo(backgroundView.right).offset(@(-20));
        make.width.equalTo(@20);
        
    }];
    
    [_account makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImg.bottom).offset(@30);
        make.height.equalTo(38);
        make.centerX.equalTo(backgroundView.centerX);
        make.width.equalTo(self.view.width).multipliedBy(0.7);
    }];
    
    [_passwords makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_account.bottom).offset(@17);
        make.height.equalTo(38);
        make.centerX.equalTo(backgroundView.centerX);
        make.width.equalTo(self.view.width).multipliedBy(0.7);
    }];
    
    [btnlogin makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwords.bottom).offset(@17);
        make.height.equalTo(38);
        make.centerX.equalTo(backgroundView.centerX);
        make.width.equalTo(self.view.width).multipliedBy(0.7);
        
    }];
    
    [registbtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnlogin.bottom).offset(@20);
        make.left.equalTo(btnlogin.left);
        make.height.equalTo(@16);
        make.width.equalTo(@80);
        
    }];
    
    [lostbtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnlogin.bottom).offset(@20);
        make.right.equalTo(btnlogin.right);
        make.height.equalTo(@16);
        make.width.equalTo(@80);
        
    }];
    
    [thirdloginlabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registbtn.bottom).offset(20);
        make.height.equalTo(18);
        make.centerX.equalTo(backgroundView.centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@18);
    }];
    
    [qqbtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(thirdloginlabel.bottom).offset(10);
        //        make.bottom.equalTo(backgroundView.bottom);
        make.right.equalTo(wechatbtn.left).offset(@-59);
        make.height.equalTo(@25);
        make.width.equalTo(@25);
    }];
    
    
    [wechatbtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(qqbtn.top);
        make.centerX.equalTo(backgroundView.centerX);
        make.height.equalTo(@25);
        make.width.equalTo(@26);
        
    }];
    
    [weibobtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(qqbtn.top);
        make.left.equalTo(wechatbtn.right).offset(@59);
        make.height.equalTo(@25);
        make.width.equalTo(@24);
        
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
    NSLog(@"lostPassWord");
}

- (void)qqLogin {
    NSLog(@"qq");
}

- (void)weChatLogin {
    NSLog(@"wechat");
}

- (void)weiBoLogin {
    NSLog(@"weibo");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField  == self.account) {//判断是哪个输入框
        NSString *securityString = [self.account.text  stringByReplacingCharactersInRange:range
                                                                               withString:string];
        if ([securityString length] >11) {
            NSLog(@"多了");
            return NO;
        }
    }
    else if (textField == self.passwords){
        NSString *oldString = [self.passwords.text  stringByReplacingCharactersInRange:range
                                                                            withString:string];
        if ([oldString length] >15) {
            NSLog(@"多了");
            return NO;
        }
    }
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.account resignFirstResponder];
    [self.passwords resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.account resignFirstResponder];
    [self.passwords resignFirstResponder];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLogin];
}

@end
