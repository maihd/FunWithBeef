# Beef Extending C++ Object

## Plan and Target
- Create a simple C++ framework, a simple scene graph framework
- Beef extend a Node (should be working node like Sprite)
- C++ must be extendable Beef node class (ex: BeefSprite)
- Auto generate C++ class from Beef
- This approach will be usable in Unreal Engine or Godot Engine (or other C++ framework).

## Architecture
- This folder: Beef library
- cpp_lib: framework library
- cpp_generated: Beef bindings for C++ which is autogen
- cpp_program: Main program, use Beef Library, extending Beef classes =))