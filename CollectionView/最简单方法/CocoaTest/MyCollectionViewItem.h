//
//  MyCollectionViewItem.h
//  CocoaTest
//
//  Created by user on 14/07/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyCollectionViewItem : NSCollectionViewItem

@property (weak) IBOutlet NSTextField *titleLabel;
@property (weak) IBOutlet NSImageView *icon;

@end
