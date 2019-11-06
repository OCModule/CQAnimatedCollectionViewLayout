//
//  CQACollectionViewCell.h
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 王承权. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACGScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACGCellModel: NSObject

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, copy) NSString *text;

@end
@class GeminiCell;
@class ACGCollectionView;

@interface CQACollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) ACGCellModel *model;
@property (nonatomic, strong) ACGScrollView *scrollview;
@property (nonatomic, strong) ACGCollectionView *collectionView;
@property (nonatomic, assign) BOOL firstItem;
@property (nonatomic, assign) BOOL lastItem;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *shadowView;
+ (NSString *)reuseIdentifier;
- (void)adapterContentInset: (NSIndexPath *)indexPath items: (NSArray *)items;
@end

NS_ASSUME_NONNULL_END
