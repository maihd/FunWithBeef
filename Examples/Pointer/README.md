# Pointer and friend
Using pointer in Beef, and some derive form of its: Span, Array object, Fixed-size Array (some programmer use the term Buffer)


## Difference from array object and fixed-size array (Buffer, C Array)
- Array object (T[]) is a generic class. Memory layout: [bf.Object headers][int mCount][appended items]
- Fixed-size array is simple C array, no headers. Memory layout: [items] x size


## Span, StringView
- Span and StringView are common data structures in C++, using to avoid memory allocations
- Theses data structures have simple memory layout, basically like this: [T* mPtr][int mLength][optional flags]
- Look into the memory layout, we can claim that no copy-on-write in theses data structures, that why we can avoid memory allocations