//
//  MusicTableViewModel.h
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "BSTableViewModel.h"
#import "MusicEntity.h"

@interface MusicTableViewModel : BSTableViewModel

@property (nonatomic, strong) MusicEntity *nowMusicEntity;

@property (nonatomic, strong) RACCommand *getInfoCommand;

@end
