//
//  UIImage+Orginal.h
//  dyd
//
//  Created by 周必稳 on 16/3/21.
//  Copyright © 2016年 IOCDOC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Accelerate;

@interface UIImage (Orginal)

+ (UIImage *)originalImage:(UIImage *)image;
+ (UIImage *)originalImageNamed:(NSString *)imageName;

// 图片模糊处理
- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;

// 图片压缩
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

// 根据颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
