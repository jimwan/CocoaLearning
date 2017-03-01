//
//  AppDelegate.m
//  CocoaTest2
//
//  Created by user on 6/6/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "AppDelegate.h"



@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;


@property (strong) QLPreviewPanel *previewPanel;


@end

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)awakeFromNib
{

}


- (IBAction)test:(id)sender
{

    if ([QLPreviewPanel sharedPreviewPanelExists] && [[QLPreviewPanel sharedPreviewPanel] isVisible])
    {
        [[QLPreviewPanel sharedPreviewPanel] orderOut:nil];
    }
    else
    {
        [[QLPreviewPanel sharedPreviewPanel] makeKeyAndOrderFront:nil];
    }

}

- (IBAction)test2:(id)sender
{
}

#pragma mark - Quick Look panel support

- (BOOL)acceptsPreviewPanelControl:(QLPreviewPanel *)panel
{
    return YES;
}

- (void)beginPreviewPanelControl:(QLPreviewPanel *)panel
{
    // This document is now responsible of the preview panel
    // It is allowed to set the delegate, data source and refresh panel.
    //
    _previewPanel = panel;
    panel.delegate = self;
    panel.dataSource = self;
}

- (void)endPreviewPanelControl:(QLPreviewPanel *)panel
{
    // This document loses its responsisibility on the preview panel
    // Until the next call to -beginPreviewPanelControl: it must not
    // change the panel's delegate, data source or refresh it.
    //
    _previewPanel = nil;
}


#pragma mark - QLPreviewPanelDataSource

- (NSInteger)numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel *)panel
{
    return 1;
}

- (id <QLPreviewItem>)previewPanel:(QLPreviewPanel *)panel previewItemAtIndex:(NSInteger)index
{


    return [NSURL fileURLWithPath:@"/Users/user/Desktop/Archive.zip"];
}


//#pragma mark - QLPreviewPanelDelegate
//
//- (BOOL)previewPanel:(QLPreviewPanel *)panel handleEvent:(NSEvent *)event
//{
//    // redirect all key down events to the table view
//    if ([event type] == NSKeyDown)
//    {
//        [self.downloadsTableView keyDown:event];
//        return YES;
//    }
//    return NO;
//}
//
//// This delegate method provides the rect on screen from which the panel will zoom.
//- (NSRect)previewPanel:(QLPreviewPanel *)panel sourceFrameOnScreenForPreviewItem:(id <QLPreviewItem>)item
//{
//    NSInteger index = [self.downloads indexOfObject:item];
//    if (index == NSNotFound)
//    {
//        return NSZeroRect;
//    }
//
//    NSRect iconRect = [self.downloadsTableView frameOfCellAtColumn:0 row:index];
//
//    // check that the icon rect is visible on screen
//    NSRect visibleRect = [self.downloadsTableView visibleRect];
//
//    if (!NSIntersectsRect(visibleRect, iconRect))
//    {
//        return NSZeroRect;
//    }
//
//    // convert icon rect to screen coordinates
//    iconRect = [self.downloadsTableView convertRectToBacking:iconRect];
//    NSRect test = [[self.downloadsTableView window] convertRectToScreen:iconRect];
//    iconRect.origin = test.origin;
//
//    return iconRect;
//}

// this delegate method provides a transition image between the table view and the preview panel
//
//- (id)previewPanel:(QLPreviewPanel *)panel transitionImageForPreviewItem:(id <QLPreviewItem>)item contentRect:(NSRect *)contentRect
//{
//    DownloadItem *downloadItem = (DownloadItem *)item;
//
//    return downloadItem.iconImage;
//}

@end
