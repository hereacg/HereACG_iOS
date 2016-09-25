//
//  BSTableViewCell.h
//  ci123web
//
//  Created by Bobby on 15/11/26.
//  Copyright © 2015年 ci123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;

- (void)setup;

+ (CGFloat)cellHeight;
@end
