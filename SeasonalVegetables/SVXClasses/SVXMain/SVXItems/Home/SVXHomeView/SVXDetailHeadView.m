//
//  SVXDetailHeadView.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/4.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXDetailHeadView.h"

@interface SVXDetailHeadView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView  *headScroll;
@property (nonatomic, strong) UIPageControl *pageCtrl;

@end

@implementation SVXDetailHeadView

- (instancetype)initHeadWithImageArray:(NSArray *)imageArray seasonStr:(NSString *)str{
    self = [super init];
    if (self) {
        [self p_setupScroll:imageArray seasonStr:str];
    }
    return self;
}

- (void)p_setupScroll:(NSArray *)imageArray seasonStr:(NSString *)str{
    
    self.headScroll = [[UIScrollView alloc] init];
    self.headScroll.backgroundColor = [UIColor whiteColor];
    self.headScroll.showsHorizontalScrollIndicator = NO;
    self.headScroll.bounces = NO;
    self.headScroll.pagingEnabled = YES;
    self.headScroll.delegate = self;
    [self addSubview:self.headScroll];
    
    [self.headScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-75);
    }];
    
    UIImageView *preView;
    for (int index = 0; index < imageArray.count; index++) {
        //添加开头的图片
        UIImageView *headImage = [[UIImageView alloc] init];
        headImage.image = [UIImage imageNamed:imageArray[index]];
        headImage.userInteractionEnabled = YES;
        [self.headScroll addSubview:headImage];
        
        UITapGestureRecognizer *headImageTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                              action:@selector(headTapAction:)];
        [headImage addGestureRecognizer:headImageTapGesture];
        
        [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            if (index == 0) {
                make.left.top.bottom.equalTo(self.headScroll);
                make.width.equalTo(self.mas_width);
                make.height.equalTo(self.headScroll.mas_height);
            } else if (index == imageArray.count - 1) {
                make.top.bottom.equalTo(self.headScroll);
                make.left.equalTo(preView.mas_right).offset(0);
                make.right.equalTo(self.headScroll.mas_right).offset(0);
                make.width.equalTo(self.mas_width);
                make.height.equalTo(self.headScroll.mas_height);
            } else {
                make.top.bottom.equalTo(self.headScroll);
                make.left.equalTo(preView.mas_right).offset(0);
                make.width.equalTo(self.mas_width);
                make.height.equalTo(self.headScroll.mas_height);
            }
        }];
        preView = headImage;
    }
    
    self.pageCtrl = [[UIPageControl alloc] init];
    self.pageCtrl.numberOfPages = imageArray.count;
    self.pageCtrl.currentPage = 0;
    self.pageCtrl.currentPageIndicatorTintColor = [UIColor colorWithRed:240 / 255.0 green:159 / 255.0 blue:159 / 255.0 alpha:1];
    self.pageCtrl.pageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:self.pageCtrl];
    
    [self.pageCtrl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.headScroll.mas_bottom).offset(0);
        make.height.equalTo(20);
    }];
    
    //添加显示时节的Label
    UILabel *seasonLabel = [[UILabel alloc] init];
    seasonLabel.text = str;
    seasonLabel.textColor = [UIColor colorWithRed:192 / 255.0 green:192 / 255.0 blue:192 / 255.0 alpha:1];
    seasonLabel.textAlignment = NSTextAlignmentCenter;
    seasonLabel.font = [UIFont fontWithName:@"PingFang SC" size:18.f];
    [self addSubview:seasonLabel];
    
    [seasonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.headScroll.mas_bottom).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.height.equalTo(60);
        make.width.equalTo(self.mas_width);
    }];
    
}

#pragma mark - UIScrollDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat page = scrollView.contentOffset.x / self.frame.size.width;
    self.pageCtrl.currentPage = page;
}

#pragma mark - 图片点击事件
- (void)headTapAction:(UITapGestureRecognizer *)tap {
    [self.headDelegate tapAction];
}

@end
