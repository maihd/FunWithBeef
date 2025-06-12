Orthodox C++ vs Beef Comparing
------------------------------
I found [Orthodox C++](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b) and [Beef](https://www.beeflang.org/) are very similar. Bgfx (same author with Orthodox C++) does have [builtin Beef bindings](https://github.com/bkaradzic/bgfx/tree/master/bindings/bf). 
> Update 12/06/2025: Beef C++ Runtime was written eith Orthodox C++ philosophy. Exploring the BeefLang github repo to find more.


Beef design goals
-----------------
- High performance execution
    - No GC of ref counting overhead
    - Minimal runtime
    - Compiled (no JIT delays)
- Control over memory
    - Extensive support for custom allocators
    - Enhanced control over stack memory
- Low-friction interop with C and C++
    - Statically or dynamically link to normal C/C++ libraries
    - Support for C/C++ structure layouts and calling conventions
- Prefer verbosity over concisements when it aides clarity, readabilitiy or discoverability
- Enable fluid iterative development
    - Fast incremental compilation and linking
    - Runtime code compilation (code hot swapping), include data layout changes
- Familiar syntax and programming paradigms for intended audience (C-family)
- Good debugability
    - Emits standard debug information (PDB/DWARF)
    - Emphasis on good execution speed of debug builds
- Well-suited to IDE-based workflow
    - Compiler as services
    - Fast and reliable autocomplete results
    - Fast and trustworthy refactorability (ie: renaming symbols)
- Leverage LLVM infrastructure
    - Battle-hardened backend optimizer
    - ThinLTO link time optimization support


C++ design goals
----------------
Unclear. That why we have to stick to one and only one subset of C++ (on one project).


Beef features from Orthodox C++ view
------------------------------------
- Prefer C code that works, good C interop
- Don't do [this](https://archive.md/2014.04.28-125041/http://www.boost.org/doc/libs/1_55_0/libs/geometry/doc/html/geometry/design.html), the end of "design rationale" in Beef/Orthodox C++ should be immedately after "Quite simple, and it is usable. EOF".
- No runtime C wrapper
- No exceptions
- No bad RTTI (Beef provide good and familiar Reflection system, with additional comptime code generation)
- No complicated metaprogramming with templates
- Standard library with good memory management, unify implementation for all platforms (2 main reasons gamedev avoid STL)
- Enum, tagged union, tuples (also zero-cost overhead) help better handling state, error with cleaner approachs
- Any data structures in Beef have clear layout, underlying type can access by programmer
- Support all syntaxes sugar of C++20 (but simpler):
    > As of January 14th 2025, Orthodox C++ committee approved use of C++20.


Combine Orthodox C++ with Beef
------------------------------
By define, Orthodox C++ are simple enough to generate bindings for other languages (just make C wrapper). But Beef can also interop with [C++ name mangle](/CppInterop). This is no brainer to claim Beef are nearly Orthodox C++. Note: Beef class will have some predefined fields (from bf::Object), so avoid inherit class from C++. 


Variables semantic
------------------
In C++, there are no different semantic of struct and class. But in Orthodox C++, we should treat struct as value, class as reference (avoid RAII in common). That are Beef behavior, but in language level. The advantage is, struct are PoDs, but can provide constructors, no copy constructor/operator that hide the works, functions, operator overloading, complicated code cognition (add features to struct does not break the PoDs semantic). Class can have constructor/destructor like C++, but no RAII, low hidden memory management flow.


Metaprogramming
---------------
In common senses, Orthodox C++ avoid complex template for metaprogramming, but use template generics for simple and neat data structure, functions are appropriated. Where the Beef generics shine. For advances metaprogramming, Beef support reflection (both rumtime and comptime), comptime eval (like constexpr, but more ergonomic), comptime codegen.


Delegates and lambdas
---------------------

Orthodox C++:
```C++
struct DeferDelete<T>
{
    T* memoryToDelete;
    // Maybe need allocator field

    DeferDelete(memory)
        : memoryToDelete(memory)
    {
    }

    ~DeferDelete()
    {
        delete memoryToDelete;
        // C++ delete cannot pass allocator (weird syntax: operator delete(memory allocator))
        // So you need call destructor (memory->~T()), later allocator->free base on your memory system
    }

};

const auto memory = new int(10);
const auto lambda = [memory](){
    // Hacks: C++ does not have lambda's destructor block like Beef
    DeferDelete<int> deferDelete(memory);

    // Work here
};
lambda();
```

Beef:
```Beef
let memory = new:allocator int(10);
let lambda = new:allocator [=memory]() =>
{
    // Work here
}
~
{
    delete:allocator memory;
};
defer delete:allocator lambda; // lamdba is delegate, and delagate is reference type
lambda();
```


Conclusion
----------
Beef is Orthodox C++, but a language not subset.
Winner: Beef is cleaner, but no different works. What Orthodox C++ can do, Beef can and with simpler ways.