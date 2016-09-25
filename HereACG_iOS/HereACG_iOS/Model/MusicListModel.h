//
//  MusicListModel.h
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MusicListModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *mid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *songInfo;

@end
