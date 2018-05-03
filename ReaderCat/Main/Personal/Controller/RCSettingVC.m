//
//  RCSettingVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCSettingVC.h"
#import "RCPersonalInfoCell.h"
#import "RCResetPasswordVC.h"
#import "RCSetPasswordQC.h"

@interface RCSettingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *dataArray;
@end
static NSString *CellIdentifier = @"Cell";
@implementation RCSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    [self showNavigationBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    self.dataArray = @[@"修改密码",@"设置密保"];
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
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RCPersonalInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leftLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self pushVC:[RCResetPasswordVC new]];
    } else if (indexPath.row == 1) {
        [self pushVC:[RCSetPasswordQC new]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
