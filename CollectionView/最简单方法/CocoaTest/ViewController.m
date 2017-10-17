//
//  ViewController.m
//  CocoaTest
//
//  Created by user on 01/07/2017.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "MyCollectionViewItem.h"

@interface ViewController() <NSCollectionViewDelegate,NSCollectionViewDataSource>
@property (weak) IBOutlet NSCollectionView *collectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.collectionView.backgroundColors = @[[NSColor whiteColor]];
    //NSNib *nib = [[NSNib alloc]initWithNibNamed:@"MyCollectionViewItem" bundle:nil];
    [self.collectionView registerClass:[MyCollectionViewItem class] forItemWithIdentifier:@"cell"];
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"cell" forIndexPath:indexPath];
    item.titleLabel.stringValue = @"asasa";
    item.icon.image = [NSImage imageNamed:NSImageNameFolder];
    return item;
}



@end
