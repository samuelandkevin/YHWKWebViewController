//
//  ViewController.m
//  YHWKWebViewController
//
//  Created by YHIOS002 on 16/12/20.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)push:(id)sender {
    //    NSURL *url = [NSURL URLWithString:@"http://testapp.gtax.cn/taxtao/index_new"];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"JSWKWebView" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    ViewController2 *vc = [[ViewController2 alloc] init];
    vc.url = url;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
