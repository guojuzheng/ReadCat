//
//  RCShowLoginManager.m
//  ReaderCat
//
//  Created by guojz on 2018/4/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCShowLoginManager.h"
#import "LoginVC.h"
#import "BaseNavigationController.h"

@implementation RCShowLoginManager
+ (void)showLoginVcFrom:(UIViewController *)viewController
{
    LoginVC *loginVC = [[LoginVC alloc]init];
    BaseNavigationController *loginNav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
    [viewController presentViewController:loginNav animated:YES completion:nil];
}

+ (void)showLoginVcFromView:(UIView *)view
{
    [self showLoginVcFrom:[view getViewController]];
}
@end
