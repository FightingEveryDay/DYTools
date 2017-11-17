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
    NSLog(@"append -> %@",[string dy_append:@"456"]);
    NSLog(@"replace -> %@", [string dy_replace:@"2" v:@"4"]);
    UIColor *hexColor = [UIColor dy_colorWithHexString:@""];
    self.view.backgroundColor = hexColor;
    self.view.backgroundColor = DY_HEXCOLOR(@"111111");
}

@end
