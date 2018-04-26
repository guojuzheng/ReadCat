//
//  RCPurchaseVC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCPurchaseVC.h"
#import "RCPurchaseMyCountView.h"
#import "RCPurchaseMoneyView.h"
#import "RCPurchasewWayView.h"

@interface RCPurchaseVC ()
@property (nonatomic, strong) MyLinearLayout             *contentLayout;
@property (nonatomic, strong) RCPurchaseMyCountView      *myCountView;
@property (nonatomic, strong) RCPurchaseMoneyView        *purchaseMoneyView;
@property (nonatomic, strong) RCPurchasewWayView         *purchaseWayView;

@end

@implementation RCPurchaseVC
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
    self.title = @"充值";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    self.myCountView = [RCPurchaseMyCountView new];
    self.myCountView.myHorzMargin = 0;
    self.myCountView.myTop = 0;
    self.myCountView.myHeight = 51;
    [self.contentLayout addSubview:self.myCountView];
    
    self.purchaseMoneyView = [RCPurchaseMoneyView new];
    self.purchaseMoneyView.myHorzMargin = 0;
    self.purchaseMoneyView.myTop = 5;
    self.purchaseMoneyView.myHeight = 295;
    [self.contentLayout addSubview:self.purchaseMoneyView];
    
    self.purchaseWayView = [RCPurchasewWayView new];
    self.purchaseWayView.myHorzMargin = 0;
    self.purchaseWayView.myTop = 5;
    self.purchaseWayView.myHeight = 185;
    [self.contentLayout addSubview:self.purchaseWayView];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
