//
//  SVXShopNextViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/1.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXShopNextViewController.h"
#import "SVXShopNextCollectionViewCell.h"
#import <MJRefresh/MJRefresh.h>

static NSString * const kSVXShopNextCell = @"kSVXShopNextCell";

@interface SVXShopNextViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView  *collectionView;

@end

@implementation SVXShopNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_initCollectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 加载collecitonView
- (void)p_initCollectionView {
    
    UICollectionViewFlowLayout *flowLayout  = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView                     = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                                 collectionViewLayout:flowLayout];
    self.collectionView.dataSource          = self;
    self.collectionView.delegate            = self;
    self.collectionView.backgroundColor     = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    //注册UICollectionViewCell
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXShopNextCollectionViewCell class]) bundle:nil]
          forCellWithReuseIdentifier:kSVXShopNextCell];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self.view);
    }];
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(p_loadHeadData)];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(p_loadFootData)];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SVXShopNextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSVXShopNextCell forIndexPath:indexPath];

    NSDictionary *dic = @{ @"headImage" : @"秋葵2f",
                           @"nameLabel" : @"秋葵",
                           @"priceLabel" : @"¥ 20(斤)"};
   
    [cell dicForCellData:dic];
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
//定义每个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size;
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        size.width = 320;
        size.height = 350;
    } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        size.width = self.view.frame.size.width * 0.4;
        size.height = self.view.frame.size.width * 0.4 + 30;
    }
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 20, 10, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选择");
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - 下拉刷新事件
- (void)p_loadHeadData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
        
        [self.collectionView.mj_header endRefreshing];
    });
}

#pragma mark - 上拉加载事件
- (void)p_loadFootData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
        
        [self.collectionView.mj_footer endRefreshing];
    });
}

@end
