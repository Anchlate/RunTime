//
//  Dog.m
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "Dog.h"
#import <objc/runtime.h>

void walkFunc(id self, SEL _cmd) {
    //let the dog walk
    NSLog(@".....没有实现Walk方法，执行了walk的替代方法");
    
}

void eatFunc(id self, SEL _cmd) {
    
    NSLog(@".....没有实现eat方法，执行了eat的替代方法");
    
}

@implementation Dog



+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSString * selString = NSStringFromSelector(sel);
    
    NSLog(@"......sel name: %@", selString);
    
    if ([selString isEqualToString:@"walk"]) {
        
        class_addMethod(self.class, @selector(walk), (IMP)walkFunc, "@:");
        
    } else if ([selString isEqualToString:@"eat"]) {
        
        class_addMethod(self.class, @selector(eat), (IMP)eatFunc, "@:");
    }
    
    
    return [super resolveInstanceMethod:sel];
}

//- (void)walk {
//    
//    NSLog(@".....狗，开始走了");
//    
//}




@end
