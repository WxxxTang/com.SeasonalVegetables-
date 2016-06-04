//
//  SVXIntroduceViewController.m
//  SeasonalVegetables
//
//  Created by Tangtang on 16/6/2.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXIntroduceViewController.h"
#import "SVXDetailHeadView.h"
#import "SVXIntroductionTableViewCell.h"

static NSString * const kInstroductCell = @"kInstroductCell";

@interface SVXIntroduceViewController ()<SVXHeadDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy)   NSArray               *listArray;
@property (nonatomic, copy)   NSArray               *containArray;
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) CAShapeLayer          *shapeLayer;
@property (nonatomic, strong) SVXDetailHeadView     *svxHeadView;

@end

@implementation SVXIntroduceViewController

- (NSArray *)listArray {
    if (_listArray == nil) {
        _listArray = @[@"基础介绍", @"营养价值", @"适宜人群", @"禁忌搭配", @"烹饪指导与做法"];
    }
    return _listArray;
}

- (NSArray *)containArray {
    if (_containArray == nil) {
        _containArray = @[@"      秋葵(学名：Abelmoschus esculentus)亦称黄秋葵、咖啡黄葵，俗名羊角豆、潺茄，性喜温暖，原产地为非洲今日埃塞俄比亚附近以及亚洲热带，当今黄秋葵已成为人们所热追高档营养保健蔬菜，风靡全球。它的可食用部分是果荚，又分绿色和红色两种，其脆嫩多汁，滑润不腻，香味独特，深受百姓青睐", @"      秋葵中富含的锌和硒等微量元素，对增强人体防癌抗癌能力很有帮助。主要有利咽、通淋、下乳、调经等功效。[5]  还可治疗咽喉肿痛、小便淋涩、预防糖尿病、预防癌症、保护胃黏膜。黄秋葵的粘性物质，可促进胃肠蠕动，有益于助消化，益肠胃。可提高耐缺氧能力。黄秋葵的果胶，多糖有护肝功效。黄秋葵的粘性物质中含有50%纤维素有利防肠癌。此外，这种粘液还可用于医药方面，作为润肤剂、镇定剂和止痰剂。同时，黄秋葵粘液在食品行业可以用来增加冷冻奶制甜品稳定性和所有产品稳定性和可接受性，并且可以作为脂肪的替代品。黄秋葵不仅含钙量与鲜奶相当，且钙的吸收率在50～60%，高于牛奶1倍，故是理想的钙源。黄秋葵为低能量食物，是很好的减肥食物。对青壮年和运动员而言，经常食用，可消除疲劳、迅速恢复体力，当然这对所有人群均有此效果。黄秋葵又叫羊角豆，美国人称其为“植物伟哥”，可见它的补肾功效。", @"      适合老人和小孩食用", @"      暂无！", @"      新鲜的秋葵脆嫩多汁，滑润清香，可凉拌、热炒、炖汤等，在凉拌和炒食之前最好在沸水中汆烫几分钟以去除涩味。"];
    }
    return _containArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self p_initWithNavigationBarItem];
    [self p_setupTableView];
    [self p_setupHeadView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.shapeLayer = nil;
    self.svxHeadView = nil;
    self.tableView = nil;
}

- (void)viewWillLayoutSubviews {
    self.shapeLayer.frame = CGRectMake(self.view.frame.size.width / 2.0 - 30,
                                       self.svxHeadView.frame.size.height - 60, 60, 60);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化NavigationBarItem
- (void)p_initWithNavigationBarItem {
    UITapGestureRecognizer *shoucanTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(shoucanTapAction:)];
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 23, 22)];
    leftView.image = [UIImage imageNamed:@"shoucan"];
    leftView.userInteractionEnabled = YES;
    [leftView addGestureRecognizer:shoucanTapGesture];
    UIBarButtonItem *shoucanItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    rightView.image = [UIImage imageNamed:@"share"];
    rightView.userInteractionEnabled = YES;
    UITapGestureRecognizer *shareTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(shareAction:)];
    [rightView addGestureRecognizer:shareTap];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    
    self.navigationItem.rightBarButtonItems = @[shareItem, shoucanItem];
}

#pragma mark - 初始化ScrollView
- (void)p_setupTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                                  style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 66;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 4)];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SVXIntroductionTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:kInstroductCell];
}

#pragma mark - 创建头部视图
- (void)p_setupHeadView {
    //添加头视图
    NSArray *imageArray = @[@"秋葵1f", @"秋葵2f", @"秋葵3f"];
    self.svxHeadView = [[SVXDetailHeadView alloc] initHeadWithImageArray:imageArray seasonStr:@"春"];
    self.svxHeadView.headDelegate = self;
    
    CGRect size;
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        size = CGRectMake(0, 0, self.view.frame.size.width, 455);
    } else if([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        size = CGRectMake(0, 0, self.view.frame.size.width, 285);
    }
    self.svxHeadView.frame = size;
    
    self.tableView.tableHeaderView = self.svxHeadView;
    
    //创建贝塞尔曲线
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 40, 40)];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(self.view.frame.size.width / 2.0 - 30,
                                  self.svxHeadView.frame.size.height - 60, 60, 60);
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = 1.f;
    self.shapeLayer.strokeColor = [UIColor colorWithRed:192 / 255.0 green:192 / 255.0 blue:192 / 255.0 alpha:1].CGColor;
    
    //建立贝塞尔曲线与CAShapeLayer之间的关联
    self.shapeLayer.path = bezierPath.CGPath;
    
    self.shapeLayer.masksToBounds = YES;
    
    [self.svxHeadView.layer addSublayer:self.shapeLayer];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SVXIntroductionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kInstroductCell];
    
    NSDictionary *dic = @{@"titleLabel" : self.listArray[indexPath.section],
                          @"containLabel" : self.containArray[indexPath.section]};
    [cell dicForCellData:dic];
    
    return cell;
}

#pragma mark - 收藏按钮事件
- (void)shoucanTapAction:(UITapGestureRecognizer *)tap {
    NSLog(@"shoucan");
}

#pragma mark - 分享按钮事件
- (void)shareAction:(UITapGestureRecognizer *)tap {
    NSLog(@"share");
}

#pragma mark - SVXHeadDelegate
- (void)tapAction {
    NSLog(@"单击图片");
}

@end
