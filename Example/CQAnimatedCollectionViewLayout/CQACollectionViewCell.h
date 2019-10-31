//
//  CQACollectionViewCell.h
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 王承权. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQACollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;
+ (NSString *)reuseIdentifier;
@end

NS_ASSUME_NONNULL_END
