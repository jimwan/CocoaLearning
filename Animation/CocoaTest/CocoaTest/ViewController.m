//
//  ViewController.m
//  CocoaTest
//
//  Created by user on 12/06/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController()

@property (weak) IBOutlet NSView *drawView;
@property (strong)  CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [NSColor redColor].CGColor;
    layer.frame =  NSMakeRect(100, 100, 100, 100);
    self.layer = layer;
    self.view.wantsLayer = YES;
    [self.view.layer addSublayer:layer];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)go:(id)sender {
   
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animation.toValue = @(0.5);
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:animation forKey:@"transform"];
    
}

@end
