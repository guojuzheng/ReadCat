//
//  RCBookInfoTableHeader.m
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookInfoTableHeader.h"
@interface RCBookInfoTableHeader ()
@property (nonatomic, strong) UIView        *lineViewA;
@property (nonatomic, strong) UIView        *lineViewB;
@end
@implementation RCBookInfoTableHeader

- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.bookImage = [UIImageView new];
    self.bookImage.backgroundColor = [UIColor redColor];
    self.bookName = Label.fnt(13).color(@"#010101").str(@"追风筝的人");
    self.updateTime = Label.fnt(11).color(@"#999999").str(@"更新于今天11:40");
    self.updateTime.textAlignment = NSTextAlignmentRight;
    self.authorImage = [UIImageView new];
    self.authorImage.backgroundColor = [UIColor redColor];
    self.authorImage.layer.cornerRadius = 7;
    self.authorImage.layer.masksToBounds = YES;
    self.authorName = Label.fnt(11).color(@"#999999").str(@"Khaled Hosseinl");
    self.classLabelView = Label.fnt(11).color(@"#999999").str(@"情感人文");
    self.classLabelView.layer.borderColor = Color(@"#999999").CGColor;
    self.classLabelView.layer.borderWidth = 0.5;
    self.classLabelView.textAlignment = NSTextAlignmentCenter;
    self.infoBtn = [QMUIFillButton creatQMUIFillButtonWithTitle:@"信息" fillColor:WhiteColor titleTextColor:ThemeColor borderColor:WhiteColor borderWidth:1 cornerRadius:0 font:12];
    self.menuBtn = [QMUIFillButton creatQMUIFillButtonWithTitle:@"目录" fillColor:WhiteColor titleTextColor:ThemeColor borderColor:WhiteColor borderWidth:1 cornerRadius:0 font:12];
    self.commentBtn = [QMUIFillButton creatQMUIFillButtonWithTitle:@"评论" fillColor:WhiteColor titleTextColor:ThemeColor borderColor:WhiteColor borderWidth:1 cornerRadius:0 font:12];
    self.lineViewA = [UIView new];
    self.lineViewA.backgroundColor = DEFAULT_BG_COLOR;
    self.lineViewB= [UIView new];
    self.lineViewB.backgroundColor = DEFAULT_BG_COLOR;
    [self sd_addSubviews:@[self.bookImage,self.bookName,self.updateTime,self.authorImage,self.authorName,self.classLabelView,self.infoBtn,self.menuBtn,self.commentBtn,self.lineViewA,self.lineViewB]];
    self.bookImage.sd_layout
    .leftSpaceToView(self, 27)
    .topSpaceToView(self, 15)
    .widthIs(54)
    .heightIs(76);
    
    self.updateTime.sd_layout
    .rightSpaceToView(self, 15)
    .topEqualToView(self.bookImage)
    .heightIs(13)
    .widthIs(89);
    
    self.bookName.sd_layout
    .leftSpaceToView(self.bookImage, 10)
    .rightSpaceToView(self.updateTime, 10)
    .topEqualToView(self.bookImage)
    .heightIs(13);
    
    self.authorImage.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.bookName, 5)
    .widthIs(14)
    .heightIs(14);

    self.authorName.sd_layout
    .leftSpaceToView(self.authorImage, 10)
    .centerYEqualToView(self.authorImage)
    .rightSpaceToView(self, 15)
    .heightIs(14);

    self.classLabelView.sd_layout
    .leftEqualToView(self.bookName)
    .topSpaceToView(self.authorImage, 23)
    .heightIs(16)
    .widthIs(51);

    self.lineViewA.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.bookImage, 15)
    .heightIs(1);
    
    self.infoBtn.sd_layout
    .leftEqualToView(self)
    .topSpaceToView(self.lineViewA, 0)
    .heightIs(40)
    .widthIs(SCREEN_WIDTH/3);

    self.menuBtn.sd_layout
    .leftSpaceToView(self.infoBtn, 0)
    .widthIs(SCREEN_WIDTH/3)
    .centerYEqualToView(self.infoBtn)
    .heightIs(40);

    self.commentBtn.sd_layout
    .leftSpaceToView(self.menuBtn, 0)
    .centerYEqualToView(self.infoBtn)
    .heightIs(40)
    .widthIs(SCREEN_WIDTH/3);
    
    for (int a = 0; a < 2; a ++) {
        UIView *line = [UIView new];
        line.backgroundColor = DEFAULT_BG_COLOR;
        [self sd_addSubviews:@[line]];
        line.sd_layout
        .leftSpaceToView(self, SCREEN_WIDTH/3*(a + 1))
        .centerYEqualToView(self.infoBtn)
        .heightIs(30)
        .widthIs(1);
    }
    self.lineViewB.sd_layout
    .leftEqualToView(self.lineViewA)
    .rightEqualToView(self.lineViewA)
    .topSpaceToView(self.infoBtn, 0)
    .heightIs(1);
    
    [self dealAcction];
  
}

- (void)dealAcction {
    self.infoBtn.onClick(^{
        if (self.buttonClickBlock) {
            self.buttonClickBlock(0);
        }
    });
    self.menuBtn.onClick(^{
        if (self.buttonClickBlock) {
            self.buttonClickBlock(1);
        }
    });
    self.commentBtn.onClick(^{
        if (self.buttonClickBlock) {
            self.buttonClickBlock(2);
        }
    });
}
@end
