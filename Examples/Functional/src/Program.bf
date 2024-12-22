namespace Functional;

using System;
using System.Linq;

class Program
{
    static void Main()
    {
        // Famous map -> filter -> reduce
        let result = scope int[](32, 45, 63, 36, 24, 11) // Scope array object == C array fat pointer, which contains length
            .Select((x) => x * 5)                        // without length, Linq cannot work
            .Where((x) => x % 3 == 0)
            .Aggregate((acc, x) => acc + x)
            ;

        Console.WriteLine("result is {}", result);
        Console.Read();
    }
}