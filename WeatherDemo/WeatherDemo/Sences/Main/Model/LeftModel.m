//
//  LeftModel.m
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/19.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "LeftModel.h"

@implementation LeftModel

- (void)setLeft:(NSString *)left {
    NSLog(@"%s,%d left = %@",__FUNCTION__,__LINE__,left);
    _left = @"123123";
}

- (instancetype)init {
    if (self = [super init]) {
        self.left = @"1111";
    }
    return self;
}

@end
