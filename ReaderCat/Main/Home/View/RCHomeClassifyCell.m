//
//  RCHomeClassifyCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/11.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCHomeClassifyCell.h"

@implementation RCHomeClassifyCell
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
    self.classifyName = Label.fnt(13).color(@"#010101").str(@"玄幻");
    self.countNumber = Label.fnt(11).color(@"#999999").str(@"共217，150册");
    UIView *lineView = [UIView new];
    lineView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.bookImage,self.classifyName,self.countNumber,lineView]];
    self.bookImage.sd_layout
    .leftSpaceToView(self, 14)
    .topSpaceToView(self, 14)
    .bottomSpaceToView(self, 14)
    .widthIs(45);
    self.classifyName.sd_layout
    .leftSpaceToView(self.bookImage, 16)
    .rightSpaceToView(self, 14)
    .topSpaceToView(self, 30)
    .heightIs(12);
    self.countNumber.sd_layout
    .leftEqualToView(self.classifyName)
    .rightEqualToView(self.classifyName)
    .topSpaceToView(self.classifyName, 10)
    .heightIs(11);
    lineView.sd_layout
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(0.5);
}
@end
