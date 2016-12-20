//
//  YHWKWebVC.h
//  PikeWay
//
//  Created by YHIOS002 on 16/10/19.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface YHWKWebVC : UIViewController

@property (nonatomic,strong) NSURL *url;
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) WKWebViewConfiguration *configuration;
@property (nonatomic,assign) BOOL presentedVC;
@property (nonatomic,strong) JSContext *jsContext;

- (instancetype)initWithFrame:(CGRect)frame url:(NSURL *)url;

//Mark:提供父类的方法,子类可以根据需求重定义
- (void)setUpNavigationBar;
- (void)setUpWebView;
- (void)setUpJSName:(NSString *)name;


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
@end
