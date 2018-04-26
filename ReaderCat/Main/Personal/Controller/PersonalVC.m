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

@interface PersonalVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *dataArray;
@property (nonatomic, strong) JCQMUIFillButton *loginOutBtn;
@end
static NSString *CellIdentifier = @"Cell";
@implementation PersonalVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideNVBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
}

- (void)configSubviews {
    self.dataArray = @[@"我的购买",@"消费记录",@"设置",@"成为作家",@"榜单",@"充值",@"个人资料",@"忘记密码",@"",@"打赏",@"打赏作者",@"填写评论",@"最新",@"打赏明细",@"订阅明细",@"账号登录",@"评论管理",@"作家资料",@"书库",@"搜索",@"作家账户",@"信息"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = DEFAULT_BG_COLOR;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
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
    if (indexPath.row == 8) {
        return 10;
    }
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.fnt(14);
    if (indexPath.row == 8) {
        cell.backgroundColor = DEFAULT_BG_COLOR;
    } else {
        cell.backgroundColor = WhiteColor;
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [RCPersonHeadView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 267;
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
    if (indexPath.row == 1) {
        [self pushVC:[RCConsumeNoteVC new]];
    } else if (indexPath.row == 3){
        [self pushVC:[RCAuthorInfoVC new]];
    } else if (indexPath.row == 4) {
        [self pushVC:[RCChartsVC new]];
    } else if (indexPath.row == 5) {
        [self pushVC:[RCPurchaseVC new]];
    } else if (indexPath.row == 6) {
        [self pushVC:[RCPersonalInfoVC new]];
    } else if (indexPath.row == 7) {
        [self pushVC:[RCForgetPassword new]];
    } else if (indexPath.row == 9) {
        [self pushVC:[RCRewardVC new]];
    } else if (indexPath.row == 10) {
        [self pushVC:[RCRewardAuthorVC new]];
    } else if (indexPath.row == 11) {
        [self pushVC:[RCCommentVC new]];
    } else if (indexPath.row == 12) {
        [self pushVC:[NewestViewController new]];
    } else if (indexPath.row == 13) {
        [self pushVC:[RCRewardDetailVC new]];
    } else if (indexPath.row == 14) {
        [self pushVC:[RCSubscribeVC new]];
    } else if (indexPath.row == 15) {
        [self pushVC:[LoginVC new]];
    } else if (indexPath.row == 16) {
        [self pushVC:[RCCommentManageVC new]];
    } else if (indexPath.row == 17) {
        [self pushVC:[RCAuthorInfoVC new]];
    } else if (indexPath.row == 18) {
        [self pushVC:[RCBookStoreVC new]];
    } else if (indexPath.row == 19) {
        [self pushVC:[RCSearchBookVC new]];
    } else if (indexPath.row == 20) {
        [self pushVC:[RCAuthorAccountVC new]];
    } else if (indexPath.row == 21) {
        [self pushVC:[RCRookInfoVC new]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
