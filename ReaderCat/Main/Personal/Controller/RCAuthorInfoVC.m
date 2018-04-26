//
//  RCAuthorInfoVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/3.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCAuthorInfoVC.h"
#import "RCPersonalInfoCell.h"

@interface RCAuthorInfoVC ()
@property (nonatomic, strong) NSMutableArray        *dataArray;
@property (nonatomic, strong) UITableView           *tableList;
@end

@implementation RCAuthorInfoVC

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
    self.title = @"作家资料";
    [self ShowNVBar];
    [self hideNVBarShadow];
    [self configSubviews];
    [self configData];
}

- (void)configSubviews {
    [self.tableList assembly:^(RCPersonalInfoCell *cell, NSString *model, NSIndexPath *indexPath) {
        cell.rightLabel.textAlignment = NSTextAlignmentLeft;
        cell.leftLabel.text = model;
        cell.leftLabel.textColor = Color(@"#393a3f");
        cell.rightLabel.textColor = Color(@"#393a3f");
        if (indexPath.row !=2 || indexPath.row != 8) {
            cell.rightLabel.text = @"150425197311043897";
        }
        if (indexPath.row == 2 || indexPath.row == 8) {
            cell.backgroundColor = [UIColor clearColor];
            [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }
        if (indexPath.row == 0) {
            cell.rightLabel.textColor = Color(@"#969696");
            cell.rightMoreImageView.img(@"");
        } else {
            cell.rightMoreImageView.img(@"person_cell_more");
        }
     
    } withPlug:RCPersonalInfoCell.class];
    
    [self.tableList setHeightForRowAtIndexPath:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.row == 2 || indexPath.row == 8) {
            return 10;
        }
        return 45;
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
    
    self.tableList.data = [NSArray arrayWithObjects:@"笔名",@"性别",@"",@"现居地",@"QQ",@"手机号码",@"邮箱",@"身份证",@"",@"开户行",@"银行卡", nil];
    [self.tableList reloadData];
}

- (void)configData {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
