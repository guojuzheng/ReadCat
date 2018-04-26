//
//  RCRewardInfoCell.m
//  ReaderCat
//
//  Created by guojz on 2018/3/30.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardInfoCell.h"

@implementation RCRewardInfoCell
- (void)configSubView {
    self.backgroundColor = WhiteColor;
    self.headImage = [UIImageView new];
    self.headImage.backgroundColor = ThemeColor;
    self.nameLabel = Label.fnt(12).color(@"#000000").str(@"用户名");
    self.timeNumberLabel = Label.fnt(12).color(@"#000000").str(@"2019-09-09 打赏了100");
    self.lineView = [UIView new];
    self.topLineView = [UIView new];
    self.topLineView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.topLineView,self.headImage,self.nameLabel,self.timeNumberLabel,self.lineView]];
    
    self.topLineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .heightIs(0.5);
    
    self.headImage.sd_layout
    .leftSpaceToView(self, 20)
    .centerYEqualToView(self)
    .widthEqualToHeight()
    .heightIs(30);
    
    self.nameLabel.sd_layout
    .leftSpaceToView(self.headImage, 10)
    .topEqualToView(self.headImage)
    .rightSpaceToView(self, 10)
    .heightIs(15);
    
    self.timeNumberLabel.sd_layout
    .leftEqualToView(self.nameLabel)
    .rightEqualToView(self.nameLabel)
    .topSpaceToView(self.nameLabel, 5)
    .heightIs(15);
    
    self.lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(0.5);
}

@end
