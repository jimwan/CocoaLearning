//
//  ViewController.m
//  圆形进度条
//
//  Created by user on 26/05/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController()

@property (weak) IBOutlet NSSlider *silder;
@property (weak) IBOutlet ProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [_silder setContinuous:YES];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)sliderValueChange:(id)sender
{
    [_progressView setProgressValue:_silder.doubleValue];
}
@end
