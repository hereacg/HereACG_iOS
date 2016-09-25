//
//  MusicPlayView.m
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "MusicPlayView.h"

@interface MusicPlayView()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *songInfoLabel;
@property (nonatomic, strong) UIButton *preBtn;
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation MusicPlayView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HexRGB(0x888888);
        
        [self addSubview:self.imgView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.songInfoLabel];
        [self addSubview:self.preBtn];
        [self addSubview:self.nextBtn];
        
        WS(ws);
        
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).offset(10);
            make.centerY.equalTo(ws);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        [self.preBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(ws).offset(-100);
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.centerY.equalTo(ws);
        }];
        
        [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(ws).offset(-35);
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.centerY.equalTo(ws);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.imgView.mas_right).offset(5);
            make.bottom.equalTo(ws.mas_centerY).offset(-2);
            make.right.equalTo(ws.preBtn.mas_left).offset(-5);
        }];
        
        [self.songInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.titleLabel);
            make.top.equalTo(ws.mas_centerY).offset(2);
            make.right.equalTo(ws.titleLabel);
        }];
        
        @weakify(self)
        [[RACObserve(self, entity) skip:1] subscribeNext:^(MusicEntity *entity) {
            @strongify(self)
            self.titleLabel.text = entity.title;
            self.songInfoLabel.text = entity.songInfo;
            [self.imgView yy_setImageWithURL:[NSURL URLWithString:entity.img] options:YYWebImageOptionSetImageWithFadeAnimation];
        }];
    }
    return self;
}

- (UIImageView *)imgView{
    if (_imgView == nil) {
        _imgView = [UIImageView new];
        _imgView.layer.cornerRadius = 20;
        _imgView.layer.masksToBounds = YES;
        _imgView.backgroundColor = HexRGB(0xf5f5f5);
    }
    return _imgView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = ({
            UILabel *label = [UILabel new];
            label.textColor = HexRGB(0xffffff);
            label.text = @"暂无歌名";
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
            label.textColor = HexRGB(0xf8f8f8);
            label.text = @"暂无说明";
            label.font = FONT(12);
            label;
        });
    }
    return _songInfoLabel;
}

- (UIButton *)preBtn{
    if (_preBtn == nil) {
        _preBtn = [UIButton new];
        [_preBtn setImage:[[UIImage imageNamed:@"pre"] yy_imageByTintColor:HexRGB(0xffffff)] forState:UIControlStateNormal];
    }
    return _preBtn;
}

- (UIButton *)nextBtn{
    if (_nextBtn == nil) {
        _nextBtn = [UIButton new];
        [_nextBtn setImage:[[UIImage imageNamed:@"next"] yy_imageByTintColor:HexRGB(0xffffff)] forState:UIControlStateNormal];
    }
    return _nextBtn;
}

@end
