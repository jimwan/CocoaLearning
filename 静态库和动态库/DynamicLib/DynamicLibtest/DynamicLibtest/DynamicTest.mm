//
//  DynamicTest.m
//  DynamicLibtest
//
//  Created by jim on 11/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "DynamicTest.h"
#import <dlfcn.h>
#import "DynamicTest.h"

#include "Person.hpp"

@implementation DynamicTest

- (void)initDylib
{
    NSString *libPath = [[NSBundle mainBundle]pathForResource:@"libDynamicLib" ofType:@"dylib"];
    void *lib_handle = dlopen(libPath.UTF8String,RTLD_LOCAL);
    // Open the library.
    if (!lib_handle) {;
        exit(EXIT_FAILURE);
    }
    
    // Get the NewPerson function.
    Person_creator* newPerson = (Person_creator*)dlsym(lib_handle, "NewPerson");
    if (!newPerson) {
        exit(EXIT_FAILURE);
    }
    
    // Get the NewPersonWithName function.
    PersonWithName_creator* newPersonWithName = (PersonWithName_creator*)dlsym(lib_handle, "NewPersonWithName");
    if (!newPersonWithName) {
        exit(EXIT_FAILURE);
    }
    
    // Get the DeletePerson function.
    Person_disposer* deletePerson =
    (Person_disposer*)dlsym(lib_handle, "DeletePerson");
    if (!deletePerson) {
        exit(EXIT_FAILURE);
    }
    //NSLog(@"person 1: %s, person 2: %s ",newPerson()->name(),newPersonWithName((char*)"Jim")->name());
    
    Person* person1 = newPerson();
    char person_name[] = "Cendrine";
    Person* person2 = newPersonWithName(person_name);
    NSLog(@"person 1: %s, person 2: %s ",person1->name(),person2->name());

    // Use Person objects.
    char person1_name[] = "Floriane";
    person1->set_name(person1_name);
    char person2_name[] = "Marcelle";
    person2->set_name(person2_name);
    NSLog(@"person 1: %s, person 2: %s ",person1->name(),person2->name());

    // Destroy Person objects.
    DeletePerson(person1);
    DeletePerson(person2);
    
    // Close the library.
    if (dlclose(lib_handle) != 0) {
        exit(EXIT_FAILURE);
    }

}


- (void)outputInfo
{
    [self initDylib];
}


@end
