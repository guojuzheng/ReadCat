//
//  RCBookCommentCell.h
//  ReaderCat
//
//  Created by guojz on 2018/4/24.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseCell.h"

@interface RCBookCommentCell : BaseCell
@property (nonatomic, strong) UIImageView        *headImage;
@property (nonatomic, strong) UILabel            *nameLabel;
@property (nonatomic, strong) UILabel            *textView;
@property (nonatomic, strong) UILabel            *timeLabel;
@property (nonatomic, strong) QMUIButton         *likeBtn;
@property (nonatomic, strong) QMUIButton         *commontBtn;
@end
