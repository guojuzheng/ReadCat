//
//  RCRewardInfoItemView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardInfoItemView.h"

@implementation RCRewardInfoItemView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
}
- (void)setItemArray:(NSArray *)itemArray {
    _itemArray = itemArray;
    for (int i = 0; i < itemArray.count; i++) {
        RCRewardInfoItemSigleView *sigleView = [RCRewardInfoItemSigleView new];
        [self sd_addSubviews:@[sigleView]];
        sigleView.sd_layout
        .centerYEqualToView(self)
        .heightRatioToView(self, 1)
        .leftSpaceToView(self, i*90)
        .widthIs(90);

    }
}
@end


@implementation RCRewardInfoItemSigleView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.topLabel = Label.fnt(15).color(@"#000000").str(@"66");
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel = Label.fnt(11).color(@"#999999").str(@"周赏次数");
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    
    [self sd_addSubviews:@[self.topLabel,self.bottomLabel]];
    self.topLabel.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self, 5)
    .heightIs(20);
    
    self.bottomLabel.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.topLabel, 0)
    .heightIs(20);
}
@end
