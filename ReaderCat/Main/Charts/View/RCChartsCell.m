//
//  RCChartsCell.m
//  ReaderCat
//
//  Created by guojz on 2018/3/27.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCChartsCell.h"

@implementation RCChartsCell

- (void)configSubView {
    self.backgroundColor = WhiteColor;
    self.leftImageView = [UIImageView new];
    self.leftImageView.backgroundColor = [UIColor redColor];
    self.leftImageView.layer.cornerRadius = 25;
    self.leftImageView.layer.masksToBounds = YES;
    
    self.chartsTitle = Label.fnt(13).color(@"#010101").str(@"女生人人气榜");
    self.chartsName  = Label.fnt(11).color(@"#999999").str(@"女生最受欢迎作品榜");
    self.chartTip    = Label.fnt(11).color(@"#999999").str(@"01/10 《彼岸三世》");
    self.lineView    = [UIView new];
    self.lineView.backgroundColor = DEFAULT_BG_COLOR;
    
    [self sd_addSubviews:@[self.leftImageView,self.chartsTitle,self.chartsName,self.chartTip,self.lineView]];
    self.leftImageView.sd_layout
    .leftSpaceToView(self, 25)
    .centerYEqualToView(self)
    .heightIs(50)
    .widthEqualToHeight();
    
    self.chartsTitle.sd_layout
    .topEqualToView(self.leftImageView)
    .leftSpaceToView(self.leftImageView, 10)
    .rightEqualToView(self)
    .heightIs(13);
    
    self.chartsName.sd_layout
    .leftEqualToView(self.chartsTitle)
    .rightEqualToView(self)
    .topSpaceToView(self.chartsTitle, 9)
    .heightIs(11);
    
    self.chartTip.sd_layout
    .leftEqualToView(self.chartsName)
    .rightEqualToView(self)
    .topSpaceToView(self.chartsName, 6)
    .heightIs(12);
    
    self.lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomSpaceToView(self, 0)
    .heightIs(0.5);
}

@end
