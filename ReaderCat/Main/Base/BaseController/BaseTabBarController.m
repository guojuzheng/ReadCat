//
//  BaseTabBarController.m
//  APPFoundation
//
//  Created by guojz on 2018/2/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)presentVC:(UIViewController *)vc {
    BaseNavigationController *navc = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:navc animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
