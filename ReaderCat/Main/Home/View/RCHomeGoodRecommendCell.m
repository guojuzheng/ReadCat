//
//  RCHomeGoodRecommendCell.m
//  ReaderCat
//
//  Created by guojz on 2018/4/4.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCHomeGoodRecommendCell.h"

@implementation RCHomeGoodRecommendCell
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
    self.bookImageView = [UIImageView new];
    self.bookImageView.backgroundColor = [UIColor redColor];
    self.bookName = Label.fnt(13).color(@"#010101").str(@"彼岸三世");
    self.bookBrief = [UILabel new];
    self.bookBrief.lineBreakMode = NSLineBreakByTruncatingTail;
    self.bookBrief.numberOfLines = 0;
    self.bookBrief.textColor =Color(@"#999999");
    self.bookBrief.fnt(13).str(@"宋书航某天意外的加入了一个资深仙侠中二病资深患者聊天群，里面群友都以“道友”相称");
    self.headImage = [UIImageView new];
    self.headImage.backgroundColor = [UIColor redColor];
    self.authorName =Label.fnt(11).color(@"#999999").str(@"流川枫");
    self.scoreLabel = Label.fnt(10).color(@"#999999").str(@"9.5分");
    self.scoreLabel.layer.borderWidth = 0.5;
    self.scoreLabel.layer.borderColor = Color(@"#999999").CGColor;
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    self.textNumberLabel = Label.fnt(10).color(@"#999999").str(@"100万字");
    self.textNumberLabel.textAlignment = NSTextAlignmentCenter;
    self.textNumberLabel.layer.borderWidth = 0.5;
    self.textNumberLabel.layer.borderColor = Color(@"#999999").CGColor;
    self.classifyLabel = Label.fnt(10).color(@"#999999").str(@"都市生活");
    self.classifyLabel.textAlignment = NSTextAlignmentCenter;
    self.classifyLabel.layer.borderWidth = 0.5;
    self.classifyLabel.layer.borderColor = Color(@"#999999").CGColor;
    [self sd_addSubviews:@[self.bookImageView,self.bookName,self.bookBrief,self.headImage,self.authorName,self.scoreLabel,self.textNumberLabel,self.classifyLabel]];
    
    self.bookImageView.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 15)
    .widthRatioToView(self, 0.15)
    .heightIs(80);
    
    self.bookName.sd_layout
    .leftSpaceToView(self.bookImageView, 10)
    .rightSpaceToView(self, 10)
    .topEqualToView(self.bookImageView)
    .heightIs(12);
    
    self.bookBrief.sd_layout
    .leftEqualToView(self.bookName)
    .rightSpaceToView(self, 15)
    .heightIs(40)
    .topSpaceToView(self.bookName, 8);
    
    self.headImage.sd_layout
    .leftEqualToView(self.bookBrief)
    .bottomEqualToView(self.bookImageView)
    .widthIs(12.5)
    .heightEqualToWidth();
    
    self.authorName.sd_layout
    .leftSpaceToView(self.headImage, 8)
    .centerYEqualToView(self.headImage)
    .rightSpaceToView(self, 15)
    .heightIs(12.5);
    
    self.scoreLabel.sd_layout
    .rightSpaceToView(self, 17)
    .centerYEqualToView(self.authorName)
    .heightIs(12.5)
    .widthIs(46);
    
    self.textNumberLabel.sd_layout
    .rightSpaceToView(self.scoreLabel, 5)
    .centerYEqualToView(self.authorName)
    .heightIs(12.5)
    .widthIs(46);
    
    self.classifyLabel.sd_layout
    .rightSpaceToView(self.textNumberLabel, 5)
    .centerYEqualToView(self.authorName)
    .heightIs(12.5)
    .widthIs(46);
}
@end
