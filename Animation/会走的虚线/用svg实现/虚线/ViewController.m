//
//  ViewController.m
//  虚线
//
//  Created by user on 2017/5/12.
//  Copyright © 2017年 user. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController()

@property (weak) IBOutlet WebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    [_webview setDrawsBackground:NO];
    [_webview setUIDelegate:self];
    [_webview  setEditingDelegate:self];
    [_webview mainFrame].frameView.allowsScrolling = NO;
    NSString* htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"1" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
    [[_webview mainFrame] loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
    [[_webview windowScriptObject] setValue:self forKey:@"objcConnector"];
   
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
