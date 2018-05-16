//
//  RCRewardCountView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/29.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardCountView.h"

@implementation RCRewardCountView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.leftLabel = Label.fnt(14).color(@"#000000").str(@"我的账户: 0阅读币");
    [self changeLabel:self.leftLabel withTextColor:ThemeColor];
    self.rightButton = [[QMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:Color(@"#000000")];
    self.rightButton.fnt(TwelveFontSize);
    self.rightButton.layer.borderColor = Color(@"#000000").CGColor;
    self.rightButton.layer.borderWidth = 1;
    self.rightButton.cornerRadius = 3.5;
    [self sd_addSubviews:@[self.leftLabel,self.rightButton]];
    self.leftLabel.sd_layout
    .leftSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightRatioToView(self, 1)
    .widthRatioToView(self, 0.7);
    
    self.rightButton.sd_layout
    .leftSpaceToView(self.leftLabel, 10)
    .rightSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightIs(23);
}

- (void)changeLabel:(UILabel *)label withTextColor:(UIColor *)color {
    NSString *labelStr = label.text; //初始化string为传入label.text的值
    NSCharacterSet *nonDigits = [[NSCharacterSet alphanumericCharacterSet]invertedSet];//创建一个字符串过滤参数,decimalDigitCharacterSet为过滤小数,过滤某个关键词,只需改变 decimalDigitCharacterSet类型  在将此方法增加一个 NSString参数即可
    NSInteger remainSeconde = [[labelStr stringByTrimmingCharactersInSet:nonDigits]intValue];//获取过滤出来的数值
    NSString *stringRange = [NSString stringWithFormat:@"%ld",(long)remainSeconde];//将过滤出来的Integer的值转换成String
    NSRange range = [labelStr rangeOfString:stringRange];//获取过滤出来的数值的位置
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:label.text];//创建一个带属性的string
    [attrStr addAttribute:NSForegroundColorAttributeName value:ThemeColor range:range];//给带属性的string添加属性,attrubute:添加的属性类型（颜色\文字大小\字体等等）,value:改变成的属性参数,range:更改的位置
    label.attributedText = attrStr;//将 attstr 赋值给label带属性的文本框属性
    
    /**
     以下为NSCharacterSet的过滤类型:
     
     controlCharacterSet; //控制符
     whitespaceCharacterSet; //空格
     whitespaceAndNewlineCharacterSet; //空格和换行符
     decimalDigitCharacterSet; //小数
     letterCharacterSet; //文字
     lowercaseLetterCharacterSet; //小写字母
     uppercaseLetterCharacterSet; //大写字母
     nonBaseCharacterSet; //非基础
     alphanumericCharacterSet; //字母数字
     decomposableCharacterSet; //可分解
     illegalCharacterSet; //非法
     punctuationCharacterSet; //标点
     capitalizedLetterCharacterSet; //大写
     symbolCharacterSet; //符号
     newlineCharacterSet; //换行符
     */
    
}
@end
