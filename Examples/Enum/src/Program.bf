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
		case Int(int);
		case UInt(uint);
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
        //Console.WriteLine("Tag value of taggedUnion: {}", taggedUnion.Underlying); // No supported, use the last byte
        Console.WriteLine("First byte of taggedUnion: {}", *taggedUnionPtr);
        Console.WriteLine("Last byte of taggedUnion: {}", taggedUnionPtr[sizeof(TaggedUnion) - 1]);
        Console.WriteLine("Unsafe get value of taggedUnion: {}", *(int*)taggedUnionPtr);

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

        if (isLast)
        {
            Console.WriteLine("The structure layout of TaggedUnion like this (packed): [ValueType][Tag as uint8][<padding>]");
            Console.WriteLine("The structure layout of TaggedUnion in C: #pragma pack struct { ValueType Value; uint8 Tag; uint8 __padding[<size gen by compiler>]; };");
        }
        else
        {
            Console.WriteLine("The structure layout of TaggedUnion like this (packed): [Tag as uint8][ValueType][<padding>]");
            Console.WriteLine("The structure layout of TaggedUnion in C: #pragma pack struct { uint8 Tag; ValueType Value; uint8 __padding[<size gen by compiler>]; };");
        }

        Console.WriteLine("");

        // Reverse engineering crepr tagged union enum

        Console.WriteLine("Size of creprTaggedUnion: {}", sizeof(CReprTaggedUnion));
        Console.WriteLine("Align of creprTaggedUnion: {}", alignof(CReprTaggedUnion));
        Console.WriteLine("Stride of creprTaggedUnion: {}", strideof(CReprTaggedUnion));

        Console.WriteLine("InstanceSize of creprTaggedUnion: {}", typeof(CReprTaggedUnion).InstanceSize);
        Console.WriteLine("InstanceAlign of creprTaggedUnion: {}", typeof(CReprTaggedUnion).InstanceAlign);
        Console.WriteLine("InstanceStride of creprTaggedUnion: {}", typeof(CReprTaggedUnion).InstanceStride);

        var creprTaggedUnion = CReprTaggedUnion.Int(1);
        let creprTaggedUnionPtr = (uint8*)&creprTaggedUnion;
        Console.WriteLine("First byte of creprTaggedUnion: {}", *creprTaggedUnionPtr);
        Console.WriteLine("Last byte of creprTaggedUnion: {}", creprTaggedUnionPtr[sizeof(CReprTaggedUnion) - 1]);

        if (*creprTaggedUnionPtr == 1 && creprTaggedUnionPtr[sizeof(CReprTaggedUnion) - 1] == 0)
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

        // Pattern matching
        if (taggedUnion case .Int(let i)) {
            Console.WriteLine("TaggedUnion.Int value: {}", i);
        }

        if (taggedUnion case .UInt(let u)) {
            Console.WriteLine("TaggedUnion.UInt value: {}", u);
        }

        switch (taggedUnion)
        {
        case .Int(let _i) when _i > 0:
            Console.WriteLine("TaggedUnion.Int value in switch case with when: {}", _i);
            break;

        case .UInt(let _u) when _u > 0:
            Console.WriteLine("TaggedUnion.UInt value in switch case with when: {}", _u);
            break;

        default:
            break;
        }

        // Pattern matching compare to C# (case instead of is)
        int? maybeNumber = 12;
        if (maybeNumber case int(let number))
        {
            Console.WriteLine("maybeNumber value: {}", number);
        }
        else
        {
            Console.WriteLine("maybeNumber is null");
        }

        // No not null like C#
        /*if (maybeNumber case not null)
        {

        }*/

        // Use comparation operators
        if (maybeNumber != null)
        {
        }

        // No switch expression
        /*var x = taggedUnion switch {
            .Int(let v) => v,
            _ => 0
        };*/

		Console.Read();
    }
}