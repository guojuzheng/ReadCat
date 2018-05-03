//
//  RCRookInfoVC.m
//  ReaderCat
//
//  Created by guojz on 2018/4/23.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "RCRookInfoVC.h"
#import "RCBookInfoTableHeader.h"
#import "RCBookInfoCell.h"
#import "RCBookIntroduceCell.h"
#import "RCBookRewordCell.h"
#import "RCBookInfoItemCell.h"
#import "RCBookMenuCell.h"
#import "RCBookCommentCell.h"
#import "RCBookBottomMenu.h"
#import "ReaderCat-Swift.h"
#import "RCRewardAuthorVC.h"
#import "RCCommentVC.h"

@interface RCRookInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView                  *bookInfoTable;
@property (nonatomic, strong) NSMutableArray               *dataArray;
@property (nonatomic, strong) RCBookInfoTableHeader        *tableHeader;
@property (nonatomic, assign) NSInteger                    flag;
@property (nonatomic, strong) RCBookBottomMenu             *bottomMenu;
@end

@implementation RCRookInfoVC

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)bookInfoTable {
    if(!_bookInfoTable){
        
        _bookInfoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-NavigationBarHeight-58) style:UITableViewStyleGrouped];
        _bookInfoTable.backgroundColor = DEFAULT_BG_COLOR;
        _bookInfoTable.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _bookInfoTable.delegate = self;
        _bookInfoTable.dataSource = self;
        //适配iOS11 中table的底部
        AdjustsScrollViewInsetNever(self, _bookInfoTable);
        self.tableHeader = [RCBookInfoTableHeader new];
        WeakifySelf();
        self.tableHeader.buttonClickBlock = ^(NSInteger flag) {
            [weakSelf doNextWithFlag:flag];
        };
        self.tableHeader.frame = CGRectMake(0, 0, SCREEN_WIDTH, 148);
        _bookInfoTable.tableHeaderView = self.tableHeader;
        [self.view addSubview:_bookInfoTable];
    }
    return _bookInfoTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"信息";
    self.flag = 0;
    [self showNavigationBar];
    [self hideNVBarShadow];
    [self configSubviews];
}

- (void)configSubviews {
    [self registCell];
    self.bottomMenu = [RCBookBottomMenu new];
    [self.view sd_addSubviews:@[self.bottomMenu]];
    self.bottomMenu.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(58);
    [self dealAction];
}

- (void)registCell {
    [self.bookInfoTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.bookInfoTable registerClass:[RCBookInfoCell class] forCellReuseIdentifier:@"RCBookInfoCell"];
    [self.bookInfoTable registerClass:[RCBookIntroduceCell class] forCellReuseIdentifier:@"RCBookIntroduceCell"];
    [self.bookInfoTable registerClass:[RCBookInfoItemCell class] forCellReuseIdentifier:@"RCBookInfoItemCell"];
    [self.bookInfoTable registerClass:[RCBookRewordCell class] forCellReuseIdentifier:@"RCBookRewordCell"];
    [self.bookInfoTable registerClass:[RCBookMenuCell class] forCellReuseIdentifier:@"RCBookMenuCell"];
    [self.bookInfoTable registerClass:[RCBookCommentCell class] forCellReuseIdentifier:@"RCBookCommentCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.flag == 0) {
        return 8;
    } else if (self.flag == 1) {
        return 7;
    } else if (self.flag == 2) {
        return 4;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.flag == 0) {
        if (indexPath.row == 0) {
            RCBookInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookInfoCell"];
            return cell;
        } else if (indexPath.row == 1) {
            RCBookIntroduceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookIntroduceCell"];
            return cell;
        } else if (indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5){
            RCBookInfoItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookInfoItemCell"];
            cell.leftLabel.text = @"上次读到:";
            cell.rightLabel.text = @"没有您的记录哦";
            return cell;
        } else if (indexPath.row == 7) {
            RCBookRewordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookRewordCell"];
            return cell;
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            cell.backgroundColor = DEFAULT_BG_COLOR;
            return cell;
        }
    } else if (self.flag == 1) {
        if (indexPath.row == 0 || indexPath.row == 1) {
            RCBookInfoItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookInfoItemCell"];
            cell.leftLabel.text = @"上次读到:";
            cell.rightLabel.text = @"没有您的记录哦";
            return cell;
        } else if (indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6) {
            RCBookMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookMenuCell"];
            cell.leftLabel.text = @"35.她有一双隐形的翅膀";
            return cell;
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            cell.backgroundColor = DEFAULT_BG_COLOR;
            return cell;
        }
    } else if (self.flag == 2) {
        if (indexPath.row == 0) {
            RCBookMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookMenuCell"];
            cell.leftLabel.fnt(14);
            cell.leftLabel.str(@"打赏区");
            cell.vipImage.img(@"person_cell_more");
            return cell;
        }  else if (indexPath.row == 2 || indexPath.row == 3) {
            RCBookCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCBookCommentCell"];
            cell.nameLabel.text = @"耳朵陈";
            cell.textView.text = @"谁终将声震人间 必长久深自缄默 谁终将点燃闪电 必长久如云漂泊 爱若执炬迎风，炽烈而哀痛就如同现在的我，当我感受着生活赐予我的微甜，我更知道，原来，这就是努力之于我们生命的意义.愿你和你的梦想相安无事，在无法预测的未来里";
            cell.commontBtn.onClick(^{
                [self pushVC:[RCCommentVC new]];
            });
            return cell;
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            cell.backgroundColor = DEFAULT_BG_COLOR;
            return cell;
        }
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.flag == 0) {
        if (indexPath.row == 0) {
            return 56;
        } else if (indexPath.row == 1) {
            return 91;
        } else if (indexPath.row == 2 || indexPath.row == 6) {
            return 10;
        } else if (indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5) {
            return 41;
        } else if (indexPath.row == 7) {
            return 79;
        }
    } else if (self.flag == 1) {
        if (indexPath.row == 2) {
            return 10;
        } else {
            return 41;
        }
    } else if (self.flag == 2) {
        if (indexPath.row == 0) {
            return 45;
        } else if (indexPath.row == 1) {
            return 10;
        } else if (indexPath.row == 2 || indexPath.row == 3) {
            return 90;
        }
    }
    return 0;
}

- (void)doNextWithFlag:(NSInteger)flag {
    self.flag = flag;
    [self.bookInfoTable reloadData];
}

- (void)dealAction {
    self.bottomMenu.rewardBtn.onClick(^{
        [self pushVC:[RCRewardAuthorVC new]];
    });
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"求魔" withExtension:@"txt"];
    self.bottomMenu.readNowBtn.onClick(^{
        [DZMReadParser ParserLocalURLWithUrl:fileURL complete:^(DZMReadModel * _Nonnull readModel) {
            DZMReadController *readController = [DZMReadController new];
            readController.readModel = readModel;
            [self.navigationController pushViewController:readController animated:YES];
        }];
    });
    self.bottomMenu.joinBookshelf.onClick(^{});
}

#pragma mark ================= 路由跳转 =================
+ (void)load{
    [super load];
    [[GMRouter shared]map:URL_SCHEMA_BOOKINFO toBlock:^id(NSDictionary *params) {
        RCRookInfoVC *vc = [RCRookInfoVC new];
        return vc;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
