//
//  SVXHeaderView.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXHeaderView.h"

@implementation SVXHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self loadHeadrView];
        
    }
    return self;
}

- (void)loadHeadrView{
    self.backgroundColor =[UIColor clearColor];
    
    _buttonhead = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonhead.layer.cornerRadius = self.bounds.size.width * 0.2 /2.0;
    _buttonhead.layer.masksToBounds =YES;

    [self addSubview:_buttonhead];
    
    _namelabel =[[UILabel alloc] init];
    [self addSubview:_namelabel];
    _namelabel.textColor =[UIColor grayColor];
    _namelabel.font =[UIFont fontWithName:@"PingFang SC" size:14];

    _detaillabel = [[UILabel alloc] init];
    [self addSubview:_detaillabel];
    _detaillabel.textColor =[UIColor grayColor];
    _detaillabel.font =[UIFont fontWithName:@"PingFang SC" size:12];
    [_detaillabel setNumberOfLines:0];

    
    [_buttonhead makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.width.equalTo(self.width).multipliedBy(0.2);
        make.height.equalTo(self.width).multipliedBy(0.2);
        make.left.equalTo(self.left).offset(15);
        
    }];
    
    [_namelabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_buttonhead.top);
        make.height.equalTo(20);
        make.left.equalTo(_buttonhead.right).offset(20);
        make.right.equalTo(self.right).priority(800);
    }];
    
    [_detaillabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_namelabel.bottom).offset(10);
        make.left.equalTo(_namelabel.left);
        make.right.equalTo(_namelabel.right).offset(-10);
    }];

}
@end
