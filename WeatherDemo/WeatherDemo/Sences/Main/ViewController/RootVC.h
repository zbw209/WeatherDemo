//
//  RootVC.h
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/16.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootVC : UIViewController

+ (instancetype)leftVC:(UIViewController *)leftvc
              centerVC:(UIViewController *)centervc
               rightVC:(UIViewController *)rightvc;

- (void)showLeftVC;
- (void)showRightVC;

@end
