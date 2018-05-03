//
//  RCChargeHeadView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCChargeHeadView.h"


@implementation RCChargeHeadView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.headTitle = Label.fnt(15).color(@"#010101").str(@"主编推荐");
    self.bookImageView = [UIImageView new];
    self.bookImageView.backgroundColor = [UIColor redColor];
    self.bookName = Label.fnt(13).color(@"#010101").str(@"彼岸三世");
    self.bookBrief = [UILabel new];
    self.bookBrief.lineBreakMode = NSLineBreakByTruncatingTail;
    self.bookBrief.numberOfLines = 0;
    self.bookBrief.textColor =Color(@"#999999");
    self.bookBrief.fnt(13).str(@"宋书航某天意外的加入了一个资深仙侠中二病资深患者聊天群，里面群友都以“道友”相称");
    self.headImage = [UIImageView new];
    self.authorName =Label.fnt(11).color(@"#999999").str(@"流川枫");
    self.leftItem = [RCChargeSigleBookMessageView new];
    self.rightItem = [RCChargeSigleBookMessageView new];
//    self.seeMoreBtn = [JCQMUIFillButton QMUIFillButtonBlueWithTitle:@"查看更多"];
//    [self.seeMoreBtn setBackgroundColor:WhiteColor];
//    [self.seeMoreBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
//    self.seeMoreBtn.cornerRadius = 0;
    UIView *paddingView = [UIView new];
    paddingView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.headTitle,self.bookImageView,self.bookName,self.bookBrief,self.headImage,self.authorName,self.leftItem,self.rightItem,paddingView]];
    self.headTitle.sd_layout
    .leftSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self, 12.5)
    .heightIs(30);
    
    self.bookImageView.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self.headTitle, 20)
    .widthRatioToView(self, 0.15)
    .heightIs(80);
    
    self.bookName.sd_layout
    .leftSpaceToView(self.bookImageView, 10)
    .rightSpaceToView(self, 10)
    .topEqualToView(self.bookImageView)
    .heightIs(12);
    
    self.bookBrief.sd_layout
    .leftEqualToView(self.bookName)
    .rightSpaceToView(self, 15)
    .heightIs(40)
    .topSpaceToView(self.bookName, 8);
    
    self.headImage.sd_layout
    .leftEqualToView(self.bookBrief)
    .bottomEqualToView(self.bookImageView)
    .widthIs(12.5)
    .heightEqualToWidth();
    
    self.authorName.sd_layout
    .leftSpaceToView(self.headImage, 8)
    .centerYEqualToView(self.headImage)
    .rightSpaceToView(self, 15)
    .heightIs(12.5);
    
    self.leftItem.sd_layout
    .leftEqualToView(self)
    .topSpaceToView(self.bookImageView, 20)
    .widthRatioToView(self, 0.5)
    .heightIs(115);
    
    self.rightItem.sd_layout
    .rightEqualToView(self)
    .centerYEqualToView(self.leftItem)
    .widthRatioToView(self, 0.5)
    .heightIs(115);
    
//    self.seeMoreBtn.sd_layout
//    .leftEqualToView(self)
//    .rightEqualToView(self)
//    .topSpaceToView(self.leftItem, 1)
//    .heightIs(41);
    
    paddingView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.rightItem, 0)
    .heightIs(5);
}

@end


@implementation RCChargeSigleBookMessageView
- (void)loadSubViews {
    self.layer.borderColor = DEFAULT_BG_COLOR.CGColor;
    self.layer.borderWidth = 0.5;
    self.bookName = Label.fnt(13).color(@"#010101").str(@"彼岸三世");
    self.bookBrief = [UILabel new];
    self.bookBrief.lineBreakMode = NSLineBreakByTruncatingTail;
    self.bookBrief.numberOfLines = 0;
    self.bookBrief.textColor =Color(@"#999999");
    self.bookBrief.fnt(13).str(@"宋书航某天意外的加入了一个资深仙侠中二病资深患者聊天群，里面群友都以“道友”相称");
    self.headImage = [UIImageView new];
    self.authorName =Label.fnt(11).color(@"#999999").str(@"流川枫");
    self.bookImageView = [UIImageView new];
    self.bookImageView.backgroundColor = ThemeColor;
    [self sd_addSubviews:@[self.bookName,self.bookBrief,self.headImage,self.authorName,self.bookImageView]];
    
    self.bookName.sd_layout
    .leftSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self, 11)
    .heightIs(12);
    
    self.bookBrief.sd_layout
    .leftEqualToView(self.bookName)
    .rightSpaceToView(self.bookImageView, 0)
    .topSpaceToView(self.bookName, 13)
    .heightIs(40);
    
    self.headImage.sd_layout
    .leftEqualToView(self.bookBrief)
    .bottomEqualToView(self.bookImageView)
    .heightIs(12.5)
    .widthEqualToHeight();
    
    self.authorName.sd_layout
    .leftSpaceToView(self.headImage, 5)
    .rightSpaceToView(self.bookImageView, 10)
    .bottomEqualToView(self.bookImageView)
    .heightIs(12.5);
    
    self.bookImageView.sd_layout
    .topEqualToView(self.bookBrief)
    .rightSpaceToView(self, 15)
    .widthIs(47)
    .heightIs(65);
}
@end
