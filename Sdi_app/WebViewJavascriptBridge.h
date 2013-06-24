//
//  WebViewJavascriptBridge.h
//  Sdi_app
//
//  Created by Rohit on 12/06/13.
//  Copyright (c) 2013 SDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewJavascriptBridgeAbstract.h"

@interface WebViewJavascriptBridge : WebViewJavascriptBridgeAbstract <UIWebViewDelegate>

@property (nonatomic, WEAK_FALLBACK) UIWebView *webView;
@property (nonatomic, WEAK_FALLBACK) id <UIWebViewDelegate> webViewDelegate;

+ (instancetype)bridgeForWebView:(UIWebView*)webView handler:(WVJBHandler)handler;
+ (instancetype)bridgeForWebView:(UIWebView*)webView webViewDelegate:(id <UIWebViewDelegate>)webViewDelegate handler:(WVJBHandler)handler;

@end
