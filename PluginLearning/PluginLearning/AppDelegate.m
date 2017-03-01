//
//  AppDelegate.m
//  PluginLearning
//
//  Created by user on 8/20/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "AppDelegate.h"
#import <PluginFramework/PluginFramework.h>

@interface AppDelegate ()
{
    NSArray *plugins;
}
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSPopUpButton *popupButton;

@end

@implementation AppDelegate

- (id)init
{
    self = [super init];
    if(self)
    {

    }
    return  self;
}

-(void)awakeFromNib
{
     plugins = [self loadPlugins];
    [_popupButton addItemWithTitle:[[plugins lastObject] name]];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application


}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


-(IBAction)do:(id)sender
{
    AbstractPlugin *plugin = [plugins lastObject];
    [plugin run:sender];
}

- (NSArray *)loadPlugins
{
    NSBundle *main = [NSBundle mainBundle];
    NSArray *allPlugins = [main pathsForResourcesOfType:@"bundle" inDirectory:@"."];

    NSMutableArray *availablePlugins = [[NSMutableArray alloc] init];

    id plugin = nil;
    NSBundle *pluginBundle = nil;

    for (NSString *path in allPlugins) {
        pluginBundle = [NSBundle bundleWithPath:path];
        if([pluginBundle load])
        {
            NSLog(@"load bundle %@",pluginBundle);
        }
        else
        {
            NSLog(@"load bundle failed");
        }

        Class principalClass = [pluginBundle principalClass];
        if (![principalClass isSubclassOfClass:[AbstractPlugin class]]) {
            continue;
        }

        plugin = [[principalClass alloc] init];

        if ([plugin respondsToSelector:@selector(run:)])
        {
            [availablePlugins addObject:plugin];
            NSLog(@" >> loading plugin %@ from %@", [plugin name], path);
        }

        plugin = nil;
        pluginBundle = nil;
    }
    
    return availablePlugins;
}

@end
