
//
//  UIButton+Callback.m
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "UIButton+Callback.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, copy) void (^callbackBlock)(UIButton * button);

@end

@implementation UIButton (Callback)

- (void (^)(UIButton *))callbackBlock {
    return objc_getAssociatedObject(self, @selector(callbackBlock));
}

- (void)setCallbackBlock:(void (^)(UIButton *))callbackBlock {
    objc_setAssociatedObject(self, @selector(callbackBlock), callbackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (instancetype)initWithFrame:(CGRect)frame callback:(void (^)(UIButton *))callbackBlock {
    
    // weakSelf 内存问题
    
    if (self = [super initWithFrame:frame]) {
        self.callbackBlock = callbackBlock;
        [self addTarget:self action:@selector(didClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)didClickAction:(UIButton *)button {
    self.callbackBlock(button);
}


@end
