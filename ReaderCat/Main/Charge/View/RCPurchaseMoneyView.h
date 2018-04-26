//
//  RCPurchaseMoneyView.h
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
@class RCPurchaseMoneyCell;
@interface RCPurchaseMoneyView : BaseView
@property (nonatomic, strong)UILabel          *viewTitle;
@property (nonatomic, strong)UILabel          *rightTitle;
@property (nonatomic, strong)UICollectionView *moneyCollectionView;
@property (nonatomic, strong)UITextView       *tipView;
@end

@interface RCPurchaseMoneyCell : UICollectionViewCell
@property (nonatomic, strong)UILabel         *topLabel;
@property (nonatomic, strong)UILabel         *bottomLabel;
@end
