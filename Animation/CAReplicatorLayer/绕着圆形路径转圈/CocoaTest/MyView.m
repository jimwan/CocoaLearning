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

@property (strong) NSBezierPath *path;
@property (strong) CALayer *dotLayer;

@end

@implementation MyView


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
  
    
    
    // 画一个矩形框
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:NSMakeRect(100, 20, 400, 400) xRadius:200 yRadius:200];
    [[NSColor redColor]setStroke];
    [path stroke];
   
    self.path = path;
    
    // 画一个小球
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = NSMakeRect(90, 220, 20, 20);
    dotLayer.backgroundColor = [NSColor blackColor].CGColor;
    //[self.layer addSublayer:dotLayer];
    self.dotLayer = dotLayer;

    
 
    
//    [layer addSublayer:beanLayer];
//    
//    [self.layer addSublayer:layer];

}

- (IBAction)go:(id)sender
{
    //每一个小球行进路径
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = [self copyQuartzPathFromNSBezierPath:_path];
    animation.duration = 5;
    animation.repeatCount = HUGE_VAL;
    
    [_dotLayer addAnimation:animation forKey:nil];

    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = self.frame;
    layer.instanceCount = 5;
    layer.instanceDelay = 1;

    [self.layer addSublayer:layer];
    [layer addSublayer:_dotLayer];
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
