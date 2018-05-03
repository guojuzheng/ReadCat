//
//  HomeTBVC.m
//  APPFoundation
//
//  Created by guojz on 2018/2/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "HomeTBVC.h"
#import "BaseNavigationController.h"
#import "PersonalVC.h"
#import "RCBookshelfVC.h"
#import "RCChargeVC.h"
#import "HomeIndexVC.h"
#import "RCMyBookshelf.h"
#import "RCClassify.h"

@interface HomeTBVC ()

@end

@implementation HomeTBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
    self.navigationController.navigationBarHidden = YES;
//    self.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT - TabbarHeight, SCREEN_WIDTH, TabbarHeight);
    self.tabBar.tintColor = ThemeColor;
}

- (void)addChildViewControllers {
    NSString *tab_home_selected_imageName  = @"home";
    NSString *tab_home_nromal_imageName    = @"home-normal";
    NSString *tab_home_title               = @"首页";
    HomeIndexVC *homeVC = [[HomeIndexVC alloc] init];
    [self setChildViewController:homeVC Image:tab_home_nromal_imageName selectedImage:tab_home_selected_imageName title:tab_home_title];
    
    NSString *tab_bookshelf_selected_imageName  = @"bookshelf";
    NSString *tab_bookshelf_normal_imageName    = @"bookshelf-normal";
    NSString *tab_bookshelf_title               = @"书架";
    RCMyBookshelf *bookShelfVC = [[RCMyBookshelf alloc] init];
    [self setChildViewController:bookShelfVC Image:tab_bookshelf_normal_imageName selectedImage:tab_bookshelf_selected_imageName title:tab_bookshelf_title];
    
    NSString *tab_charge_selected_imageName  = @"charge";
    NSString *tab_charge_normal_imageName    = @"charge-normal";
    NSString *tab_charge_title               = @"书库";
    RCClassify *chargeVC = [[RCClassify alloc] init];
    [self setChildViewController:chargeVC Image:tab_charge_normal_imageName selectedImage:tab_charge_selected_imageName title:tab_charge_title];

    NSString *tab_mine_selected_imageName  = @"person";
    NSString *tab_mine_normal_imageName    = @"person-normal";
    NSString *tab_mine_title               = @"我的";
    PersonalVC *personamVC = [[PersonalVC alloc] init];
    [self setChildViewController:personamVC Image:tab_mine_normal_imageName selectedImage:tab_mine_selected_imageName title:tab_mine_title];
    
}

- (void)setChildViewController:(UIViewController *)vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    BaseNavigationController *NA_VC = [[BaseNavigationController alloc] initWithRootViewController:vc];
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.title = title;
    [self addChildViewController:NA_VC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
