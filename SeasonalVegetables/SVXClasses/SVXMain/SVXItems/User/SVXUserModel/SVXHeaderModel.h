//
//  SVXHeaderModel.h
//  SeasonalVegetables
//
//  Created by WxxxYi on 16/5/30.
//  Copyright © 2016年 com.SeasonalVegetables. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVXHeaderModel : NSObject
@property (nonatomic, copy) NSNumber *groupId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;

@property (nonatomic, assign) BOOL openOrClose;
@property (nonatomic, assign, readonly) NSInteger friendsCount;
//- (ZZXFriendModel *)friendAtIndex:(NSInteger)index;

- (id)WithDic;

@end
