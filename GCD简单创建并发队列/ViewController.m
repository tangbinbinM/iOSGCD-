//
//  ViewController.m
//  GCD简单创建并发队列
//
//  Created by YiGuo on 2017/10/22.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.创建一个并发队列 DISPATCH_QUEUE_CONCURRENT
    //"666"队列标签，相当于队列名字
    dispatch_queue_t queue = dispatch_queue_create("666", DISPATCH_QUEUE_CONCURRENT);
    //把任务添加到队列中
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"111--%@--%zd",[NSThread currentThread],i);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"222--%@--%zd",[NSThread currentThread],i);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"333--%@--%zd",[NSThread currentThread],i);
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
