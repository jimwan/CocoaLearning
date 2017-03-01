//
//  AppDelegate.m
//  Animation2
//
//  Created by user on 11/1/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import "QuartzCore/QuartzCore.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *flyingBox;
@property (weak) IBOutlet NSView *view;
@property (weak) IBOutlet NSView *roundView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (void)fadeInAnimation
{
    CABasicAnimation *titleAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    titleAnimation1.duration = 1.0f;
    titleAnimation1.autoreverses = NO;
    titleAnimation1.repeatCount = 1;
    titleAnimation1.fromValue = @(0);
    titleAnimation1.toValue = @(1.0f);
    titleAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    titleAnimation1.delegate = self;
    [self.flyingBox.layer addAnimation:titleAnimation1 forKey:@""];

    CABasicAnimation *titleAnimation2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    titleAnimation2.duration = 1.0f;
    titleAnimation2.autoreverses = NO;
    titleAnimation2.repeatCount = 1;
    titleAnimation2.fromValue = @(self.flyingBox.frame.origin.y);
    titleAnimation2.toValue = @(self.flyingBox.frame.origin.y+120);
    titleAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    titleAnimation2.delegate = self;
    [self.flyingBox.layer addAnimation:titleAnimation2 forKey:@""];
}

- (IBAction)go:(id)sender {
    self.view.wantsLayer = YES;
    [self fadeInAnimation];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

    NSLog(@"%@",anim.timingFunction);

}
@end
