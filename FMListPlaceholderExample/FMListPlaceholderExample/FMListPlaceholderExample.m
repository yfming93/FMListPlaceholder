//
//  FMListPlaceholderExample.m
//  FMListPlaceholderExample
//
//  Created by mingo on 2019/1/15.
//  Copyright © 2019年 袁凤鸣. All rights reserved.
//

#import "FMListPlaceholderExample.h"
#import "FMTableViewPlaceholder.h"
#import "FMCollectionViewPlaceholder.h"


@interface FMListPlaceholderExample ()

@end

@implementation FMListPlaceholderExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FMListPlaceholder";
}

- (IBAction)fmTableViewPlaceholder:(UIButton *)sender {
    FMTableViewPlaceholder *vc = [[FMTableViewPlaceholder alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)fmCollectionViewPlaceholder:(UIButton *)sender {
    FMCollectionViewPlaceholder *vc = [[FMCollectionViewPlaceholder alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
