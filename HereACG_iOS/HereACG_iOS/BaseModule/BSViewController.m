//
//  BSViewController.m
//  babylearn
//
//  Created by Bobby on 15/10/20.
//  Copyright (c) 2015年 ci123. All rights reserved.
//

#import "BSViewController.h"
#import "BSViewModel.h"

@interface BSViewController ()
@property (nonatomic, strong) BSViewModel *viewModel;
@end

@implementation BSViewController

@synthesize viewModel = _viewModel;


+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BSViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindViewModel];
     }];
    
    return viewController;
}

- (id<BSViewControllerProtocol>)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        self.canBack = YES;
    }
    return self;
}

- (void)bindViewModel
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置CGRectZero从导航栏下开始计算
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    if (self.canBack) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = 0;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,[[UIBarButtonItem alloc]
                                                     initWithImage:[UIImage imageNamed:@"comeback_icon"]
                                                     style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(backToFront)]];
    }
    
    @weakify(self);
    [self.viewModel.errors subscribeNext:^(NSError *error) {
        @strongify(self);
        [self showTextWithMessage:error.domain withComplete:NO];
    }];
}

- (void)backToFront
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
