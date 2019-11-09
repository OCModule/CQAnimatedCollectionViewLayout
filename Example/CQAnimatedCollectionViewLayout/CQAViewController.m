//
//  CQAViewController.m
//  CQAnimatedCollectionViewLayout
//
//  Created by 王承权 on 10/30/2019.
//  Copyright (c) 2019 王承权. All rights reserved.
//

#import "CQAViewController.h"
#import "CQACollectionViewCell.h"
#import "UIColor+CQExt.h"
#import "CQAnimatedCollectionViewLayoutHeader.h"
#import "CQAnimatedCollectionViewLayout_Example-Swift.h"
#import "ACGCollectionView.h"

@interface CQAViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

//@property (nonatomic, strong) ACGCollectionView *collectionView;

@property (nonatomic, strong) ACGCollectionView *collectionView;
@property (nonatomic, strong) NSArray<ACGCellModel *> *datas;
@property (nonatomic, strong) AnimatedCollectionViewLayout *layout;
@property (nonatomic, assign) CGPoint lastContentOffset;

@property (nonatomic, assign) int currentPage;


@end

@implementation CQAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentPage = 0;
    // Do any additional setup after loading the view, typically from a nib.
    self.collectionView.frame = self.view.bounds;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CQACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CQACollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.collectionView = (ACGCollectionView *)collectionView;
    cell.model = self.datas[indexPath.item];
    cell.label.text = self.datas[indexPath.item].text;
    cell.backgroundColor = [UIColor randomColor];
    cell.clipsToBounds = YES;
//    cell.scrollview.bounces = YES;
//    cell.scrollview.userInteractionEnabled = NO;
//    [cell.contentView addGestureRecognizer:cell.scrollview.panGestureRecognizer];
//    [collectionView addGestureRecognizer:cell.scrollview.pinchGestureRecognizer];
//    [collectionView addGestureRecognizer:cell.scrollview.panGestureRecognizer];
//    [cell.scrollview removeGestureRecognizer:collectionView.panGestureRecognizer];
//    [cell.scrollview addGestureRecognizer:collectionView.panGestureRecognizer];
    [cell adapterContentInset:indexPath items:self.datas];
    self.currentPage = [@(indexPath.item) intValue];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(CQACollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
//    [collectionView removeGestureRecognizer:cell.scrollview.panGestureRecognizer];
}

#pragma mark - UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width, 600);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"🌹 contentOffset.x: %f ", scrollView.contentOffset.x);
    self.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    if (velocity.x > 0) {
////        NSLog(@"🌹velocity.x: %f ", velocity.x);
////            *targetContentOffset = CGPointMake((self.currentPage + 1)* scrollView.frame.size.width, 0);
//    } else {
////        NSLog(@"🌹velocity.x: %f ", velocity.x);
////            *targetContentOffset = CGPointMake((self.currentPage - 1)* scrollView.frame.size.width, 0);
//    }
//}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        UICollectionView* collectionView = (UICollectionView*)scrollView;
        if ([collectionView.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
            CGFloat pageWidth = self.view.bounds.size.width;
            if (abs(velocity.x) > 3) {
                
            }
            
            if (velocity.x < 0) {
                self.currentPage = pageWidth * self.currentPage - targetContentOffset->x  > pageWidth / 2 ? self.currentPage - 1 : self.currentPage;
            } else {
                self.currentPage = targetContentOffset->x - pageWidth * self.currentPage > pageWidth / 2 ? self.currentPage + 1 : self.currentPage;
            }
            *targetContentOffset = CGPointMake(self.currentPage * pageWidth, 0);
//            CGFloat usualSideOverhang = (scrollView.bounds.size.width - pageWidth)/2.0;
//            NSInteger targetPage = 0;
//            CGFloat currentOffsetInPages = (scrollView.contentOffset.x + usualSideOverhang)/pageWidth;
//            targetPage = velocity.x < 0 ? floor(currentOffsetInPages) : ceil(currentOffsetInPages);
//            targetPage = MAX(0,MIN(self.datas.count - 1,targetPage));
//            *targetContentOffset = CGPointMake(MAX(targetPage*pageWidth - usualSideOverhang,0), 0);
            NSLog(@"🌹contentOffset.x: %f, targetContentOffset->x: %f, velocity.x: %f", scrollView.contentOffset.x, targetContentOffset->x, velocity.x);
        }
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"🌹 UICollectionView：%@", self.collectionView.debugDescription);

    });

}
//
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    if (_currentPage == 0 && scrollView.contentOffset.x <= scrollView.bounds.size.width) {
//        *targetContentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//    } else if (_currentPage == self.datas.count-1 && scrollView.contentOffset.x >= scrollView.bounds.size.width) {
//        *targetContentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//    }
//}

#pragma mark - getter

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        CGRect frame = self.view.bounds;
        _collectionView = [[ACGCollectionView alloc] initWithFrame:frame collectionViewLayout:self.layout];
        [_collectionView registerClass:[CQACollectionViewCell class] forCellWithReuseIdentifier:[CQACollectionViewCell reuseIdentifier]];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.decelerationRate =  UIScrollViewDecelerationRateFast;
    }
    return _collectionView;
}

- (AnimatedCollectionViewLayout *)layout {
    if (!_layout) {
        _layout = [[AnimatedCollectionViewLayout alloc] init];
        _layout.animator = [[CubeAttributesAnimator alloc] init];
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _layout;
}

- (NSArray<ACGCellModel *> *)datas {
    if (!_datas) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSInteger i = 0; i < 4; i ++) {
            ACGCellModel *model = [[ACGCellModel alloc] init];
            model.currentIndex = 0;
            model.text = [NSString stringWithFormat:@"%@", @(i)];
            [arr addObject:model];
        }
        _datas = [NSArray arrayWithArray:arr];
    }
    return _datas;
}

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//    CGFloat pageSize = self.collectionView.frame.size.width;
//    if (velocity.x > 0) {
//        proposedContentOffset.x = ceill(self.collectionView.contentOffset.x / pageSize) * pageSize;
//    }
//    else {
//        proposedContentOffset.x = floorl(self.collectionView.contentOffset.x / pageSize) * pageSize;
//    }
//
//    return proposedContentOffset;
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end
