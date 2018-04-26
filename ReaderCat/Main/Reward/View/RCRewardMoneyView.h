//
//  RCRewardMoneyView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/30.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
@class RCRewardMoneyCell;
@interface RCRewardMoneyView : BaseView
@property (nonatomic, strong)UILabel          *viewTitle;
@property (nonatomic, strong)UICollectionView *moneyCollectionView;
@end

@interface RCRewardMoneyCell : UICollectionViewCell
@property (nonatomic, strong)UILabel          *cellTextLabel;
@end
