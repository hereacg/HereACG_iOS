//
//  BSNavigationViewController.h
//  babylearn
//
//  Created by Bobby on 15/10/20.
//  Copyright (c) 2015年 ci123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSNavigationViewController : UINavigationController<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@property(nonatomic,weak) UIViewController *currentShowVC;

@end
