//
//  FMTableViewPlaceholder.m
//  FMListPlaceholderExample
//
//  Created by mingo on 2019/1/15.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import "FMTableViewPlaceholder.h"
#import <MJRefresh.h>
#import <FMListPlaceholder.h>

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
        
        __weak __typeof(self)weakSelf = self;
        _tableView.reloadBlock = ^(UIScrollView *listView) {
            weakSelf.rowNum = 15;
            [listView.mj_header beginRefreshing];
        };
        
        /// 使用场景 1
    //  _tableView.needPlaceholderView = YES; /// 只设置该属性，就使用系统默认占位图，没有点击刷新

        /// 使用场景 2
        // 只实现 reloadBlock 就使用系统默认占位图，有点击刷新
    //    _tableView.reloadBlock = ^(UIScrollView *listView) {
    //        // Click Reload Handle is Here!
    //        // [listView.mj_header beginRefreshing]; // reloadData
    //    };
        
        /// 使用场景 3
        // 自定义某个 列表的 占位图 文字 等等属性。根据需求自行调用相应接口。不想覆盖全局默认属性的参数传nil
        [_tableView fm_emptyCoverName:@"fm_placeholder_nil" emptyTips:@" "]; // emptyTips如果传 nil 则会显示全局默认文字。不要 emptyTips 传 空白字符 即可
        [_tableView fm_backgroundColor:[UIColor colorWithRed:0.91 green:0.90 blue:0.90 alpha:1.00] tipsTextColor:UIColor.redColor tipsFont:nil];
        [_tableView fm_coverCenterYOffset:-80 coverSize:CGSizeMake(90, 120) coverSpaceToTips:20];
        
        /// 使用场景 4
        /// 设置自定义 的占位视图
//        UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)]; // 上面设置过 coverSize  ，coverSize 优先级比当前设置的 size 高
//        vv.backgroundColor = UIColor.redColor;
//        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 90, 90, 30)];
//        [vv addSubview:btn];
//        [btn setTitle:@"哈哈哈" forState:0];
//        [vv addSubview:btn];
//        [_tableView fm_defaultPlaceholder:vv];
        
        /// 使用场景 5
        // 设置全局默认占位图。见 AppDelegate 文件
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
