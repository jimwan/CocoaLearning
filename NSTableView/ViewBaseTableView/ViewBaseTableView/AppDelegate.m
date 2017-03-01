//
//  AppDelegate.m
//  ViewBaseTableView
//
//  Created by user on 3/3/16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AppDelegate.h"
#import "MyCellView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong) NSArray *array;

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
    NSDictionary *dict1 = @{
                            @"name":@"jim",
                            @"age":@(18)
                            };

    NSDictionary *dict2 = @{
                            @"name":@"tom",
                            @"age":@(20)
                            };

    _array = [NSArray arrayWithObjects:dict1,dict2, nil];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [_array count];
}

/* This method is required for the "Cell Based" TableView, and is optional for the "View Based" TableView. If implemented in the latter case, the value will be set to the view at a given row/column if the view responds to -setObjectValue: (such as NSControl and NSTableCellView).
 */
- (nullable id)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    MyCellView *cellView = [tableView makeViewWithIdentifier:[tableColumn identifier] owner:self];
    if([[tableColumn identifier] isEqualToString:@"name"])
    {
        cellView.name.stringValue = [_array[row] objectForKey:[tableColumn identifier]];
    }
    else if([[tableColumn identifier] isEqualToString:@"age"])
    {
        cellView.age.stringValue = [_array[row] objectForKey:[tableColumn identifier]];
    }
    else
    {
        return nil;
    }
    return cellView;
}


@end
