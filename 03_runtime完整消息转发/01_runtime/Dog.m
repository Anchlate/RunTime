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


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature *sig = [Dog methodSignatureForSelector:aSelector];
    
    if (sig) return sig;
    
    sig = [self.dogOwner methodSignatureForSelector:aSelector];
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([DogOwner instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self.dogOwner];
    }
}

/*
- (void)walk {
    
    NSLog(@"狗走了");
}
*/


#pragma mark -Getter
- (DogOwner *)dogOwner {
    
    if (!_dogOwner) {
        _dogOwner = [DogOwner new];
    }
    return _dogOwner;
}

@end
