//
//  FMTableViewPlaceholder.m
//  FMListPlaceholderDemo
//
//  Created by mingo on 2019/1/15.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import "FMTableViewPlaceholder.h"
#import "FMListPlaceholder.h"
#import <MJRefresh.h>

static NSString *cellID = @"UITableViewCell";

@interface FMTableViewPlaceholder ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger rowNum;

@end

@implementation FMTableViewPlaceholder

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0 , kScreenW, kScreenH - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = UIView.new;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        [_tableView.mj_header beginRefreshing];
        
//        _tableView.needPlaceholderView = YES;

        __weak __typeof(self)weakSelf = self;
        _tableView.reloadBlock = ^(UIScrollView *listView) {
            weakSelf.rowNum = 15;
            [listView.mj_header beginRefreshing];
        };
        [_tableView fm_emptyCoverName:@"emptycart" emptyTips:@"没有商品哟！"];
        [_tableView fm_backgroundColor:[UIColor colorWithRed:0.91 green:0.90 blue:0.90 alpha:1.00] tipsTextColor:UIColor.redColor tipsFont:nil];
        [_tableView fm_coverCenterYOffset:-100 coverSize:CGSizeMake(160, 120) coverSpaceToTips:20];
    }
    return _tableView;
}

- (void)headerRefresh {
    [self performSelector:@selector(reloadTable) withObject:nil afterDelay:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FMTableViewPlaceholder";
    [self.view addSubview:self.tableView];
}

- (void)reloadTable {
    [self.tableView reloadData];
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.rowNum;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.backgroundColor = kRandomColor;
    return cell;
}

@end
