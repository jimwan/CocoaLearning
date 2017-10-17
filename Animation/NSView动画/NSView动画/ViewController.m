//
//  ViewController.m
//  NSView动画
//
//  Created by user on 23/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController()<NSAnimationDelegate,CAAnimationDelegate>

@property (weak) IBOutlet MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

// 使用NSViewAnimation是真的会让NSView的位置移动了
- (void)moveView
{

    
    NSRect startFrame = _myView.frame;
    NSRect endFrame = NSMakeRect(startFrame.origin.x + 300, startFrame.origin.y, startFrame.size.width, startFrame.size.height);
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                _myView,NSViewAnimationTargetKey,
                                NSViewAnimationFadeInEffect,NSViewAnimationEffectKey,
                                [NSValue valueWithRect:startFrame],NSViewAnimationStartFrameKey,
                                [NSValue valueWithRect:endFrame],NSViewAnimationEndFrameKey, nil];
    NSViewAnimation *animation = [[NSViewAnimation alloc]initWithViewAnimations:@[dictionary]
                                  ];
    animation.duration = 3;
    animation.delegate = self;
    [animation setAnimationBlockingMode:NSAnimationNonblockingThreaded];
    [animation startAnimation];

}

// 1. Core Animation只能用于layer
// 2. 使用Core Animation只是假的位置移动，实际上NSView的位置还在原地。通过动画结束后点击事件mouseUp或者frame的值可以验证这一点
- (void)moveView2
{
    NSRect startFrame = _myView.frame;
    NSRect endFrame = NSMakeRect(startFrame.origin.x + 300, startFrame.origin.y, startFrame.size.width, startFrame.size.height);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 3;
    animation.delegate = self;
    animation.fromValue =  [NSValue valueWithRect:startFrame];
    animation.toValue =  [NSValue valueWithRect:endFrame];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [_myView.layer addAnimation:animation forKey:nil];
}

- (IBAction)go:(id)sender {
    
   // [self moveView];
    [self moveView2];
}


#pragma mark - NSAnimationDelegate -
- (void)animationDidEnd:(NSAnimation *)animation;
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",NSStringFromRect(_myView.frame));
}

#pragma mark - CAAnimationDelegate - 
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",NSStringFromRect(_myView.frame));
}
@end
