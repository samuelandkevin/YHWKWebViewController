//
//  ViewController2.m
//  MansoryTest
//
//  Created by YHIOS002 on 16/10/13.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super setUpJSName:@"Native"];
}

- (void)setUpWebView{
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(100, 100, 200, 300) configuration:self.configuration];

}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    [super userContentController:userContentController didReceiveScriptMessage:message];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
