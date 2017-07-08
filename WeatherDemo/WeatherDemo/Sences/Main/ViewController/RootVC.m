//
//  RootVC.m
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/16.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "RootVC.h"
#import "LeftVC.h"
#import "RightVC.h"
#import "BaseNavigationVC.h"

#define kVCShowDuration 0.35

@interface RootVC ()
@property (nonatomic, weak , readonly) UIViewController *leftVC;
@property (nonatomic, weak) UIViewController *rightVC;
@property (nonatomic, weak) UIViewController *centerVC;

@property (nonatomic, assign) BOOL leftVCIsVisual;
@property (nonatomic, assign) BOOL rightVCIsVisual;

@property (nonatomic, assign) CGPoint lastPoint;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation RootVC

+ (instancetype)leftVC:(UIViewController *)leftvc
              centerVC:(UIViewController *)centervc
               rightVC:(UIViewController *)rightvc {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RootVC *vc = [storyboard instantiateInitialViewController];
    
//    vc.leftVC = leftvc;
    vc.rightVC = rightvc;
    vc.centerVC = centervc;
    
    [vc addChildViewController:leftvc];
    [vc addChildViewController:rightvc];
    [vc addChildViewController:centervc];
    [vc.view addSubview:leftvc.view];
    [vc.view addSubview:rightvc.view];
    [vc.view addSubview:centervc.view];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildrenVC];
    [self addGesture];
}


- (void)setupChildrenVC {
    _leftVC = (LeftVC *)[self addChildVCWithStoryboardId:@"LeftVC"];
    self.rightVC = (RightVC *)[self addChildVCWithStoryboardId:@"RightVC"];
    self.centerVC = (BaseNavigationVC *)[self addChildVCWithStoryboardId:@"BaseNavigationVC"];
}

- (UIViewController *)addChildVCWithStoryboardId:(NSString *)storyboardid {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:storyboardid];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    return vc;
}

- (void)addGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    [self.view addGestureRecognizer:pan];
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
    [self.centerVC.view addGestureRecognizer:self.tapGestureRecognizer];
    self.tapGestureRecognizer.enabled = NO;
}

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)panGesture {
    CGPoint point = [panGesture translationInView:self.view];

    if (self.leftVCIsVisual) {
        CGFloat offx = self.leftVC.view.width + point.x;

        if (offx <= self.leftVC.view.width) {
            self.centerVC.view.x = offx <= 0 ? 0 : offx;
        }
        
        if (panGesture.state == UIGestureRecognizerStateEnded) {
            if (point.x > -50) {
                [UIView animateWithDuration:kVCShowDuration animations:^{
                    self.centerVC.view.x = self.leftVC.view.width;
                }];
            }else {
                [UIView animateWithDuration:kVCShowDuration animations:^{
                    self.centerVC.view.x = 0;
                }];
                self.leftVCIsVisual = NO;
                self.tapGestureRecognizer.enabled = NO;
            }
        }
    }
    
    if (self.rightVCIsVisual) {
        CGFloat offx = -self.rightVC.view.width + point.x;
        if (offx >= -self.rightVC.view.width) {
            self.centerVC.view.x = offx >= 0 ? 0 : offx;
        }

        if (panGesture.state == UIGestureRecognizerStateEnded) {
            if (point.x > 50) {
                [UIView animateWithDuration:kVCShowDuration animations:^{
                    self.centerVC.view.x = 0;
                }];
                self.rightVCIsVisual = NO;
                self.tapGestureRecognizer.enabled = NO;
            }else {
                [UIView animateWithDuration:kVCShowDuration animations:^{
                    self.centerVC.view.x = -self.rightVC.view.width;
                }];
            }
        }
    }
    
}

- (void)tapGestureRecognizerAction:(UITapGestureRecognizer *)tap {
    if (self.leftVCIsVisual) [self showLeftVC];
    if (self.rightVCIsVisual) [self showRightVC];
}

#pragma mark - Actions
- (void)showLeftVC {
    if (self.leftVCIsVisual) {
        [UIView animateWithDuration:kVCShowDuration animations:^{
            self.centerVC.view.x = 0;
        }];
    }else {
        [self.view insertSubview:self.leftVC.view aboveSubview:self.rightVC.view];
        [UIView animateWithDuration:kVCShowDuration animations:^{
            self.centerVC.view.x = self.leftVC.view.width;
        }];
    }
    self.leftVCIsVisual = !self.leftVCIsVisual;
    self.tapGestureRecognizer.enabled = self.leftVCIsVisual;
}

- (void)showRightVC {
    if (self.rightVCIsVisual) {
        [UIView animateWithDuration:kVCShowDuration animations:^{
            self.centerVC.view.x = 0;
        }];
    }else {
        [self.view insertSubview:self.rightVC.view aboveSubview:self.leftVC.view];
        [UIView animateWithDuration:kVCShowDuration animations:^{
            self.centerVC.view.x = -self.rightVC.view.width;
        }];
    }
    self.rightVCIsVisual = !self.rightVCIsVisual;
    self.tapGestureRecognizer.enabled = self.rightVCIsVisual;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
