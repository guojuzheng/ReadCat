//
//  RCSubscribeVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCSubscribeVC.h"
#import "RCSelectTimeView.h"
#import "RCRewardDetailCell.h"

@interface RCSubscribeVC ()
@property (nonatomic, strong) NSMutableArray        *dataArray;
@property (nonatomic, strong) UITableView           *tableList;
@property (nonatomic, strong) RCSelectTimeView      *selectTimeView;
@end

@implementation RCSubscribeVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)tableList{
    if(!_tableList){
        
        _tableList = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
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
    self.title = @"订阅明细";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self configRefresh];
}

- (void)configSubviews {
    self.selectTimeView = [RCSelectTimeView new];
    [self.view sd_addSubviews:@[self.selectTimeView]];
    self.selectTimeView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .heightIs(45);
    [self.tableList assembly:^(RCRewardDetailCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
    } withPlug:RCRewardDetailCell.class];
    
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
            //            JCInsuranceBillDetailVC *billDetailVC = [JCInsuranceBillDetailVC new];
            //            billDetailVC.orderId = x.orderId;
            //            [self pushVC:billDetailVC];
        }
    }];
    self.tableList.data = [NSArray arrayWithObjects:@"1", nil];
    [self.tableList reloadData];
    [self dealAction];
}

- (void)dealAction {
    WeakifySelf();
    self.selectTimeView.selectedTimeBlock = ^(NSString *seletedTime) {
        [weakSelf loadNewData];
    };
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
    [footer setTitle:@"注：每24小时统计一次订阅收入，实时更新请看订阅明细" forState:MJRefreshStateIdle];
    [footer setTitle:@"注：每24小时统计一次订阅收入，实时更新请看订阅明细" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"注：每24小时统计一次订阅收入，实时更新请看订阅明细" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.fnt(10);
    footer.stateLabel.color(@"#999999");
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
