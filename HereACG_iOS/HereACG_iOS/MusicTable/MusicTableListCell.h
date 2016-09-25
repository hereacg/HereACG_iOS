//
//  MusicTableListCell.h
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "BSTableViewCell.h"
#import "MusicListModel.h"

static NSString *MusicTableListCellIdentifier = @"MusicTableListCellIdentifier";

@interface MusicTableListCell : BSTableViewCell

@property (nonatomic, strong) MusicListModel *model;

@end
