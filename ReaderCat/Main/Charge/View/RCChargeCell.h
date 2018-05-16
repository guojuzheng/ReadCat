//
//  RCChargeCell.h
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseCell.h"

@interface RCChargeCell : BaseCell
@property (nonatomic, strong) UIImageView                      *bookImageView;
@property (nonatomic, strong) UILabel                          *bookName;
@property (nonatomic, strong) UILabel                          *bookBrief;
@property (nonatomic, strong) UIImageView                      *headImage;
@property (nonatomic, strong) UILabel                          *authorName;
@property (nonatomic, strong) UILabel                          *classifyLabel;
@property (nonatomic, strong) UILabel                          *textNumberLabel;
@property (nonatomic, strong) UILabel                          *scoreLabel;
@end
