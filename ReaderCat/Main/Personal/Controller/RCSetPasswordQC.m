//
//  RCSetPasswordQC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCSetPasswordQC.h"
#import "RCInputView.h"

@interface RCSetPasswordQC ()
@property (nonatomic, strong) RCInputView        *questionA;
@property (nonatomic, strong) RCInputView        *questionB;
@property (nonatomic, strong) RCInputView        *questionC;
@property (nonatomic, strong) RCInputView        *answer;
@property (nonatomic, strong) MyLinearLayout     *contentLayout;
@property (nonatomic, strong) QMUIFillButton     *serveButton;
@end

@implementation RCSetPasswordQC

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
    self.title = @"设置密保";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    self.questionA = [RCInputView new];
    [self.questionA setLeftImage:@"" placeHolder:@"你最喜欢的书?"];
    self.questionA.inputtextfield.text = @"你最喜欢的书?";
    self.questionB = [RCInputView new];
    [self.questionB setLeftImage:@"" placeHolder:@"你最喜欢的数字?"];
    self.questionB.inputtextfield.text = @"你最喜欢的数字?";
    self.questionC = [RCInputView new];
    [self.questionC setLeftImage:@"" placeHolder:@"你能记住的密码?"];
    self.questionC.inputtextfield.text = @"你能记住的密码?";
    self.answer = [RCInputView new];
    [self.answer setLeftImage:@"" placeHolder:@"请输入答案"];
    self.questionA.inputtextfield.userInteractionEnabled =
    self.questionB.inputtextfield.userInteractionEnabled =
    self.questionC.inputtextfield.userInteractionEnabled = NO;
    self.questionA.myHorzMargin = 30;
    self.questionA.myTop = 50;
    self.questionA.myHeight = 51;
    [self.contentLayout addSubview:self.questionA];
    self.questionB.myHorzMargin = 30;
    self.questionB.myTop = 0;
    self.questionB.myHeight = 51;
    [self.contentLayout addSubview:self.questionB];
    self.questionC.myHorzMargin = 30;
    self.questionC.myTop = 0;
    self.questionC.myHeight = 51;
    [self.contentLayout addSubview:self.questionC];
    self.answer.myHorzMargin = 30;
    self.answer.myTop = 0;
    self.answer.myHeight = 51;
    [self.contentLayout addSubview:self.answer];
    self.serveButton = [[QMUIFillButton alloc] initWithFillColor:ThemeColor titleTextColor:Color(@"#000000")];
    self.serveButton.fnt(SixteenFontSize);
    self.serveButton.layer.borderColor = Color(@"#000000").CGColor;
    self.serveButton.layer.borderWidth = 1;
    [self.serveButton setTitle:@"保存" forState:UIControlStateNormal];
    self.serveButton.cornerRadius = 3.5;
    self.serveButton.myHorzMargin = 30;
    self.serveButton.myTop = 36;
    self.serveButton.myHeight = 45;
    [self.contentLayout addSubview:self.serveButton];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
