//
//  RCAuthorAccountCell.h
//  ReaderCat
//
//  Created by guojz on 2018/4/17.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseCell.h"

@interface RCAuthorAccountCell : BaseCell
@property (nonatomic, strong) UIImageView        *bookImage;
@property (nonatomic, strong) UILabel            *bookName;
@property (nonatomic, strong) UILabel            *toolIn;
@property (nonatomic, strong) UILabel            *selfIn;
@property (nonatomic, strong) UILabel            *rewardIn;
@property (nonatomic, strong) UILabel            *thirdIn;
@property (nonatomic, strong) UILabel            *rightIn;
@property (nonatomic, strong) UILabel            *payStatus;
@property (nonatomic, strong) UILabel            *totalIn;
@property (nonatomic, strong) QMUIFillButton     *timeBtn;
@property (nonatomic, strong) QMUIFillButton     *commentMngBtn;
@property (nonatomic, strong) QMUIFillButton     *rewardDetailBtn;
@property (nonatomic, strong) QMUIFillButton     *subscribeBtn;
@end
