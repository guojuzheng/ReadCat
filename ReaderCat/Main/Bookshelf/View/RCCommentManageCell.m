//
//  RCCommentManageCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCCommentManageCell.h"

@implementation RCCommentManageCell
-(void)configSubView {
    self.bookName = Label.fnt(15).color(@"#323232").str(@"");
    self.commentView = [UITextView new];
    self.commentView.text = @"作者写的很棒!希望您能和我交流一下，万分感谢。我的圈圈是尔尔刘而刘";
    self.commentView.fnt(10).color(@"#969696");
    self.commenter = Label.fnt(10).color(@"#969696").str(@"评论人");
    self.commentTime = Label.fnt(10).color(@"#969696").str(@"评论时间");
    self.answerBtn = [self creatQMUIFillBtnWithTitle:@"回复" fontSize:12 titleColor:BlackColor backgroundColor:ThemeColor borderColor:BlackColor borderWidth:1];
    self.likeBtn = [self creatQMUIFillBtnWithTitle:@"加精" fontSize:12 titleColor:BlackColor backgroundColor:ThemeColor borderColor:BlackColor borderWidth:1];
    self.topBtn = [self creatQMUIFillBtnWithTitle:@"置顶" fontSize:12 titleColor:BlackColor backgroundColor:ThemeColor borderColor:BlackColor borderWidth:1];
    self.deleteBtn = [self creatQMUIFillBtnWithTitle:@"删除" fontSize:12 titleColor:BlackColor backgroundColor:ThemeColor borderColor:BlackColor borderWidth:1];
    self.lineView = [UIView new];
    self.lineView.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.bookName,self.commentView,self.commenter,self.commentTime,self.answerBtn,self.likeBtn,self.topBtn,self.deleteBtn,self.lineView]];
    self.bookName.sd_layout
    .leftSpaceToView(self, 13)
    .rightSpaceToView(self, 26)
    .topSpaceToView(self, 15)
    .heightIs(15);
    self.commentView.sd_layout
    .leftEqualToView(self.bookName)
    .rightEqualToView(self.bookName)
    .topSpaceToView(self.bookName, 10)
    .heightIs(30);
    self.commenter.sd_layout
    .leftEqualToView(self.bookName)
    .rightEqualToView(self.bookName)
    .topSpaceToView(self.commentView, 5)
    .heightIs(10);
    self.commentTime.sd_layout
    .leftEqualToView(self.bookName)
    .rightEqualToView(self.bookName)
    .topSpaceToView(self.commenter, 5)
    .heightIs(10);
    self.answerBtn.sd_layout
    .leftSpaceToView(self, 12)
    .topSpaceToView(self.commentTime, 20)
    .heightIs(23)
    .widthIs((SCREEN_WIDTH-60)/4);
    self.likeBtn.sd_layout
    .leftSpaceToView(self.answerBtn, 12)
    .centerYEqualToView(self.answerBtn)
    .heightIs(23)
    .widthIs((SCREEN_WIDTH-60)/4);
    self.topBtn.sd_layout
    .leftSpaceToView(self.likeBtn, 12)
    .centerYEqualToView(self.answerBtn)
    .heightIs(23)
    .widthIs((SCREEN_WIDTH-60)/4);
    self.deleteBtn.sd_layout
    .leftSpaceToView(self.topBtn, 12)
    .centerYEqualToView(self.answerBtn)
    .heightIs(23)
    .widthIs((SCREEN_WIDTH-60)/4);
    self.lineView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .heightIs(1);
}

- (QMUIFillButton *)creatQMUIFillBtnWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth {
    QMUIFillButton *button = [[QMUIFillButton alloc] initWithFillColor:backgroundColor titleTextColor:titleColor];
    button.fnt(fontSize);
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
    button.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    return button;
}
@end
