//
//  MusicTableViewModel.m
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "MusicTableViewModel.h"

@implementation MusicTableViewModel

- (void)initialize{
    self.shouldPullToRefresh = YES;
    
    [super initialize];
    
    self.getInfoCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [HANetworkEngine rac_get:[MusicInfoURL stringByAppendingString:input]];
    }];
    
    RAC(self, dataSource) = self.requestRemoteDataCommand.executionSignals.switchToLatest;
    
    @weakify(self);
    [[RACObserve(self, dataSource) filter:^BOOL(id value) {
        return value != nil;
    }] subscribeNext:^(NSArray *array) {
        @strongify(self);
        self.shouldDisplayEmptyDataSet = array.count == 0;
    }];
    
    [self.getInfoCommand.errors subscribe:self.errors];
}

-(RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page{
    return [[HANetworkEngine rac_get:MusicListURL] map:^id(NSArray *data) {
        return [data.rac_sequence map:^id(id value) {
            MusicListModel *model = [MTLJSONAdapter modelOfClass:[MusicListModel class] fromJSONDictionary:value error:nil];
            return model;
        }].array;
    }];
}

@end
