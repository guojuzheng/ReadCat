//
//  SettingVC.m
//  APPFoundation
//
//  Created by guojz on 2018/3/1.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "SettingVC.h"

@interface SettingVC ()

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"功能设置";
    [self ShowNVBar];
    [self configSubviews];

}

- (void)configSubviews {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView assembly:^(UITableViewCell  *cell, NSString *model, NSIndexPath *indexPath) {
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        cell.textLabel.text = model;
    } withPlug:UITableViewCell.class];
    
    [self.tableView setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 49;
    }];
    
   
    
    [[[[self.tableView didSelectRowAtIndexPathSignal] reduceEach:^id (UITableView *tableView ,NSIndexPath *indexPath){
        return self.tableView.data[indexPath.row];
    }] filter:^BOOL(id  _Nullable value) {
        return YES;
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"--%@++",x);
    }];
    
    self.tableView.data = @[@"个人资料", @"帮助和反馈"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
