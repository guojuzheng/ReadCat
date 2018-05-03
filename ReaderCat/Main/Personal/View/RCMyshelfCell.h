//
//  RCMyshelfCell.h
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseCell.h"

@interface RCMyshelfCell : BaseCell
@property (nonatomic, strong) UIImageView        *bookImage;
@property (nonatomic, strong) UILabel            *bookName;
@property (nonatomic, strong) UILabel            *readTo;
@property (nonatomic, strong) UILabel            *writeTo;
@property (nonatomic, strong) UIButton           *deleteBtn;
@property (nonatomic, strong) UIView             *lineView;

@end
