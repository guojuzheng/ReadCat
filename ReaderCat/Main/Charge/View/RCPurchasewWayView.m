//
//  RCPurchasewWayView.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCPurchasewWayView.h"

@implementation RCPurchasewWayView

- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.alipayBtn = [self creatQMUIBtnWithImage:@"" title:@"支付宝支付" titleImageSpace:10 imagePosition:QMUIButtonImagePositionLeft font:16 backgroundColor:Color(@"#1babea") titleColor:WhiteColor];
    self.wxPayBtn = [self creatQMUIBtnWithImage:@"" title:@"微信支付" titleImageSpace:10 imagePosition:QMUIButtonImagePositionLeft font:16 backgroundColor:Color(@"#37d22b") titleColor:WhiteColor];
    self.wxScanBtn = [self creatQMUIBtnWithImage:@"" title:@"微信扫码支付" titleImageSpace:10 imagePosition:QMUIButtonImagePositionLeft font:16 backgroundColor:Color(@"#37d22b") titleColor:WhiteColor];
    
    [self sd_addSubviews:@[self.alipayBtn,self.wxPayBtn,self.wxScanBtn]];
    self.alipayBtn.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(self, 20)
    .heightIs(45);
    
    self.wxPayBtn.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(self.alipayBtn, 10)
    .heightIs(45);
    
    self.wxScanBtn.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(self.wxPayBtn, 10)
    .heightIs(45);
    
}

- (QMUIButton *)creatQMUIBtnWithImage:(NSString *)imageName title:(NSString *)title  titleImageSpace:(float)space imagePosition:(QMUIButtonImagePosition)imagePosition font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor {
    QMUIButton  *button = [[QMUIButton alloc] init];
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    [button setBackgroundColor:backgroundColor];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.imagePosition = imagePosition;
    button.spacingBetweenImageAndTitle = space;
    [button setImage:UIImageMake(imageName) forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = UIFontMake(fontSize);
    button.qmui_borderPosition = QMUIBorderViewPositionTop | QMUIBorderViewPositionBottom;
    return button;
}
@end
