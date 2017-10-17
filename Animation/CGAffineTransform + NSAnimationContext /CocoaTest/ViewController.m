//
//  ViewController.m
//  CocoaTest
//
//  Created by user on 2017/5/17.
//  Copyright © 2017年 user. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self.view setWantsLayer:YES];
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.

}

- (IBAction)animate:(id)sender
{
    CGAffineTransform tranform = CGAffineTransformMakeTranslation(100, 100);
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.allowsImplicitAnimation = YES;
        context.duration = 3;
        
        [self.view.layer setAffineTransform:tranform];

    } completionHandler:^{
        
    }];
}
@end
