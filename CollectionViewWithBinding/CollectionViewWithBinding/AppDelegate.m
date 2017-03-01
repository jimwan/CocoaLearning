//
//  AppDelegate.m
//  CollectionViewWithBinding
//
//  Created by user on 9/21/16.
//  Copyright © 2016 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import "SelectedFolder.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSCollectionView *collectionView;

@property (nonatomic,strong) IBOutlet NSArrayController *foldersArray;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
   
    _collectionView.maxNumberOfRows = 1;
    _collectionView.maxNumberOfColumns = 0;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)add:(id)sender
{
    SelectedFolder *selectedFolder = [[SelectedFolder alloc]init];
    selectedFolder.folderIcon = [NSImage imageNamed:NSImageNameTrashEmpty];
    selectedFolder.folderText = @"Trash";
    [self.foldersArray addObject:selectedFolder];
}

@end
