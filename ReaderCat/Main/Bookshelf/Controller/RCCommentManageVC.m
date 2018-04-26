//
//  BaseTabBarController.m
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCCommentManageVC.h"
#import "RCCommentManageCell.h"

@interface RCCommentManageVC ()
@property (nonatomic, strong) NSMutableArray        *dataArray;
@property (nonatomic, strong) UITableView           *tableList;
@end

@implementation RCCommentManageVC

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"评论管理";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self configRefresh];
}

- (void)configSubviews {
    [self.tableList assembly:^(RCCommentManageCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
    } withPlug:RCCommentManageCell.class];
    
    [self.tableList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 160;
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
            //            JCInsuranceBillDetailVC *billDetailVC = [JCInsuranceBillDetailVC new];
            //            billDetailVC.orderId = x.orderId;
            //            [self pushVC:billDetailVC];
        }
    }];
    self.tableList.data = [NSArray arrayWithObjects:@"启示录",@"哈利波特与死亡圣器", nil];
    [self.tableList reloadData];
}

- (void)configRefresh {
    WeakifySelf();
    self.tableList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
        [weakSelf.tableList.mj_header endRefreshing];
    }];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
        [weakSelf.tableList.mj_footer endRefreshing];
    }];
    [footer setTitle:@"已加载完成" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载更多..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"已经显示完了" forState:MJRefreshStateNoMoreData];
    self.tableList.mj_footer = footer;
    [self.tableList.mj_header beginRefreshing];
}

- (void)loadNewData {
    
}

- (void)loadMoreData {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
