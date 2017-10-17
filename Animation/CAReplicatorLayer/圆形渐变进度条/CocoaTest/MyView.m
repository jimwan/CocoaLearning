//
//  MyView.m
//  CocoaTest
//
//  Created by user on 28/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "MyView.h"
#import <QuartzCore/QuartzCore.h>

@interface MyView()


@end

@implementation MyView


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
  
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = self.frame;
    layer.instanceCount = 12;
    layer.instanceDelay = 0.3;
    layer.instanceTransform = CATransform3DMakeRotation(30*M_PI/180, 0, 0, 1);
    
    layer.instanceAlphaOffset -=0.05;
    
    // 画一个小圆
    CALayer *beanLayer = [CALayer layer];
    //beanLayer.path = beanPath;
    beanLayer.frame = NSMakeRect(252, 339, 48, 48);
    beanLayer.cornerRadius = 24;
    beanLayer.backgroundColor = [NSColor colorWithSRGBRed:1 green:0 blue:0 alpha:1].CGColor;

    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.duration = 3.6;
    animation.repeatCount = HUGE_VAL;
    [beanLayer addAnimation:animation forKey:nil];
    
    
    [layer addSublayer:beanLayer];
    
    [self.layer addSublayer:layer];

}

@end
