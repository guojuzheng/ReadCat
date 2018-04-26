//
//  RCRewardVC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRewardVC.h"
#import "RCRewardInfoView.h"
#import "RCRewardCountView.h"
#import "RCRewardMoneyView.h"
#import "RCLeftAndRightButtonView.h"

@interface RCRewardVC ()
@property (nonatomic, strong) MyLinearLayout     *contentLayout;
@property (nonatomic, strong) RCRewardInfoView   *rewardInfoView;
@property (nonatomic, strong) RCRewardCountView  *accountView;
@property (nonatomic, strong) RCRewardMoneyView  *moneyView;
@property (nonatomic, strong) RCLeftAndRightButtonView *bottomBtnView;
@end

@implementation RCRewardVC
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
    self.title = @"打赏";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    self.rewardInfoView = [RCRewardInfoView new];
    self.rewardInfoView.myHorzMargin = 0;
    self.rewardInfoView.myTop = 0;
    self.rewardInfoView.myHeight = 108;
    [self.contentLayout addSubview:self.rewardInfoView];
    
    self.accountView = [RCRewardCountView new];
    [self.accountView.rightButton setTitle:@"充值" forState:UIControlStateNormal];
    self.accountView.myHorzMargin = 0;
    self.accountView.myTop = 1;
    self.accountView.myHeight = 51;
    [self.contentLayout addSubview:self.accountView];
    
    self.moneyView = [RCRewardMoneyView new];
    self.moneyView.myHorzMargin = 0;
    self.moneyView.myTop = 1;
    self.moneyView.myHeight = 220;
    [self.contentLayout addSubview:self.moneyView];
    
    self.bottomBtnView = [RCLeftAndRightButtonView new];
    self.bottomBtnView.myHorzMargin = 0;
    self.bottomBtnView.myTop = 1;
    self.bottomBtnView.myHeight = 45;
    [self.contentLayout addSubview:self.bottomBtnView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
