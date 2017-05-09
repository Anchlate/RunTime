//
//  ViewController.m
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Model.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
    
}

- (void)test0 {
    
    // 获取成员变量
    unsigned int outCount = 0;
    
    Ivar * ivars = class_copyIvarList([Model class], &outCount); // 获取所有成员变量
    
    for (unsigned int i = 0; i < outCount; i ++) {
        
        Ivar ivar = ivars[i];
        
        const char * name = ivar_getName(ivar); // 获取成员变量名
        const char * type = ivar_getTypeEncoding(ivar); // 获取成员变量类型编码（变量类型）
        NSLog(@"类型为 %s 的 %s ",type, name);
        
    }
    free(ivars);
}

- (void)test1 {
    
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList([Model class], &outCount); // 获取所有属性
    
    for (unsigned int i = 0; i < outCount; i ++) {
        
        objc_property_t property = properties[i];
        
        //属性名
        const char * name = property_getName(property);
        
        //属性描述
        const char * propertyAttr = property_getAttributes(property);
        
        NSLog(@"属性描述为 %s 的 %s ", propertyAttr, name);
        
        //属性的特性
        unsigned int attrCount = 0;
        objc_property_attribute_t * attrs = property_copyAttributeList(property, &attrCount);
        for (unsigned int j = 0; j < attrCount; j ++) {
            objc_property_attribute_t attr = attrs[j];
            const char * name = attr.name;
            const char * value = attr.value;
            NSLog(@"属性的描述：%s 值：%s", name, value);
        }
        free(attrs);
        NSLog(@"\n");
    }
    free(properties);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
