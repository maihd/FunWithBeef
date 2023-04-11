namespace Enum;

using System;

class Program
{
    enum Day : uint
    {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday
    }

    static void Main()
    {
        let day = Day.Monday;
        Console.WriteLine("{0} = {1}", day, day.Underlying);

		let jsonString = JsonValue.String("Hello");
		Console.WriteLine("{0} = {1}", jsonString.TypeName(), jsonString.ToString(.. scope String(1024)));

		let jsonArray = JsonValue.Array(scope .(){.Number(10), .String("string item")});
		Console.WriteLine("{0} = {1}", jsonArray.TypeName(), jsonArray.ToString(.. scope String(1024)));

		let jsonObject = JsonValue.Object(scope .(){ ("number", .Number(10)), ("string", .String("hehe")) });
		Console.WriteLine("{0} = {1}", jsonObject.TypeName(), jsonObject.ToString(.. scope String(1024)));

		Console.Read();
    }
}