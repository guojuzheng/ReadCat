//
//  RCBookInfoCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//  收藏 打赏 点击数

#import "RCBookInfoCell.h"

@implementation RCBookInfoCell
- (void)configSubView {
    UIView *lineView = [UIView new];
    lineView.backgroundColor = DEFAULT_BG_COLOR;
    self.likeLabel = Label.fnt(12).color(@"#030303").str(@"128万");
    self.likeTitleLabel = Label.fnt(9).color(@"#999999").str(@"收藏");
    self.rewordLabel  = Label.fnt(12).color(@"#030303").str(@"456");
    self.rewordTitleLabel  = Label.fnt(9).color(@"#999999").str(@"打赏");
    self.clickNumber = Label.fnt(12).color(@"#030303").str(@"234");
    self.clickTitle = Label.fnt(9).color(@"#999999").str(@"点击数");
    self.likeLabel.textAlignment        =
    self.likeTitleLabel.textAlignment   =
    self.rewordLabel.textAlignment      =
    self.rewordTitleLabel.textAlignment =
    self.clickNumber.textAlignment      =
    self.clickTitle.textAlignment       = NSTextAlignmentCenter;
    [self sd_addSubviews:@[self.likeLabel,self.likeTitleLabel,self.rewordLabel,self.rewordTitleLabel,self.clickNumber,self.clickTitle,lineView]];
    lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(1);
    self.likeLabel.sd_layout
    .leftEqualToView(self)
    .topSpaceToView(self, 16)
    .heightIs(11)
    .widthIs(SCREEN_WIDTH/3);
    self.rewordLabel.sd_layout
    .leftSpaceToView(self.likeLabel, 0)
    .topSpaceToView(self, 16)
    .heightIs(11)
    .widthIs(SCREEN_WIDTH/3);
    self.clickNumber.sd_layout
    .leftSpaceToView(self.rewordLabel, 0)
    .topSpaceToView(self, 16)
    .heightIs(11)
    .widthIs(SCREEN_WIDTH/3);
    self.likeTitleLabel.sd_layout
    .leftEqualToView(self.likeLabel)
    .rightEqualToView(self.likeLabel)
    .topSpaceToView(self.likeLabel, 5)
    .heightIs(9);
    self.rewordTitleLabel.sd_layout
    .leftEqualToView(self.rewordLabel)
    .rightEqualToView(self.rewordLabel)
    .topSpaceToView(self.rewordLabel, 5)
    .heightIs(9);
    self.clickTitle.sd_layout
    .leftEqualToView(self.clickNumber)
    .rightEqualToView(self.clickNumber)
    .topSpaceToView(self.clickNumber, 5)
    .heightIs(9);
    
    
}
@end
