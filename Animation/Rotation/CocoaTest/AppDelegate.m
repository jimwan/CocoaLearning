//
//  AppDelegate.m
//  CocoaTest
//
//  Created by user on 5/5/16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>


CGFloat DegreesToRadians(CGFloat degrees)
{
    return degrees * M_PI / 180;
}

NSNumber* DegreesToNumber(CGFloat degrees)
{
    return [NSNumber numberWithFloat:
            DegreesToRadians(degrees)];
}


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSView *circleProgressBarView;

@property (strong) CALayer *needLayer;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    }

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)awakeFromNib
{
    [_circleProgressBarView setWantsLayer:YES];
    CGColorRef black = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    CGColorRef orange = CGColorCreateGenericRGB(1.0, 0.56, 0.0, 1.0);

    [_circleProgressBarView.layer  setBackgroundColor:black];

    _needLayer = [CALayer layer];
    [_needLayer setFrame:CGRectMake(0, 0, self.circleProgressBarView.frame.size.width, self.circleProgressBarView.frame.size.height)];
    [_needLayer setCornerRadius:self.circleProgressBarView.frame.size.width/2];
    [_needLayer setBackgroundColor:orange];
    [_needLayer setMasksToBounds:YES];
    [_needLayer setDelegate:self];
    [_needLayer setNeedsDisplay];

    [_needLayer addAnimation:[self rotateAnimation] forKey:@"rotate"];


    [_circleProgressBarView.layer addSublayer:_needLayer];

    CFRelease(orange);
    CFRelease(black);

    [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(test) userInfo:nil repeats:YES];

}

-(void)test
{
    static int i = - 180;
    if(i<=180)
    {
        [slider setFloatValue:i];
        [self sliderChange:nil];
        i+=5;
    }
    else
        i= - 180;
}

- (IBAction)sliderChange:(id)sender;
{
    //[degreesTextLayer setString:[NSString stringWithFormat:@"%f", [slider floatValue]]];
    [_needLayer addAnimation:[self rotateAnimation] forKey:@"rotate"];
    [_needLayer setNeedsDisplay];
}


- (CAAnimation*)rotateAnimation;
{
    CABasicAnimation * animation;
    animation = [CABasicAnimation
                 animationWithKeyPath:@"transform.rotation.z"];

    NSLog(@"%f",[slider floatValue]);
    [animation setFromValue:DegreesToNumber(previousValue)];
    [animation setToValue:DegreesToNumber([slider floatValue])];

    [animation setRemovedOnCompletion:NO];
    [animation setFillMode:kCAFillModeForwards];

    previousValue = [slider floatValue];

    return animation;
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context;
{
    //static int i=0;

    if( layer == _needLayer )
    {
        CGMutablePathRef path = CGPathCreateMutable();

//        CGPathMoveToPoint(path,NULL, [_circleProgressBarView bounds].size.width/2.0, 0.0);
//        CGPathAddLineToPoint(path, NULL, [_circleProgressBarView bounds].size.width/2.0, [_circleProgressBarView bounds].size.height);
//
//        CGPathMoveToPoint(path,NULL, 0.0, [_circleProgressBarView bounds].size.height/2.0);
//        CGPathAddLineToPoint(path, NULL, [_circleProgressBarView bounds].size.width, [_circleProgressBarView bounds].size.height/2.0);

        CGFloat r = [_circleProgressBarView bounds].size.width/2.0;

        CGPathMoveToPoint(path,NULL, r, r);
        CGPathAddLineToPoint(path, NULL, r, r+r);
        //i+=5;

        CGColorRef black =
        CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
        CGContextSetStrokeColorWithColor(context, black);
        CFRelease(black);

        CGContextBeginPath(context);
        CGContextAddPath(context, path);

        CGContextSetLineWidth(context, 3.0);

        CGContextStrokePath(context);

        CFRelease(path);

    }
    
}
@end
