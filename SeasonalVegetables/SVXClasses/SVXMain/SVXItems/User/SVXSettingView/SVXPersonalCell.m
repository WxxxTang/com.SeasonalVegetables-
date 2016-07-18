//
//  SVXPersonalCell.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/2.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXPersonalCell.h"

@implementation SVXPersonalCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)loadCellWithdic:(NSDictionary *)dic{
    

//    UILabel *labelleft =[[UILabel alloc] init];
//    [self.contentView addSubview:labelleft];
//    labelleft.textColor =[UIColor grayColor];
//    labelleft.font =[UIFont fontWithName:@"PingFang SC" size:15];
//   
//    UILabel *labelcurrent =[[UILabel alloc] init];
//    [self.contentView addSubview:labelcurrent];
//    labelcurrent.textColor =[UIColor grayColor];
//    labelcurrent.font =[UIFont fontWithName:@"PingFang SC" size:15];
//    
//    UITextField *textfildCurrent = [[UITextField alloc] init];
//    [self.contentView addSubview:textfildCurrent];
//
//    
//    UIImageView *headimg =[[UIImageView alloc] init];
//    [self.contentView addSubview: headimg];
//    
//    UITextView * textarea = [[UITextView alloc] init];
//    [self.contentView addSubview:textarea];
//    textarea.text = @"个人签名";
//    textarea.font =[UIFont fontWithName:@"PingFang SC" size:15];
//
//
//    [labelleft makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.top.equalTo(self.contentView.top).offset(21);
//        make.bottom.equalTo(self.contentView.bottom);
//        make.left.equalTo(self.contentView.left).offset(25);
//        make.width.equalTo(@57);
//        
//    }];
//    
//    [headimg makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.contentView.center);
//        make.width.equalTo(@55);
//        make.height.equalTo(@55);
//    }];
//    
//    
//    [labelcurrent makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(labelleft.top);
//        make.bottom.equalTo(labelleft.bottom);
//        make.left.equalTo(labelleft.right).offset(40);
//        make.right.equalTo(self.contentView.right);
//        
//    }];

    
    
    
//    [textarea makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView.top);
//        make.left.equalTo(self.contentView.left).offset(25);
//        make.right.equalTo(self.contentView.right).offset(22);
//        make.bottom.equalTo(self.contentView.bottom).offset(22);
//    
//    }];
//

}

@end
