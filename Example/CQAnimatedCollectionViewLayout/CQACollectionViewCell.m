//
//  CQACollectionViewCell.m
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/10/30.
//  Copyright © 2019 王承权. All rights reserved.
//

#import "CQACollectionViewCell.h"
#import "UIColor+CQExt.h"

@interface CQACollectionViewCell()


@end

@implementation CQACollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addComponents];
    }
    return self;
}

- (void)addComponents {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 414, 300)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor randomColor];
    [self.contentView addSubview:self.label];
    self.contentView.frame = CGRectMake(0, 60, 414, 600);
    self.contentView.backgroundColor = [UIColor randomColor];
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}
@end
