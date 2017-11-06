//
//  Person.hpp
//  DynamicLib
//
//  Created by jim on 11/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//


class Person {
private:
    char _person_name[30];
public:
    Person();
    Person(char* name);
    //void outputInfo();
    virtual void set_name(char person_name[]);
    virtual char* name();
};

// Constructor functions and function types.
extern "C" Person* NewPerson(void);
typedef Person * Person_creator(void);
extern "C" Person* NewPersonWithName(char name[]);
typedef Person * PersonWithName_creator(char name[]);

// Destructor function and function type.
extern "C" void DeletePerson(Person* person);
typedef void Person_disposer(Person*);


