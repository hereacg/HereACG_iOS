//
//  MusicListModel.m
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "MusicListModel.h"

@implementation MusicListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
                @"mid":@"id",
                @"title":@"title",
                @"songInfo":@"songinfo",
             };
}

@end
