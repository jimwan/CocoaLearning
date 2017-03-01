//
//  RoundCornerView.m
//  RoundCorner
//
//  Created by user on 11/1/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "RoundCornerView.h"
#import "XUIKit/XUIKit.h"
#import <QuartzCore/QuartzCore.h>

@implementation RoundCornerView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSBezierPath * path = [NSBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:XUIRectCornerBottomLeft|XUIRectCornerBottomRight|XUIRectCornerTopLeft cornerRadii:CGSizeMake(100, 100)];
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = [path CGPath];
    self.wantsLayer = TRUE;
    self.layer.mask = layer;
    self.layer.backgroundColor = [NSColor colorWithSRGBRed:132/255.0 green:223/255.0 blue:255/255.0 alpha:1.0f].CGColor;
}

@end
