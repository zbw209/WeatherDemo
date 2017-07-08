//
//  RightModel.m
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/19.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "RightModel.h"

@implementation RightModel

- (NSString *)INeedLeft {
    LeftModel *leftM = [LeftModel new];
    return leftM.left;
}

@end
