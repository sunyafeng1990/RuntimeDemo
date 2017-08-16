//
//  NSObject+ArchiverExtension.h
//  RunTimeDemo
//
//  Created by 孙亚锋 on 2017/8/15.
//  Copyright © 2017年 LeiMo. All rights reserved.



//给NSObject做一个分类，让我们不需要每次都写这么一长串代码，只要实现一小段代码就可以让一个对象具有归解档的能力。

#import <Foundation/Foundation.h>

@interface NSObject (ArchiverExtension)

-(NSArray *)ignoreNames;

-(void)syf_encode:(NSCoder *)aCoder;
-(void)syf_decode:(NSCoder *)aDecoder;

@end
