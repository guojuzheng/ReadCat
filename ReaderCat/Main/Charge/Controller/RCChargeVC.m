//
//  RCChargeVC.m
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCChargeVC.h"
#import "RCChargeHeadView.h"
#import "RCChargeCell.h"

@interface RCChargeVC ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *myBookshelfList;
@property (nonatomic, strong) RCChargeHeadView *headView;
@end

@implementation RCChargeVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideNVBar];
    [self loadNewData];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)myBookshelfList{
    if(!_myBookshelfList){
        
        _myBookshelfList = [[UITableView alloc] initWithFrame:CGRectMake(0, StatusBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight) style:UITableViewStyleGrouped];
        _myBookshelfList.backgroundColor = DEFAULT_BG_COLOR;
        _myBookshelfList.separatorStyle  = UITableViewCellSeparatorStyleNone;
        //适配iOS11 中table的底部
        AdjustsScrollViewInsetNever(self, _myBookshelfList);
        RCChargeHeadView *headView =[RCChargeHeadView new];
        headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 324);
        _myBookshelfList.tableHeaderView = headView;
        
        [self.view addSubview:_myBookshelfList];
    }
    return _myBookshelfList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [[self.myBookshelfList setViewForHeaderInSection:^UIView *(UITableView *tableView, NSInteger section){
        UILabel *sectionTitle = Label.fnt(15).color(@"#010101").str(@"    精品推荐");
        sectionTitle.backgroundColor = WhiteColor;
        return sectionTitle;
    }] setSectionHeaderHeight:40];
    
    self.myBookshelfList.data = [NSArray arrayWithObjects:@"西游记",@"水浒传",@"三国演义",@"红楼梦",@"围城", nil];
    [self.myBookshelfList reloadData];
}
- (void)loadNewData {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
