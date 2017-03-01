//
//  AbstractPlugin.h
//  PluginLearning
//
//  Created by user on 8/20/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractPlugin : NSObject

- (NSString *)name;
- (IBAction)run:(id)sender;

@end
