namespace BeefExtendCpp.Codegen;

using System;

class Program
{
    static void Main()
    {
        GenCppWrapper.GenerateAll("../cpp_generated");
    }
}