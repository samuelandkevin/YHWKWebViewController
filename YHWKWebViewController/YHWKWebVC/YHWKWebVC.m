//
//  YHWKWebVC.m
//  PikeWay
//
//  Created by YHIOS002 on 16/10/19.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import "YHWKWebVC.h"
//#import "YHLoadView.h"
#import "UIBarButtonItem+Custom.h"

@interface YHWKWebVC ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (nonatomic,assign) CGRect rect;
//@property (nonatomic,strong) YHLoadView *viewLoadFail;
//@property (nonatomic,strong) YHLoadView *viewLoading;
@end



@implementation YHWKWebVC

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame url:(NSURL *)url{
    if (self  = [super init]) {
        _url  = url;
        _rect = frame;
    }
    return self;
}

- (instancetype)initWithURL:(NSURL *)url{
    if(self = [super init]){
        _url = url;
    }
    return self;
}

#pragma mark - Life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    
}

- (void)dealloc{
    self.webView.UIDelegate = nil;
    self.webView.navigationDelegate = nil;
}

#pragma mark - Public
- (void)setUpNavigationBar{
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithTarget:self selector:@selector(onBack:)];
}

- (void)setUpWebView{
    self.webView = [[WKWebView alloc] initWithFrame:_rect configuration:self.configuration];

}

- (void)setUpJSName:(NSString *)name{
    [self.configuration.userContentController addScriptMessageHandler:self name:name];
}


- (void)initUI{
    
    [self setUpNavigationBar];
    
    self.configuration = [[WKWebViewConfiguration alloc] init];
    self.configuration.userContentController = [[WKUserContentController alloc] init];
    
    [self setUpJSName:@""];
    
    [self setUpWebView];
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
   
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView.backgroundColor = [UIColor colorWithWhite:0.957 alpha:1.000];
    
}



#pragma mark - Lazy Load
//- (YHLoadView *)viewLoading{
//    if (!_viewLoading) {
//        _viewLoading = [YHLoadView loading];
//        _viewLoading.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT/4);
//        [self.view addSubview:_viewLoading];
//    }
//    return _viewLoading;
//}
//
//- (YHLoadView *)viewLoadFail{
//    if(!_viewLoadFail){
//        _viewLoadFail = [YHLoadView loadFail];
//        _viewLoadFail.center = CGPointMake(self.view.centerX, SCREEN_HEIGHT/4);
//        WeakSelf
//        [_viewLoadFail onReloadHandler:^{
//            DDLog(@"onReload");
//            NSMutableURLRequest *mreq = [NSMutableURLRequest requestWithURL:weakSelf.url];
//            [weakSelf.webView loadRequest:mreq];
//        }];
//        [self.view addSubview:_viewLoadFail];
//    }
//    return _viewLoadFail;
//}

#pragma mark - Action
- (void)onBack:(id)sender{
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
    else{
        if(_presentedVC){
            [self dismissViewControllerAnimated:YES completion:NULL];
        }else
            [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
//    [self.viewLoading showLoadingView];
//    [self.viewLoadFail hideFailView];
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
//    [self.viewLoading hideLoadingView];
//    [self.viewLoadFail hideFailView];
    
    
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
//    [self.viewLoading hideLoadingView];
}

// 接收到服务器跳转请求之后再执行
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}

// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - WKUIDelegate
//1.创建一个新的WebVeiw
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    return nil;
}


//2.WebVeiw关闭（9.0中的新方法）
- (void)webViewDidClose:(WKWebView *)webView NS_AVAILABLE(10_11, 9_0){
    
}

//3.显示一个JS的Alert（与JS交互）
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    completionHandler();
}

//4.弹出一个输入框（与JS交互的）
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    
}

//5.显示一个确认框（JS的）
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    
}

#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
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
