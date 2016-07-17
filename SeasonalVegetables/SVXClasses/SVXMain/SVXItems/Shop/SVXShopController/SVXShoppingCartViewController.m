//
//  SVXShoppingCartViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/12.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXShoppingCartViewController.h"
#import "SXShoppingCartTableViewCell.h"

@interface SVXShoppingCartViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,copy) NSMutableArray * dataArray;
@property (nonatomic ,copy) NSDictionary *dataDic;
@property(nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UIButton *btnchoose;

@property (nonatomic ,strong) UIView * bottomView;
@property (nonatomic,strong) UIView *bottomViewUpdate;

@property(nonatomic,strong)UILabel *total;
@end

@implementation SVXShoppingCartViewController

static NSString *cellID =@"shoppingCar";

- (NSMutableArray *)dataArray{
    if (_dataArray ==nil) {
        _dataArray =[[NSMutableArray alloc] initWithObjects:@"胡萝卜1",@"胡萝卜2",@"黄瓜3", nil];
    }
    return _dataArray;
}

- (NSDictionary *)dataDic{
    if (_dataDic==nil) {
        _dataDic =[[NSDictionary alloc] init];

        _dataDic =@{@"goodsView":@"huanggua",@"goodsName":@"黄瓜",@"goodsMoney":@10,@"goodsCount":@1,@"isEdit":@NO};
    }
    return _dataDic;
}
- (UITableView *)tableView{
    if (_tableView ==nil) {
        _tableView =[[UITableView alloc] init];
        [self.view addSubview:_tableView];
        self.tableView.delegate =self;
        self.tableView.dataSource =self;
        self.tableView.separatorColor =[UIColor clearColor];
        
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.bottom).offset(@-54);
        }];
    }
    return _tableView;
}


- (void)loadShoppingCart{
    self.view.backgroundColor =[UIColor whiteColor];
//    [self.tableView  registerClass:[SXShoppingCartTableViewCell class] forCellReuseIdentifier:cellID];
//    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(goToEdit) ];
//    [self.navigationItem setRightBarButtonItem:rightButton];
    
    //结算
    
    self.bottomView =[[UIView alloc] init];
    [self.view addSubview: self.bottomView];
    self.bottomView.backgroundColor =[UIColor colorWithRed:243/255.0
                                                green:243/255.0
                                                 blue:243/255.0 alpha:1];
    
    UIImageView *allChoose =[[UIImageView alloc] init];
    [self.bottomView addSubview:allChoose];
    [self.bottomViewUpdate addSubview:allChoose];
    
//    allChoose.backgroundColor =[UIColor redColor ];
    allChoose.userInteractionEnabled =YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickImg)];
    [allChoose addGestureRecognizer:singleTap];
    
    
    self.btnchoose =[UIButton buttonWithType:UIButtonTypeCustom];
    [allChoose addSubview:self.btnchoose];
    [self.btnchoose  addTarget:self action:@selector(onClickImg) forControlEvents:UIControlEventTouchUpInside];
    [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2"] forState:UIControlStateNormal];
    [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2-select"] forState:UIControlStateSelected];
    
    
    UILabel *allchooseLabel = [[UILabel alloc] init];
    [allChoose addSubview:allchooseLabel];
    allchooseLabel.text =@"全选";
    allchooseLabel.textColor =[UIColor grayColor];
    allchooseLabel.font =[UIFont fontWithName:@"PingFang SC" size:14];
    
    UIView *midView =[[UIView alloc] init];
    [self.bottomView addSubview: midView];
//    midView.backgroundColor =[UIColor greenColor];
    
    
    UILabel *totalLabel = [[UILabel alloc] init];
    [midView addSubview:totalLabel];
    totalLabel.text = @"合计:";
    totalLabel.textColor = [UIColor grayColor];
    totalLabel.font =[UIFont fontWithName:@"PingFang SC" size:18];
    
    
    self.total  =[[UILabel alloc] init];
    [midView addSubview:self.total];
    self.total.textColor = [UIColor grayColor];
    self.total.font=[UIFont fontWithName:@"PingFang SC" size:18];
    self.total.text = [NSString stringWithFormat:@"¥ %.2f",60.00];
    
    
    UIButton *btnpay =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.bottomView addSubview:btnpay];
    [btnpay setTitle:@"去结算" forState:UIControlStateNormal];
    btnpay.backgroundColor =[UIColor colorWithRed:240/255.0
                                            green:159/255.0
                                             blue:159/255.0 alpha:1];
    btnpay.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:18];
//    [btnpay addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@54);
        
    }];
    
    [allChoose makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView.left);
        make.centerY.equalTo(self.bottomView.centerY);
        make.width.equalTo(100);
        make.height.equalTo(self.bottomView.height);
    }];
    
    [self.btnchoose makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView.centerY);
        make.left.equalTo(self.bottomView.left).offset(17);
        
    }];
    [allchooseLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btnchoose.right).offset(3);
        make.centerY.equalTo(allChoose.centerY);
        make.right.lessThanOrEqualTo(allChoose.right);
    }];
    
    //中间
    [midView makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.bottomView);
        make.left.equalTo(allchooseLabel.right).offset(10);
        make.right.equalTo(btnpay.left);
    }];
    
    [totalLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(midView.centerY);
        make.left.equalTo(midView.left).offset(10);
    }];
    [self.total makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(midView.centerY);
        make.left.equalTo(totalLabel.right).offset(@10);
//        make.right.equalTo(midView.right);
    }];
    
    
    [btnpay makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.bottomView);
        make.width.equalTo(80);
        
    }];
    
}

- (void)onClickImg {
    NSLog(@"onClickImg ");
    if (self.btnchoose.isSelected ==NO) {
        self.btnchoose.selected = YES;
        //dic设值标志cell
        //reload cell ;
        
    }else{
        self.btnchoose.selected = NO;
    }
    
    
}

- (void)goToEdit{
    NSLog(@"编辑");
    if (self.bottomView.hidden==NO) {
        self.dataDic =@{@"goodsView":@"huanggua",@"goodsName":@"黄瓜",@"goodsMoney":@10,
                        @"goodsCount":@1,@"isEdit":@YES};
        [self.tableView reloadData];
        self.bottomView.hidden=YES;
        UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(goToEdit) ];
        [self.navigationItem setRightBarButtonItem:rightButton];
        
        
        
        //  测试！！！
        self.bottomViewUpdate = [[UIView alloc] init];
        [self.view addSubview: self.bottomViewUpdate];
        self.bottomViewUpdate.backgroundColor =[UIColor colorWithRed:243/255.0
                                                               green:243/255.0
                                                                blue:243/255.0 alpha:1];
        
        UIImageView *allChoose =[[UIImageView alloc] init];
        [self.bottomViewUpdate addSubview:allChoose];
        
        //    allChoose.backgroundColor =[UIColor redColor ];
        allChoose.userInteractionEnabled =YES;
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickImg)];
        [allChoose addGestureRecognizer:singleTap];
        
        
        self.btnchoose =[UIButton buttonWithType:UIButtonTypeCustom];
        [allChoose addSubview:self.btnchoose];
        [self.btnchoose  addTarget:self action:@selector(onClickImg) forControlEvents:UIControlEventTouchUpInside];
        [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2"] forState:UIControlStateNormal];
        [self.btnchoose setImage:[UIImage imageNamed:@"Oval-2-select"] forState:UIControlStateSelected];
        
        
        UILabel *allchooseLabel = [[UILabel alloc] init];
        [allChoose addSubview:allchooseLabel];
        allchooseLabel.text =@"全选";
        allchooseLabel.textColor =[UIColor grayColor];
        allchooseLabel.font =[UIFont fontWithName:@"PingFang SC" size:14];
        
        
        UIButton *btnCollect = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomViewUpdate addSubview:btnCollect];
        [btnCollect setTitle:@" 移入收藏  " forState:UIControlStateNormal];
        btnCollect.backgroundColor =[UIColor colorWithRed:214/255.0
                                                   green:214/255.0
                                                    blue:214/255.0 alpha:1];
        btnCollect.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:18];
        //    [btnCollect addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *btnDelete =[UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomViewUpdate addSubview:btnDelete];
        [btnDelete setTitle:@"删除" forState:UIControlStateNormal];
        btnDelete.backgroundColor =[UIColor colorWithRed:240/255.0
                                                green:159/255.0
                                                 blue:159/255.0 alpha:1];
        btnDelete.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size:18];
        //    [btnDelete addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventTouchUpInside];
        
      
        
        [self.bottomViewUpdate makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@54);
            
        }];
        [allChoose makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bottomViewUpdate.left);
            make.centerY.equalTo(self.bottomViewUpdate.centerY);
            make.width.equalTo(100);
            make.height.equalTo(self.bottomViewUpdate.height);
        }];
        
        [self.btnchoose makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bottomViewUpdate.centerY);
            make.left.equalTo(self.bottomViewUpdate.left).offset(17);
            
        }];
        [allchooseLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btnchoose.right).offset(3);
            make.centerY.equalTo(allChoose.centerY);
            make.right.lessThanOrEqualTo(allChoose.right);
        }];
        
        [btnCollect makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.bottomViewUpdate);
            make.right.equalTo(btnDelete.left);
        }];
        
        [btnDelete makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.bottomViewUpdate);
            make.width.equalTo(80);
        }];
        


    }
    else{
        //新的bottomViewchange 改为隐藏;
        self.bottomViewUpdate.hidden =YES;
        self.dataDic =@{@"goodsView":@"huanggua",@"goodsName":@"黄瓜",@"goodsMoney":@10,
                        @"goodsCount":@1,@"isEdit":@NO};
        [self.tableView reloadData];
        self.bottomView.hidden=NO;
        UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(goToEdit) ];
        [self.navigationItem setRightBarButtonItem:rightButton];
        
        

    }
    
    
}

- (void)viewWillAppear:(BOOL)animated{

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView  registerClass:[SXShoppingCartTableViewCell class] forCellReuseIdentifier:cellID];
    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(goToEdit) ];
    [self.navigationItem setRightBarButtonItem:rightButton];
    
    [self loadShoppingCart];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   

    SXShoppingCartTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID ];
    
    if (!cell) {
        cell = [[SXShoppingCartTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    else//当页面拉动的时候 当cell存在并且最后一个存在 把它进行删除就出来一个独特的cell我们在进行数据配置即可避免
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    [cell loadCell:self.dataDic];
    cell.backgroundColor =[UIColor colorWithRed:249/255.0
                                          green:249/255.0
                                           blue:249/255.0 alpha:1];
    cell.btnchoose.tag = indexPath.row;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--点击%ld",(long)indexPath.row);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 127;
}


-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
     
        //当前无后台的数据源是一个假装的 只存在返回row数
        [self.dataArray removeObjectAtIndex:indexPath.row];
    
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end










