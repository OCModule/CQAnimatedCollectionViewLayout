//
//  ACGDynamicItem.h
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/11/2.
//  Copyright © 2019 王承权. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACGDynamicItem : NSObject<UIDynamicItem>
@property (nonatomic, readwrite) CGPoint center;
@property (nonatomic, readonly) CGRect bounds;
@property (nonatomic, readwrite) CGAffineTransform transform;
@end

NS_ASSUME_NONNULL_END
