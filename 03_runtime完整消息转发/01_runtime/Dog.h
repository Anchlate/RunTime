//
//  Dog.h
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DogOwner.h"

@interface Dog : NSObject

@property (nonatomic, retain) DogOwner *dogOwner;

- (void)walk;
- (void)eat;

@end
