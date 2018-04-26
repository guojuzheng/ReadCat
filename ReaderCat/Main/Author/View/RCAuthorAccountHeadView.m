//
//  RCAuthorAccountHeadView.m
//  ReaderCat
//
//  Created by guojz on 2018/4/17.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCAuthorAccountHeadView.h"

@implementation RCAuthorAccountHeadView
- (void)loadSubViews {
    self.bgImageView = [UIImageView new];
    self.bgImageView.img(@"bg_Image.JPG");
    
    self.authorHeadImage = [UIImageView new];
    self.authorHeadImage.backgroundColor = [UIColor redColor];
    self.authorHeadImage.layer.cornerRadius = 26;
    self.authorHeadImage.layer.masksToBounds = YES;
    self.authorHeadImage.layer.borderColor = WhiteColor.CGColor;
    
    self.authorName = Label.fnt(15).color(WhiteColor).str(@"小丼");
    self.authorName.textAlignment = NSTextAlignmentCenter;
    self.leavlBtn = [self creatQMUIFillButtonWithTitle:@"等级:LV1" fillColor:ThemeColor titleTextColor:WhiteColor borderColor:BlackColor borderWidth:0.5 cornerRadius:6 font:9];
    self.numberBtn = [self creatQMUIFillButtonWithTitle:@"编号:001" fillColor:ThemeColor titleTextColor:WhiteColor borderColor:BlackColor borderWidth:0.5 cornerRadius:6 font:9];
    self.scorBtn = [self creatQMUIFillButtonWithTitle:@"积分:100" fillColor:ThemeColor titleTextColor:WhiteColor borderColor:BlackColor borderWidth:0.5 cornerRadius:6 font:9];
    
    self.settledMoneyLabel = Label.fnt(14).color(WhiteColor).str(@"0.00元");
    self.settledMoneyLabel.textAlignment = NSTextAlignmentRight;
    self.stockMoneyLabel = Label.fnt(14).color(WhiteColor).str(@"0.00元");
    self.stockMoneyLabel.textAlignment = NSTextAlignmentCenter;
    self.totalMoneyLabel = Label.fnt(14).color(WhiteColor).str(@"0.00元");
    self.totalMoneyLabel.textAlignment = NSTextAlignmentLeft;
    self.settledMoney = Label.fnt(10).color(WhiteColor).str(@"已结算");
    self.settledMoney.textAlignment = NSTextAlignmentRight;
    self.stockMoney = Label.fnt(10).color(WhiteColor).str(@"存余");
    self.stockMoney.textAlignment = NSTextAlignmentCenter;
    self.totalMoney = Label.fnt(10).color(WhiteColor).str(@"总稿费");
    self.totalMoney.textAlignment = NSTextAlignmentLeft;
    
    [self sd_addSubviews:@[self.bgImageView,self.authorHeadImage,self.authorName,self.leavlBtn,self.numberBtn,self.scorBtn,self.settledMoneyLabel ,self.stockMoneyLabel,self.totalMoneyLabel, self.settledMoney,self.stockMoney,self.totalMoney]];
    self.bgImageView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
    
    self.authorHeadImage.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self, 15)
    .widthIs(52)
    .heightIs(52);
    
    self.authorName.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.authorHeadImage, 5)
    .heightIs(14)
    .widthIs(47);
    
    self.numberBtn.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.authorName, 8)
    .heightIs(17)
    .widthIs(56);
    
    self.leavlBtn.sd_layout
    .rightSpaceToView(self.numberBtn, 15)
    .centerYEqualToView(self.numberBtn)
    .heightIs(17)
    .widthIs(56);
    
    self.scorBtn.sd_layout
    .leftSpaceToView(self.numberBtn, 15)
    .centerYEqualToView(self.numberBtn)
    .heightIs(17)
    .widthIs(56);
    
    self.stockMoneyLabel.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.numberBtn, 20)
    .widthIs(70)
    .heightIs(13);
    
    self.stockMoney.sd_layout
    .heightIs(10)
    .topSpaceToView(self.stockMoneyLabel, 3)
    .leftEqualToView(self.stockMoneyLabel)
    .rightEqualToView(self.stockMoneyLabel);
    
    self.settledMoneyLabel.sd_layout
    .rightSpaceToView(self.stockMoneyLabel, 20)
    .centerYEqualToView(self.stockMoneyLabel)
    .widthIs(70)
    .heightIs(13);
    
    self.settledMoney.sd_layout
    .leftEqualToView(self.settledMoneyLabel)
    .rightEqualToView(self.settledMoneyLabel)
    .centerYEqualToView(self.stockMoney)
    .heightIs(10);
    
    self.totalMoneyLabel.sd_layout
    .leftSpaceToView(self.stockMoneyLabel, 20)
    .centerYEqualToView(self.stockMoneyLabel)
    .widthIs(70)
    .heightIs(13);
    
    self.totalMoney.sd_layout
    .leftEqualToView(self.totalMoneyLabel)
    .rightEqualToView(self.totalMoneyLabel)
    .centerYEqualToView(self.stockMoney)
    .heightIs(10);
}

- (QMUIFillButton *)creatQMUIFillButtonWithTitle:(NSString *)title fillColor:(UIColor *)fillColor titleTextColor:(UIColor *)titleTextColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth     cornerRadius:(CGFloat)cornerRadius font:(CGFloat)font{
    QMUIFillButton *button = [[QMUIFillButton alloc] initWithFillColor:fillColor titleTextColor:titleTextColor];
    button.fnt(font);
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
    button.cornerRadius = cornerRadius;
    return button;
}
@end
