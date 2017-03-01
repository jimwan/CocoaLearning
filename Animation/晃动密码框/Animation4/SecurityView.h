//
//  SecurityView.h
//  Animation4
//
//  Created by user on 11/3/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SecurityView : NSView

@property (nonatomic, assign) BOOL encrypted;
@property (nonatomic, strong) NSString *password;

- (void)showPassword:(BOOL)show;
- (void)shackAnimation;

@end
