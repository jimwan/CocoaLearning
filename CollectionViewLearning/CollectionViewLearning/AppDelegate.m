//
//  AppDelegate.m
//  CollectionViewLearning
//
//  Created by user on 3/4/16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewItem.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSScrollView *scrollView;
@property (weak) IBOutlet NSCollectionView *collectionView;
@property (strong)  NSArray *collectionArray;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}




-(void)awakeFromNib
{
    [_scrollView setDrawsBackground:NO];
    [_collectionView setBackgroundColors:@[[NSColor clearColor],]];
    _collectionView.maxNumberOfRows = 2;

    NSImage *computerimage = [NSImage imageNamed:NSImageNameComputer];

    NSImage *folderimage = [NSImage imageNamed:NSImageNameFolder];

    NSImage *homeimage = [NSImage imageNamed:NSImageNameHomeTemplate];

    NSImage *listimage = [NSImage imageNamed:NSImageNameListViewTemplate];

    NSImage *networkimage = [NSImage imageNamed:NSImageNameNetwork];

    NSImage *shareimage = [NSImage imageNamed:NSImageNameShareTemplate];

    CollectionViewItem *itemPrototype = [[CollectionViewItem alloc]initWithNibName:@"CollectionViewItem" bundle:nil];

    _collectionView.itemPrototype = itemPrototype;

    NSDictionary *item1 =@{

                           // @"title":@"computer",

                           @"image":computerimage

                           };


    NSDictionary *item2 =@{

                           //  @"title":@"folder",

                           @"image":folderimage

                           };


    NSDictionary *item3 =@{

                           //   @"title":@"home",

                           @"image":homeimage

                           };


    NSDictionary *item4 =@{

                           //  @"title":@"list",

                           @"image":listimage

                           };


    NSDictionary *item5 =@{

                           // @"title":@"network",

                           @"image":networkimage

                           };


    NSDictionary *item6 =@{

                           //  @"title":@"share",

                           @"image":shareimage
                           
                           };
    
    
    _collectionArray = @[
                         
                         item1,
                         item2,
                         item3,
                         item4,
                         item5,
                         item6
                         
                         ];
    
    _collectionView.content = _collectionArray;

}
@end
