//
//  Person.h
//  CoreDataTest
//
//  Created by user on 2/28/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Person : NSManagedObject

@property (strong) NSNumber * age;
@property (copy) NSString * name;

@end
