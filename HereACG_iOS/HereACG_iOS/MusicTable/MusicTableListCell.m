//
//  MusicTableListCell.m
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "MusicTableListCell.h"

@interface MusicTableListCell()

@property (nonatomic, strong) UILabel *idLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *songInfoLabel;

@end

@implementation MusicTableListCell

- (void)setup{
    [super setup];
    
    [self.contentView addSubview:self.idLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.songInfoLabel];
    
    WS(ws);
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView).offset(15);
        make.centerY.equalTo(ws.contentView);
        make.width.equalTo(@25);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.idLabel.mas_right).offset(5);
        make.bottom.equalTo(ws.contentView.mas_centerY).offset(-2);
        make.right.equalTo(ws.contentView).offset(-10);
    }];
    
    [self.songInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.titleLabel);
        make.top.equalTo(ws.contentView.mas_centerY).offset(2);
        make.right.equalTo(ws.titleLabel);
    }];
    
    @weakify(self)
    [[RACObserve(self, model) skip:1] subscribeNext:^(MusicListModel *model) {
        @strongify(self)
        self.idLabel.text = model.mid;
        self.titleLabel.text = model.title;
        self.songInfoLabel.text = model.songInfo;
    }];
}

- (UILabel *)idLabel{
    if (_idLabel == nil) {
        _idLabel = ({
            UILabel *label = [UILabel new];
            label.textColor = HexRGB(0xee1100);
            label.font = FONT(14);
            label;
        });
    }
    return _idLabel;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = ({
            UILabel *label = [UILabel new];
            label.textColor = HexRGB(0x333333);
            label.font = FONT(14);
            label;
        });
    }
    return _titleLabel;
}

- (UILabel *)songInfoLabel{
    if (_songInfoLabel == nil) {
        _songInfoLabel = ({
            UILabel *label = [UILabel new];
            label.textColor = HexRGB(0x666666);
            label.font = FONT(12);
            label;
        });
    }
    return _songInfoLabel;
}

@end
