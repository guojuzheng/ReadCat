//
//  RCPurchaseMyCountView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCPurchaseMyCountView.h"

@implementation RCPurchaseMyCountView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.leftTitle = Label.fnt(14).color(@"#000000").str(@"我的账户:");
    self.rightTitle = Label.fnt(14);
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"19阅读币"];
    [attrStr addAttribute:NSForegroundColorAttributeName value:Color(ThemeColor) range:NSMakeRange(0, attrStr.length-3)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:Color(BlackColor) range:NSMakeRange(attrStr.length-3, 3)];
    self.rightTitle.attributedText = attrStr;
    self.rightTitle.textAlignment = NSTextAlignmentRight;
    [self sd_addSubviews:@[self.leftTitle,self.rightTitle]];
    self.leftTitle.sd_layout
    .leftSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightIs(20)
    .widthRatioToView(self, 0.5);
    
    self.rightTitle.sd_layout
    .leftSpaceToView(self.leftTitle, 0)
    .rightSpaceToView(self, 20)
    .centerYEqualToView(self.leftTitle)
    .heightIs(20);
}
@end
