//
//  RCMyBookshelf.m
//  ReaderCat
//
//  Created by guojz on 2018/3/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCMyBookshelf.h"
#import "RCSegmentView.h"
#import "RCMyshelfCell.h"

@interface RCMyBookshelf ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView    *myBookshelfList;
@property (nonatomic, strong) RCSegmentView  *segmentView;
@end

@implementation RCMyBookshelf

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
        AdjustsScrollViewInsetNever(self, _myBookshelfList);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5)];
        view.backgroundColor = DEFAULT_BG_COLOR;
        _myBookshelfList.tableHeaderView = view;
        [self.view addSubview:_myBookshelfList];
    }
    return _myBookshelfList;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadNewData];
}
- (void)viewDidLoad {
    self.navigationItem.title = @"我的书架";
    [super viewDidLoad];
    [self ShowNVBar];
    [self setNavBar];
    [self configSubviews];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)setNavBar {
    [self setRightNVBarTitle:@"编辑"];
}
- (void)configSubviews {
    self.segmentView  = [RCSegmentView new];
    [self.segmentView setSegmentTitle:@[@"我的书架",@"最近阅读"]];
    self.segmentView.segmentBlock = ^(NSInteger selectedIndex) {
        if (selectedIndex == 0) {
            
        } else if (selectedIndex == 1) {
            
        }
    };
    [self.view sd_addSubviews:@[self.segmentView]];
    self.segmentView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .heightIs(41);
    
    [self.myBookshelfList assembly:^(RCMyshelfCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.bookName.text = model;
    } withPlug:RCMyshelfCell.class];
    
    [self.myBookshelfList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 111;
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
    self.myBookshelfList.data = [NSArray arrayWithObjects:@"1", nil];
    [self.myBookshelfList reloadData];
}
- (void)loadNewData {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
