//
//  MyCellView.h
//  ViewBaseTableView
//
//  Created by user on 3/3/16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyCellView : NSTableCellView

@property (weak)IBOutlet NSTextField *name;
@property (weak)IBOutlet NSTextField *age;
@end
