# Functional programming with Beef

## Supported features
- [LinQ](https://github.com/disarray2077/Beef.Linq)
- [Lambda, delegates, functions](https://www.beeflang.org/docs/language-guide/datatypes/methodrefs/)
- [Bind operator](https://www.beeflang.org/docs/language-guide/expressions/#bind-expression), capture context (closure)
- [Pattern matching](https://www.beeflang.org/docs/language-guide/pattern/)
- [Tagged unions](https://www.beeflang.org/docs/language-guide/datatypes/#enums), [tuples](https://www.beeflang.org/docs/language-guide/datatypes/#tuples)
- [Generics](https://www.beeflang.org/docs/language-guide/generics/)
- Result (Result monad) and [Nullable](https://www.beeflang.org/docs/language-guide/datatypes/#nullable-types) (Maybe monad)
- Range, slice (Span<T>), slice operator
- Pipe operator with x..y().z()
- [Immutable variables](https://www.beeflang.org/docs/language-guide/statements/#variable-declarations), [immutable parameters](https://www.beeflang.org/docs/language-guide/datatypes/members/#methods)
- Pure functions: no keyword required, compiler will do the work
- Expressions: initializers, tuple expression, conditional expressions, range expressions, ...
- Good and many literals
- Lazy evaluation with some tricks from lambda, closure