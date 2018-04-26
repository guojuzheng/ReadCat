//
//  RCRewardHeadView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/30.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
#import "RCRewardInfoView.h"
#import "RCRewardCountView.h"

@interface RCRewardHeadView : BaseView
@property (nonatomic,strong)RCRewardInfoView        *rewardInfoView;
@property (nonatomic,strong)RCRewardCountView       *rewardCountView;
@end
