//
//  LeftVC.m
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/16.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "LeftVC.h"

@interface LeftVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews {
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"bgother"].CGImage);
    self.view.width = self.view.width * 3 / 4;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}







@end
