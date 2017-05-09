
//
//  ANPerson+ANPersonCategory.m
//  01_runtime
//
//  Created by Qianrun on 17/3/13.
//  Copyright © 2017年 qianrun. All rights reserved.
//

#import "ANPerson+ANPersonCategory.h"
#import <objc/runtime.h>

@implementation ANPerson (ANPersonCategory)

#pragma mark -Setter
- (void)setDog:(ANDog *)dog {
    
    //这里使用方法的指针地址作为唯一的key
    objc_setAssociatedObject(self, @selector(dog), dog, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -Getter
- (ANDog *)dog {
    
    return objc_getAssociatedObject(self, @selector(dog));
}

@end
