//
//  ViewController.m
//  CocoaTest
//
//  Created by user on 20/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FirstView.h"
#import "SecondView.h"
#import "ThirdView.h"

@interface ViewController()

@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSView *rootView;
@property (strong) FirstView *firstView;
@property (strong) SecondView *secondView;
@property (strong) ThirdView *thirdView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    _firstView = [[FirstView alloc]init];
    [_firstView setFrame:NSMakeRect(0, 0, 235, 183)];
    
    _secondView = [[SecondView alloc]init];
    [_secondView setFrame:NSMakeRect(0, 0, 235, 183)];
    
    _thirdView = [[ThirdView alloc]init];
    [_thirdView setFrame:NSMakeRect(0, 0, 235, 183)];
    
    [_rootView addSubview:_firstView];

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)chaneg:(id)sender {
    
    static int  i=1;
    i++;
    if(i>3){
        i=1;
    }
    
    NSImage *image = [NSImage imageNamed:[NSString stringWithFormat:@"%d",i]];
    _imageView.image = image;
    
    CATransition *transiton = [CATransition animation];
    transiton.duration = 1;
    transiton.startProgress = 0.3;
    transiton.endProgress = 0.8;
    // 私有的type有：cube，suckEffect，oglFlip，rippleEffect，pageCurl，pageUnCurl，cameraIrisHollowOpen，cameraIrisHollowClose
    transiton.type = kCATransitionReveal;
    
    [_imageView.layer addAnimation:transiton forKey:nil];
}
- (IBAction)change2:(id)sender {
    
    static int j = 1;
    j++;
    if(j>3){
        j=1;
    }
    
    if(j==1)
        [_rootView addSubview:_firstView];
    if(j==2)
        [_rootView addSubview:_secondView];
    if(j==3)
        [_rootView addSubview:_thirdView];
    
    CATransition *transiton = [CATransition animation];
    transiton.duration = 1;
    transiton.startProgress = 0;
    transiton.endProgress = 1;
    transiton.type = @"fade";
    
    [_rootView.layer addAnimation:transiton forKey:nil];
}

@end
