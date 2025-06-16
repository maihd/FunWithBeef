# Beef Extending C++ Object

## Plan and Target
- Create a simple C++ framework, a simple scene graph framework
- Beef extend a Node (should be working node like Sprite)
- C++ must be extendable Beef node class (ex: BeefSprite)
- Auto generate C++ class from Beef
- This approach will be usable in Unreal Engine: 
    - Can export property from Beef to Unreal Details panel
    - C++ class can extends class from Beef (actually a C++ wrapper)

## Architecture
- This folder: Beef library
- cpp_lib: framework library
- cpp_generated: Beef bindings for C++ which is autogen
- cpp_program: Main program, use Beef Library, extending Beef classes =))

## Key notes
- From C++ bindings: must be force concrete call on virtual methods to avoid cyclic calls
- Beef Object is append in C++ object, check cpp_program