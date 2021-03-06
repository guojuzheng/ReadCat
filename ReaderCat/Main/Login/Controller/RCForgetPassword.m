//
//  RCForgetPassword.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCForgetPassword.h"
#import "RCInputView.h"
#import "RCForgetPasswordQCVC.h"

@interface RCForgetPassword ()
@property (nonatomic, strong) MyLinearLayout     *contentLayout;
@property (nonatomic, strong) RCInputView        *accountInput;
@property (nonatomic, strong) QMUIFillButton     *commitBtn;
@end

@implementation RCForgetPassword
-(MyLinearLayout *)contentLayout{
    if(!_contentLayout){
        _contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
        _contentLayout.padding = UIEdgeInsetsMake(0, 0, 0, 0);    //设置布局内的子视图离自己的边距.
        _contentLayout.myHorzMargin = 0;                          //同时指定左右边距为0表示宽度和父视图一样宽
        _contentLayout.heightSize.lBound(self.scrollView.heightSize, 10, 1); //高度虽然是wrapContentHeight的。但是最小的高度不能低于父视图的高度加10.
        [self.scrollView addSubview:_contentLayout];
    }
    return _contentLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"忘记密码";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self dealAction];
}

- (void)configSubviews {
    self.accountInput = [RCInputView new];
    [self.accountInput setLeftImage:@"" placeHolder:@"请输入手机/邮箱/个性账号"];
    self.accountInput.myHorzMargin = 30;
    self.accountInput.myTop = 50;
    self.accountInput.myHeight = 51;
    [self.contentLayout addSubview:self.accountInput];
    self.commitBtn = [[QMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:Color(@"#000000")];
    self.commitBtn.fnt(SixteenFontSize);
    self.commitBtn.layer.borderColor = Color(@"#000000").CGColor;
    self.commitBtn.layer.borderWidth = 1;
    [self.commitBtn setTitle:@"通过密保问题找回密码" forState:UIControlStateNormal];
    self.commitBtn.cornerRadius = 3.5;
    self.commitBtn.myHorzMargin = 30;
    self.commitBtn.myTop = 36;
    self.commitBtn.myHeight = 45;
    [self.contentLayout addSubview:self.commitBtn];
    
    UILabel *tipLabel =Label.fnt(11).color(@"#000000").str(@"若未设置密保问题，请联系客服（QQ:848317996）处理。");
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.myHorzMargin = 30;
    tipLabel.myTop = 20;
    tipLabel.myHeight = 15;
    [self.contentLayout addSubview:tipLabel];
}
- (void)dealAction {
    self.commitBtn.onClick(^{
        [self pushVC:[RCForgetPasswordQCVC new]];
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
