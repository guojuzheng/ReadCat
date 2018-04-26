//
//  RCSiftView.h
//  ReaderCat
//
//  Created by guojz on 2018/4/11.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"


@protocol DropdownButtonDelegate <NSObject>

- (void)showDropdownMenu:(NSInteger)index;
- (void)hideDropdownMenu;
@end
@interface RCSiftView : BaseView

@end
