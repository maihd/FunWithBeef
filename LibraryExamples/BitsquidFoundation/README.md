# Bitsquid's Foundation on Beef


## Why?
Standard libraries have good enough data structures, but its was implemented with class. Which have both pros and cons:

Pros:
- Ready to use
- Good and well design implement
- Like C# API
- Support `append` expressions
- Mostly used
- Store as reference, only take one pointer size
- Modern and careful design with slices, bulk data in mind (Span, StringView)
- Have use virtual methods, so we can embed logics and behaviours of existing functions

Cons:
- Hard to change custom allocator (not a big deals)
- Fields are mostly `private`, hard to add custom methods (but we have `extension`)
- Mostly `class`, maybe not safe when checking length
- Cannot store allocator, so if use custom allocator when constructing object, we need that allocator to delete object too
- Must override Alloc and Free function to customize allocation logic
- Growing are scaling by size, commonly double size, it's mean we will face redundant memory in not used
- Still revoluting


## Why Bisquid Foundation?
Mai favourites. But have both pros and cons.

Pros:
- Open structure
- Store as value, can be directed access fields, and avoid null access
- Centre memory management
- Can store allocator, and clear allocation logic
- Small and focus data types
- Pure data, does not contains methods (not a big deal with Beef)
- No virtual methods, calling functions are clear meaning and deterministic

Cons:
- Open structure, can be mis-changed the data
- Store as value, maybe caused overhead to the parent data type
- Still growing by double size, but we can change this behaviour
- Lack of data structures
- No virtual methods, mean that we can change behaviours of existing functions, but we should avoid that in mindset of Bitsquid Foundation