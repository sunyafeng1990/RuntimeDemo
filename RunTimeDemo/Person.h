//
//  Person.h
//  SaveImageToPhoneAlbum
//
//  Created by 孙亚锋 on 2017/8/9.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : NSObject

@property(nonatomic,copy)NSString * name;

@property(nonatomic,copy)NSString *address;

@property(nonatomic,assign)CGFloat height;






+(void)run;

+(void)student;


-(void)eat;

-(void)sleep;




@end
