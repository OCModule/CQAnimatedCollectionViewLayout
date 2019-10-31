//
//  ACGCubeAttributesAnimator.h
//  acgapp
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 iqiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACGLayoutAttributesAnimator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACGCubeAttributesAnimator : NSObject<ACGLayoutAttributesAnimator>

@property (nonatomic, assign) CGFloat perspective;
@property (nonatomic, assign) CGFloat totalAngle;

@end

NS_ASSUME_NONNULL_END
