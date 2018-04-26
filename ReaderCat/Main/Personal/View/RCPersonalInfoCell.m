//
//  RCPersonalInfoCell.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCPersonalInfoCell.h"

@implementation RCPersonalInfoCell
- (void)configSubView {
    _leftLabel  = Label.fnt(14).color(@"#666666");
    _leftLabel.textAlignment = NSTextAlignmentLeft;
    
    _rightImageView = ImageView.img(@"");
    
    _rightLabel = Label.fnt(14).color(@"#666666");
    _rightLabel.textAlignment = NSTextAlignmentRight;
    
    _rightMoreImageView = ImageView.img(@"");
    _rightMoreImageView.contentMode = UIViewContentModeLeft;
    
    UILabel *lineLable = Label.bgColor(DEFAULT_BG_COLOR);
    
    [self sd_addSubviews:@[_leftLabel, _rightImageView, _rightLabel, _rightMoreImageView, lineLable]];
    
    _leftLabel.sd_layout
    .leftSpaceToView(self, 15)
    .centerYEqualToView(self)
    .heightIs(14)
    .widthIs(150);
    
    _rightMoreImageView.sd_layout
    .rightEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(20)
    .heightIs(13);
    
    _rightImageView.sd_layout
    .rightSpaceToView(_rightMoreImageView, 12)
    .centerYEqualToView(self)
    .topSpaceToView(self, 8)
    .bottomSpaceToView(self, 8)
    .widthEqualToHeight();
    _rightImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    _rightLabel.sd_layout
    .rightSpaceToView(_rightMoreImageView, 12)
    .centerYEqualToView(_rightImageView)
    .heightIs(16)
    .widthIs(200);
    
    lineLable.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(1);
}
@end
