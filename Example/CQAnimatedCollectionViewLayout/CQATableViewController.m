//
//  CQATableViewController.m
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by Steve on 2019/11/9.
//  Copyright © 2019 王承权. All rights reserved.
//

#import "CQATableViewController.h"
#import "UIView+CQExt.h"
#import "UIColor+CQExt.h"
#import "CQATableViewCell.h"

@interface CQATableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<ACGCellModel *> *datas;
@property (nonatomic, assign) CGPoint lastContentOffset;

@property (nonatomic, assign) int currentPage;

@end

@implementation CQATableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentPage = 0;
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.frame = self.view.bounds;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CQATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CQATableViewCell reuseIdentifier] forIndexPath:indexPath];
        cell.model = self.datas[indexPath.item];
        cell.label.text = self.datas[indexPath.item].text;
        cell.backgroundColor = [UIColor randomColor];
        cell.clipsToBounds = YES;
        [cell adapterContentInset:indexPath items:self.datas];
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        self.currentPage = [@(indexPath.item) intValue];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.bounds.size.width;
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
            
//            if (velocity.x < 0) {
//                self.currentPage = pageWidth * self.currentPage - targetContentOffset->x  > pageWidth / 2 ? self.currentPage - 1 : self.currentPage;
//            } else {
//                self.currentPage = targetContentOffset->x - pageWidth * self.currentPage > pageWidth / 2 ? self.currentPage + 1 : self.currentPage;
//            }
//            *targetContentOffset = CGPointMake(self.currentPage * pageWidth, 0);
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

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.pagingEnabled = YES;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.bounces = NO;
        _tableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        [_tableView registerClass:[CQATableViewCell class] forCellReuseIdentifier:[CQATableViewCell reuseIdentifier]];
    }
    return _tableView;
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
