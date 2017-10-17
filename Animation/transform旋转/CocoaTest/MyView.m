//
//  MyView.m
//  CocoaTest
//
//  Created by user on 26/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "MyView.h"
#import <QuartzCore/QuartzCore.h>

#define DegreesToRadians(degrees) (degrees * M_PI / 180)

@interface MyView()

@property (weak) IBOutlet NSImageView *pigView;
@property (weak) IBOutlet NSImageView *pigView2;
@property (weak) IBOutlet NSSlider *slider;

@end

@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    _slider.doubleValue = 0 ;
    // Drawing code here.
//    _pigView.wantsLayer  = YES;
    _pigView.layer.contentsRect = NSMakeRect(0, 0, 1,1);
    _pigView.layer.position = NSMakePoint(100, 100);
    //_pigView.layer.anchorPoint = NSMakePoint(0, 0);
    
//    _pigView2.wantsLayer  = YES;
//    _pigView2.layer.contentsRect = NSMakeRect(0, 0, 1, 0.5);
//    _pigView2.layer.position = NSMakePoint(100, 33);
    //_pigView2.layer.anchorPoint = NSMakePoint(0, 0);
}

- (void)rotate:(CGFloat)degree {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    animation.toValue = [NSNumber numberWithFloat: M_PI*2];
    animation.duration = 1;
    animation.removedOnCompletion =  NO;
    animation.fillMode = kCAFillModeForwards;
    
    //[_pigView.layer addAnimation:animation forKey:nil];
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/450.0;
    _pigView.layer.transform = CATransform3DRotate(transform, DegreesToRadians(degree), 1, 0, 0);
}

- (IBAction)change:(id)sender {
    
    [self rotate:_slider.doubleValue];
}


@end
