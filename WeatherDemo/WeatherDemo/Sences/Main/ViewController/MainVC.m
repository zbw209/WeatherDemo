//
//  MainVC.m
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/16.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "MainVC.h"
#import "RootVC.h"

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews {
    [self setupBackgroundView];
    [self setupNavifationItems];
}

- (void)setupBackgroundView {
    self.view.layer.contents =  (__bridge id _Nullable)([UIImage imageNamed:@"bg03"].CGImage);
}

- (void)setupNavifationItems {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"分类"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemPressed:)];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"添加"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemPressed:)];

    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)leftBarButtonItemPressed:(UIBarButtonItem *)barButtonItem {
    if ([self.navigationController.parentViewController isKindOfClass:[RootVC class]]) {
        RootVC *rootVC = (RootVC *)self.navigationController.parentViewController;
        [rootVC showLeftVC];
    }
}

- (void)rightBarButtonItemPressed:(UIBarButtonItem *)barButtonItem {
    if ([self.navigationController.parentViewController isKindOfClass:[RootVC class]]) {
        RootVC *rootVC = (RootVC *)self.navigationController.parentViewController;
        [rootVC showRightVC];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-50, 180)];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:view.bounds];
    
    imageV.image = [UIImage imageNamed:@"雾云"];
    imageV.layer.affineTransform = CGAffineTransformMakeTranslation(kScreenWidth, 0);
    
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.frame = imageV.bounds;
    repLayer.instanceCount = 2;
    repLayer.instanceDelay = 15;
    [repLayer addSublayer:imageV.layer];
    [view.layer addSublayer:repLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = @(kScreenWidth / 2);
    animation.toValue = @(-kScreenWidth * 3 / 2);
    animation.duration = 30;
    animation.repeatCount = MAXFLOAT;
    [imageV.layer addAnimation:animation forKey:@"animation"];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

@end
