//
//  CQATableViewCell.m
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/11/9.
//  Copyright © 2019 王承权. All rights reserved.
//

#import "CQATableViewCell.h"
#import "UIColor+CQExt.h"

@interface CQATableViewCell()<UIScrollViewDelegate>

@property (nonatomic, assign) CGPoint lastContentOffset;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, copy) NSArray *datas;
@end

@implementation CQATableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addComponents];
    }
    return self;
}

- (void)addComponents {
    CGFloat w = 414;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, 100)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor randomColor];
    self.scrollview = [[ACGScrollView alloc] initWithFrame:CGRectMake(0, 120, w, 200)];
    self.scrollview.userInteractionEnabled = YES;
    self.scrollview.alwaysBounceHorizontal = YES;
    self.scrollview.backgroundColor = [UIColor grayColor];
    for (NSInteger i = 0; i < self.datas.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor randomColor];
        label.textColor = [UIColor blackColor];
        label.text = self.datas[i];
        label.frame = CGRectMake(i * w, 0, w, 200);
        [self.scrollview addSubview:label];
    }
//    [self.scrollview setContentOffset:CGPointMake(-10, 0)];
    [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.scrollview.pagingEnabled = YES;
    self.scrollview.delegate = self;
    self.scrollview.contentSize = CGSizeMake(w * self.datas.count, 0);
    self.scrollview.decelerationRate =  UIScrollViewDecelerationRateFast;
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.scrollview];
    self.contentView.backgroundColor = [UIColor randomColor];
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    self.model.currentIndex = currentIndex;
}

- (void)setModel:(ACGCellModel *)model {
    _model = model;
    self.scrollview.contentOffset = CGPointMake(model.currentIndex * 414, 0);
}

- (void)adapterContentInset: (NSIndexPath *)indexPath items: (NSArray *)items {
    self.indexPath = indexPath;
    self.firstItem = indexPath.item == 0;
    self.lastItem = indexPath.item == (items.count - 1);
    if (self.firstItem) {
        [self.scrollview setContentInset:UIEdgeInsetsMake(0, 1, 0, 0)];
    } else if (self.lastItem) {
        [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 1)];
    } else {
        [self.scrollview setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.currentIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//*targetContentOffset = scrollView.contentOffset;
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    scrollView.contentOffset = CGPointMake(self.currentIndex * scrollView.bounds.size.width, 0);
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return [super pointInside:point withEvent:event];
}

- (NSArray *)datas {
    return @[
        @"1",
        @"2",
        @"3",
        ];
}


@end
