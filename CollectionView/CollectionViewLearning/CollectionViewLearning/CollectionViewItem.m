//
//  CollectionViewItem.m
//  CollectionViewLearning
//
//  Created by user on 3/4/16.
//  Copyright © 2016 user. All rights reserved.
//

#import "CollectionViewItem.h"

@interface CollectionViewItem ()

@property (weak) IBOutlet NSImageView *collImageView;

@end

@implementation CollectionViewItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    if(!self.representedObject){
        return;
    }

    self.collImageView.image = [self.representedObject objectForKey:@"image"];
}

@end
