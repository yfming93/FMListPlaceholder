//
//  FMCollectionViewPlaceholder.m
//  FMListPlaceholderExample
//
//  Created by mingo on 2019/1/15.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import "FMCollectionViewPlaceholder.h"
#import <MJRefresh.h>
#import <FMListPlaceholder.h>

static NSString *cellID = @"UICollectionView";

@interface FMCollectionViewPlaceholder ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger rowNum;

@end

@implementation FMCollectionViewPlaceholder

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FMCollectionViewPlaceholder";
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.rowNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = kRandomColor;
    return cell;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat width = (kScreenW - 30) / 2;
        layout.itemSize = CGSizeMake(width,  width);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0  , kScreenW, kScreenH - 64) collectionViewLayout:layout];
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView.mj_header beginRefreshing];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        __weak __typeof(self)weakSelf = self;
        _collectionView.reloadBlock = ^(UIScrollView *listView) {
            weakSelf.rowNum = 15;
            [listView.mj_header beginRefreshing];
        };
    }
    return _collectionView;
}

- (void)headerRefresh {
    [self performSelector:@selector(fm_reloadData) withObject:nil afterDelay:1];
}

- (void)fm_reloadData {
    [self.collectionView reloadData];
    [_collectionView.mj_header endRefreshing];
    [_collectionView.mj_footer endRefreshing];
}

@end
