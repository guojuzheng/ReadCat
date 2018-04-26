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
    self.wxLogin = [self creatLoginBtnWithImage:@""];
    [self sd_addSubviews:@[leftLine,centerLabel,rightLine,self.qqLogin,self.wxLogin]];
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
}
- (UIButton *)creatLoginBtnWithImage:(NSString *)imageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 20.5;
    button.layer.edgeAntialiasingMask = YES;
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return button;
}
@end

