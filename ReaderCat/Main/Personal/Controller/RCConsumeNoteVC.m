//
//  RCConsumeNoteVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCConsumeNoteVC.h"
#import "RCSegmentView.h"
#import "RCChargeCell.h"
#import "RCRewardDetailVC.h"
#import "RCSubscribeVC.h"

@interface RCConsumeNoteVC ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView    *noteList;
@property (nonatomic, strong) RCSegmentView  *segmentView;
@property (nonatomic, assign) NSInteger      flag;

@end

@implementation RCConsumeNoteVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)noteList{
    if(!_noteList){
        
        _noteList = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _noteList.backgroundColor = DEFAULT_BG_COLOR;
        _noteList.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
        AdjustsScrollViewInsetNever(self, _noteList);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5)];
        view.backgroundColor = DEFAULT_BG_COLOR;
        _noteList.tableHeaderView = view;
        [self.view addSubview:_noteList];
    }
    return _noteList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadNewData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消费记录";
    [self showNavigationBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self configRefresh];
}

- (void)configSubviews {
    self.flag = 0;
    self.dataArray = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
    self.segmentView  = [RCSegmentView new];
    [self.segmentView setSegmentTitle:@[@"打赏记录",@"订阅记录"]];
    WeakifySelf();
    self.segmentView.segmentBlock = ^(NSInteger selectedIndex) {
        weakSelf.flag = selectedIndex;
        if (selectedIndex == 0) {
            weakSelf.dataArray = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
        } else if (selectedIndex == 1) {
            weakSelf.dataArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
        }
        weakSelf.noteList.data = weakSelf.dataArray;
        [weakSelf.noteList reloadData];
    };
    [self.view sd_addSubviews:@[self.segmentView]];
    self.segmentView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .heightIs(41);
    [self.noteList assembly:^(RCChargeCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
    } withPlug:RCChargeCell.class];
    
    [self.noteList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 111;
    }];
    [[[[self.noteList didSelectRowAtIndexPathSignal] reduceEach:^id (UITableView *tableView ,NSIndexPath *indexPath){
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
            if (self.flag == 0) {
                [self pushVC:[RCRewardDetailVC new]];
            } else if (self.flag == 1) {
                [self pushVC:[RCSubscribeVC new]];
            }
        }
    }];
    self.noteList.data = [NSArray arrayWithObjects:@"1",@"2", nil];
    [self.noteList reloadData];
}

- (void)configRefresh {
    WeakifySelf();
    self.noteList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
        [weakSelf.noteList.mj_header endRefreshing];
    }];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
        [weakSelf.noteList.mj_footer endRefreshing];
    }];
    [footer setTitle:@"已加载完成" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载更多..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"已经显示完了" forState:MJRefreshStateNoMoreData];
    self.noteList.mj_footer = footer;
    [self.noteList.mj_header beginRefreshing];
}
- (void)loadNewData {
    self.noteList.data = [NSArray arrayWithObjects:@"1",@"2", nil];
    [self.noteList reloadData];
}
- (void)loadMoreData {
    self.noteList.data = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    [self.noteList reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
