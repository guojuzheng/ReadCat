
//
//  RCBookInfoItemCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//  两段拼接样式

#import "RCBookInfoItemCell.h"

@implementation RCBookInfoItemCell
- (void)configSubView {
    self.leftLabel = Label.fnt(12).color(@"#000000").str(@"");
    self.rightLabel = Label.fnt(12).color(@"#999999").str(@"");
    self.lineView = [UIView new];
    self.lineView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.leftLabel,self.rightLabel,self.lineView]];
    self.leftLabel.sd_layout
    .leftSpaceToView(self, 27)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(65);
    self.rightLabel.sd_layout
    .leftSpaceToView(self.leftLabel, 0)
    .rightSpaceToView(self, 26)
    .topEqualToView(self)
    .bottomEqualToView(self);
    self.lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(1);
}
@end
