//
//  ViewController.m
//  DYToolsDemo
//
//  Created by wdy on 2017/6/26.
//  Copyright © 2017年 wdy. All rights reserved.
//

#import "ViewController.h"
#import "DYTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *string = @"123";
    NSLog(@"append -> %@",[string append:@"456"]);
    NSLog(@"replace -> %@", [string replace:@"2" v:@"4"]);
}

@end
