//
//  SVXPasswordViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/3.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXPasswordViewController.h"

@interface SVXPasswordViewController () <UITextFieldDelegate>

@property(nonatomic ,strong)UITextField *oldTF;
@property(nonatomic ,strong)UITextField *anewTf;
@property(nonatomic ,strong)UITextField *againTF;

@end

@implementation SVXPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self loadPassWordView];
}

- (void)loadPassWordView{
    self.oldTF =[[UITextField alloc] init];
    [self.view addSubview: self.oldTF];
    self.oldTF.backgroundColor =[UIColor colorWithRed: 249/255.0
                                             green:249/255.0 blue:249/255.0 alpha:1];
    self.oldTF.layer.cornerRadius = 4;
    self.oldTF.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    self.oldTF.placeholder =@"输入旧密码";
    self.oldTF.delegate =self;
    
    self.anewTf =[[UITextField alloc] init];
    [self.view addSubview:self.anewTf];
    self.anewTf.backgroundColor =[UIColor colorWithRed: 249/255.0
                                                green:249/255.0 blue:249/255.0 alpha:1];
    self.anewTf.layer.cornerRadius = 4;
    self.anewTf.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    self.anewTf.placeholder =@"输入新密码";
    self.anewTf.delegate =self;
    
    self.againTF =[[UITextField alloc] init];
    [self.view addSubview:self.againTF];
    self.againTF.backgroundColor =[UIColor colorWithRed: 249/255.0
                                                 green:249/255.0 blue:249/255.0 alpha:1];
    self.againTF.layer.cornerRadius = 4;
    self.againTF.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    self.againTF.placeholder =@"再次输入";
    self.againTF.delegate =self;
    
    UIButton *buttonsend =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttonsend];
    [buttonsend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonsend setBackgroundColor:[UIColor colorWithRed: 214/255.0
                                                   green:214/255.0 blue:214/255.0 alpha:1]];
    [buttonsend setTitle:@"提交" forState:UIControlStateNormal];
    [buttonsend addTarget:self action:@selector(btnsend) forControlEvents:UIControlEventTouchUpInside];
    buttonsend.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:16];
    buttonsend.layer.cornerRadius = 6  ;


    [self.oldTF makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(76);
        make.left.equalTo(self.view.left).offset(37);
        make.right.equalTo(self.view.right).offset(-37);
        make.height.equalTo(40);
    }];
    
    [self.anewTf makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oldTF.bottom).offset(11);
        make.left.equalTo(self.oldTF.left);
        make.right.equalTo(self.oldTF.right);
        make.height.equalTo(self.oldTF);
    }];
    [self.againTF makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.anewTf.bottom).offset(11);
        make.left.equalTo(self.anewTf.left);
        make.right.equalTo(self.anewTf.right);
        make.height.equalTo(self.anewTf);
    }];
    
    [buttonsend makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.againTF.bottom).offset(35);
        make.left.equalTo(self.againTF.left);
        make.right.equalTo(self.againTF.right);

    }];

}

- (void)btnsend {
    UIAlertController  * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"提交成功" preferredStyle:1];
    UIAlertAction  *defalutAction  = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                
                                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                                            }];
    [alert addAction:defalutAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.oldTF resignFirstResponder];
    [self.anewTf resignFirstResponder];
    [self.againTF resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    [self.oldTF resignFirstResponder];
    [self.anewTf resignFirstResponder];
    [self.againTF resignFirstResponder];
    
}



@end
