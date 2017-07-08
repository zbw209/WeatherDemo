//
//  MainVC.h
//  WeatherDemo
//
//  Created by 周必稳 on 2017/6/16.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : BaseVC

@end


/*
 
 如何处理mainVC和leftVC以及rightVC之间传值
 1.在rootVC中建立代理关系，通过协议进行传值
 2.利用单例存储leftVC实例变量，在mainVC中进行访问，并建立代理关系
 
 */
