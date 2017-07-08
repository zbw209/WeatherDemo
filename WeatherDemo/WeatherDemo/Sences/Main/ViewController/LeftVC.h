//
//  LeftVC.h
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/16.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftVCDelegate <NSObject>

@optional
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LeftVC : BaseVC

@end
