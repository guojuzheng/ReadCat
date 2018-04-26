//
//  RCRewardCountView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/29.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardCountView.h"

@implementation RCRewardCountView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.leftLabel = Label.fnt(14).color(@"#000000").str(@"我的账户: 0阅读币");
    self.rightButton = [[QMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:Color(@"#000000")];
    self.rightButton.fnt(TwelveFontSize);
    self.rightButton.layer.borderColor = Color(@"#000000").CGColor;
    self.rightButton.layer.borderWidth = 1;
    self.rightButton.cornerRadius = 3.5;
    [self sd_addSubviews:@[self.leftLabel,self.rightButton]];
    self.leftLabel.sd_layout
    .leftSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightRatioToView(self, 1)
    .widthRatioToView(self, 0.7);
    
    self.rightButton.sd_layout
    .leftSpaceToView(self.leftLabel, 10)
    .rightSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightIs(23);
}
@end
