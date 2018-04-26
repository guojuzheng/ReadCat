//
//  RCBannerView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
#import "SDCycleScrollView.h"
@interface RCBannerView : BaseView
@property (nonatomic, strong)SDCycleScrollView *cycleBannerView;
@property (nonatomic, strong)NSArray           *imageArray;
@end

