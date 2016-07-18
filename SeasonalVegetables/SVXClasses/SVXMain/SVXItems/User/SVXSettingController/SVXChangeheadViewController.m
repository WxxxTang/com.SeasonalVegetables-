//
//  SVXChangeheadViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXChangeheadViewController.h"
#import "SVXPersonalViewController.h"

#import "SVXHeaderModel.h"

@interface SVXChangeheadViewController () <UITextFieldDelegate>
@property (nonatomic,strong) UITextField *filed;
@property (nonatomic,strong) UITextView *filedView;


@end

@implementation SVXChangeheadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self LoadChangeView];
    
    UIBarButtonItem * rightButton =[[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(textFieldChanged)];
//    rightButton.tintColor =[UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:rightButton];

}

- (void)textFieldChanged{
    //存NSUserDefaults对象
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     if ([self.title  isEqual: @"昵称"]) {
    [defaults setObject:self.filed.text forKey:@"昵称"];
    [defaults synchronize];
    }
     else if ([self.title isEqualToString:@"个人签名"]){
         [defaults setObject:self.filedView.text forKey:@"个人签名"];
         [defaults synchronize];

     }
    
//    NSNotification * noitce = [NSNotification notificationWithName:@"reloaddata"
//                                                            object:nil];
//    [[NSNotificationCenter defaultCenter] postNotification: noitce];
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    

}
- (void)LoadChangeView{
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([self.title  isEqual: @"昵称"]) {
        
        self.filed =[[UITextField alloc] init];
        [self.view addSubview:self.filed];
        self.filed.backgroundColor =[UIColor colorWithRed: 249/255.0
                                                    green:249/255.0 blue:249/255.0 alpha:1];
        self.filed.layer.cornerRadius = 4;
        self.filed.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        self.filed.clearButtonMode = UITextFieldViewModeAlways;
        
        self.filed.text = [defaults objectForKey:@"昵称"];
        
        [self.filed makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(40);
            make.width.equalTo(self.view.width);
            make.top.equalTo(self.view.top).offset(74);
            
            
        }];


    }
    else if ([self.title isEqualToString:@"个人签名"]){
        
        self.filedView =[[UITextView alloc] init];
        [self.view addSubview:self.filedView];
        self.filedView.backgroundColor =[UIColor colorWithRed: 249/255.0
                                                    green:249/255.0 blue:249/255.0 alpha:1];
        self.filedView.layer.cornerRadius = 4;
//        self.filed.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
//        self.filed.clearButtonMode = UITextFieldViewModeAlways;
        
        self.filedView.text = [defaults objectForKey:@"个人签名"];
        self.filedView.font =[UIFont fontWithName:@"PingFang SC" size:15];

        
        [self.filedView makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.view.height).multipliedBy(0.2);
            make.width.equalTo(self.view.width);

            
            
        }];
        
    }
    
    self.filed.delegate =self;
    
    
    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField ==self.filed) {
        NSString *securityString = [self.filed.text  stringByReplacingCharactersInRange:range
                                                                                    withString:string];
        if ([self.title isEqualToString:@"昵称"]) {
            if ([securityString length]>30 ) {
                return NO;
            }

        }else if ([self.title isEqualToString:@"个人签名"]){
            if ([securityString length]>10) {
                return NO;
            }
        }
        
        }
    
    return YES;
}

@end
