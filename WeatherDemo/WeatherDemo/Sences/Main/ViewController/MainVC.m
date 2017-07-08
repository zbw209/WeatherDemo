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
@property (nonatomic, assign) BOOL rainHeaderView;
@property (nonatomic, strong) UIView *weatherAnimationView;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupSubViews];
}

- (void)setupData {
    _rainHeaderView = YES;
}

- (void)setupSubViews {
    [self setupBackgroundView];
    [self setupWeatherAnimationView];
    [self setupNavifationItems];
}

- (void)setupBackgroundView {
    self.view.layer.contents =  (__bridge id _Nullable)([UIImage imageNamed:@"bg03"].CGImage);
}

- (void)setupWeatherAnimationView {
    if (!self.weatherAnimationView) {
        self.weatherAnimationView = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.weatherAnimationView];
        [self.view sendSubviewToBack:self.weatherAnimationView];
    }

    for (UIView *view in self.weatherAnimationView.subviews) {
        [view removeFromSuperview];
    }
    if (_rainHeaderView) {
        [self.weatherAnimationView addSubview:[self rainAnimationView]];
    }else {
        [self.weatherAnimationView addSubview:[self cloudAnimationView]];
    }
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"1234134";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self showViewController:vc sender:nil];
}

#pragma mark - UITableViewDelegate

#pragma mark - WeatherAnimation
- (UIView *)cloudAnimationView {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 80, kScreenWidth-50, 180)];
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
    animation.removedOnCompletion = NO;
    [imageV.layer addAnimation:animation forKey:@"animation"];
    return view;
}

- (UIView *)rainAnimationView {
    UIView *view =  [[UIView alloc]initWithFrame:CGRectMake(0, 80, kScreenWidth, 380)];
    UIImageView *imagev = [[UIImageView alloc]initWithFrame:view.bounds];
    NSMutableArray *imageArr = [NSMutableArray new];
    for (int i = 1; i < 5; i++) {
        id obj = [UIImage imageNamed:[NSString stringWithFormat:@"雨滴%d",i]];
        [imageArr addObject:obj];
    }
    
    imagev.animationImages = imageArr;
    imagev.animationDuration = 0.5;
    [imagev startAnimating];
    [view addSubview:imagev];
    return view;
}


@end
