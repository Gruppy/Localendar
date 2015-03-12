//
//  LOCEventWebViewController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/03/08.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCEventWebViewController.h"

@interface LOCEventWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation LOCEventWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:_urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
    if (_urlString) {
        NSURL *url = [NSURL URLWithString:_urlString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:urlRequest];
    }
}

@end
