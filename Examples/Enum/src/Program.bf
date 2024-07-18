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

    enum TaggedUnion
    {
        case Int(int);
        case UInt(uint);
    }

	[CRepr]
	enum CReprTaggedUnion
	{
		case Int(int32);
		case UInt(uint32);
	}

    static void Main()
    {
        // Simple enum

        let day = Day.Monday;
        Console.WriteLine("{0} = {1}", day, day.Underlying);

		let jsonString = JsonValue.String("Hello");
		Console.WriteLine("{0} = {1}", jsonString.TypeName(), jsonString.ToString(.. scope String(1024)));

		let jsonArray = JsonValue.Array(scope .(){.Number(10), .String("string item")});
		Console.WriteLine("{0} = {1}", jsonArray.TypeName(), jsonArray.ToString(.. scope String(1024)));

		let jsonObject = JsonValue.Object(scope .(){ ("number", .Number(10)), ("string", .String("hehe")) });
		Console.WriteLine("{0} = {1}", jsonObject.TypeName(), jsonObject.ToString(.. scope String(1024)));

        Console.WriteLine("");

        // Reverse engineering tagged union enum

        Console.WriteLine("Size of taggedUnion: {}", sizeof(TaggedUnion));
        Console.WriteLine("Align of taggedUnion: {}", alignof(TaggedUnion));
        Console.WriteLine("Stride of taggedUnion: {}", strideof(TaggedUnion));

        Console.WriteLine("InstanceSize of taggedUnion: {}", typeof(TaggedUnion).InstanceSize);
        Console.WriteLine("InstanceAlign of taggedUnion: {}", typeof(TaggedUnion).InstanceAlign);
        Console.WriteLine("InstanceStride of taggedUnion: {}", typeof(TaggedUnion).InstanceStride);

        var taggedUnion = TaggedUnion.Int(1);
        let taggedUnionPtr = (uint8*)&taggedUnion;
        Console.WriteLine("First byte of taggedUnion: {}", *taggedUnionPtr);
        Console.WriteLine("Last byte of taggedUnion: {}", taggedUnionPtr[sizeof(TaggedUnion) - 1]);

		var isLast = false;
        if (*taggedUnionPtr == 1 && taggedUnionPtr[sizeof(TaggedUnion) - 1] == 0)
        {
            Console.WriteLine("Beef but type of tagged union in last byte");
			isLast = true;
        }
        else
        {
            Console.WriteLine("Beef but type of tagged union in first byte");
        }

        Console.WriteLine("");

        // Reverse engineering crepr tagged union enum

        Console.WriteLine("Size of creprTaggedUnion: {}", sizeof(TaggedUnion));
        Console.WriteLine("Align of creprTaggedUnion: {}", alignof(TaggedUnion));
        Console.WriteLine("Stride of creprTaggedUnion: {}", strideof(TaggedUnion));

        Console.WriteLine("InstanceSize of creprTaggedUnion: {}", typeof(TaggedUnion).InstanceSize);
        Console.WriteLine("InstanceAlign of creprTaggedUnion: {}", typeof(TaggedUnion).InstanceAlign);
        Console.WriteLine("InstanceStride of creprTaggedUnion: {}", typeof(TaggedUnion).InstanceStride);

        var creprTaggedUnion = TaggedUnion.Int(1);
        let creprTaggedUnionPtr = (uint8*)&creprTaggedUnion;
        Console.WriteLine("First byte of creprTaggedUnion: {}", *creprTaggedUnionPtr);
        Console.WriteLine("Last byte of creprTaggedUnion: {}", creprTaggedUnionPtr[sizeof(TaggedUnion) - 1]);

        if (*creprTaggedUnionPtr == 1 && creprTaggedUnionPtr[sizeof(TaggedUnion) - 1] == 0)
        {
            Console.WriteLine("Beef but type of crepr tagged union in last byte");

			if (isLast)
			{
				Console.WriteLine("CRepr have no effect on tagged union");
			}
        }
        else
        {
            Console.WriteLine("Beef but type of crepr tagged union in first byte");

			if (!isLast)
			{
				Console.WriteLine("CRepr have no effect on tagged union");
			}
        }

		Console.Read();
    }
}