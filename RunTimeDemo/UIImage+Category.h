//
//  UIImage+Category.h
//  RunTimeDemo
//
//  Created by 孙亚锋 on 2017/8/9.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

//1、为UIImage建一个分类（UIImage+Category）
//2、在分类中实现一个自定义方法，方法中写要在系统方法中加入的语句，比如版本判断
+(UIImage *)syf_imageNamed:(NSString *)name;

@end
