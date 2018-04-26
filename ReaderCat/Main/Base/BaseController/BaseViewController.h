//
//  BaseViewController.h
//  APPFoundation
//
//  Created by guojz on 2018/2/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic, strong) BaseViewController *normalBackVC;
@property (nonatomic, strong) BaseViewController *popToBackVC;
@property (nonatomic, strong) UIScrollView       *scrollView;
@property (nonatomic, strong) MyLinearLayout     *lineLayout;
@property (nonatomic, assign) UIStatusBarStyle   statusBarStyle;

/*
 Methods
 */
#pragma mark ================= 加载数据 =================
-(void)loadData;

#pragma mark ================= 监听键盘 =================
-(void)addKeyBoardObserver;
-(void)keyboardWillShow:(NSNotification *) notification;
-(void)keyboardWillHide:(NSNotification *) notification;

#pragma mark ================= 返回方法 =================
-(void)backClick;
-(void)dissmissVC;
-(void)backToRoot;
-(void)pushVC:(BaseViewController *)vc;
-(void)presentVC:(BaseViewController *)vc;

#pragma mark ================= 显示隐藏导航栏 =================
-(void)ShowNVBar;
-(void)hideNVBar;
-(void)hideNVBarShadow;

#pragma mark ================= 更改状态栏颜色 =================
- (void)statusBarBGC:(UIColor *)color andStatusTintStyle:(UIStatusBarStyle)style;

#pragma mark ================= 设置蓝色导航栏 =================
-(void)setBlueNavigationBar;
#pragma mark ================= 设置右侧NVBar =================
-(void)setRightNVBarTitle:(NSString *)title;
-(void)setRightNVBarImage:(NSString *)image;
-(void)rightNVBarClick;
@end
