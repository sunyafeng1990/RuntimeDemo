//
//  UIImage+Category.m
//  RunTimeDemo
//
//  Created by 孙亚锋 on 2017/8/9.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "UIImage+Category.h"
#import <objc/runtime.h>


@implementation UIImage (Category)



//1、为UIImage建一个分类（UIImage+Category）
//2、在分类中实现一个自定义方法，方法中写要在系统方法中加入的语句，比如版本判断
+(UIImage *)syf_imageNamed:(NSString *)name
{
    
    double varsion = [[UIDevice currentDevice].systemVersion doubleValue];
    
    if (varsion >= 7.0) {
//        name = [name stringByAppendingString:@"_ios7"];
        name = [[name substringToIndex:[name length] - 4]stringByAppendingString:@"_ios7.jpg"];
        
         NSLog(@"name---%@",name);
    }
    
   
    return [UIImage syf_imageNamed:name];
    
    
    
}
//3、分类中重写UIImage的load方法，实现方法的交换（只要能让其执行一次方法交换语句，load再合适不过了）
+(void)load{
    //获取两个类的类方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(syf_imageNamed:));
    //开始交换方法实现
    method_exchangeImplementations(m1, m2);
    
}

@end
