//
//  BSTableViewCell.m
//  ci123web
//
//  Created by Bobby on 15/11/26.
//  Copyright © 2015年 ci123. All rights reserved.
//

#import "BSTableViewCell.h"

@implementation BSTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    _topLineView = [UIView new];
    _topLineView.hidden = YES;
    _topLineView.backgroundColor = HexRGB(0xf7f7f7);
    [self.contentView addSubview:_topLineView];
    
    _bottomLineView = [UIView new];
    _bottomLineView.hidden = YES;
    _bottomLineView.backgroundColor = HexRGB(0xf7f7f7);
    [self.contentView addSubview:_bottomLineView];
    
    WS(ws);
    [_topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(ws.contentView);
        make.height.mas_equalTo(@0.5);
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(ws.contentView);
        make.height.mas_equalTo(@0.5);
        make.left.equalTo(ws.contentView);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (CGFloat)cellHeight
{
    return 44;
}
@end
