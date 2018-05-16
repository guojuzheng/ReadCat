//
//  RCSearchBookVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/17.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCSearchBookVC.h"
#import "RCChargeCell.h"
#import "ReaderCat-Swift.h"
#import "RCRookInfoVC.h"

@interface RCSearchBookVC ()<UISearchBarDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *myBookshelfList;
@end

@implementation RCSearchBookVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)myBookshelfList{
    if(!_myBookshelfList){
        
        _myBookshelfList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _myBookshelfList.backgroundColor = DEFAULT_BG_COLOR;
        _myBookshelfList.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
//        _myBookshelfList.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
        UISearchBar * mSearchBar = [[UISearchBar alloc] init];
        mSearchBar.searchBarStyle =UISearchBarStyleDefault;
        mSearchBar.backgroundImage = [UIImage new];//去掉上下横线
        mSearchBar.barTintColor = DEFAULT_BG_COLOR;
        [mSearchBar sizeToFit];
        mSearchBar.delegate = self;
        mSearchBar.placeholder = @"搜索书名和作者>_<";
        UITextField * searchField = [mSearchBar valueForKey:@"_searchField"];
        [searchField setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        searchField.font = [UIFont systemFontOfSize:12];
        searchField.backgroundColor = WhiteColor;
        [mSearchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        _myBookshelfList.tableHeaderView = mSearchBar;
        AdjustsScrollViewInsetNever(self, _myBookshelfList);
        [self.view addSubview:_myBookshelfList];
    }
    return _myBookshelfList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showNavigationBar];
    [self hideNVBarShadow];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    [self configSubViews];
    [self addRefresh];
}

- (void)configSubViews {
    self.dataArray = [NSMutableArray arrayWithObjects:@"2",@"1",@"3",@"4", nil];
    [self.myBookshelfList assembly:^(RCChargeCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
    } withPlug:RCChargeCell.class];
    
    [self.myBookshelfList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 108;
    }];
    [[self.myBookshelfList setViewForHeaderInSection:^UIView *(UITableView *tableView, NSInteger section) {
        UILabel *sectionLabel = Label.fnt(15).color(@"#010101").str(@"      猜你喜欢");
        sectionLabel.backgroundColor = WhiteColor;
        return sectionLabel;
    }]setSectionHeaderHeight:40];
    [[[[self.myBookshelfList didSelectRowAtIndexPathSignal] reduceEach:^id (UITableView *tableView ,NSIndexPath *indexPath){
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
    self.myBookshelfList.data = [NSArray arrayWithObjects:@"西游记",@"水浒传",@"三国演义",@"红楼梦",@"围城", nil];
    [self.myBookshelfList reloadData];
}

- (void)addRefresh {
    WeakifySelf();
    self.myBookshelfList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
        [weakSelf.myBookshelfList.mj_header endRefreshing];
    }];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
        [weakSelf.myBookshelfList.mj_footer endRefreshing];
    }];
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载更多数据" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"暂无更多数据" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.fnt(10);
    footer.stateLabel.color(@"#999999");
    self.myBookshelfList.mj_footer = footer;
    [self.myBookshelfList.mj_header beginRefreshing];
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
