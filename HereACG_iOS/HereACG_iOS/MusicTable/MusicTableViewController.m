//
//  MusicTableViewController.m
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "MusicTableViewController.h"
#import "MusicTableListCell.h"
#import "MusicPlayView.h"

@interface MusicTableViewController ()

@property (nonatomic, strong) MusicTableViewModel *viewModel;
@property (nonatomic, strong) MusicPlayView *playView;

@end

@implementation MusicTableViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HereACG";
    [self configTableView];
    [self addPlayView];
}

- (void)configTableView{
    [self.tableView registerClass:[MusicTableListCell class] forCellReuseIdentifier:MusicTableListCellIdentifier];
    self.tableView.backgroundColor = HexRGB(0xf7f7f7);
    
    WS(ws);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).insets(UIEdgeInsetsMake(0, 0, 60, 0));
    }];
}

- (MusicPlayView *)playView{
    if (_playView == nil) {
        _playView = [[MusicPlayView alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, 60)];
    }
    return _playView;
}

- (void)addPlayView{
    [self.view addSubview:self.playView];
    
    WS(ws);
    
    [self.playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view);
        make.left.right.equalTo(ws.view);
        make.height.equalTo(@60);
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"Version %@(Build %@)",Current_Version, Current_Build];
    label.textColor = HexRGB(0x555555);
    label.font = FONT(15);
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
