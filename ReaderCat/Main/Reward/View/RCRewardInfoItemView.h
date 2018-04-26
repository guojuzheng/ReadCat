//
//  RCRewardInfoItemView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
@class RCRewardInfoItemSigleView;
@interface RCRewardInfoItemView : BaseView
@property (nonatomic, strong) NSArray   *itemArray;
@end


@interface RCRewardInfoItemSigleView : BaseView
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@end
