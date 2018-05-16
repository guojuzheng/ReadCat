//
//  LoginWayView.m
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "LoginWayView.h"

@implementation LoginWayView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    UIView *leftLine = [UIView new];
    leftLine.backgroundColor = Color(@"#999999");
    UIView *rightLine = [UIView new];
    rightLine.backgroundColor =Color(@"#999999");
    UILabel *centerLabel = Label.fnt(12).color(@"#999999").str(@"其他登录方式");
    centerLabel.textAlignment = NSTextAlignmentCenter;
    self.qqLogin = [self creatLoginBtnWithImage:@""];
    self.qqLogin.backgroundColor = ThemeColor;
    self.wxLogin = [self creatLoginBtnWithImage:@""];
    self.wxLogin.backgroundColor = ThemeColor;
    self.readerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.readerBtn.backgroundColor = ThemeColor;
    self.leftTipLab = Label.fnt(10).color(@"#999999").str(@"我已阅读并接受");
    self.centerTipLab = Label.fnt(10).color(@"#999999").str(@"等及");
    self.leftProtocalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftProtocalBtn setTitle:@"《阅读猫软件许可及服务协议》" forState:UIControlStateNormal];
    [self.leftProtocalBtn setTitleColor:Color(@"#399fff") forState:UIControlStateNormal];
    self.leftProtocalBtn.titleLabel.fnt(10);
    self.rightProtocalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightProtocalBtn setTitle:@"《隐私协议》" forState:UIControlStateNormal];
    [self.rightProtocalBtn setTitleColor:Color(@"#399fff") forState:UIControlStateNormal];
    self.rightProtocalBtn.titleLabel.fnt(10);
    [self sd_addSubviews:@[leftLine,centerLabel,rightLine,self.qqLogin,self.wxLogin,self.readerBtn,self.leftTipLab,self.leftProtocalBtn,self.centerTipLab,self.rightProtocalBtn]];
    leftLine.sd_layout
    .leftSpaceToView(self, 30)
    .topSpaceToView(self, 50)
    .heightIs(0.5)
    .widthIs((SCREEN_WIDTH-145)/2);
    centerLabel.sd_layout
    .leftSpaceToView(leftLine, 10)
    .centerYEqualToView(leftLine)
    .widthIs(75)
    .heightIs(15);
    rightLine.sd_layout
    .leftSpaceToView(centerLabel, 10)
    .centerYEqualToView(leftLine)
    .rightSpaceToView(self, 30)
    .heightIs(0.5);
    self.qqLogin.sd_layout
    .leftSpaceToView(self, 122)
    .topSpaceToView(centerLabel, 20)
    .widthIs(41)
    .heightIs(41);
    self.wxLogin.sd_layout
    .rightSpaceToView(self, 122)
    .centerYEqualToView(self.qqLogin)
    .widthRatioToView(self.qqLogin, 1)
    .heightEqualToWidth();
    
    self.readerBtn.sd_layout
    .leftSpaceToView(self, 29)
    .topSpaceToView(self.wxLogin, 58)
    .widthIs(16)
    .heightEqualToWidth();
    
    CGSize sizeThatFit = [self.leftTipLab sizeThatFits:CGSizeZero];
    self.leftTipLab.sd_layout
    .leftSpaceToView(self.readerBtn, 4)
    .centerYEqualToView(self.readerBtn)
    .heightIs(10)
    .widthIs(sizeThatFit.width);
    
    CGSize sizeThatFit2 = [self.leftProtocalBtn sizeThatFits:CGSizeZero];
    self.leftProtocalBtn.sd_layout
    .leftSpaceToView(self.leftTipLab, 0)
    .centerYEqualToView(self.leftTipLab)
    .heightIs(10)
    .widthIs(sizeThatFit2.width);
    
    CGSize sizeThatFit3 = [self.centerTipLab sizeThatFits:CGSizeZero];
    self.centerTipLab.sd_layout
    .leftSpaceToView(self.leftProtocalBtn, 0)
    .centerYEqualToView(self.leftProtocalBtn)
    .heightIs(10)
    .widthIs(sizeThatFit3.width);
    
    CGSize sizeThatFit4 = [self.rightProtocalBtn sizeThatFits:CGSizeZero];
    self.rightProtocalBtn.sd_layout
    .leftSpaceToView(self.centerTipLab, 0)
    .centerYEqualToView(self.centerTipLab)
    .heightIs(10)
    .widthIs(sizeThatFit4.width);

}
- (UIButton *)creatLoginBtnWithImage:(NSString *)imageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 20.5;
    button.layer.edgeAntialiasingMask = YES;
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return button;
}
@end

