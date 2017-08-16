//
//  NSObject+ArchiverExtension.m
//  RunTimeDemo
//
//  Created by 孙亚锋 on 2017/8/15.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "NSObject+ArchiverExtension.h"
#import <objc/runtime.h>

@implementation NSObject (ArchiverExtension)
//-(NSArray *)ignoreNames
//{
//    unsigned int count;
//    Ivar *ivarList = class_copyIvarList([self class], &count);
//    NSMutableArray *properNames =[NSMutableArray array];
//    for (int i = 0; i < count; i++) {
//        Ivar ivar = ivarList[i];
//        
//        // 2.获得成员属性名
//        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        
//        // 3.除去下划线，从第一个角标开始截取
//        NSString *key = [name substringFromIndex:1];
//        
//        [properNames addObject:key];
//    }
//    
//    return [properNames copy];
    
//}



-(void)syf_encode:(NSCoder *)aCoder
{
     // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    
    while (c && c != [NSObject class]) {
        unsigned int count = 0;
        //获取所有成员属性 存放的数组
        Ivar *ivars = class_copyIvarList(c, &count);
        for (int i = 0; i< count; i++) {
            
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoreNames)]) {
                if([[self ignoreNames] containsObject:key])continue;
            }
            
               // 如果有实现该方法再去调用
            id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
            
        }
        
        free(ivars);
        c = [c superclass];
    }
    
    
}
-(void)syf_decode:(NSCoder *)aDecoder
{
     // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    
    while (c && c != [NSObject class]) {
        unsigned int outCount = 0;
        
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for (int i = 0; i< outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //如果有实现该方法再去调用
            if ([self respondsToSelector:@selector(ignoreNames)]) {
                if ([[self ignoreNames]containsObject:key]) continue;
             }
            
            id value = [aDecoder decodeObjectForKey:key];
            
            [self setValue:value forKey:key];
            
        }
        free(ivars);
        
        c = [c superclass];
        
    }
    
}
@end
