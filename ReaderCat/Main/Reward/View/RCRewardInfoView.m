//
//  RCRewardInfoView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardInfoView.h"

@implementation RCRewardInfoView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.bookImageView = [UIImageView new];
    self.bookImageView.backgroundColor = ThemeColor;
    self.bookName =Label.fnt(13).color(@"#010101").str(@"彼岸三世");
    self.rewardInfoItemView = [RCRewardInfoItemView new];
    self.rewardInfoItemView.itemArray = @[@"",@""];
    self.tipView = Label.fnt(11).color(@"#999999").str(@"只差1阅读币即可超越前1名");
    [self sd_addSubviews:@[self.bookImageView,self.bookName,self.rewardInfoItemView,self.tipView]];
    self.bookImageView.sd_layout
    .leftSpaceToView(self, 17)
    .topSpaceToView(self, 15)
    .widthIs(54)
    .heightIs(76);
    
    self.bookName.sd_layout
    .leftSpaceToView(self.bookImageView, 10)
    .topEqualToView(self.bookImageView)
    .rightSpaceToView(self, 17)
    .heightIs(15);
    
    self.rewardInfoItemView.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.bookName, 0)
    .rightSpaceToView(self, 17)
    .heightIs(49);
    
    self.tipView.sd_layout
    .leftEqualToView(self.rewardInfoItemView)
    .topSpaceToView(self.rewardInfoItemView, 0)
    .rightSpaceToView(self, 17)
    .heightIs(15);
    
}
@end
