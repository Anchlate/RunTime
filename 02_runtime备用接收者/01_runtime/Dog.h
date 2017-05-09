//
//  Dog.h
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cat.h"

@interface Dog : NSObject

@property (nonatomic, retain) Cat *cat;

- (void)walk;
- (void)eat;

@end
