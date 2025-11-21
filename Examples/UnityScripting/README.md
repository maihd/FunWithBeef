# Unity scripting with Beef
Based on https://www.jacksondunstan.com/articles/3938.

## Articles and Topics
- How to build Dynamic Library for Beef: https://m0n7y5.github.io/beef-dll-creation-and-research-2/
- Unity Native Plugins: https://docs.unity3d.com/Manual/NativePlugins.html
- Mono Interop with Native Libraries: https://www.mono-project.com/docs/advanced/pinvoke/
- Unity Scripting architecture: https://docs.unity3d.com/Manual/overview-of-dot-net-in-unity.html
- C# function pointer: https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/proposals/csharp-9.0/function-pointers
- Other approachs: https://github.com/i-saint/UnityCppScript

## Disclaimer
- This use dynamic dispatch (marshaling, pinvoke) to call Unity API, so avoid heavy working with Unity API in Beef
- If your framework, game have good performance, dont do more works
- Hybrid ECS, Burst/Job can support, have better C# compatibility, and have native support by Unity

## Suggestions
- Use a framework in Unity to prototype your game first: Game Creator 2, TopDown Engine
- Port the framework to Beef for native performance (advanced tech skills required)
- Port the gameplay use the new framework
- Finish your game
- Upgrade your framework, create features to help make game faster, better
- Repeat

## Solutions
- You need glue code, glue runtime to make C# and Beef work togethers
- Use object store and output handle to native side
- Use object pointer
- Marshalling function pointer from delegate and vice versa
- Directly use function pointer in C#
- Fast data marshalling use C struct layout (required):
    - C# side: StructLayoutAttribute
    - Beef side: CRepr
- Fast iterations using dynamic serialization with JSON and Custom Editor:
    - Create a custom type store json and dictionary
        - JsonStr field store as string, can be serialized by Unity
        - Fields/Objects to do coding editor logic
    - Create a custom type store schema information of json structure
    - Create a custom editor to handle editting data, load and save in json
- Memory managements:
    - Object return to C#, should be use custom allocator, to avoid Leak Detector complains
- Bindings:
    - Another tricky problem
    - We must use dynamic loading in editor:
        - Once DLL loaded on by Editor, its cannot be unload
        - Dynamic loading help you do hot reload
    - We must provide C ABI to export Beef functions that can call from C#
    - We must convert C# functions to Function Pointer, and pass to Beef plugin init function