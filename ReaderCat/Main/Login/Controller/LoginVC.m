//
//  LoginVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "LoginWayView.h"
#import "RCForgetPassword.h"
@interface LoginVC ()
@property (nonatomic, strong)MyLinearLayout     *contentLayout;
@property (nonatomic, strong)LoginView          *loginView;
@property (nonatomic, strong)LoginWayView       *loginWayView;
@end

@implementation LoginVC

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
    self.title = @"账号登录";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self dealAction];
}

- (void)configSubviews {
    self.loginView = [LoginView new];
    self.loginView.myHorzMargin = 0;
    self.loginView.myTop = 0;
    self.loginView.myHeight = 400;
    [self.lineLayout addSubview:self.loginView];
    self.loginWayView = [LoginWayView new];
    self.loginWayView.myHorzMargin = 0;
    self.loginWayView.myTop = 0;
    self.loginWayView.myHeight = 200;
    [self.lineLayout addSubview:self.loginWayView];
}

- (void)dealAction {
    self.loginView.forwordPw.onClick(^{
        [self pushVC:[RCForgetPassword new]];
    });
    
    self.loginView.loginBtn.onClick(^{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)backClick {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
