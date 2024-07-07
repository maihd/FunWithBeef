# C++ interop solution
- C++ class must be have padding fields (see /CppLib/CppLib/CppLib.cpp)
- Declare class in Beef: fields (required), extern methods
- Now you can create subclass in Beef (see /src/Program.bf)
- Notes: prefer C interop over C++, C is simple and have good ABI. C++ is complex and no standard ABI at all.

## Test cases
- Interop with C++ naming mangle
- Naming mangle cases: primitives, static function in class, struct in namespace, const mangle, reference, const reference
- Failed handle free function wrapped in namespace, both named and anounymous