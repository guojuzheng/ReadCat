//
//  RCMyshelfCell.m
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCMyshelfCell.h"

@implementation RCMyshelfCell
- (void)configSubView {
    self.bookImage = [UIImageView new];
    self.bookImage.backgroundColor = ThemeColor;
    self.bookName = [UILabel new];
    self.bookName.fnt(13).color(@"#010101").str(@"西游记");
    self.readTo = [UILabel new];
    self.readTo.fnt(11).color(@"#999999").str(@"读至第一章");
    self.writeTo = [UILabel new];
    self.writeTo.fnt(11).color(@"#999999").str(@"更新完");
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteBtn.titleLabel.fnt(13);
    self.deleteBtn.hidden = YES;
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.deleteBtn setTitleColor:BlackColor forState:UIControlStateNormal];
    [self sd_addSubviews:@[self.bookImage,self.bookName,self.deleteBtn,self.readTo,self.writeTo]];
    self.bookImage.sd_layout
    .leftSpaceToView(self, 17)
    .topSpaceToView(self, 17)
    .widthIs(54)
    .heightIs(76);
    
    self.bookName.sd_layout
    .leftSpaceToView(self.bookImage, 15)
    .topEqualToView(self.bookImage)
    .rightSpaceToView(self, 70)
    .heightIs(13);
    
    self.deleteBtn.sd_layout
    .leftSpaceToView(self.bookName, 5)
    .rightSpaceToView(self, 15)
    .centerYEqualToView(self.bookName)
    .heightIs(13);
    
    self.readTo.sd_layout
    .leftEqualToView(self.bookName)
    .rightEqualToView(self)
    .topSpaceToView(self.bookName, 8)
    .heightIs(11);
    
    self.writeTo.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.readTo, 8)
    .rightEqualToView(self)
    .heightIs(11);
}
@end
