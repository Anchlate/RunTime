//
//  ViewController.m
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import "ANPerson+ANPersonCategory.h"
#import "ANPerson.h"

@interface ViewController ()

@property (nonatomic, retain) ANPerson *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [ANPerson new];
    
    self.person.dog = [ANDog new];
    self.person.dog.name = @"哈士奇";
    [self.person.dog run];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
