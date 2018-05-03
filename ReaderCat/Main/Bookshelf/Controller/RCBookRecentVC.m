//
//  RCBookRecentVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookRecentVC.h"
#import "RCMyshelfCell.h"
#import "RCRookInfoVC.h"

@interface RCBookRecentVC ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView    *tableList;
@end

@implementation RCBookRecentVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)tableList{
    if(!_tableList){
        
        _tableList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _tableList.backgroundColor = DEFAULT_BG_COLOR;
        _tableList.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
        AdjustsScrollViewInsetNever(self, _tableList);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5)];
        view.backgroundColor = DEFAULT_BG_COLOR;
        _tableList.tableHeaderView = view;
        [self.view addSubview:_tableList];
    }
    return _tableList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadNewData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"最近阅读";
    [self showNavigationBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self configRefresh];
    
}

- (void)configSubviews {
    [self.tableList assembly:^(RCMyshelfCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
    } withPlug:RCMyshelfCell.class];
    
    [self.tableList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 111;
    }];
    [[[[self.tableList didSelectRowAtIndexPathSignal] reduceEach:^id (UITableView *tableView ,NSIndexPath *indexPath){
        if (self.dataArray.count != 0) {
            id objc = self.dataArray[indexPath.row];
            return objc;
        } else {
            return nil;
        }
        
    }] filter:^BOOL(id  _Nullable value) {
        return YES;
    }] subscribeNext:^(id x) {
        if (x != nil) {
            [self pushVC:[RCRookInfoVC new]];
        }
    }];
    self.dataArray = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
    self.tableList.data = self.dataArray;
    [self.tableList reloadData];
}
- (void)loadNewData {
    
}

- (void)configRefresh {
    
}

#pragma mark ================= 路由跳转 =================
+ (void)load{
    [super load];
    [[GMRouter shared]map:URL_SCHEMA_HISTORY toBlock:^id(NSDictionary *params) {
        RCBookRecentVC *vc = [RCBookRecentVC new];
        return vc;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
