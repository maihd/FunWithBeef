// CppLib.cpp : Defines the functions for the static library.
//

#include "pch.h"
#include "framework.h"

#include <stdio.h>

class CppLib
{
public:
    // TODO: This is an example of a library function
    static void Intro(void)
    {
        printf("Hello from C++\n");
    }
};

class HelloClass
{
public:
    const char* message;

public:
    static HelloClass* Create()
    {
        printf("Hello from HelloClass constructor\n");
        
        auto helloClass = new HelloClass();
        helloClass->message = "An secret message";
    }
    
    static void Destroy(HelloClass* helloClass)
    {
        printf("Goodbye from HelloClass destructor\n");
        delete helloClass;
    }

public:
    void SayHi()
    {
        printf("HelloClass say hi\n");
    }

    void ShowMessage()
    {
        printf("Message from HelloClass: %s\n", message);
    }
};

extern "C" void cIntro()
{
    printf("Hello from C\n");
    CppLib::Intro();

    HelloClass helloClass;
    helloClass.ShowMessage();
}
