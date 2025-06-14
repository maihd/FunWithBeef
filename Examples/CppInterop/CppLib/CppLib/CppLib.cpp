// CppLib.cpp : Defines the functions for the static library.
//

#include "pch.h"
#include "framework.h"

#include <stdio.h>
#include <stdint.h>
#include <string>

namespace CppLibNamespace
{
    void Outro(void)
    {
        printf("Welldone!\n");
    }
}

namespace CStrContainer
{
    struct CStr
    {
        const char* ptr;
    };
}

struct __declspec(dllexport) HelloClass
{
public: // bf::Object fields (required to C++ class interop and inheritance in Beef)
    //int mClassVData;

#if BF_ENABLE_OBJECT_DEBUG_FLAGS || 1
    size_t mDbgAllocInfo;
#endif

public:
    const char* message = nullptr;

public:
    static HelloClass* Create(void)
    {
        printf("Hello from HelloClass constructor\n");
        
        auto helloClass = new HelloClass();
        helloClass->message = "An secret message";

        return helloClass;
    }
    
    static void Destroy(HelloClass* helloClass)
    {
        printf("Goodbye from HelloClass destructor\n");
        delete helloClass;
    }

public:
    void SetMessage(char const* message)
    {
        this->message = message;
    }

    void SetMessage(const CStrContainer::CStr& message)
    {
        this->message = message.ptr;
    }

public:
    virtual void SayHi()
    {
        printf("HelloClass say hi\n");
    }

    virtual void ShowMessage()
    {
        printf("Message from HelloClass: %s\n", message);
    }
};


class __declspec(dllexport) NativeCppClass
{
public:
    const char* message = nullptr;

public:
    virtual void SayHi()
    {
        printf("NativeCppClass say hi: %s\n", message);
    }
};

extern "C"
__declspec(dllexport) NativeCppClass* NativeCppClass_Create(void)
{
    printf("Hello from NativeCppClass constructor\n");

    auto nativeCppClass = new NativeCppClass();
    nativeCppClass->message = "An secret message";

    return nativeCppClass;
}

extern "C"
__declspec(dllexport) void NativeCppClass_Destroy(NativeCppClass* nativeCppClass)
{
    printf("Goodbye from NativeCppClass destructor\n");
    delete nativeCppClass;
}

extern "C"
__declspec(dllexport) void* NativeCppClass_GetSayHiPtr()
{
    printf("NativeCppClass_GetSayHiPtr\n");
    auto methodPtr = &NativeCppClass::SayHi;
    return reinterpret_cast<void*&>(methodPtr);
}


class CppLib
{
public:
    // TODO: This is an example of a library function
    static void Intro(void)
    {
        printf("Hello from C++\n");

        printf("NativeCppClass size: %zu\n", sizeof(NativeCppClass));
        printf("NativeCppClass message offset: %zu\n", offsetof(NativeCppClass, message));
    }
};

extern "C" void cIntro()
{
    printf("Hello from C\n");
    CppLib::Intro();

    HelloClass helloClass;
    helloClass.ShowMessage();
}

//! EOF
