//
//  RCChargeCell.m
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCChargeCell.h"

@implementation RCChargeCell
- (void)configSubView {
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
     [self sd_addSubviews:@[self.bookImageView,self.bookName,self.bookBrief,self.headImage,self.authorName]];

    self.bookImageView.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 15)
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
}
@end
