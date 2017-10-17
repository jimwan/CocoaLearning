//
//  ViewController.m
//  Marching Ants
//
//  Created by user on 2017/5/16.
//  Copyright © 2017年 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    shapeLayer = [CAShapeLayer layer];
    CGRect shapeRect = CGRectMake(0.0f, 0.0f, 200.0f, 100.0f);
    [shapeLayer setBounds:shapeRect];
    [shapeLayer setPosition:CGPointMake(160.0f, 140.0f)];
    [shapeLayer setFillColor:[[NSColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[NSColor blackColor] CGColor]];
    [shapeLayer setLineWidth:1.0f];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:10],
      [NSNumber numberWithInt:5],
      nil]];
    
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, shapeRect);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // Set the layer's contents
    //[shapeLayer setContents:(id)[[NSImage imageNamed:@"balloon.jpg"] CGImage]];
    [self.view setWantsLayer:YES];
    [[[self view] layer] addSublayer:shapeLayer];
}

- (IBAction)toggleMarching:(id)sender;
{
    if ([shapeLayer animationForKey:@"linePhase"])
        [shapeLayer removeAnimationForKey:@"linePhase"];
    else {
        CABasicAnimation *dashAnimation;
        dashAnimation = [CABasicAnimation
                         animationWithKeyPath:@"lineDashPhase"];
        
        [dashAnimation setFromValue:[NSNumber numberWithFloat:0.0f]];
        [dashAnimation setToValue:[NSNumber numberWithFloat:15.0f]];
        [dashAnimation setDuration:0.75f];
        [dashAnimation setRepeatCount:10000];
        
        [shapeLayer addAnimation:dashAnimation forKey:@"linePhase"];
        
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
