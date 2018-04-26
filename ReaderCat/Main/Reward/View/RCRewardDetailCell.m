//
//  RCRewardDetailCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardDetailCell.h"

@implementation RCRewardDetailCell
- (void)configSubView {
    self.backgroundColor = WhiteColor;
    self.bookImage = ImageView.img(@"");
    self.bookImage.backgroundColor = [UIColor redColor];
    self.bookName = Label.fnt(13).color(@"#323232").str(@"");
    self.userName = Label.fnt(10).color(@"#969696").str(@"打赏用户昵称:");
    self.rewardCount = Label.fnt(10).color(@"#969696").str(@"打赏阅读币:");
    self.rewardTime = Label.fnt(10).color(@"#969696").str(@"打赏时间:");
    [self sd_addSubviews:@[self.bookImage,self.bookName,self.userName,self.rewardCount,self.rewardTime]];
    self.bookImage.sd_layout
    .leftSpaceToView(self, 13)
    .topSpaceToView(self, 15)
    .bottomSpaceToView(self, 15)
    .widthIs(65);
    self.bookName.sd_layout
    .leftSpaceToView(self.bookImage, 10)
    .topEqualToView(self.bookImage)
    .rightSpaceToView(self, 15)
    .heightIs(15);
    self.userName.sd_layout
    .leftEqualToView(self.bookName)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self.bookName, 20)
    .heightIs(12);
    self.rewardCount.sd_layout
    .leftEqualToView(self.bookName)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self.userName, 3)
    .heightIs(12);
    self.rewardTime.sd_layout
    .leftEqualToView(self.bookName)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self.rewardCount, 3)
    .heightIs(12);
    
}

@end
