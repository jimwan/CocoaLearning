//
//  RoundView.m
//  DrawLine
//
//  Created by user on 11/3/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "RoundView.h"

@implementation RoundView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    self.wantsLayer = YES;

    NSBezierPath *path = [[NSBezierPath alloc]init];

    // control point 1 and point 2 is the same
    [path moveToPoint:NSMakePoint(0, 180)];
    [path curveToPoint:NSMakePoint(240, 180) controlPoint1:NSMakePoint(120, 360) controlPoint2:NSMakePoint(120, 360)];
    [[NSColor redColor]set];
    [path moveToPoint:NSMakePoint(240, 180)];
    [path curveToPoint:NSMakePoint(480, 180) controlPoint1:NSMakePoint(360, 0) controlPoint2:NSMakePoint(360, 0)];
    [path stroke];

    [path moveToPoint:NSMakePoint(0, 180)];
    [path lineToPoint:NSMakePoint(480, 180)];
    [path stroke];



    // control point 1 and point 2 is different
    [path moveToPoint:NSMakePoint(0, 400)];
    [path curveToPoint:NSMakePoint(480, 500) controlPoint1:NSMakePoint(200, 600) controlPoint2:NSMakePoint(280, 300)];
    [path stroke];

    [path moveToPoint:NSMakePoint(0, 400)];
    [path lineToPoint:NSMakePoint(480, 500)];
    [path stroke];

    [[NSColor whiteColor]set];
    [path closePath];
    [path fill];


    // 画切线
    NSBezierPath *path2 = [[NSBezierPath alloc]init];
    CGFloat pattern[2] = {5.0,5.0};
    [path2 moveToPoint:NSMakePoint(0, 180)];
    [path2 lineToPoint:NSMakePoint(120, 360)];
    [path2 moveToPoint:NSMakePoint(240, 180)];
    [path2 lineToPoint:NSMakePoint(120, 360)];

    [path2 moveToPoint:NSMakePoint(240, 180)];
    [path2 lineToPoint:NSMakePoint(360, 0)];
    [path2 moveToPoint:NSMakePoint(480, 180)];
    [path2 lineToPoint:NSMakePoint(360, 0)];


    [path2 moveToPoint:NSMakePoint(0, 400)];
    [path2 lineToPoint:NSMakePoint(200, 600)];
    [path2 moveToPoint:NSMakePoint(480, 500)];
    [path2 lineToPoint:NSMakePoint(280, 300)];


    [[NSColor blueColor]set];
    [path2 setLineDash:pattern count:2 phase:0];
    [path2 stroke];
}

@end
