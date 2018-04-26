//
//  AppDelegate+UI.m
//  APPFoundation
//
//  Created by guojz on 2018/2/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "AppDelegate+UI.h"
#import "HomeTBVC.h"

@implementation AppDelegate (UI)
- (void)setMyWindowAndRootViewController {
    [self setItems];
    [self setViews];
}

- (void)setItems {
    [[UINavigationBar appearance]setBackgroundImage:[UIImage createImageWithColor:WhiteColor] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *dic = @{NSForegroundColorAttributeName:kMainFontColor};
    [[UINavigationBar appearance] setTitleTextAttributes:dic];
    [[UINavigationBar appearance]setTintColor:kMainFontColor];
    [[UIBarButtonItem appearance]setTitleTextAttributes:dic forState:UIControlStateNormal];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
}

- (void)setViews {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    HomeTBVC *homeTab = [[HomeTBVC alloc] init];
    self.window.rootViewController = homeTab;
    [self.window makeKeyAndVisible];
}
@end
