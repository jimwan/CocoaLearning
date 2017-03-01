//
//  RoundView.m
//  Animation3
//
//  Created by user on 11/3/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "RoundView.h"
#import <QuartzCore/QuartzCore.h>

@implementation RoundView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    self.wantsLayer = YES;
    CALayer *layer1 = [CALayer layer];
    CALayer *layer2 = [CALayer layer];
    layer1.backgroundColor = [NSColor whiteColor].CGColor;
    layer1.frame = NSMakeRect(0, 0, 100, 100);
    layer2.backgroundColor = [NSColor redColor].CGColor;
    layer2.frame = NSMakeRect(40, 40, 100, 100);

    CAKeyframeAnimation *size = [CAKeyframeAnimation animation];
    size.keyPath = @"transform.scale";
    size.values = @[ @0, @1, @0, @0.5, @0 ];
    size.keyTimes = @[ @0, @(1 / 4.0),@(2 / 4.0),@(3 / 4.0), @1 ];
    size.duration = 3;

    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @1;
    zPosition.toValue = @-1;
    zPosition.duration = 3;

    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[zPosition,size];
    group.duration = 3;
    group.beginTime = 0;
    group.repeatCount = HUGE_VAL;


    [layer1 addAnimation:group forKey:@"bigbig"];


    CAKeyframeAnimation *size2 = [CAKeyframeAnimation animation];
    size2.keyPath = @"transform.scale";
    size2.values = @[ @0, @1, @0, @0.5, @0 ];
    size2.keyTimes = @[ @0, @(1 / 4.0),@(2 / 4.0),@(3 / 4.0), @1 ];
    size2.duration = 3;

    CABasicAnimation *zPosition2 = [CABasicAnimation animation];
    zPosition2.keyPath = @"zPosition";
    zPosition2.fromValue = @-1;
    zPosition2.toValue = @1;
    zPosition2.duration = 3;

    CAAnimationGroup *group2 = [[CAAnimationGroup alloc] init];
    group2.animations = @[zPosition2,size2];
    group2.duration = 3;
    group2.beginTime = 0;
    group2.repeatCount = HUGE_VAL;

    [layer2 addAnimation:group2 forKey:@"bigbig"];

    [self.layer addSublayer:layer1];
    [self.layer addSublayer:layer2];
}

@end
