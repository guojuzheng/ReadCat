//
//  RCAuthorAccountHeadView.h
//  ReaderCat
//
//  Created by guojz on 2018/4/17.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"

@interface RCAuthorAccountHeadView : BaseView
@property (nonatomic, strong) UIImageView         *bgImageView;
@property (nonatomic, strong) UIImageView         *authorHeadImage;
@property (nonatomic, strong) UILabel             *authorName;
@property (nonatomic, strong) QMUIFillButton      *leavlBtn;
@property (nonatomic, strong) QMUIFillButton      *numberBtn;
@property (nonatomic, strong) QMUIFillButton      *scorBtn;
@property (nonatomic, strong) UILabel             *settledMoneyLabel;
@property (nonatomic, strong) UILabel             *stockMoneyLabel;
@property (nonatomic, strong) UILabel             *totalMoneyLabel;
@property (nonatomic, strong) UILabel             *settledMoney;
@property (nonatomic, strong) UILabel             *stockMoney;
@property (nonatomic, strong) UILabel             *totalMoney;
@end
