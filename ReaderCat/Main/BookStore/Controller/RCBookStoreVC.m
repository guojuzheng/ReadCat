//
//  RCBookStoreVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/11.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCBookStoreVC.h"
#import "RCBookStoreSearchView.h"
#import "RCChargeCell.h"

@interface RCBookStoreVC ()<RCBookStoreSearchDelegate>
@property (nonatomic, strong) RCBookStoreSearchView *searchView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *myBookshelfList;
@end

@implementation RCBookStoreVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)myBookshelfList{
    if(!_myBookshelfList){
        
        _myBookshelfList = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _myBookshelfList.backgroundColor = DEFAULT_BG_COLOR;
        _myBookshelfList.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
        _myBookshelfList.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
        AdjustsScrollViewInsetNever(self, _myBookshelfList);
        [self.view addSubview:_myBookshelfList];
    }
    return _myBookshelfList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"书库";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
    
}

- (void)configSubviews {

    
    [self.myBookshelfList assembly:^(RCChargeCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
    } withPlug:RCChargeCell.class];
    
    [self.myBookshelfList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 108;
    }];
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
            //            JCInsuranceBillDetailVC *billDetailVC = [JCInsuranceBillDetailVC new];
            //            billDetailVC.orderId = x.orderId;
            //            [self pushVC:billDetailVC];
        }
    }];
    self.myBookshelfList.data = [NSArray arrayWithObjects:@"西游记",@"水浒传",@"三国演义",@"红楼梦",@"围城", nil];
    [self.myBookshelfList reloadData];
    
    self.searchView = [RCBookStoreSearchView new];
    self.searchView.searchDelegate = self;
    [self.view sd_addSubviews:@[self.searchView]];
    self.searchView.sd_layout
    .leftEqualToView(self.view)
    .topEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(41);
    self.searchView.colView.hidden = YES;
    self.searchView.colView.buttonView.rightButton.onClick(^{
        self.searchView.sd_layout.heightIs(41);
        self.searchView.colView.hidden = YES;
    });
}

- (void)bookStoreSearchClick {
    self.searchView.sd_layout.heightIs(SCREEN_HEIGHT);
    self.searchView.colView.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
