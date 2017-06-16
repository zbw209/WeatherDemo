//
//  RightVC.m
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/16.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "RightVC.h"

@interface RightVC ()

@end

@implementation RightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews {
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"bgother"].CGImage);
    self.view.x += self.view.width / 4;
    self.view.width = self.view.width * 3 / 4;
}

@end
