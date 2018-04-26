//
//  RCSelectTimeView.h
//  ReaderCat
//
//  Created by guojz on 2018/4/2.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
typedef void (^ selectTimeBlock) (NSString *seletedTime);
@interface RCSelectTimeView : BaseView
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UILabel  *centerLabel;
@property (nonatomic, copy) selectTimeBlock    selectedTimeBlock;
@end
