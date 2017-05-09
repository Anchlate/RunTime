//
//  ANPerson+ANPersonCategory.h
//  01_runtime
//
//  Created by Qianrun on 17/3/13.
//  Copyright © 2017年 qianrun. All rights reserved.
//

#import "ANPerson.h"
#import "ANDog.h"

@interface ANPerson (ANPersonCategory)

@property (nonatomic, retain) ANDog *dog;

@end
