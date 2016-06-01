//
//  SVXHomeViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/26.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXHomeViewController.h"
#import "SVXDetailViewController.h"
#import "SVXSearchViewController.h"
#import "SVXRecomViewController.h"

#define SVXButtonUnSelColor [UIColor lightGrayColor]
#define SVXButtonSelColor   [UIColor colorWithRed:186 / 255.0 green:175 / 255.0 blue:58 / 255.0 alpha:1]

static CGFloat const kSVXTitleH = 44;
static CGFloat const kMaxScale = 1.3;
static int const kButtonWidth = 70;
static int const kLineWidth = 50;

@interface SVXHomeViewController () <UIScrollViewDelegate, UISearchBarDelegate> {
    UIView      *_preView;
    NSUInteger  _currentX;
}
//定义头部标题
@property (nonatomic, strong) UIScrollView  *titleScroller;
@property (nonatomic, strong) UIScrollView  *containScroller;
@property (nonatomic, strong) UISearchBar   *searchBar;

//当前选中的标题按钮
@property (nonatomic, strong) UIButton      *selectButton;

@property (nonatomic, strong) UIView        *bottomLine;

//添加的标题按钮集合
@property (nonatomic, strong) NSMutableArray <UIButton *> *titleButtons;

@end

@implementation SVXHomeViewController

- (NSMutableArray <UIButton *> *)titleButtons {
    if (_titleButtons == nil) {
        _titleButtons = [NSMutableArray array];
        
    }
    return _titleButtons;
}

- (UIView *)bottomLine {
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, kSVXTitleH - 2, kLineWidth, 2)];
        _bottomLine.backgroundColor = SVXButtonSelColor;
    }
    return _bottomLine;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_initWithNavigationBarItem];
    [self p_setupSearchBar];
    
    [self p_setupTitleScroller];
    [self p_setupContainScroller];
    [self p_setupChildViewController];
    [self p_setupTitle];
}

- (void)viewWillLayoutSubviews {
    //屏幕旋转修正containScroller的contentSize,修正到合适的大小
    self.containScroller.contentSize = CGSizeMake(self.view.frame.size.width * self.childViewControllers.count, 0);
    
    //同样是修正位置，将当前的contentOffset修正到合适的位置
    self.containScroller.contentOffset = CGPointMake(_currentX * self.view.frame.size.width, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置navigationBar上的Item
- (void)p_initWithNavigationBarItem {
    UITapGestureRecognizer *saoyisaoTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(soayisaoTapAction:)];
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    leftView.image = [UIImage imageNamed:@"saoyisao"];
    leftView.userInteractionEnabled = YES;
    [leftView addGestureRecognizer:saoyisaoTapGesture];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    rightLabel.text = @"推荐";
    rightLabel.textColor = [UIColor colorWithRed:126 / 255.0 green:122 / 255.0 blue:122 / 255.0 alpha:1];
    rightLabel.font = [UIFont fontWithName:@"PingFang SC" size:15.f];
    rightLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *recommendTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(recommendAction:)];
    [rightLabel addGestureRecognizer:recommendTapGesture];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
}

#pragma mark - 设置搜索栏
- (void)p_setupSearchBar {
    UIView *searchView = nil;
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 4, 580, 21)];
        searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 580, 30)];
    } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 4, self.view.frame.size.width - 130, 21)];
        searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 130, 30)];
    }
    
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜你想搜";
    searchView.backgroundColor = [UIColor whiteColor];
    searchView.layer.cornerRadius = 10;
    [searchView addSubview:self.searchBar];
    
    self.navigationItem.titleView = searchView;
}

#pragma mark - 扫一扫
- (void)soayisaoTapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"saoyisao");
}

#pragma mark - 推荐
- (void)recommendAction:(UITapGestureRecognizer *)tap {
    SVXRecomViewController *recomVC = [[SVXRecomViewController alloc] init];
    recomVC.title = @"推荐";
    recomVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:recomVC animated:YES];
}

#pragma mark - 设置头部标题栏
- (void)p_setupTitleScroller {
    self.titleScroller = [[UIScrollView alloc] init];
    self.titleScroller.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleScroller];
    
    [self.titleScroller addSubview:self.bottomLine];
    
    [self.titleScroller mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.offset(kSVXTitleH);
    }];
}

#pragma mark - 设置内容
- (void)p_setupContainScroller {
    
    self.containScroller = [[UIScrollView alloc] init];
    self.containScroller.backgroundColor = [UIColor whiteColor];
    self.containScroller.delegate = self;
    self.containScroller.pagingEnabled = YES;
    self.containScroller.showsHorizontalScrollIndicator = NO;
    self.containScroller.bounces = NO;
    [self.view addSubview:self.containScroller];
    
    [self.containScroller mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.top.equalTo(self.view.mas_top).offset(kSVXTitleH);
    }];
}

#pragma mark - 添加子控制器
- (void)p_setupChildViewController {
    SVXDetailViewController *springVC = [[SVXDetailViewController alloc] init];
    springVC.title = @"春";
    [self addChildViewController:springVC];
    
    SVXDetailViewController *summerVC = [[SVXDetailViewController alloc] init];
    summerVC.title = @"夏";
    [self addChildViewController:summerVC];
    
    SVXDetailViewController *autumVC = [[SVXDetailViewController alloc] init];
    autumVC.title = @"秋";
    [self addChildViewController:autumVC];
    
    SVXDetailViewController *winterVC = [[SVXDetailViewController alloc] init];
    winterVC.title = @"冬";
    [self addChildViewController:winterVC];
    
    //添加4个占位View
    UIView *tempView = nil;
    for (int i = 0; i < self.childViewControllers.count; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        [self.containScroller addSubview:view];
        
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(self.containScroller);
                make.width.equalTo(self.view.mas_width);
                make.height.equalTo(self.containScroller.mas_height);
            }];
        } else if(i == 3){
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(tempView.mas_right).offset(0);
                make.top.right.bottom.equalTo(self.containScroller);
                make.width.equalTo(self.view.mas_width);
                make.height.equalTo(self.containScroller.mas_height);
            }];
        } else {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(tempView.mas_right).offset(0);
                make.top.bottom.equalTo(self.containScroller);
                make.width.equalTo(self.view.mas_width);
                make.height.equalTo(self.containScroller.mas_height);
            }];
        }
        tempView = view;
    }
    
}

#pragma mark - 添加标题
- (void)p_setupTitle {
    NSUInteger icount = self.childViewControllers.count;
    
    CGFloat currentX = 0;
    CGFloat width = kButtonWidth;
    CGFloat height = kSVXTitleH;
    
    for (int index = 0; index < icount; index++) {
        UIViewController *VC = self.childViewControllers[index];
        currentX = index * width;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(currentX, 0, width, height);
        button.tag = index;
        
        [button setTitle:VC.title forState:UIControlStateNormal];
        [button setTitleColor:SVXButtonUnSelColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.f];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.titleScroller addSubview:button];
        [self.titleButtons addObject:button];
        
        if (index == 0) {
            [self buttonAction:button];
        }
        
    }
    self.titleScroller.contentSize = CGSizeMake(icount * width, 0);
    self.titleScroller.showsHorizontalScrollIndicator = NO;
    
}

#pragma mark - 按钮点击事件
- (void)buttonAction:(UIButton *)sender {
    [self p_selectButton:sender];
    
    NSUInteger index = sender.tag;
    [self p_setupOneChildController:index];
    _currentX = index;
    
    self.containScroller.contentOffset = CGPointMake(index * self.view.frame.size.width, 0);
}

#pragma mark - 选中按钮进行的操作
- (void)p_selectButton:(UIButton *)button {
    [self.selectButton setTitleColor:SVXButtonUnSelColor forState:UIControlStateNormal];
    //将选中的button的transform重置
    self.selectButton.transform = CGAffineTransformIdentity;
    
    [button setTitleColor:SVXButtonSelColor forState:UIControlStateNormal];
    button.transform = CGAffineTransformMakeScale(kMaxScale, kMaxScale);
    
    //添加按钮下面线的移动动画
    CGFloat x = button.frame.origin.x + (kButtonWidth * 0.15) + (kButtonWidth - kLineWidth) / 2.0;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.bottomLine.frame = CGRectMake(x, self.bottomLine.frame.origin.y, kLineWidth, self.bottomLine.frame.size.height);
    } completion:nil];
    
    self.selectButton = button;
    [self p_setupButtonCenter:button];
}

#pragma mark - 将当前选中的按钮置于中心
- (void)p_setupButtonCenter:(UIButton *)button {
    CGFloat offSet = button.center.x - self.view.frame.size.width * 0.5;
    CGFloat maxOffSet = self.titleScroller.contentSize.width - self.view.frame.size.width;
    if (offSet > maxOffSet) {
        offSet = maxOffSet;
    }
    
    if (offSet < 0) {
        offSet = 0;
    }
    
    [self.titleScroller setContentOffset:CGPointMake(offSet, 0) animated:YES];
}

#pragma mark - 添加一个子视图方法
- (void)p_setupOneChildController:(NSUInteger)index {
    UIViewController *VC = self.childViewControllers[index];
    
    //判断是否已经加上
    if (VC.view.superview) {
        return;
    }
    
    [self.containScroller addSubview:VC.view];
    
    if (index == 0) {
        [VC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.containScroller);
            make.width.equalTo(self.view.mas_width);
            make.height.equalTo(self.containScroller.mas_height);
        }];
    } else if(index == 3){
        [VC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_preView.mas_right).offset(0);
            make.top.right.bottom.equalTo(self.containScroller);
            make.width.equalTo(self.view.mas_width);
            make.height.equalTo(self.containScroller.mas_height);
        }];
    } else {
        [VC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_preView.mas_right).offset(0);
            make.top.bottom.equalTo(self.containScroller);
            make.width.equalTo(self.view.mas_width);
            make.height.equalTo(self.containScroller.mas_height);
        }];
    }
    _preView = VC.view;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger i = self.containScroller.contentOffset.x / self.view.frame.size.width;
    [self p_selectButton:self.titleButtons[i]];
    [self p_setupOneChildController:i];
    _currentX = i;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.x;
    NSUInteger leftIndex = offset / self.view.frame.size.width;
    NSUInteger rightIndex = leftIndex + 1;
    
    UIButton *leftButton = self.titleButtons[leftIndex];
    UIButton *rightButton = nil;
    if (rightIndex < self.titleButtons.count) {
        rightButton = self.titleButtons[rightIndex];
    }
    
    CGFloat transScale = kMaxScale - 1;
    CGFloat rightScale = offset / self.view.frame.size.width - leftIndex;
    CGFloat leftScale = 1 - rightScale;
    
    leftButton.transform = CGAffineTransformMakeScale(leftScale * transScale + 1, leftScale * transScale + 1);
    rightButton.transform = CGAffineTransformMakeScale(rightScale * transScale + 1, rightScale * transScale + 1);
    
}

#pragma mark - SearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    SVXSearchViewController *searchVC = [[SVXSearchViewController alloc] init];
    searchVC.title = @"搜索";
    searchVC.hidesBottomBarWhenPushed = YES;
    searchVC.isShop = NO;
    [self.navigationController pushViewController:searchVC animated:YES];
    return NO;
}

@end
