//
//  RCChargeHeadView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
#import "JCQMUIFillButton.h"
@class RCChargeSigleBookMessageView;
@interface RCChargeHeadView : BaseView
@property (nonatomic, strong) UILabel                          *headTitle;
@property (nonatomic, strong) UIImageView                      *bookImageView;
@property (nonatomic, strong) UILabel                          *bookName;
@property (nonatomic, strong) UILabel                          *bookBrief;
@property (nonatomic, strong) UIImageView                      *headImage;
@property (nonatomic, strong) UILabel                          *authorName;
@property (nonatomic, strong) RCChargeSigleBookMessageView     *leftItem;
@property (nonatomic, strong) RCChargeSigleBookMessageView     *rightItem;
@property (nonatomic, strong) JCQMUIFillButton                 *seeMoreBtn;
@property (nonatomic, strong) UILabel                          *classifyLabel;
@property (nonatomic, strong) UILabel                          *textNumberLabel;
@property (nonatomic, strong) UILabel                          *scoreLabel;
@end

@interface RCChargeSigleBookMessageView : BaseView
@property (nonatomic, strong) UILabel         *bookName;
@property (nonatomic, strong) UILabel         *bookBrief;
@property (nonatomic, strong) UIImageView     *headImage;
@property (nonatomic, strong) UILabel         *authorName;
@property (nonatomic, strong) UIImageView     *bookImageView;
@end
