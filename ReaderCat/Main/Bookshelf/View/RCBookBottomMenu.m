//
//  RCBookBottomMenu.m
//  ReaderCat
//
//  Created by guojz on 2018/4/24.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookBottomMenu.h"

@implementation RCBookBottomMenu
- (void)loadSubViews {
    self.rewardBtn = [QMUIFillButton creatQMUIBtnWithImage:@"reword" title:@"打赏一下" titleImageSpace:3 imagePosition:QMUIButtonImagePositionTop font:12 backgroundColor:WhiteColor titleColor:BlackColor];
    self.readNowBtn = [QMUIFillButton creatQMUIBtnWithImage:@"read_now" title:@"立即阅读" titleImageSpace:3 imagePosition:QMUIButtonImagePositionTop font:12 backgroundColor:ThemeColor titleColor:BlackColor];
    self.joinBookshelf = [QMUIFillButton creatQMUIBtnWithImage:@"join_bookshelf" title:@"加入书架" titleImageSpace:3 imagePosition:QMUIButtonImagePositionTop font:12 backgroundColor:WhiteColor titleColor:BlackColor];
    [self sd_addSubviews:@[self.rewardBtn,self.readNowBtn,self.joinBookshelf]];
    self.rewardBtn.sd_layout
    .leftEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(SCREEN_WIDTH/3);
    self.readNowBtn.sd_layout
    .leftSpaceToView(self.rewardBtn, 0)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(SCREEN_WIDTH/3);
    self.joinBookshelf.sd_layout
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(SCREEN_WIDTH/3);
}
@end
