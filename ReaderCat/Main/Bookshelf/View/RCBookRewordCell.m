//
//  RCBookRewordCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//  打赏榜

#import "RCBookRewordCell.h"

@implementation RCBookRewordCell
- (void)configSubView {
    self.cellTitle = Label.fnt(12).color(@"#000000").str(@"打赏榜");
    self.moreBtn = [QMUIFillButton creatQMUIFillButtonWithTitle:@"更多 >" fillColor:WhiteColor titleTextColor:Color(@"#999999") borderColor:WhiteColor borderWidth:1 cornerRadius:0 font:12];
    self.headImage = [UIImageView new];
    self.headImage.backgroundColor = ThemeColor;
    self.nameLabel = Label.fnt(15).color(@"#000000").str(@"阿烦");
    self.numberLabel = Label.fnt(10).color(@"#999999").str(@"打赏了500个");
    [self sd_addSubviews:@[self.cellTitle,self.moreBtn,self.headImage,self.nameLabel,self.numberLabel]];
    self.cellTitle.sd_layout
    .leftSpaceToView(self, 26)
    .topSpaceToView(self, 8)
    .heightIs(12)
    .widthIs(80);
    self.moreBtn.sd_layout
    .rightSpaceToView(self, 21)
    .centerYEqualToView(self.cellTitle)
    .heightIs(14)
    .widthIs(40);
    self.headImage.sd_layout
    .leftEqualToView(self.cellTitle)
    .topSpaceToView(self.cellTitle, 13)
    .widthIs(35)
    .heightEqualToWidth();
    self.nameLabel.sd_layout
    .leftSpaceToView(self.headImage, 5)
    .rightSpaceToView(self, 26)
    .topEqualToView(self.headImage)
    .heightIs(15);
    self.numberLabel.sd_layout
    .leftEqualToView(self.nameLabel)
    .rightEqualToView(self.nameLabel)
    .topSpaceToView(self.nameLabel, 5)
    .heightIs(10);
}

@end
