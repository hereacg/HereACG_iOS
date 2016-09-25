//
//  MusicEntity.h
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "MusicListModel.h"

@interface MusicEntity : MusicListModel

@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *url;

@end
