//
//  PersonalVC.m
//  APPFoundation
//
//  Created by guojz on 2018/2/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "PersonalVC.h"
#import "SettingVC.h"
#import "RCPersonHeadView.h"
#import "JCQMUIFillButton.h"
#import "RCMyBookshelf.h"
#import "RCChartsVC.h"
#import "RCPurchaseVC.h"
#import "RCPersonalInfoVC.h"
#import "RCForgetPassword.h"
#import "RCRewardVC.h"
#import "RCRewardAuthorVC.h"
#import "RCCommentVC.h"
#import "RCConsumeNoteVC.h"
#import "NewestViewController.h"
#import "RCRewardDetailVC.h"
#import "RCSubscribeVC.h"
#import "LoginVC.h"
#import "RCCommentManageVC.h"
#import "RCAuthorInfoVC.h"
#import "RCBookStoreVC.h"
#import "RCSearchBookVC.h"
#import "RCAuthorAccountVC.h"
#import "RCRookInfoVC.h"
#import "RCBookRecentVC.h"
#import "RCSettingVC.h"
#import "RCPurchaseVC.h"

@interface PersonalVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *dataArray;
@property (nonatomic, strong) JCQMUIFillButton *loginOutBtn;
@end
static NSString *CellIdentifier = @"Cell";
@implementation PersonalVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
}

- (void)configSubviews {
    self.dataArray = @[@"最近阅读",@"充值记录",@"消费记录",@"设置",@"",@"账号登录"];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = DEFAULT_BG_COLOR;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.001)];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        return 10;
    }
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.fnt(14);
    if (indexPath.row == 4) {
        cell.backgroundColor = DEFAULT_BG_COLOR;
    } else {
        cell.backgroundColor = WhiteColor;
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    RCPersonHeadView *headView = [RCPersonHeadView new];
    headView.editMessageBtn.onClick(^{
        [self pushVC:[RCPersonalInfoVC new]];
    });
    headView.countView.rightButton.onClick(^{
        QMUITips *tips = [QMUITips showLoading:@"加载中..." inView:self.view];
        QMUIToastBackgroundView *backgroundView = (QMUIToastBackgroundView *)tips.backgroundView;
        backgroundView.shouldBlurBackgroundView = YES;
        backgroundView.styleColor = UIColorMakeWithRGBA(232, 232, 232, 0.8);
        tips.tintColor = UIColorBlack;
        [self pushVC:[RCPurchaseVC new]];
        [tips hideAnimated:YES];
    });
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 270;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    _loginOutBtn = [JCQMUIFillButton QMUIFillButtonBlueWithTitle:@"退出登录"];
    _loginOutBtn.cornerRadius = 0;
    return _loginOutBtn;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 45;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self pushVC:[RCBookRecentVC new]];
    } else if (indexPath.row == 2) {
        [self pushVC:[RCConsumeNoteVC new]];
    } else if (indexPath.row == 3) {
        [self pushVC:[RCSettingVC new]];
    } else if (indexPath.row == 5) {
//        [self pushVC:[LoginVC new]];
        [RCShowLoginManager showLoginVcFrom:self];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
