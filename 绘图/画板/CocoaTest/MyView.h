//
//  MyView.h
//  CocoaTest
//
//  Created by user on 11/24/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyView : NSView

-(void)undo:(id)sender;
-(void)removeAll:(id)sender;
-(void)erase:(id)sender;
-(void)draw:(id)sender;
-(void)changeColor:(NSColor*)color;
-(void)save:(id)sender;

@end
