//
//  AppDelegate.m
//  CocoaTest
//
//  Created by user on 8/17/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import "MyView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet MyView *drawView;
@property (nonatomic,weak) IBOutlet NSColorWell *colorWell;

@end




@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



-(IBAction)undo:(id)sender
{
    [_drawView undo:sender];
}

-(IBAction)removeAll:(id)sender
{
    [_drawView removeAll:sender];
}

-(IBAction)erase:(id)sender
{
    [_drawView erase:sender];

}

-(IBAction)draw:(id)sender
{
    [_drawView draw:sender];

}

- (IBAction)changeColor:(id)sender
{
    [_drawView changeColor:self.colorWell.color];
}

-(IBAction)save:(id)sender
{
    [_drawView save:sender];

//    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithFocusedViewRect:[self.drawView bounds]];
//    NSData *exportedData = [rep representationUsingType:NSJPEGFileType properties:nil];
//    
//    NSSavePanel *savepanel = [NSSavePanel savePanel];
//    savepanel.title = @"Save chart";
//    
//    [savepanel setAllowedFileTypes:[NSArray arrayWithObject:@"jpg"]];
//    
//    [savepanel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result)
//     {
//         if (NSFileHandlingPanelOKButton == result)
//         {
//             NSURL* fileURL = [savepanel URL];
//             
//             if ([fileURL.pathExtension isEqualToString:@""])
//                 fileURL = [fileURL URLByAppendingPathExtension:@"jpg"];
//             
//             [exportedData writeToURL:fileURL atomically:YES];
//         }
//         
//     }];
}
@end
