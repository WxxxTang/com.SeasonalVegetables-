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
static int const kNavBarH = 64;
static int const kButtonWidth = 70;
static int const kLineWidth = 50;

@interface SVXHomeViewController () <UIScrollViewDelegate, UISearchBarDelegate>

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
    
    NSLog(@"hello");
    
    self.containScroller.contentSize = CGSizeMake(self.childViewControllers.count * SVXWidth, 0);
    
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
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 4, SVXWidth - 130, 21)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜你想搜";
    [self.navigationController.navigationBar addSubview:self.searchBar];
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SVXWidth - 130, 30)];
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
    self.titleScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SVXWidth, kSVXTitleH)];
    self.titleScroller.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleScroller];
    
    [self.titleScroller addSubview:self.bottomLine];
}

#pragma mark - 设置内容
- (void)p_setupContainScroller {
    int y = kNavBarH + kSVXTitleH;
    
    self.containScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kSVXTitleH, SVXWidth, SVXHeight - y)];
    self.containScroller.backgroundColor = [UIColor whiteColor];
    self.containScroller.delegate = self;
    self.containScroller.pagingEnabled = YES;
    self.containScroller.showsHorizontalScrollIndicator = NO;
    self.containScroller.bounces = NO;
    [self.view addSubview:self.containScroller];
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
    
    self.containScroller.contentOffset = CGPointMake(index * SVXWidth, 0);
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
    CGFloat offSet = button.center.x - SVXWidth * 0.5;
    CGFloat maxOffSet = self.titleScroller.contentSize.width - SVXWidth;
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
    CGFloat x = index * SVXWidth;
    UIViewController *VC = self.childViewControllers[index];
    
    //判断是否已经加上
    if (VC.view.superview) {
        return;
    }
    
    VC.view.frame = CGRectMake(x, 0, SVXWidth, SVXHeight - self.containScroller.frame.origin.y);
    
    [self.containScroller addSubview:VC.view];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger i = self.containScroller.contentOffset.x / SVXWidth;
    [self p_selectButton:self.titleButtons[i]];
    [self p_setupOneChildController:i];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.x;
    NSUInteger leftIndex = offset / SVXWidth;
    NSUInteger rightIndex = leftIndex + 1;
    
    UIButton *leftButton = self.titleButtons[leftIndex];
    UIButton *rightButton = nil;
    if (rightIndex < self.titleButtons.count) {
        rightButton = self.titleButtons[rightIndex];
    }
    
    CGFloat transScale = kMaxScale - 1;
    CGFloat rightScale = offset / SVXWidth - leftIndex;
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
