//
//  RCHomeSeeMoreCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/11.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCHomeSeeMoreCell.h"

@implementation RCHomeSeeMoreCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}

- (void)configSubviews {
    self.seeMoreBtn = [JCQMUIFillButton QMUIFillButtonBlueWithTitle:@"查看更多"];
    [self.seeMoreBtn setBackgroundColor:WhiteColor];
    [self.seeMoreBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
    self.seeMoreBtn.cornerRadius = 0;
    [self sd_addSubviews:@[self.seeMoreBtn]];
    self.seeMoreBtn.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
}
@end
