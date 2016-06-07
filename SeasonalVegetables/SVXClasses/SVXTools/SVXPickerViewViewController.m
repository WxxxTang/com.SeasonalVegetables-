//
//  SVXPickerViewViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/7.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXPickerViewViewController.h"

@interface SVXPickerViewViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, copy)   NSArray       *cityArray;
@property (nonatomic, copy)   NSString      *chooseText;

@end

@implementation SVXPickerViewViewController

- (NSArray *)cityArray {
    if (_cityArray == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"city" ofType:@"plist"];
        _cityArray = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _cityArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    //初始化chooseText
    NSDictionary *items = [self.cityArray objectAtIndex:0];
    NSArray *cities = [items objectForKey:@"cities"];
    NSString *str1 = [items objectForKey:@"state"];
    self.chooseText = [NSString stringWithFormat:@"%@,%@", str1, cities[0]];
    
    [self p_setupView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setupView
- (void)p_setupView {
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor colorWithRed:255 / 255.0  green:252 / 255.0 blue:235 / 255.0 alpha:0.7];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.height.equalTo(@250);
    }];
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    [backView addSubview:pickerView];
    
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(backView).offset(0);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"请选择地区";
    titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:14.f];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backView.mas_centerX);
        make.height.equalTo(@25);
        make.top.equalTo(backView.mas_top).offset(4.5);
    }];
    
    UIButton *overButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [overButton setTitle:@"完成" forState:UIControlStateNormal];
    [overButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    overButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13.f];
    [overButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:overButton];
    
    [overButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backView.mas_right).offset(-8);
        make.top.equalTo(backView.mas_top).offset(4.5);
        make.width.equalTo(@50);
        make.height.equalTo(@25);
    }];
}

- (void)buttonAction:(UIButton *)sender {
    if (_pickDelegate && [_pickDelegate respondsToSelector:@selector(pickText:)]) {
        [_pickDelegate pickText:_chooseText];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIPickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.cityArray.count;
    }
    
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSDictionary *items = [self.cityArray objectAtIndex:selectedRow];
    NSArray *cities = [items objectForKey:@"cities"];
    
    return cities.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    if (component == 0) {
        NSDictionary *dic = [self.cityArray objectAtIndex:row];
        NSString *state = [dic objectForKey:@"state"];
        return state;
    }
    
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSDictionary *items = [self.cityArray objectAtIndex:selectedRow];
    NSArray *cities = [items objectForKey:@"cities"];
    NSString *cityName = [cities objectAtIndex:row];
    return cityName;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.view.frame.size.width / 2.0;
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    NSInteger selectedRow1 = [pickerView selectedRowInComponent:0];
    NSInteger selectedRow2 = [pickerView selectedRowInComponent:1];
    
    NSDictionary *items = [self.cityArray objectAtIndex:selectedRow1];
    NSArray *cities = [items objectForKey:@"cities"];
    NSString *str1 = [items objectForKey:@"state"];
    
    self.chooseText = [NSString stringWithFormat:@"%@,%@", str1, cities[selectedRow2]];
    
}

#pragma mark - 点击背景去掉pickerView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
