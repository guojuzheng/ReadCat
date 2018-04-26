//
//  JCCalenderView.h
//  ReaderCat
//
//  Created by guojz on 2018/4/17.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
typedef void (^ReturnDateBlock) (NSString *dateValue);
@interface JCCalenderView : BaseView
@property (nonatomic, copy) ReturnDateBlock    returnDateBlock;
-(void)timeSelectedButtonAction;
@end
