//
//  RCBookStoreSearchView.h
//  ReaderCat
//
//  Created by guojz on 2018/4/16.
//  Copyright © 2018年 admin_gjz. All rights reserved.
//

#import "BaseView.h"
#import "RCLeftAndRightButtonView.h"
@class RCBookStoreSearchCollectionView;
@class RCBookStoreSearchViewCell;
@protocol RCBookStoreSearchDelegate <NSObject>
- (void)bookStoreSearchClick;
@end

@interface RCBookStoreSearchView : BaseView
@property (nonatomic, strong) NSArray                           *buttonTitleArray;
@property (nonatomic, strong) NSArray                           *clumOneArray;
@property (nonatomic, strong) NSArray                           *clumTwoArray;
@property (nonatomic, strong) NSArray                           *clumThreeArray;
@property (nonatomic, strong) NSArray                           *clumFourArray;
@property (nonatomic, strong) RCBookStoreSearchCollectionView   *colView;
@property (nonatomic, weak)   id <RCBookStoreSearchDelegate>    searchDelegate;
@end



@interface RCBookStoreSearchCollectionView : BaseView
@property (nonatomic, strong) NSArray                         *dataArray;
@property (nonatomic, strong) UICollectionView                *dataCollection;
@property (nonatomic, strong) RCLeftAndRightButtonView        *buttonView;
@end

@interface RCBookStoreSearchViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel        *itemName;
@end
