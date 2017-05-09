//
//  UIButton+Callback.h
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Callback)

- (instancetype)initWithFrame:(CGRect)frame callback:(void (^)(UIButton *))callbackBlock;

@end
