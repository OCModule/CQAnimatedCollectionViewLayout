//
//  CQATableViewCell.h
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/11/9.
//  Copyright © 2019 王承权. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQACollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CQATableViewCell : UITableViewCell

@property (nonatomic, strong) ACGCellModel *model;
@property (nonatomic, strong) ACGScrollView *scrollview;
@property (nonatomic, assign) BOOL firstItem;
@property (nonatomic, assign) BOOL lastItem;
@property (nonatomic, strong) UILabel *label;
+ (NSString *)reuseIdentifier;
- (void)adapterContentInset: (NSIndexPath *)indexPath items: (NSArray *)items;
@end

NS_ASSUME_NONNULL_END
