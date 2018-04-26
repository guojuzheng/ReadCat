//
//  RCPersonalInfoVC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCPersonalInfoVC.h"
#import "JCQMUIFillButton.h"
#import "RCPersonalInfoCell.h"
#import "RCResetPasswordVC.h"
#import "RCSetPasswordQC.h"

@interface RCPersonalInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *dataArray;
@property (nonatomic, strong) JCQMUIFillButton *loginOutBtn;
@end
static NSString *CellIdentifier = @"Cell";
@implementation RCPersonalInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人资料";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
}
- (void)configSubviews {
    self.dataArray = @[@"头像",@"昵称",@"",@"性别",@"生日",@"居住地",@"电话",@"QQ",@"",@"修改密码",@"设置密保",@""];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = DEFAULT_BG_COLOR;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.001)];
    [self.tableView registerClass:[RCPersonalInfoCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2 || indexPath.row ==  8|| indexPath.row == 11) {
        return 10;
    }
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RCPersonalInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.textLabel.text = self.dataArray[indexPath.row];
//    cell.textLabel.fnt(14);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leftLabel.text = self.dataArray[indexPath.row];
    if (indexPath.row == 2 || indexPath.row == 8 || indexPath.row == 11) {
        cell.backgroundColor = DEFAULT_BG_COLOR;
    }
    return cell;
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
    if (indexPath.row == 9) {
        [self pushVC:[RCResetPasswordVC new]];
    } else if (indexPath.row == 10) {
        [self pushVC:[RCSetPasswordQC new]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
