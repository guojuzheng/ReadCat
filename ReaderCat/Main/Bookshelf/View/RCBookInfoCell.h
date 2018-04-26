//
//  RCBookInfoCell.h
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseCell.h"

@interface RCBookInfoCell : BaseCell
@property (nonatomic, strong) UILabel        *likeLabel;
@property (nonatomic, strong) UILabel        *likeTitleLabel;
@property (nonatomic, strong) UILabel        *rewordLabel;
@property (nonatomic, strong) UILabel        *rewordTitleLabel;
@property (nonatomic, strong) UILabel        *clickNumber;
@property (nonatomic, strong) UILabel        *clickTitle;
@end
