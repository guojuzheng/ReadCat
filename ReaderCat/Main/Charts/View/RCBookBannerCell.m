//
//  RCBookBannerCell.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookBannerCell.h"

@implementation RCBookBannerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self loadSubviews];
    }
    return self;
}
- (void)loadSubviews {
    self.backgroundColor = WhiteColor;
    self.leftImageView = [UIImageView new];
    self.leftImageView.backgroundColor = [UIColor redColor];
//    self.leftImageView.layer.cornerRadius = 25;
//    self.leftImageView.layer.masksToBounds = YES;
    
    self.chartsTitle = Label.fnt(13).color(@"#010101").str(@"");
    self.chartsName  = Label.fnt(11).color(@"#999999").str(@"2087人正在追");
    self.chartTip    = Label.fnt(11).color(@"#999999").str(@"更新于今天");
    self.classLabel  = Label.fnt(10).color(@"#999999").str(@"都市生活");
    self.classLabel.layer.cornerRadius = 2;
    self.classLabel.textAlignment = NSTextAlignmentCenter;
    self.classLabel.layer.masksToBounds = YES;
    self.classLabel.layer.borderColor = Color(@"#999999").CGColor;
    self.classLabel.layer.borderWidth = 1;
    self.lineView    = [UIView new];
    self.lineView.backgroundColor = DEFAULT_BG_COLOR;
    
    [self sd_addSubviews:@[self.leftImageView,self.chartsTitle,self.chartsName,self.chartTip,self.classLabel,self.lineView]];
    self.leftImageView.sd_layout
    .leftSpaceToView(self, 25)
    .centerYEqualToView(self)
    .heightIs(78)
    .widthIs(60);
    
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
    
    self.classLabel.sd_layout
    .leftEqualToView(self.chartsName)
    .bottomEqualToView(self.leftImageView)
    .widthIs(50)
    .heightIs(16);
    
    self.lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomSpaceToView(self, 0)
    .heightIs(0.5);
}
@end
