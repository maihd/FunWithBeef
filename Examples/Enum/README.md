# Deep Dive into Enum, Tagged Union, Pattern Matching

## Analyzing
- C-like enum have no difference from C
- TaggedUnion have same layout with sameway we do in C, but have type safety syntax, default type of tag is 1-size
- CRepr have no effect on tagged union. You should define C tagged union in this way to work with Beef, or avoid define tagged union in Beef when interop with C.
- Pattern matching have the syntax like C#, with `case` for matching tagged union in `if` statement.
    - `case` instead of `is`
    - `let`, `var` in parens to declare variables in matching, not auto like C#
    - Does not have `not null` expression
    - Does not have `switch` expression
    - Read more about C# pattern matching: https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/functional/pattern-matching
    - Read more about Beef pattern matching: https://www.beeflang.org/docs/language-guide/pattern/

## Conclusion
Beef prefer simple syntaxes, so pattern matching must be limited, only with simple `case` pattern matching. Avoid some bloats for syntax tree (help better compilation performance).