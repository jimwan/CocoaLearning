//
//  SecurityView.m
//  Animation4
//
//  Created by user on 11/3/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "SecurityView.h"
#import <QuartzCore/QuartzCore.h>

@interface SecurityView()

@property (nonatomic, strong) NSImageView *lockView;
@property (nonatomic, strong) NSSecureTextField *inputSecurityBox;
@property (nonatomic, strong) NSTextField *inputBox;

@end

@implementation SecurityView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    // Drawing code here.
    self.wantsLayer = YES;
    self.layer.cornerRadius = 8.0f;
    self.layer.borderColor = [NSColor colorWithSRGBRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1.0f].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.backgroundColor = [NSColor whiteColor].CGColor;

    if(!_lockView)
    {
        _lockView  = [[NSImageView alloc]initWithFrame:NSMakeRect(10, 10, 20, 20)];
        [self addSubview:_lockView];
    }
    _lockView.animator.image = self.encrypted ? [NSImage imageNamed:NSImageNameLockLockedTemplate]:[NSImage imageNamed:NSImageNameLockUnlockedTemplate] ;


    if(!_inputSecurityBox)
    {
        _inputSecurityBox = [[NSSecureTextField alloc]initWithFrame:NSMakeRect(30, 8, self.frame.size.width-26, self.frame.size.height-20)];
        _inputSecurityBox.focusRingType = NSFocusRingTypeNone;
        [_inputSecurityBox setDrawsBackground:NO];
        [_inputSecurityBox setBezeled:NO];
        [_inputSecurityBox.cell setUsesSingleLineMode:YES];
        [_inputSecurityBox.cell setWraps:NO];
        [_inputSecurityBox.cell setScrollable:YES];
        [_inputSecurityBox setFont:[NSFont fontWithName:@"Helvetica Neue" size:20]];
        [self addSubview:_inputSecurityBox];
    }

    if(!_inputBox)
    {
        _inputBox = [[NSTextField alloc]initWithFrame:NSMakeRect(30, 8, self.frame.size.width-26, self.frame.size.height-20)];
        _inputBox.focusRingType = NSFocusRingTypeNone;
        [_inputBox setDrawsBackground:NO];
        [_inputBox setBezeled:NO];
        [_inputBox.cell setUsesSingleLineMode:YES];
        [_inputBox.cell setWraps:NO];
        [_inputBox.cell setScrollable:YES];
        [_inputBox setFont:[NSFont fontWithName:@"Helvetica Neue" size:15]];
        [self addSubview:_inputBox];
    }

}


- (NSString*)password
{
    if(self.encrypted)
    {
        self.password = _inputSecurityBox.stringValue;
        return _inputSecurityBox.stringValue;
    }
    else
    {
        self.password =  _inputBox.stringValue;
        return _inputBox.stringValue;
    }
}

- (void)shackAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;

    animation.additive = YES;

    [self.layer addAnimation:animation forKey:@"shake"];
}

- (void)showPassword:(BOOL)show
{
    self.encrypted = !show;
    if(show)
    {
        //self.text = _inputSecurityBox.stringValue;
        _inputBox.hidden = NO;
        _inputBox.stringValue = _inputSecurityBox.stringValue;
        _inputSecurityBox.hidden = YES;
        _inputSecurityBox.stringValue = @"";
    }
    else
    {
        //self.text = _inputBox.stringValue;
        _inputSecurityBox.hidden = NO;
        _inputSecurityBox.stringValue = _inputBox.stringValue;
        _inputBox.hidden = YES;
        _inputBox.stringValue = @"";
    }
    [self setNeedsDisplay:YES];
}
@end
