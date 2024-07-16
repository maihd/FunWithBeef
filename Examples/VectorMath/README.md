# VectorMath in BeefLang
No much differences from C++ and C#, supported features:
- Operators
- SIMD
- Optimized pass-by-value, return struct.
- Inlining and comptime
- Property-based swizzles
- Anonymous struct
- Fast compile (including swizzle, comptime code generation)
    > Compiling...
    > Beef compilation time: 0.12s
    > Comptime execution time: 0.13s
- Fast incremental compilation
    > Beef compilation time: 0.03s
    > Compile-to-debug time: 0.07s