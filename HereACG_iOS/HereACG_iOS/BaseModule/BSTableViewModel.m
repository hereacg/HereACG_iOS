//
//  BSTableViewModel.m
//  babylearn
//
//  Created by Bobby on 15/10/20.
//  Copyright (c) 2015年 ci123. All rights reserved.
//

#import "BSTableViewModel.h"

@interface BSTableViewModel ()

@property (strong, nonatomic, readwrite) RACCommand *requestRemoteDataCommand;

@end

@implementation BSTableViewModel

- (void)initialize
{
    [super initialize];
    
    self.page = 1;
    self.perPage = 30;
    self.isMore = YES;
    
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithEnabled:[self requestEnableSignal] signalBlock:^RACSignal *(NSNumber *page) {
        @strongify(self)
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
    }];
    
    [[self.requestRemoteDataCommand.errors
      filter:[self requestRemoteDataErrorsFilter]]
     subscribe:self.errors];
}

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter {
    return ^(NSError *error) {
        return YES;
    };
}

- (id)fetchLocalData {
    return nil;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    return [RACSignal empty];
}

- (RACSignal *)requestEnableSignal
{
    return [RACSignal return:@(YES)];
}
@end
