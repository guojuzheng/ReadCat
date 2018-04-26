//
//  RCPersonHeadView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"

@interface RCPersonHeadView : BaseView
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UILabel     *nameLabel;
@property (nonatomic, strong) UIImageView *vipImageView;
@property (nonatomic, strong) UIButton    *editMessageBtn;
@property (nonatomic, strong) UILabel     *readTime;
@property (nonatomic, strong) UILabel     *goodNumber;
@end
