//
//  ACGAnimatedCollectionViewLayoutAttributes.m
//  acgapp
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 iqiyi. All rights reserved.
//

#import "ACGAnimatedCollectionViewLayoutAttributes.h"

@implementation ACGAnimatedCollectionViewLayoutAttributes

- (id)copyWithZone:(NSZone *)zone {
    ACGAnimatedCollectionViewLayoutAttributes *copy = [super copyWithZone:zone];
    copy.endOffset = self.endOffset;
    copy.middleOffset = self.middleOffset;
    copy.endOffset = self.endOffset;
    copy.scrollDirection = self.scrollDirection;
    copy.contentView = self.contentView;
    return copy;
}

@end
