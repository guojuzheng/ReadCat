//
//  RCBookMenuCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/24.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookMenuCell.h"

@implementation RCBookMenuCell
- (void)configSubView {
    self.leftLabel = Label.fnt(12).color(@"#000000").str(@"");
    self.vipImage = [UIImageView new];
    self.vipImage.backgroundColor = ThemeColor;
    self.lineView = [UIView new];
    self.lineView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.leftLabel,self.vipImage,self.lineView]];
    self.leftLabel.sd_layout
    .leftSpaceToView(self, 26)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthRatioToView(self, 0.7);
    self.vipImage.sd_layout
    .rightSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightIs(9)
    .widthIs(16);
    self.lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(1);
}
@end
