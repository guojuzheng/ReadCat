//
//  RCBookCommentCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/24.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookCommentCell.h"

@implementation RCBookCommentCell
- (void)configSubView {
    self.headImage = [UIImageView new];
    self.headImage.backgroundColor = ThemeColor;
    self.nameLabel = Label.fnt(15).color(@"#999999");
    self.textView = [UILabel new];
    self.textView.fnt(12).color(@"#999999");
    self.textView.numberOfLines = 0;
    self.timeLabel = Label.fnt(15).color(@"#999999");
    self.likeBtn = [QMUIFillButton creatQMUIBtnWithImage:@"like" title:@"34" titleImageSpace:3 imagePosition:QMUIButtonImagePositionLeft font:10 backgroundColor:WhiteColor titleColor:Color(@"#999999")];
    self.commontBtn = [QMUIFillButton creatQMUIBtnWithImage:@"comment" title:@"89" titleImageSpace:3 imagePosition:QMUIButtonImagePositionLeft font:10 backgroundColor:WhiteColor titleColor:Color(@"#999999")];
    [self sd_addSubviews:@[self.headImage,self.nameLabel,self.textView,self.likeBtn,self.commontBtn]];
    self.headImage.sd_layout
    .leftSpaceToView(self, 10)
    .topSpaceToView(self, 10)
    .heightIs(30)
    .widthIs(30);
    self.nameLabel.sd_layout
    .leftSpaceToView(self.headImage, 5)
    .rightSpaceToView(self, 15)
    .topSpaceToView(self, 10)
    .heightIs(15);
    self.textView.sd_layout
    .leftEqualToView(self.nameLabel)
    .topSpaceToView(self.nameLabel, 0)
    .heightIs(40)
    .rightSpaceToView(self, 15);
    self.timeLabel.sd_layout
    .leftEqualToView(self.textView)
    .topSpaceToView(self.textView, 5)
    .heightIs(12)
    .widthIs(100);
    self.commontBtn.sd_layout
    .rightSpaceToView(self, 10)
    .topSpaceToView(self.textView, 5)
    .heightIs(15)
    .widthIs(30);
    self.likeBtn.sd_layout
    .rightSpaceToView(self.commontBtn, 10)
    .topSpaceToView(self.textView, 5)
    .heightIs(15)
    .widthIs(30);
    
}
@end
