//
//  RCRewardDetailCell.h
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseCell.h"

@interface RCRewardDetailCell : BaseCell
@property (nonatomic, strong) UIImageView        *bookImage;
@property (nonatomic, strong) UILabel            *bookName;
@property (nonatomic, strong) UILabel            *userName;
@property (nonatomic, strong) UILabel            *rewardCount;
@property (nonatomic, strong) UILabel            *rewardTime;
@end
