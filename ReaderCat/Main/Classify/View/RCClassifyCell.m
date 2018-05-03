//
//  RCClassifyCell.m
//  ReaderCat
//
//  Created by guojz on 2018/5/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCClassifyCell.h"

@implementation RCClassifyCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}
- (void)configSubviews {
    self.backgroundColor = WhiteColor;
    self.bookImage = [UIImageView new];
    self.bookImage.backgroundColor = ThemeColor;
    self.classifyName = Label.fnt(14).color(BlackColor);
    self.lineView = [UIView new];
    self.lineView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.bookImage,self.classifyName,self.lineView]];
    self.bookImage.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 5)
    .bottomSpaceToView(self, 5)
    .widthIs(50);
    self.classifyName.sd_layout
    .leftSpaceToView(self.bookImage, 5)
    .rightSpaceToView(self, 15)
    .centerYEqualToView(self.bookImage)
    .heightIs(30);
    self.lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(1);
}
@end
