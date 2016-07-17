//
//  SVXBindingViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/3.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXBindingViewController.h"

@interface SVXBindingViewController () <UITextFieldDelegate>
@property (nonatomic ,strong) UITextField *textold;
@property (nonatomic ,strong) UITextField *textsecurity ;
@property (nonatomic ,strong) UITextField *textnew;
@end

@implementation SVXBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self loadBindingView];
}
- (void)loadBindingView{
    
    UILabel *oldmobile = [[UILabel alloc] init];
    [self.view addSubview:oldmobile];
    oldmobile.text =@"旧手机号";
    oldmobile.textColor =[UIColor grayColor];
    oldmobile.font =[UIFont fontWithName:@"PingFang SC" size:14];
    
    UILabel *securitycode =[[UILabel alloc] init];
    [self.view addSubview:securitycode];
    securitycode.text =@"验证码";
    securitycode.textColor =[UIColor grayColor];
    securitycode.font =[UIFont fontWithName:@"PingFang SC" size:14];

    UILabel *newmobile =[[UILabel alloc] init];
    [self.view addSubview: newmobile];
    newmobile.text =@"新手机号";
    newmobile.textColor =[UIColor grayColor];
    newmobile.font =[UIFont fontWithName:@"PingFang SC" size:14];
    
    UITextField *textold =[[UITextField alloc] init];
    [self.view addSubview:textold];
    textold.backgroundColor =[UIColor colorWithRed: 249/255.0
                                             green:249/255.0 blue:249/255.0 alpha:1];
    textold.layer.cornerRadius = 4;
    textold.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    textold.keyboardType= UIKeyboardTypeNumberPad;
    self.textold=textold;
    self.textold.delegate =self;


    
    UITextField *textsecurity =[[UITextField alloc] init];
    [self.view addSubview:textsecurity];
    textsecurity.backgroundColor =[UIColor colorWithRed: 249/255.0
                                                  green:249/255.0 blue:249/255.0 alpha:1];
    textsecurity.layer.cornerRadius = 4;
    textsecurity.enabled =YES;
    textsecurity.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textsecurity.autocapitalizationType = UITextAutocapitalizationTypeNone;

    self.textsecurity=textsecurity;
    self.textsecurity.delegate =self;



    UIButton * btnsecurity =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btnsecurity];
    [btnsecurity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnsecurity setBackgroundColor:[UIColor colorWithRed: 235/255.0
                                                  green:162/255.0 blue:160/255.0 alpha:1]];
    [btnsecurity setTitle:@"发送验证码" forState:UIControlStateNormal];
    btnsecurity.layer.cornerRadius = 4;
    btnsecurity.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:14];

    
    
    UITextField *textnew =[[UITextField alloc] init];
    [self.view addSubview:textnew];
    textnew.backgroundColor =[UIColor colorWithRed: 249/255.0
                                             green:249/255.0 blue:249/255.0 alpha:1];
    textnew.layer.cornerRadius = 4;
    textnew.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textnew.keyboardType=UIKeyboardTypeNumberPad;
    self.textnew=textnew;
    self.textnew.delegate =self;



    UIButton *buttonsend =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttonsend];
    [buttonsend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonsend setBackgroundColor:[UIColor colorWithRed: 214/255.0
                                                   green:214/255.0 blue:214/255.0 alpha:1]];
    [buttonsend setTitle:@"提交" forState:UIControlStateNormal];
    [buttonsend addTarget:self action:@selector(btnsend) forControlEvents:UIControlEventTouchUpInside];
    buttonsend.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:16];
    buttonsend.layer.cornerRadius = 6  ;
    
                                     

    
    
    
    
    [oldmobile makeConstraints:^(MASConstraintMaker *make) {
        make.top.lessThanOrEqualTo(self.view.top).offset(74);
        make.left.equalTo(self.view.left).offset(20);
        make.height.equalTo(@37);
        make.width.equalTo(57);
    }];
    [textold makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldmobile.top);
        make.left.equalTo(oldmobile.right).offset(10);
        make.right.equalTo(self.view.right).offset(-15);
        make.height.equalTo(oldmobile);
    }];
    
    
    [securitycode makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldmobile.bottom).offset(10);
        make.left.equalTo(oldmobile.left);
        make.height.equalTo(oldmobile.height);
        make.width.equalTo(oldmobile.width);
    }];
    [textsecurity makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(securitycode);
        make.left.equalTo(securitycode.right).offset(10);
        make.right.equalTo(btnsecurity.left).offset(-13);
        make.height.equalTo(securitycode.height);
        
    }];
    
    [btnsecurity makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textsecurity);
        make.left.equalTo(textsecurity.right).offset(13);
        make.right.equalTo(self.view.right).offset(-15);
        make.height.equalTo(securitycode.height);
        
    }];
    
    [newmobile makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(securitycode.bottom).offset(10);
        make.left.equalTo(self.view.left).offset(20);
        make.height.equalTo(oldmobile.height);
        make.width.equalTo(oldmobile.width);
    }];
    [textnew makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newmobile.top);
        make.left.equalTo(newmobile.right).offset(10);
        make.right.equalTo(self.view.right).offset(-15);
        make.height.equalTo(newmobile);
    }];
    
    [buttonsend makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(newmobile.bottom).offset(30);
        make.left.equalTo(self.view.left).offset(30);
        make.right.equalTo(self.view.right).offset(-30);
        make.height.equalTo(44);
        
    }];
    
    

    
}
- (void)btnsend {
    UIAlertController  * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"提交成功" preferredStyle:1];
    UIAlertAction  *defalutAction  = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                [self.navigationController popToRootViewControllerAnimated:YES];                                                            }];
    
    [alert addAction:defalutAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textold resignFirstResponder];
    [self.textsecurity resignFirstResponder];
    [self.textnew resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField  == self.textsecurity) {//判断是哪个输入框
        NSString *securityString = [self.textsecurity.text  stringByReplacingCharactersInRange:range
                                                                          withString:string];
        if ([securityString length] >4) {
            NSLog(@"多了");
            return NO;
        }
    }
    else if (textField == self.textold){
        NSString *oldString = [self.textold.text  stringByReplacingCharactersInRange:range
                                                                                    withString:string];
        if ([oldString length] >11) {
            NSLog(@"多了");
            return NO;
        }
    }
    else if (textField ==self.textnew){
        NSString *newString = [self.textnew.text  stringByReplacingCharactersInRange:range
                                                                               withString:string];
        if ([newString length] >11) {
            NSLog(@"多了");
            return NO;
        }

    }
    
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    [self.textold resignFirstResponder];
    [self.textsecurity resignFirstResponder];
    [self.textnew resignFirstResponder];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
