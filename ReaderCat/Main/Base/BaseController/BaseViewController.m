//
//  BaseViewController.m
//  APPFoundation
//
//  Created by guojz on 2018/2/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
- (MyLinearLayout *)lineLayout {
    if(!_lineLayout){
        _lineLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
        _lineLayout.padding = UIEdgeInsetsMake(0, 0, 0, 0);    //设置布局内的子视图离自己的边距.
        _lineLayout.myHorzMargin = 0;                          //同时指定左右边距为0表示宽度和父视图一样宽
        _lineLayout.heightSize.lBound(self.scrollView.heightSize, 10, 1); //高度虽然是wrapContentHeight的。但是最小的高度不能低于父视图的高度加10.
        [self.scrollView addSubview:_lineLayout];
    }
    return _lineLayout;
}

-(UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView = [UIScrollView new];
        _scrollView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        _scrollView.contentSize = CGSizeMake(self.view.width, self.view.height-StatusBarHeight+5);
        _scrollView.backgroundColor = DEFAULT_BG_COLOR;
        _scrollView.showsVerticalScrollIndicator   = FALSE;
        _scrollView.showsHorizontalScrollIndicator = FALSE;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setBlueStatusBar];
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultConfig];
}

#pragma mark ================= 更改状态栏颜色 =================
- (void)setBlueStatusBar{
    [self statusBarBGC:ThemeColor andStatusTintStyle:UIStatusBarStyleLightContent];
}

- (void)statusBarBGC:(UIColor *)color andStatusTintStyle:(UIStatusBarStyle)style{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
    _statusBarStyle = style;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return _statusBarStyle;
}

-(void)defaultConfig{
    
    _statusBarStyle = UIStatusBarStyleDefault;
    self.view.backgroundColor = DEFAULT_BG_COLOR;
    [self setBlueStatusBar];
    [self setBlueNavigationBar];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    
    //[[IQKeyboardManager sharedManager] setEnable:NO];不使用IQKeyBoard
    //[IQKeyboardManager sharedManager].enableAutoToolbar = NO;不自动出现toolBar
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;//点击背景View收回键盘
}

#pragma mark ================= 监听键盘弹出收回 =================
- (void)addKeyBoardObserver{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];//键盘完全显示
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];//键盘完全隐藏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputModeDidChange:) name:UITextInputCurrentInputModeDidChangeNotification object:nil];
    //    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgViewClick)]];//输入法切换
}
- (void)bgViewClick{
    [self.view endEditing:YES];
    //    [self.scrollView endEditing:YES];
}
- (void)keyboardWillShow:(NSNotification *) notification{}
- (void)keyboardWillHide:(NSNotification *) notification{}
- (void)inputModeDidChange:(NSNotification *) notification{}

#pragma mark ================= 返回处理 =================
-(void)backClick{
    
    if(_popToBackVC){
        [self.navigationController popToViewController:_popToBackVC animated:YES];
    }else if(_normalBackVC){
        [self.navigationController popToViewController:_normalBackVC animated:YES];
    }else{
//        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)backToRoot{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark ================= 跳转新页面 =================
-(void)pushVC:(BaseViewController *)vc{
    if(_popToBackVC){
        vc.popToBackVC = _popToBackVC;
    }else{
        vc.normalBackVC = self;
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)presentVC:(BaseViewController *)vc{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nav animated:YES completion:^{}];
}

-(void)dissmissVC{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark ================= 显示隐藏导航栏 =================
-(void)hideNVBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)ShowNVBar{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)hideNVBarShadow{
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

#pragma mark ================= 设置蓝色导航栏 =================
-(void)setBlueNavigationBar{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage qmui_imageWithColor:ThemeColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self setBackButtonItemWhite];
}

- (void)setBackButtonItemWhite{
    
    UIButton *leftBtn = Button.xywh(15, 0, 20, 34);
    UIImageView *backImage = ImageView.img(@"white_back_image").xywh(5, 0, 12, 34);
    backImage.contentMode = UIViewContentModeCenter;
    [leftBtn addSubview:backImage];
    [leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

#pragma mark ================= 设置右侧NVBar =================
-(void)setRightNVBarTitle:(NSString *)title{
    UIButton *button = Button.wh(20, 20).fnt(14).str(title).color(WhiteColor).fitSize;
    [button addTarget:self action:@selector(rightNVBarClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

-(void)setRightNVBarImage:(NSString *)image{
    UIButton *button = Button.fnt(14).wh(20, 20).fnt(14).img(image);
    [button addTarget:self action:@selector(rightNVBarClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

-(void)rightNVBarClick{}

-(void)loadData{};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideNavigationBar {
    self.navigationController.navigationBar.hidden = YES;
}

- (void)showNavigationBar {
    self.navigationController.navigationBar.hidden = NO;
}
@end
