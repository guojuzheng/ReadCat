//
//  BaseTableViewController.m
//  APPFoundation
//
//  Created by guojz on 2018/3/1.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
- (UITableView *)tableView {
    if(!_tableView){
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = DEFAULT_BG_COLOR;
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        self.view = _tableView;
    }
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
