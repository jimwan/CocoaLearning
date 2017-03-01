//
//  AppDelegate.m
//  ArrayControllerAndTableView
//
//  Created by user on 8/21/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;

@property (weak) IBOutlet NSTextField *name;
@property (weak) IBOutlet NSTextField *age;

@property (weak) IBOutlet NSArrayController *arrayController;


@property (strong) Person *person;
@property (nonatomic,strong) NSMutableArray *employees;

@end

@implementation AppDelegate

/**** please remember to set Class to Person for Array Controller  ****/
-(void)awakeFromNib
{
     _employees = [[NSMutableArray alloc]init];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(IBAction)add:(id)sender
{
    _person = [[Person alloc]initWithName:[_name stringValue] andAge:[[_age stringValue]integerValue]];
    [_arrayController addObject:_person];
}

-(IBAction)del:(id)sender
{
    _person = [_employees objectAtIndex:[_tableView selectedRow]];
    [_arrayController removeObject:_person];
}
@end
