//
//  LoginView.m
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView
- (void)loadSubViews {
    self.backgroundColor = WhiteColor;
    self.appIcon = [UIImageView new];
    self.appIcon.layer.cornerRadius = 10;
    self.appIcon.layer.masksToBounds = YES;
    self.appIcon.img(@"");
    self.appName = Label.fnt(24).color(@"#272727").str(@"阅读猫");
    self.appName.textAlignment = NSTextAlignmentCenter;
    self.userName = [RCInputView new];
    [self.userName setLeftImage:@"" placeHolder:@"手机/邮箱/个性账号"];
    self.password = [RCInputView new];
    [self.password setLeftImage:@"" placeHolder:@"请输入您的账号密码"];
    self.remberMe = [self creatQMUIBtnWithImage:@"" title:@"记住我" titleImageSpace:5 imagePosition:QMUIButtonImagePositionLeft font:13 backgroundColor:WhiteColor titleColor:BlackColor];
    self.forwordPw = [self creatQMUIBtnWithImage:@"" title:@"忘记密码？" titleImageSpace:0 imagePosition:QMUIButtonImagePositionLeft font:13 backgroundColor:WhiteColor titleColor:ThemeColor];
    self.registerBtn = [self creatQMUIFillBtnWithTitle:@"注册" fontSize:16 titleColor:BlackColor backgroundColor:WhiteColor borderColor:BlackColor borderWidth:1];
    self.loginBtn = [self creatQMUIFillBtnWithTitle:@"登录" fontSize:16 titleColor:BlackColor backgroundColor:ThemeColor borderColor:BlackColor borderWidth:1];
    [self sd_addSubviews:@[self.appIcon,self.appName,self.userName,self.password,self.remberMe,self.forwordPw,self.registerBtn,self.loginBtn]];
    self.appIcon.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self, 25)
    .widthIs(91)
    .heightEqualToWidth();
    self.appName.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.appIcon, 10)
    .heightIs(23);
    self.userName.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(self.appName, 30)
    .heightIs(51);
    self.password.sd_layout
    .leftSpaceToView(self, 30)
    .rightSpaceToView(self, 30)
    .topSpaceToView(self.userName, 5)
    .heightIs(51);
    self.remberMe.sd_layout
    .leftEqualToView(self.password)
    .topSpaceToView(self.password, 10)
    .heightIs(15)
    .widthIs(70);
    self.forwordPw.sd_layout
    .rightEqualToView(self.password)
    .topEqualToView(self.remberMe)
    .heightIs(15)
    .widthIs(70);
    self.registerBtn.sd_layout
    .leftEqualToView(self.password)
    .topSpaceToView(self.remberMe, 30)
    .heightIs(45)
    .widthIs((SCREEN_WIDTH-70)/2);
    self.loginBtn.sd_layout
    .leftSpaceToView(self.registerBtn, 10)
    .rightEqualToView(self.password)
    .centerYEqualToView(self.registerBtn)
    .heightRatioToView(self.registerBtn, 1);
    
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

- (QMUIFillButton *)creatQMUIFillBtnWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth {
    QMUIFillButton *button = [[QMUIFillButton alloc] initWithFillColor:backgroundColor titleTextColor:titleColor];
    button.fnt(fontSize);
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
    button.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    return button;
}
@end
