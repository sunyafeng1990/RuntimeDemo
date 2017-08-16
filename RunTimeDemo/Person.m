//
//  Person.m
//  SaveImageToPhoneAlbum
//
//  Created by 孙亚锋 on 2017/8/9.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "Person.h"
#import "NSObject+ArchiverExtension.h"
#import <MJExtension.h>

@interface Person()<NSCoding>

@end

@implementation Person


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self syf_encode:aCoder]; //自己用tunime实现编码
//    [self mj_encode:aCoder];// MJ 编码
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        [self syf_decode:aDecoder];//自己用tunime实现解码
//        [self mj_decode:aDecoder];//MJ解码
    }
    
    return self;
}





+(void)run
{
    NSLog(@"跑步");
}

+(void)student
{
    NSLog(@"学习");
}
-(void)eat
{
    NSLog(@"吃饭");
}

-(void)sleep
{
    NSLog(@"睡觉");
}
@end
