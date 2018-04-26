//
//  RCBookInfoTableHeader.h
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
typedef void (^ ButtonClickBlock) (NSInteger flag);
@interface RCBookInfoTableHeader : BaseView
@property (nonatomic, strong)UIImageView        *bookImage;
@property (nonatomic, strong)UILabel            *bookName;
@property (nonatomic, strong)UILabel            *updateTime;
@property (nonatomic, strong)UIImageView        *authorImage;
@property (nonatomic, strong)UILabel            *authorName;
@property (nonatomic, strong)UILabel            *classLabelView;
@property (nonatomic, strong)QMUIFillButton     *infoBtn;
@property (nonatomic, strong)QMUIFillButton     *menuBtn;
@property (nonatomic, strong)QMUIFillButton     *commentBtn;
@property (nonatomic, copy) ButtonClickBlock    buttonClickBlock;
@end
