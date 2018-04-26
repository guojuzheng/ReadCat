//
//  RCBookIntroduceCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//  书籍简介

#import "RCBookIntroduceCell.h"

@implementation RCBookIntroduceCell
- (void)configSubView {
    self.textview = [UILabel  new];
    self.textview.numberOfLines = 0;
    self.textview.fnt(11).str(@"宋书航某天意外的加入了一个资深仙侠中二病资深患者聊天 群，里面群友们都以“道友”相称。宋书航某天意外的加入 了一个资深仙侠中二病资深患者聊天群，里面群友们都以“ 道友”相称。").color(@"#999999");
    [self sd_addSubviews:@[self.textview]];
    self.textview.sd_layout
    .leftSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self, 15)
    .bottomSpaceToView(self, 15);
}
@end
