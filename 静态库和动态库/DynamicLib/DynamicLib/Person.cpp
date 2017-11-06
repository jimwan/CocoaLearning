//
//  Person.cpp
//  DynamicLib
//
//  Created by jim on 11/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#include <iostream>
#include "Person.hpp"

#define EXPORT __attribute__((visibility("default")))

EXPORT
Person::Person()
{
    char default_name[] = "<no value>";
    this->set_name(default_name);
}

EXPORT
Person::Person(char *name) {
    this->set_name(name);
}

EXPORT
Person* NewPerson(void) {
    return new Person;
}

EXPORT
Person* NewPersonWithName(char name[]) {
    return new Person(name);
}

EXPORT
void DeletePerson(Person* person) {
    delete person;
}

void Person::set_name(char name[]) {
    strcpy(_person_name, name);
}

char* Person::name(void) {
    return _person_name;
}


