//
//  NSObject+Category.m
//  RunTimeDemo
//
//  Created by 孙亚锋 on 2017/8/15.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>
@implementation NSObject (Category)

char nameKey;
/*
 
需要用到的方法
set方法，将值value 跟对象object 关联起来（将值value 存储到对象object 中）
参数 object：给哪个对象设置属性
参数 key：一个属性对应一个Key，将来可以通过key取出这个存储的值，key 可以是任何类型：double、int 等，建议用char 可以节省字节
参数 value：给属性设置的值
参数policy：存储策略 （assign 、copy 、 retain就是strong）

 */
-(void)setName:(NSString *)name{
    // 将某个值跟谋和对象关联起来,将某个值存储到某个对象中。
    objc_setAssociatedObject(self, &nameKey,name ,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}
-(NSString *)name{
    return objc_getAssociatedObject(self, &nameKey);
}
@end
