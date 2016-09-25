//
//  MusicTableViewController.m
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "MusicTableViewController.h"
#import "MusicTableListCell.h"

@interface MusicTableViewController ()

@property (nonatomic, strong) MusicTableViewModel *viewModel;

@end

@implementation MusicTableViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HereACG";
    [self configTableView];
}

- (void)configTableView{
    [self.tableView registerClass:[MusicTableListCell class] forCellReuseIdentifier:MusicTableListCellIdentifier];
    
    WS(ws);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view);//.insets(UIEdgeInsetsMake(0, 0, 60, 0));
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MusicTableListCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicTableListCell *cell = [tableView dequeueReusableCellWithIdentifier:MusicTableListCellIdentifier forIndexPath:indexPath];
    MusicListModel *model = self.viewModel.dataSource[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
