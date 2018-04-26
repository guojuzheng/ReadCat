//
//  RCRewardInfoView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
#import "RCRewardInfoItemView.h"

@interface RCRewardInfoView : BaseView
@property (nonatomic, strong) UIImageView             *bookImageView;
@property (nonatomic, strong) UILabel                 *bookName;
@property (nonatomic, strong) RCRewardInfoItemView    *rewardInfoItemView;
@property (nonatomic, strong) UILabel                 *tipView;
@end
