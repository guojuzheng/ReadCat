//
//  RCBookBannerCell.h
//  ReaderCat
//
//  Created by guojz on 2018/3/28.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCBookBannerCell : UICollectionViewCell
@property (nonatomic, strong)UIImageView        *leftImageView;
@property (nonatomic, strong)UILabel            *chartsTitle;
@property (nonatomic, strong)UILabel            *chartsName;
@property (nonatomic, strong)UILabel            *chartTip;
@property (nonatomic, strong)UIView             *lineView;
@property (nonatomic, strong)UILabel            *classLabel;
@end
