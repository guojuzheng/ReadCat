//
//  RCCommentManageCell.h
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseCell.h"

@interface RCCommentManageCell : BaseCell
@property (nonatomic, strong)UILabel        *bookName;
@property (nonatomic, strong)UITextView     *commentView;
@property (nonatomic, strong)UILabel        *commenter;
@property (nonatomic, strong)UILabel        *commentTime;
@property (nonatomic, strong)QMUIFillButton *answerBtn;
@property (nonatomic, strong)QMUIFillButton *likeBtn;
@property (nonatomic, strong)QMUIFillButton *topBtn;
@property (nonatomic, strong)QMUIFillButton *deleteBtn;
@property (nonatomic, strong)UIView         *lineView;
@end
