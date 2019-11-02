//
//  ACGDynamicItem.m
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/11/2.
//  Copyright © 2019 王承权. All rights reserved.
//

#import "ACGDynamicItem.h"

@implementation ACGDynamicItem

- (instancetype)init {
    self = [super init];

    if (self) {
        // Sets non-zero `bounds`, because otherwise Dynamics throws an exception.
        _bounds = CGRectMake(0, 0, 1, 1);
    }

    return self;
}
@end
