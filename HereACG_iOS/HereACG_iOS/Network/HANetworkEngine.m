//
//  HANetworkEngine.m
//  HereACG_iOS
//
//  Created by 石云洋 on 2016/9/25.
//  Copyright © 2016年 石云洋. All rights reserved.
//

#import "HANetworkEngine.h"
#import "AFNetworking/AFNetworking.h"

@implementation HANetworkEngine

+ (RACSignal *)rac_get:(NSString *)path{
    return [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
        NSURLSessionDataTask *task = [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [subscriber sendError:[NSError errorWithDomain:error.domain code:error.code userInfo:nil]];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }]
             replayLazily]
            setNameWithFormat:@"rac_getPath: %@", path];
}

@end
