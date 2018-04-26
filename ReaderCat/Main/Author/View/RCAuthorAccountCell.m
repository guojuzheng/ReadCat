//
//  RCAuthorAccountCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/17.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCAuthorAccountCell.h"

@implementation RCAuthorAccountCell
- (void)configSubView {
    self.bookImage = [UIImageView new];
    self.bookImage.backgroundColor = [UIColor redColor];
    
    self.bookName = Label.fnt(12).color(@"#323232").str(@"极品房东俊俏娘【单本】");
    self.toolIn = Label.fnt(10).color(@"#969696").str(@"道具收入:0.00元");
    self.selfIn= Label.fnt(10).color(@"#969696").str(@"自有平台:0.00元");
    self.rewardIn = Label.fnt(10).color(@"#969696").str(@"奖励保障:0.00元");
    self.thirdIn = Label.fnt(10).color(@"#969696").str(@"第三方/渠道:0.00元");
    self.rightIn = Label.fnt(10).color(@"#969696").str(@"版权收入:0.00元");
    
    self.payStatus = Label.fnt(10).color(@"#f7bd51").str(@"【支付状态】");
    self.totalIn = Label.fnt(10).color(@"#fe5800").str(@"合计:0.00元");
    
    self.timeBtn = [self creatQMUIFillButtonWithTitle:@"2018-4" fillColor:WhiteColor titleTextColor:Color(@"#969696") borderColor:Color(@"#969696") borderWidth:0.5 cornerRadius:4 font:12];
    self.commentMngBtn = [self creatQMUIFillButtonWithTitle:@"评论管理" fillColor:ThemeColor titleTextColor:BlackColor borderColor:BlackColor borderWidth:0.5 cornerRadius:4 font:12];
    self.rewardDetailBtn = [self creatQMUIFillButtonWithTitle:@"打赏明细" fillColor:ThemeColor titleTextColor:BlackColor borderColor:BlackColor borderWidth:0.5 cornerRadius:4 font:12];
    self.subscribeBtn = [self creatQMUIFillButtonWithTitle:@"订阅明细" fillColor:ThemeColor titleTextColor:BlackColor borderColor:BlackColor borderWidth:0.5 cornerRadius:4 font:12];
    
    [self sd_addSubviews:@[self.bookImage,self.bookName,self.toolIn,self.selfIn,self.rewardIn,self.thirdIn,self.rightIn,self.payStatus,self.totalIn, self.timeBtn,self.commentMngBtn,self.rewardDetailBtn,self.subscribeBtn]];
    
    self.bookImage.sd_layout
    .leftSpaceToView(self, 14)
    .topSpaceToView(self, 16)
    .bottomSpaceToView(self, 45)
    .widthIs(60);
    
    self.bookName.sd_layout
    .leftSpaceToView(self.bookImage, 10)
    .topEqualToView(self.bookImage)
    .widthIs(150)
    .heightIs(12);
    
    self.toolIn.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.bookName, 5)
    .widthIs(150)
    .heightIs(10);
    
    self.selfIn.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.toolIn, 5)
    .widthIs(150)
    .heightIs(10);
    
    self.rewardIn.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.selfIn, 5)
    .widthIs(150)
    .heightIs(10);
    
    self.thirdIn.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.rewardIn, 5)
    .widthIs(150)
    .heightIs(10);
    
    self.rightIn.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.thirdIn, 5)
    .widthIs(150)
    .heightIs(10);
    
    self.payStatus.sd_layout
    .rightSpaceToView(self, 11)
    .centerYEqualToView(self.thirdIn)
    .heightIs(10)
    .widthIs(100);
    
    self.totalIn.sd_layout
    .rightSpaceToView(self, 11)
    .centerYEqualToView(self.rightIn)
    .heightIs(10)
    .widthIs(100);
    
    self.timeBtn.sd_layout
    .rightSpaceToView(self, 11)
    .topSpaceToView(self, 15)
    .widthRatioToView(self, 0.2)
    .heightIs(23);
    
    self.commentMngBtn.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.bookImage, 5)
    .widthRatioToView(self, 0.2)
    .heightIs(23);
    
    self.rewardDetailBtn.sd_layout
    .leftSpaceToView(self.commentMngBtn, 20)
    .centerYEqualToView(self.commentMngBtn)
    .widthRatioToView(self, 0.2)
    .heightIs(23);
    
    self.subscribeBtn.sd_layout
    .leftSpaceToView(self.rewardDetailBtn, 20)
    .centerYEqualToView(self.commentMngBtn)
    .widthRatioToView(self, 0.2)
    .heightIs(23);
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[lineView]];
    lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(0.5);
    
    
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
