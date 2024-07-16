Yolo C++ - a C/C++ dialect, programming with C++11 compiler
===========================================================

> This is old docs of my ideas before I known about Beef

Basics principles
-----------------

- Pass-by-value prefer to pass-by-reference/pass-by-pointer
- Pointer type is mean to make a loan for the function execution (learn more from Rust Ownership)
- No OOP, no classes, no methods, no static methods, no free functions (just functions)
- No struct inherits (extend by composition)
- No struct encapsulations (all thing in header is public, internal and private are the same, contain in source file).
- Code and data is seperated.
- Avoid change data, avoid storing state, use pure data only.
- Pure function is prefered. Maybe a thing called pure procedure exists?
- Avoid magic features: no RTTI, no exceptions, minimal RAII, minimal metaprogramming.

What should I use?
------------------

- C-like C++ is good start, if code doesn't require more complexity don't add unnecessary C++ complexities. In general case code should be readable to anyone who is familiar with C language.
- Should only use C++11. Somethings that just need C++0x to work with.
- Don't do [this](http://archive.md/2014.04.28-125041/http://www.boost.org/doc/libs/1_55_0/libs/geometry/doc/html/geometry/design.html), the end of "design rationale" in Yolo C++ should be immedately after "Quite simple, and it is usable. EOF".
- Prefer `struct` over `class`.
- We have no `friend` because of this styles.
- Data structure is transparent, no hidding anythings from hacker.
- Prefer free function over methods. We just call this functions.
- Don't use C++ runtime wrapper for C runtime includes (<cstdio>, <cmath>, etc.), use C runtime instead (<stdio.h>, <math.h>, etc.)
- Don't use RTTI
- Don't use exceptions
> Exception handling is the only C++ language feature which requires significant support from a complex runtime system, and it's the only C++ feature that has a runtime cost even if you don't use it – sometimes as additional hidden code at every object construction, destruction, and try block entry/exit, and always by limiting what the compiler's optimizer can do, often quite significantly. Yet C++ exception specifications are not enforced at compile time anyway, so you don't even get to know that you didn't forget to handle some error case! And on a stylistic note, the exception style of error handling doesn't mesh very well with the C style of error return codes, which causes a real schism in programming styles because a great deal of C++ code must invariably call down into underlying C libraries.

Naming convention
-----------------

- Type name: PascalCase
- Funtion name: PascalCase
- Variable name: camelCase
- Member name: PascalCase
- Constants name: ALL_CAPS_CASE
- Enum name: PascalCase
- Enum's member: EnumName_PascalCase if is enum flags, ALL_CAPS_CASE if mean constants
- Parameter name: camelCase
- Global variable name: PascalCase
- Avoid use multiples global variable, should group in one data structure, context.
- Macro name: PascalCase when use as function, ALL_CAPS_CASE otherwise.
- Source code file and directory names: PascalCase

Further Reading
---------------

You will find some similar ideas from theses articles:
- [Bitsquid's Foundation](https://github.com/niklas-ourmachinery/bitsquid-foundation)
- [Insomniac Games' coding style](https://gist.github.com/Kerollmops/fcad27cfef9e3552cb75a3d201494ba6)
- [Orthodox C++](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b#file-orthodoxc-md)
- [The Practice of Programming – Kernighan, Pike](https://www.amazon.com/Practice-Programming-Addison-Wesley-Professional-Computing/dp/020161586X)

Some advices
------------

- Use Feynman technique for your code, make the code simpler to understand by simpler words and sentences.
- If you are a man with principles, read more on [Yolo's principles](YoloPrinciples.md)
- You only live once.
