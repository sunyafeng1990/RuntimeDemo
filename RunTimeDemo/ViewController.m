//
//  ViewController.m
//  RunTimeDemo
//
//  Created by 孙亚锋 on 2017/8/9.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "UIImage+Category.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // 1. 通过runtime 实现方法交换,
    [self exchangeMethodTest];
    // 2. 拦截系统方法
    [self interceptSystemMethodTest];
    
    // 3.利用runtime进行归档，解档
    [self ArchiverTest];
    
}
-(void)ArchiverTest{
    Person * p1 = [[Person alloc]init];
    p1.name = @"sunyafeng";
    p1.address = @"上海";
    p1.height = 175.0;
    Person * p2 = [[Person alloc]init];
    p2.name = @"zhangSan";
    p2.address = @"伦敦";
    p2.height = 159.0;
    
    
    NSArray * arr = @[p1,p2];
    
    [NSKeyedArchiver archiveRootObject:arr toFile:[self filePath]];
    
    
    //  NSArray * arr2 = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    //    NSLog(@"arr2---%@",arr2);
    //    Person * p3 = arr2[0];
    //    NSLog(@"p3--%@  %@  %f",p3.name,p3.address,p3.height);
    //   Person * p4 = arr2[1];
    //       NSLog(@"p4--%@  %@  %f",p4.name,p4.address,p4.height);
}

-(NSString *)filePath{
    
    NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * document = path[0];
    NSString * plistPath = [document stringByAppendingPathComponent:@"test.plist"];
    NSLog(@"--->%@",plistPath);
    return plistPath;
}
#pragma mark - -// 1. 通过runtime 实现方法交换,
-(void)exchangeMethodTest{
    
    // 类方法用 class_getClassMethod,
    
    Method m1 = class_getClassMethod([Person class], @selector(run));
    Method m2 = class_getClassMethod([Person class], @selector(student));
    
    method_exchangeImplementations(m1, m2);
    
    [Person run];
    
    [Person student];
    
    
    
    
    // 对象方法 用 class_getInstanceMethod;
    Method m3 = class_getInstanceMethod([Person class], @selector(eat));
    Method m4 = class_getInstanceMethod([Person class], @selector(sleep));
    method_exchangeImplementations(m3, m4);
    
    Person * p = [[Person alloc]init];
    
    [p eat];
    
    [p sleep];
    
}
#pragma mark - -// 2. 拦截系统方法
-(void)interceptSystemMethodTest{
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageV.image = [UIImage imageNamed:@"123s.jpg"];

    
    [self.view addSubview:imageV];
    
}

@end
