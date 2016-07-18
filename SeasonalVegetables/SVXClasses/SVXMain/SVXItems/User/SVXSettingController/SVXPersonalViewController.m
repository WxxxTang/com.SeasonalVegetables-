//
//  SVXPersonalViewController.m
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/6/2.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import "SVXPersonalViewController.h"
#import "SVXPersonalCell.h"
#import "svxpersonalCell2.h"
#import "SVXHeaderModel.h"
//did
#import "SVXChangeheadViewController.h"
#import "AddressViewController.h"
#import "SexTableViewController.h"

@interface SVXPersonalViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,copy) NSDictionary *personaldic;
@property (nonatomic,copy) NSArray *array;
@end

@implementation SVXPersonalViewController

static NSString * cellPersonalID = @"SVXPersonalCell";
static NSString * cellPersonalID2 = @"SVXPersonalCell2";

- (void)viewWillAppear:(BOOL)animated{
    //更新数据源
    SVXHeaderModel *model =[[SVXHeaderModel alloc] init];
    _personaldic =[model WithDic];
    self.personaldic = _personaldic;
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SVXPersonalCell class] forCellReuseIdentifier:cellPersonalID];
    [self.tableView registerClass:[SVXPersonalCell2 class] forCellReuseIdentifier:cellPersonalID2];
    self.tableView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    self.tableView.separatorColor =[UIColor clearColor];
    
    

}

- (NSDictionary *)personaldic{
    if (_personaldic ==nil) {
        SVXHeaderModel *model =[[SVXHeaderModel alloc] init];
        
        _personaldic =[model WithDic];
//        _personaldic = @{@"头像":@"Oval-1",@"昵称":@"怎么办我超想笑",
//                         @"所在城市":@"西安",@"性别":@"男",@"个人签名":@"方寸中 方寸却不能定夺七十二般胆魄 这次我决意不闪躲"};
    }
    return _personaldic;
}
- (NSArray *)array{
    if (_array ==nil) {
        _array =[[NSArray alloc] init];
        _array =@[@"头像",@"昵称",@"性别",@"所在城市",@"个人签名"];
    }
    return _array;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row ==0) {
        SVXPersonalCell2 *cell =[tableView dequeueReusableCellWithIdentifier:cellPersonalID2];
        cell.textLabel.text =@"头像";
        cell.textLabel.textColor =[UIColor grayColor];
        cell.textLabel.font =[UIFont fontWithName:@"PingFang SC" size:15];
       
        NSData * data = [[NSUserDefaults standardUserDefaults] objectForKey:@"usericon"];
        cell.headicon.image =[UIImage imageWithData:data];
        return cell;
    }
    else{
        
        SVXPersonalCell *cell = [tableView dequeueReusableCellWithIdentifier: cellPersonalID ];
        cell.textLabel.text =self.array[indexPath.row];
        cell.textLabel.textColor =[UIColor grayColor];
        cell.textLabel.font =[UIFont fontWithName:@"PingFang SC" size:15];
//        NSLog(@"-----%@---",self.personaldic);
        cell.detailTextLabel.text = self.personaldic[self.array[indexPath.row]];
        if (indexPath.row ==0) {
            cell.detailTextLabel.text = nil;
        }
        cell.detailTextLabel.font =[UIFont fontWithName:@"PingFang SC" size:15];
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 100;
    }
    else{
        return 64;
    }
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.row==0) {
        
        UIImagePickerController * imgpickVC =[[UIImagePickerController alloc] init];
        imgpickVC.delegate =self;
        // 创建一个警告控制器
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        // 设置警告响应事件
        UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 设置照片来源为相机
            imgpickVC.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            // 设置进入相机时使用前置或后置摄像头
            imgpickVC.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            
            // 展示选取照片控制器
            [self presentViewController:imgpickVC animated:YES completion:^{}];
        }];
        
        UIAlertAction *photosAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            imgpickVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imgpickVC animated:YES completion:^{}];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            // 添加警告按钮
            [alert addAction:cameraAction];
        }
        [alert addAction:photosAction];
        [alert addAction:cancelAction];
        // 展示警告控制器
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    
    else if (indexPath.row ==1){
     
        SVXChangeheadViewController * changVC =[[SVXChangeheadViewController alloc] init];
        changVC.title = @"昵称";
        self.hidesBottomBarWhenPushed= YES;
        [self.navigationController pushViewController:changVC animated:YES];
        
        
    }
    else if (indexPath.row ==2){
        SexTableViewController * sexVC =[[SexTableViewController alloc] init];
        sexVC.title =@"性别";
        self.hidesBottomBarWhenPushed= YES;
        [self.navigationController pushViewController:sexVC animated:YES];
        
    }
    else if (indexPath.row ==3){
        
        AddressViewController *addressVC = [[AddressViewController alloc] init];
        addressVC.title =@"地区选择";
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:addressVC animated:YES];
    }
    else if (indexPath.row==4){
        SVXChangeheadViewController * changVC =[[SVXChangeheadViewController alloc] init];
        changVC.title = @"个人签名";
        self.hidesBottomBarWhenPushed= YES;
        [self.navigationController pushViewController:changVC animated:YES];
    }
    
}



#pragma mark - UIImagePickerControllerDelegate
// 完成图片的选取后调用的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // 选取完图片后跳转回原控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    /* 此处参数 info 是一个字典，下面是字典中的键值 （从相机获取的图片和相册获取的图片时，两者的info值不尽相同）
     * UIImagePickerControllerMediaType; // 媒体类型
     * UIImagePickerControllerOriginalImage;  // 原始图片
     * UIImagePickerControllerEditedImage;    // 裁剪后图片
     * UIImagePickerControllerCropRect;       // 图片裁剪区域（CGRect）
     * UIImagePickerControllerMediaURL;       // 媒体的URL
     * UIImagePickerControllerReferenceURL    // 原件的URL
     * UIImagePickerControllerMediaMetadata    // 当数据来源是相机时，此值才有效
     */
    
    // 从info中将图片取出，并加载到imageView当中
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    //存NSUserDefaults对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *imgData =UIImagePNGRepresentation(image);
    [defaults setObject:imgData forKey:@"usericon"];
    [defaults synchronize];
    

    // 创建保存图像时需要传入的选择器对象（回调方法格式固定）
    SEL selectorToCall = @selector(image:didFinishSavingWithError:contextInfo:);
    // 将图像保存到相册（第三个参数需要传入上面格式的选择器对象）
    UIImageWriteToSavedPhotosAlbum(image, self, selectorToCall, NULL);
}

// 取消选取调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 保存图片后到相册后，回调的相关方法，查看是否保存成功
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil){
        NSLog(@"Image was saved successfully.");
        [self.tableView reloadData];
        NSNotification * noitce = [NSNotification notificationWithName:@"reloaddata"
                                                                object:nil];
        [[NSNotificationCenter defaultCenter] postNotification: noitce];
        
        
    } else {
        NSLog(@"An error happened while saving the image.");
        NSLog(@"Error = %@", error);
    }
}

@end
