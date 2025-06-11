Modern C++ vs Beef Comparing
----------------------------
Disclaimer: 
- Researching Mordern C++...
- Most Beefy things are from Beef docs.
- See [Beef and Orthodox C++ (old C++, C++ as C-with-class) comparing](/Essays/ModernC++Comparing/README.md) first.
- I almost avoid Modern C++, but it have some features that we needed. But in Beef, we have thoses. This docs maybe work as decision making analysis.


Comparison table
----------------
| Features                          | Beef                       | Modern C++ (>= C++11)                       |
| --------------------------------- | -------------------------- | ------------------------------------------- |
| Implicitly-typed local variables  | `var`, `let`               | `auto`, `const auto`                        |
| Core type system                  | Modern Archetypes          | Simple Archetypes                           |
| Tagged Union & Variant & Tuple    | Language-level             | Library-level                               |
| Error Handling                    | Result, Optional           | Exception, `std::optional`, `std::expected` | 
| Comptime                          | ConstEval, C# Preprocessor | `constexpr`, `template`, C Preprocessor     |
| Constraints and concepts          | C#-like + CompTime         | C++20 feature: `concept`, `requires`        |
| Generic                           | C#-like                    | `template`                                  | 
| Literals                          | C#-like + extensions       | C-like, extensions, user-defined            |
| Memory management                 | Allocator + Syntaxes       | RAII                                        |
| Safety features                   | Language-level + IDE       | RAII + 3rd Party Tools                      |
| Reflection                        | Language-level             | Library-level                               |


Implicitly-typed local variables
--------------------------------
Modern C++ prefer `auto` to avoid long type name when declarations.
Beef inherit `var` from C#.


Core type system
----------------
Modern C++: have no big changes from C++11.
Beef: many modern archetypes, from other modern languages that help programming better.
Some special cases declare in details above.


Tagged Union & Variant & Tuple
------------------------------
Modern C++ mainly use `std::variant` to do tagged union. See blog explaining this: https://orodu.net/2022/12/03/tagged-union.html.
In Beef thoses features are native supported in language-level.
```Beef
// Examples from https://www.beeflang.org/docs/language-guide/datatypes/

enum Shape
{
    case None;
    case Square(int x, int y, int width, int height);
    case Circle(int x, int y, int radius);

    // ...
    // Enum can have properties, methods like struct/class.
}

let tup = (1, 2); // Unnamed members
int sum = tup.0 + tup.1; // Access by position
let (first, second) = tup; // Decompose into new variables
let coords = (x: 2, y: 3); // Named members
let len = Math.Sqrt(coords.x*coords.x + coords.y*coords.y); // Access by name

(uint, uint) utup = (1, 2); // Explicitly typed, unnamed members
(int index, Type type) entry = (first, null); // Explicitly typed, named members
```


Error Handling: Exception, Result, Optional
-------------------------------------------
Modern C++: Exception. Or use `std::optional`, `std::expected`. But have no way to quick exit, mapping type.
Beef: No support for Exception. Have `System.Result`, `System.Nullable`. Have quick exit with `Try!`, like Rust `try` and `?` statement. See details: https://www.beeflang.org/docs/language-guide/errors/


Comptime: compile-time execution, conditional compilation
---------------------------------------------------------
Modern C++: compile-time execution can use with template and constexpr (but have limits). Conditional compilation still depend on C preprocessor.
Beef: Have CompTime, have C# preprocessor. CompTime can generates code. See details here: https://www.beeflang.org/docs/language-guide/comptime/
Additional: Beef have Mixin, another good features to do comptime works, like C macros, but have type-checked, work in language-level context. See details: https://www.beeflang.org/docs/language-guide/datatypes/members/#mixins


Constraints and concepts
------------------------
Advanced features for C++ template.
Beef use CompTime, Attribute, Reflection.


Generic
-------
Modern C++: C++ template.
Beef: C#-like generics.


Literals
--------
Modern C++: More literals to C. Have custom literals. Unsure C++ have constexpr literals or not.
Beef: Combine of C++ and C# literals. No custom literals. But can use CompTime to do custom listerals.


Memory management
-----------------
From C++11, and now Modern C++, memory management almost depends on RAII.
Beef avoid this, focus on Allocator (a.k.a Arena, Buffer). But support more features, language-level constructs to work with. See details: https://www.beeflang.org/docs/language-guide/memory/


Safety features
---------------
Modern C++: RAII for avoid manually memory management, use third party software for debugging, static analyzing.
Beef: All in one with Beef IDE. Have language-level support for safetyness. See details: https://www.beeflang.org/docs/language-guide/safety/


Reflection
----------
Modern C++: No standard library.
Beef: Limited features. Mostly for CompTime works, see details: https://www.beeflang.org/docs/language-guide/reflection/


Conculusion
-----------
Beef have many things as a high performance software developer seeking for. But still have modern, ergonomics,flexible. Modern C++ in a direction, that, complexing further and further the language. The language we have used, and used many times to make high performance software. But now we choose Rust, Zig. And now Beef. Let's make own software Beefy.