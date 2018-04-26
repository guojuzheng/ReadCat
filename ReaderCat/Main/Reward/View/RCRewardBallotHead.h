//
//  RCRewardBallotHead.h
//  ReaderCat
//
//  Created by guojz on 2018/4/24.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
#import "RCRewardInfoView.h"
@class RCCollectionCell;
@interface RCRewardBallotHead : BaseView
@property (nonatomic, strong)RCRewardInfoView        *rewardInfoView;
@property (nonatomic, strong)UICollectionView        *collectionView;
@property (nonatomic, strong)UILabel                 *numberLabel;
@property (nonatomic, strong)UILabel                 *tipView;
@property (nonatomic, strong)UIView                  *lineA;
@property (nonatomic, strong)UIView                  *lineB;
@property (nonatomic, strong)UIView                  *lineC;
@property (nonatomic, strong)NSIndexPath             *selectedIndex;
@end

@interface RCCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UILabel    *cellLabel;
@property (nonatomic, strong) NSString   *contentText;
@end
