Fun with Beef
-------------
Beef learning space. Some examples can be using as solutions.
After deep dive in the details, solving problems with Beef, find out it is good for gamedev, special [yolo coding style](https://github.com/a327ex/blog/issues/24).


Notes for beginners
-------------------
By [design](https://www.beeflang.org/docs/foreward/), Beef prefer performance-with-simple
code over complex-but-performance, which mean it's more C than C++, just as C# features for more ergonomic development. So, good C knowledges are better than C++, learning C is good ideas. [I have learn much C and topics](https://github.com/maihd/maicstyle), but still feel not enough. Details can find in essays sections. 
> After working a while with this project, I recommend you start a project like this learn more about techs, programming langugages, frameworks/engines. This project help me learn a lots.


Essays
------
This folder contains essays to explain the ideas and research about Beef.
- [Using Beef as Modern C](/Essays/BeefForModernC)
- [Comparing Beef with Modern C++](/Essays/ModernC%2B%2BComparing)
- [Comparing Beef with Orthodox C++](/Essays/OrthodoxC%2B%2BComparing)


Examples
--------
This folder contains code examples. You will find code snippets from C# or C++ can be reused. Each example contains its own workspace, to avoid redundant building process for untargeted projects. And it's scaling better.
- [Build Beef application to android](/Examples/Android)
- [C library interop (calling C code from Beef)](/Examples/CInterop)
- [Fast, no runtime reflection tweening for entity/game object](/Examples/ComptimeTweening)
- [C++ library interop (calling C++ code from Beef, also support inheriting and subclassing)](/Examples/CppInterop)
- [Better enum, tagged unions, pattern matching with Beef](/Examples/Enum)
- [Hello world from Beef](/Examples/HelloWorld)
- [Dear ImGui for Beef](/Examples/ImGui)
- [Messaging system](/Examples/MessageSystem)
- [Working with pointers in Beef (allocations, placement new, allocator)](/Examples/Pointer)
- [Simple scene graph in Beef](/Examples/SceneGraph)
- [Simple vector math library in Beef with Swizzle properties codegen](/Examples/VectorMath)
- [Create desktop with Win32 API (hand written bindings, input handling)](/Examples/Win32Window)
- [Unity Scripting with Beef (Unity NativeScript)](/Examples/UnityScripting)


TODOs
-----
- Make research version from examples (convert into topics)
- Deep dive into `interface`: underlying type, performance, abstraction overhead
- Deep dive into function pointer, delegate, lambda, dynamic dispatch (also work with memory management)
- Coroutine, Async:
    - Comptime for faster and safer coding with async
    - Memory management
    - Syntax proposal?
- Deep dive into functional programming, how compiler optimize the code to avoid function call overhead.
- Final plan: make a guidebook =))


Suggesting ideas
----------------
Open an issue, or a discusstion.


Meta
----
Beef version: 0.43.6 nightly (>= 03/06/2025 DD/MM/YYYY)
Source License: No license at all, the code is just for learning/research purposes.
Dependencies Licenses: Find its in folder if exists.