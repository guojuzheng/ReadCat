//
//  RCResetPasswordVC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCResetPasswordVC.h"
#import "RCInputView.h"

@interface RCResetPasswordVC ()
@property (nonatomic, strong) RCInputView        *PassWord;
@property (nonatomic, strong) RCInputView        *againNewPW;
@property (nonatomic, strong) MyLinearLayout     *contentLayout;
@property (nonatomic, strong) QMUIFillButton     *resetButton;

@end

@implementation RCResetPasswordVC
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
    self.title = @"重置密码";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    self.PassWord = [RCInputView new];
    [self.PassWord setLeftImage:@"" placeHolder:@"请输入新密码(6~16位，区分大小写)"];
    self.againNewPW = [RCInputView new];
    [self.againNewPW setLeftImage:@"" placeHolder:@"再次输入新密码"];
    self.PassWord.myHorzMargin = 30;
    self.PassWord.myTop = 50;
    self.PassWord.myHeight = 51;
    [self.contentLayout addSubview:self.PassWord];
    self.againNewPW.myHorzMargin = 30;
    self.againNewPW.myTop = 0;
    self.againNewPW.myHeight = 51;
    [self.contentLayout addSubview:self.againNewPW];
    
    self.resetButton = [[QMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:Color(@"#000000")];
    self.resetButton.fnt(SixteenFontSize);
    self.resetButton.layer.borderColor = Color(@"#000000").CGColor;
    self.resetButton.layer.borderWidth = 1;
    [self.resetButton setTitle:@"重置" forState:UIControlStateNormal];
    self.resetButton.cornerRadius = 3.5;
    self.resetButton.myHorzMargin = 30;
    self.resetButton.myTop = 36;
    self.resetButton.myHeight = 45;
    [self.contentLayout addSubview:self.resetButton];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
