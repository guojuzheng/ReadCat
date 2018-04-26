//
//  RCPersonHeadView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCPersonHeadView.h"

@implementation RCPersonHeadView
- (void)loadSubViews {
    self.backgroundColor = [UIColor grayColor];
    UILabel *title = [UILabel new];
    title.textAlignment = NSTextAlignmentCenter;
    title.backgroundColor = ThemeColor;
    title.fnt(18).str(@"我的账户");
    
    _bgImageView = [UIImageView new];
    _bgImageView.img(@"bg_Image.JPG");
    _headView = [UIImageView new];
    _headView.layer.cornerRadius = 25;
    _headView.layer.masksToBounds = YES;
    
    _nameLabel = [UILabel new];
    _nameLabel.fnt(12).str(@"杨幂").color(@"#ffffff");
    _nameLabel.backgroundColor = [UIColor clearColor];
    
    _vipImageView = [UIImageView new];
    
    _editMessageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editMessageBtn.backgroundColor = [UIColor clearColor];
    _editMessageBtn.titleLabel.fnt(10);
    [_editMessageBtn setTitleColor:Color(WhiteColor) forState:UIControlStateNormal];
    [_editMessageBtn setTitle:@"编辑个人资料>" forState:UIControlStateNormal];
    
    _readTime = [UILabel new];
    _readTime.textAlignment = NSTextAlignmentCenter;
    _readTime.fnt(12).str(@"阅读时长").color(@"#ffffff");
    _readTime.backgroundColor = [UIColor clearColor];
    
    _goodNumber = [UILabel new];
    _goodNumber.textAlignment = NSTextAlignmentCenter;
    _goodNumber.fnt(12).str(@"收到的赞").color(@"#ffffff");
    _goodNumber.backgroundColor = [UIColor clearColor];
    
    [self sd_addSubviews:@[title,_bgImageView, _headView,_nameLabel,_vipImageView,_editMessageBtn,_readTime,_goodNumber]];
    title.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .heightIs(45);
    _bgImageView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(title, 0)
    .bottomEqualToView(self);
    _headView.sd_layout
    .centerXEqualToView(title)
    .topSpaceToView(title, 15)
    .widthIs(50)
    .heightEqualToWidth();
    
    _nameLabel.sd_layout
    .centerXEqualToView(_headView)
    .topSpaceToView(_headView, 10)
    .heightIs(11);
    [_nameLabel sizeToFit];
    
    _vipImageView.sd_layout
    .leftSpaceToView(_nameLabel, 0)
    .centerYEqualToView(_nameLabel)
    .heightIs(11)
    .widthIs(100);
    
    _editMessageBtn.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(_nameLabel, 15)
    .heightIs(10);
    
    _readTime.sd_layout
    .leftEqualToView(self)
    .topSpaceToView(_editMessageBtn, 18)
    .heightIs(50)
    .widthRatioToView(self, 0.5);
    
    _goodNumber.sd_layout
    .rightEqualToView(self)
    .centerYEqualToView(_readTime)
    .leftSpaceToView(_readTime, 0)
    .heightIs(50);
    
}

@end
