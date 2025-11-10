Beef in the view of Modern C
============================

By [design](https://www.beeflang.org/docs/foreward/), Beef values simplicity, code readability, fast development iteration, and good debuggability. Which are much like C in common. And also support low-friction interop with C.


First of all, Beef easily interop C code
----------------------------------------
Usable system language can be completed without C interop, because of its stable ABI (maybe claim as standard), and many existing libraries and frameworks written on it. So from the beginning, Beef chose this path, make sure it have good [C interop support](https://www.beeflang.org/docs/language-guide/interop/). And now that a main features to make program with Beef. You can call C function without the need of PInvoke, can pass struct by value or pointer without any conversion, C-like array, calling convention, and so on. Sections below will talking about how to use Modern C coding style apply to Beef, without the need of OOP features. This essays can be used for programmer starting Beef with C background.
> Note: runtime of Beef and C only have minor differences, both compile with LLVM (if C is compiled with Clang). Also in Windows, Beef may use MSVC to generate code (basically support by LLVM). So, use Beef instead of C for high level that still have same working program may have benefits.

Struct are pass-by-values, plain old datas
------------------------------------------
[Struct in Beef](https://www.beeflang.org/docs/language-guide/datatypes/#structs) are similar to C, the main difference is have difference layout, but can mark `[CRepr]` to make full C compatible. The goods is struct can have methods, properties, operators overloading helping work with struct easier (but should limit to what are really needed to contains in struct). Please note that struct in Beef members is not public accessible by default.

```Beef
[CRepr]
struct Vector3
{
    public float x;
    public float y;
    public float z;
}
```

Struct abilities:
- Plain old data, even contains fields with type of a class. Because Beef always store class in reference (underlying is pointer).
- Fields are private access by default
- Can have methods, properties, operators overloading
- Doesn't have same memory layout as C, need `[CRepr]`
- Can inherit from other struct, but cannot have virtual methods

Anonymous Inline Type Declarations
----------------------------------
C support this through extensions (all major compilers). Beef have support this from nightly build 1/6/2025.
```
[Union]
struct Vec2
{
    public float[2] coords;
    public struct
    {
        public float x;
        public float y;
    };
}
```

Fixed-sized primitives in language level
----------------------------------------
In Modern C program, we were encouraged to use fixed-size primitives, but will to include headers, and no one will use the same name of fixed-size primitives, sometime `uint32_t`, sometime `u32`. But Beef so this problem by simply provide fixed-size primitives in language level. The tables below compare name-to-name from Beef to C.

| Beef   | Beef C Interop | C                  | C stdint.h |
|--------|----------------|--------------------|------------|
| int8   | c_char         | char               | int8_t     |
| uint8  | c_uchar        | unsigned char      | uint8_t    |
| int16  | c_short        | short              | int16_t    |
| uint16 | c_ushort       | unsigned short     | uint16_t   |
| int32  | c_int          | int                | int32_t    |
| uint32 | c_uchar        | unsigned int       | uint32_t   |
| int64  | c_longlong     | long long          | int64_t    |
| uint64 | c_ulonglong    | unsigned long long | uint64_t   |
| float  | float          | float              | float      |
| double | double         | double             | double     |

> Updated 12/06/2025: Beef C types required `using System.Interop` from new versions (>= 0.43.5).


Modern C encourage use values over pointers
-------------------------------------------
Beef by design based on C# syntax, which struct pass-by-value default. And Beef support optimize pass-by-value, which is will use SIMD register when available. Modern C compiler can do its as well. Beef also support expressions block (in C only have on GCC/Clang).
```Beef
Console.WriteLine("Result={}",
    {
        GetByRef(let val);
        val
    });
```


Immutable
---------
Using value mean we will have concepts of mutable and immutable values. By default parameters of Beef are immutable. Struct method cannot modify fields. Otherwise, you can mark method have modify struct fields with `mut` postfix of method signature, opposite to C++ const correct.


Tagged Union
------------
C have no OOP support, when facing problem need polymorphism to solve, programmer prefer tagged union. By far, Beef support tagged union in [language syntax](https://www.beeflang.org/docs/language-guide/datatypes/#enums), come with well pattern matching support. By using `case` keyword, syntax for pattern matching are easy to recognize, easy to read in form of English. So pattern matching is not hard to understand, just a syntatic sugar to reduce boilerplate code, details here: https://www.beeflang.org/docs/language-guide/pattern/.

```Beef
enum Shape
{
    case None;
    case Square(int x, int y, int width, int height);
    case Circle(int x, int y, int radius);
}
Shape drawShape = .Circle(10, 20, 5);
...
switch (drawShape)
{
case .None:
case .Square(let x, let y, let width, let height): DrawSquare(x, y, width, height);
case .Circle(let x, let y, let radius): DrawCircle(x, y, radius);
}
....
if (drawShape case .Square)
    Console.WriteLine("We drew a square");

if (drawShape not case .Square)
    Console.WriteLine("We did not draw a square");

/* Radius will keep the value -1 if the value isn't a Circle */
int radius = -1;
if (drawShape case .Circle(?, ?, ref radius)) {}
```


Designated initialization
-------------------------
Working with values, there will be need initialize struct by hand, because C have no constructor methods. Which is combersome, spoilate code. That why C99 designated initialization was introduce, and quickly become one big features to use C99 over C89. Based on C# syntax, we have Beef welly support designated initialization in some form.

```C
Vector3 v3 = { 1.0f, 2.0f, 3.0f };
Vector3 v3 = { .x = 1.0f, .y = 2.0f, .z = 3.0f };
```

```Beef
Vector3 v3 = { x = 1.0f, y = 2.0f, z = 3.0f };
// Note: there a no anounymous fields construct
// Vector3 v3 = { 1.0f, 2.0f, 3.0f };
```


Compound literal
----------------
C99 does not only support create struct with designated initialization when declare value, but also support create struct with designated initialization any where appricated. Which is called compound literal. Beef has this, but no need to wrap struct name into parens. And has type inference when the context is clear.

```C
Vector3Add((Vector3){ 1.0f, 2.0f, 3.0f }, v3);
Vector3Add((Vector3){ .x = 1.0f, .y = 2.0f, .z = 3.0f }, v3);
```

```Beef
Vector3Add(Vector3 { x = 1.0f, y = 2.0f, z = 3.0f }, v3);

// Type-inference with `.`
Vector3Add(.{ x = 1.0f, y = 2.0f, z = 3.0f });

// Type-inference with `.`, with constructor (may have default value)
Vector3Add(.(1.0f, 2.0f, 3.0f));

// Type-inference with `.`, with constructor (may have default value), with named arguments
Vector3Add(.(x: 1.0f, y: 2.0f, z: 3.0f));

// Note: there a no anounymous fields construct
// let v3 = Vector3 { 1.0f, 2.0f, 3.0f };
```


Pointers
--------
Pointers is the most important concept in C, but come with hard to understanding and using. Maybe only true for beginners, when the programmers meet experiences that needed to influent C programming, pointer become the handy features. It's still a unsafe features, must use with care. In old standard of C, for performance reason, pointers maybe overuse in many cases. In the modern C standards, new compiler with many tricks to optimized code when compiling, pointers may be avoided. Modern C encourage pass-by-value, also pass-by-reference cannot be avoided overtimes. User defined array types still need pointers. Come with this problem, Beef provide good support for pointers, with `ref`/`out` when you only need pass-by-reference. This come handy when interop C code, also port C code to Beef when needed. Lastly, written Modern C style in Beef more easily.


Pointer arithmetic
------------------
Unlike C, in Beef, we cannot cast pointer to `int` or other value type. And unlike C++, we cannot cast `this` to pointer (`this` is value type, not a pointer), but we can use `Internal.UnsafeCastToPtr(this)` to get `void*` pointer. Fortunately, we can do pointer arithmetic. Just use `uint8*` to increase/decrease the address of the pointer. That how I do stack allocations.


Centralized Memory Management
-----------------------------
In the modern C (and its family languages like Zig, Odin) memory will be management through arena/allocator. Which is also called [centralized memory management](https://sasluca.github.io/cmm.html). [Beef support allocator](https://www.beeflang.org/docs/language-guide/memory/) in language features, support real-time leak detector (which can be turn off with distinct build options, and commonly remove from release build).


Attributes
----------
Modern hardware and compiler are more complex, but come with more powerful. CPU now can support many features to solve many problems and topics. One simple use case is to have attributes for each data structures and functions. Modern C standard attributes, which are supported by Beef:
- Align: C alignas
- Inline: C inline, more like `__forceinline`/`__attribute__((always_inline))`
- Union: to avoid redundant keywords, Beef use attribute to mark struct are union (C# StructLayout attribute)
- CRepr: use C struct layout, Beef have concept of struct stride over struct size. Which is reduce hole in struct.
- Packed: not clear when comparing with `#pragma pack`


Enum, tuples, error handling
----------------------------
Enum are a good feature that help C programmer abstract the code without overhead. But C enum have some limitations:
- Underlying type are int32/uint32, but no ensure all compilers do this. C23 will support declare underlying type, but when will C23 are widely supported and used?
- Because of this, some library avoid use typedef of enum in struct members and parameters to provide stable ABI
- Enum members are globally export, maybe conflict without library, prefix must be used.
- If use flags, make sure only support 32 distinct members (combined members doesnot count). More members is undefined behaviours between compilers. Someone will find uint64 solve this problem, but will miss the opportunity for easy debugging (Visual Studio will show exactly what flag is set when debugging).

But Beef solve this problem by just copying the enum of Rust, cook its into C# syntax. Now Beef enum become more powerful with theses features:
- Enum as type value
- Enum as flags by default, no need `[Flags]` like C#
- Enum as tagged union like Rust
- Enum can have methods
- Enum can be extended like C, but more strict typing
- Enum can custom underlying type

Tuples is just anounymous struct, construct with parens. Not must things to said about it, but this can help when you need return multiple values without using dangerous pointer or too verbose `ref`/`out` modifiers. And in for each loop, when dictionary-like enumerator return pair, no need to defining new type.

Unlike C# and C++, C does not support exception. To handling errors, we have 2 common modern solutions:
- Return boolean, and log error messages
- Return a error result struct

But in Beef we have enum as tagged union, so just famous `Result<T, V>` data structure. The problem solved. But in some form of problems, return boolean or default values and log error messages are more appreciated. Raylib does that, and many systems do that, take a read for more details: https://www.rfleury.com/p/the-easiest-way-to-handle-errors


Namespaces and modules
----------------------
In C there are no concrete concepts of namespaces and modules. To solve this problem, we are prefer to use prefix as namespaces/modules name. Beef is C# syntax with C++, so there are no brainer it supported namespaces by default. But prefix solution have one advantages, that modules can be easily add extensions. But Beef have one features that help with that. Based on C# `partial`, but more openness and more freedom, which is call `extension`.


Metaprogramming & Code generations
----------------------------------
C widely use textual macros. And in modern C, it will be more used. Like stb_array, stb_ds, which help to create generic type container data structures. C _Generics commly use to create constructors. Beef support all this without needed of headache textual macros, like Mixin, Generic. And in C, you will find sometime need code generation with simple DSL to avoid spoilate code. But with Beef, we dont need another DSL or codegen tools, all come with language features. Links: https://www.beeflang.org/docs/language-guide/comptime.


Comptime
--------
Metaprogramming are not powerful enough if its come without comptime. C have some of comptime to help programmer make code more strict, more robust over many platforms. But have no comptime evaluation. By this limit, static assertion need a syntax and language implementation (can also fake this, but not practical, have no good compiler message). No constant values for user-defined data structures, need to use `#define` or depends on optimizing static values. Hash string at comptime have no support in language, must be deal with codegen. Beef Comptime solve all this, without introduce new keywords, just use C# attributes syntax. And compiler will do comptime eval when appricated and force comptime only with `[Comptime]` attribute. 


Defer and block
---------------
C have no RAII. So programmer need to cleanup the resources manually. This is not a big problem, but with some features to help organize code, that is more pleasant to coding with. That why `defer` is well supported in many languages that attempt to be a Better C replacement. Beef join this trend too. Defer code line or block will be executed when leave the function (not only the last line of the function) in reversed order. Declare first will be executed last. Defer solve some problems that C programmer may have (again, not big problems):
- Large functions, hard to track when resources are cleanup
- Declare and forget context, i.e temporary allocator
- Multi-path to returns functions, where its return path must be cleanup resources
> **_NOTE:_** This is the hack I used to make AutoRelease/FrameAllocations/TempAllocations.


Math/VectorMath, SIMD, Operators Overloading
--------------------------------------------
Coming to Modern C, usually we are a gamedev, so we cannot avoid math programming (also SIMD). C have well support SIMD through compiler extensions. But it lack of operators overloading. We have to use Clang extensions or compile C code as C++ (may miss main features like designated initialization). Someones sticks to operator-like function (ex: vec2_add). And inline function sometime maybe not inlined (doesnot have the same behaviours through compilers). BeefLang so this problem well (creator is a variant in gamedev, PopCap Games Founder). SIMD is a work as compiler-level, the compiler will choose good fit intrintics for the operations, the programmer no need to know hundreds intrinsics to the job for multi platforms (maybe not the best performance, but it save programming time with good performance).

> **_NOTE:_** 
> 1. You should use the nightly build to get best support of SIMD, older version may crash the IDE when compiling.
> 2. BeefLang have property, attribute and comptime, we can do swizzle by generating properties


Conclusion
----------
That all things I know about Modern C to Beef. If you hate OOP, use Beef as a better C replacement also a good choice. For some cases, like parsing resource files, I find Modern C parts of Beef are more fit. I did [the parsing here](https://github.com/maihd/beef-gamedev/blob/main/Gamefx/src/LDtk.bf). Hope you have fun in the journey to explore about rediculous naming programming language Beef.


Samples
-------
Projects and libraries use Modern C style in Beef:
- Sokol-Beef: https://github.com/kochol/sokol-beef/blob/main/samples/sokol-triangle/src/Program.bf
- Raylib-Beef: https://github.com/Starpelly/raylib-beef
- Clay-Beef: https://github.com/farism/clay-beef
- LDtk-Beef: https://github.com/maihd/beef-gamedev/blob/main/Gamefx/src/LDtk.bf
- ...and more projects that bindings C libraries


Further reading
---------------
C is not obsolete language, many features have been added. Many ideas, solutions, coding style have been invented to make coding with C more pleasant, more performances, less error-prone. Take below resources to explore about Modern C, theses resources are more fit for game developer, because I am a gamedev:
- https://www.youtube.com/watch?v=QpAhX-gsHMs
- https://floooh.github.io/2019/09/27/modern-c-for-cpp-peeps.html
- https://sasluca.github.io/cmm.html
- https://www.rfleury.com/p/the-codepath-combinatoric-explosion#%C2%A7questions-vs-answers
- A clean solution for dynamic dispatch in C, which also effiency: https://github.com/cmuratori/misc/blob/main/cleancodeqa-2.md