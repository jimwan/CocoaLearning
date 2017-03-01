//
//  RoundView.m
//  Animation2
//
//  Created by user on 11/2/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "RoundView.h"
#import "QuartzCore/QuartzCore.h"

@implementation RoundView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    //self.layer.backgroundColor = [NSColor whiteColor].CGColor;
    for (int i = 0; i<24; i++) {
        NSColor *color = i%2 ? [NSColor greenColor]:[NSColor blueColor];
        CGFloat width = i%2 ? 3.0*2 :5.0*2;
        NSRect rect = NSMakeRect (176*cos(M_PI/2-i*2*M_PI/24)-width/2.0+220,
                                  176*sin(M_PI/2-i*2*M_PI/24)-width/2.0+220,
                                  width, width);
        NSBezierPath * path= [NSBezierPath bezierPathWithOvalInRect: rect];
        CGPathRef beanPath = [self copyQuartzPathFromNSBezierPath: path];
        CAShapeLayer *beanLayer = [CAShapeLayer layer];
        beanLayer.path = beanPath;
        beanLayer.fillColor = color.CGColor;

        CAKeyframeAnimation *beanAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        beanAnimation.duration = 6;
        beanAnimation.beginTime = CACurrentMediaTime() + 1.3f + 6*i*1.0/24;
        beanAnimation.autoreverses = NO;
        beanAnimation.repeatCount = HUGE_VALF;
        beanAnimation.values = @[ @0,@0,@1,@1];
        beanAnimation.keyTimes = @[ @0,@0.25,@0.5,@1 ];
        beanAnimation.calculationMode = kCAAnimationLinear;

        [beanLayer addAnimation:beanAnimation forKey:@""];


        self.wantsLayer = YES;
        [self.layer addSublayer:beanLayer];
    }
    self.layer.backgroundColor = [NSColor whiteColor].CGColor;
}

- (CGPathRef)copyQuartzPathFromNSBezierPath:(NSBezierPath *)bezierPath
{
    NSInteger i, numElements;

    // Need to begin a path here.
    CGPathRef           immutablePath = NULL;

    // Then draw the path elements.
    numElements = [bezierPath elementCount];
    if (numElements > 0) {
        CGMutablePathRef    path = CGPathCreateMutable();
        NSPoint             points[3];
        BOOL                didClosePath = YES;

        for (i = 0; i < numElements; i++) {
            switch ([bezierPath elementAtIndex:i associatedPoints:points]) {
                case NSMoveToBezierPathElement:
                    CGPathMoveToPoint(path, NULL, points[0].x, points[0].y);
                    break;

                case NSLineToBezierPathElement:
                    CGPathAddLineToPoint(path, NULL, points[0].x, points[0].y);
                    didClosePath = NO;
                    break;

                case NSCurveToBezierPathElement:
                    CGPathAddCurveToPoint(path, NULL, points[0].x, points[0].y,
                                          points[1].x, points[1].y,
                                          points[2].x, points[2].y);
                    didClosePath = NO;
                    break;

                case NSClosePathBezierPathElement:
                    CGPathCloseSubpath(path);
                    didClosePath = YES;
                    break;
            }
        }

        // Be sure the path is closed or Quartz may not do valid hit detection.
        if (!didClosePath) {
            CGPathCloseSubpath(path);
        }

        immutablePath = CGPathCreateCopy(path);
        CGPathRelease(path);
    }
    
    return immutablePath;
}

@end
