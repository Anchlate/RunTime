//
//  ViewController.m
//  01_runtime
//
//  Created by Qianrun on 16/10/27.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Callback.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(20, 80, 200, 30) callback:^(UIButton *button) {
        NSLog(@".........哈哈哈，被点击了");
    }];
    
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor redColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
