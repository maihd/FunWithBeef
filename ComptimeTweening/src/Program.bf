using System;
using System.Reflection;
using System.Collections;

namespace ComptimeTypeInfo;

class Program
{
	[Comptime]
	public static void PrintTypeInfo<T>(bool noUnderlyingType = true)
	{
		Type type = typeof(T);
        if (type.IsPointer && !noUnderlyingType)
        {
            type = type.UnderlyingType;
        }

		String name = type.GetName(..scope String());
		Compiler.MixinRoot(scope $"""
			System.Console.WriteLine($"typeof(T) = {name}");
		""");

        for (let field in type.GetFields())
        {
            Compiler.MixinRoot(scope $"""
            	System.Console.WriteLine($"{name} has field: {field.Name}");
            """);
        }

        for (let method in type.GetMethods())
        {
            Compiler.MixinRoot(scope $"""
            	System.Console.WriteLine($"{name} has method: {method.Name}");
            """);

            if (method.Name == "get__x")
            {
                Compiler.MixinRoot(scope $"""
                	System.Console.WriteLine($"{name} has properties x");
                """);
            }
        }
	}

	public function void TweenFunc<T, V>(T target, V value, float time);
	public function float EaseFunc(float s, float e, float t);
	public delegate void TweenFuncDel<T, V>(T target, V value, float time);
	public delegate void TweenRunner(float dt);

	public static float DefEaseFunc(float s, float e, float t)
	{
		return (s * (1.0f - t)) + (e * t);
	}

	public static class TweenFuncs
	{
		[Comptime]
		public static void GenTweenFunc<T, V>()
		{
			var typeT = typeof(T);
			var typeV = typeof(V);

			let nameT = typeT.GetFullName(..scope String());
			let nameV = typeV.GetFullName(..scope String());

			// Make sure T is reference type
			if (typeT.IsValueType)
			{
				Runtime.FatalError(scope $"{nameT} must be a reference type");
			}
		
			// T must has all fields of V
            const let checkFields = false;
            if (checkFields)
            {
				// Currently Beef pointer is void* only
                if (typeT.IsPointer)
                {
                    typeT = typeT.UnderlyingType;
                }

				// Currently Beef pointer is void* only
				if (typeV.IsPointer)
				{
					typeV = typeV.UnderlyingType;
				}

    			for (let fieldV in typeV.GetFields())
    			{
                    var found = false;

                    for (let fieldT in typeT.GetFields())
                    {
                        if (fieldT.Name == fieldV.Name)
                        {
                            found = true;
                            break;
                        }
                    }

                    if (!found)
                    {
                        var foundGetter = false;
                        var foundSetter = false;

                        let getterName = scope $"get__{fieldV.Name}";
                        let setterName = scope $"set__{fieldV.Name}";
                        for (let methodT in typeT.GetMethods())
                        {
                            if (methodT.Name == getterName)
                            {
                                foundGetter = true;
                            }

                            if (methodT.Name == setterName)
                            {
                                foundSetter = true;
                            }

                            if (foundGetter && foundSetter)
                            {
                                found = true;
                                break;
                            }
                        }

                        /*This code cause CmpEq error
                        found = typeT.GetMethod(getterName) != .Err(.NoResults) &&
							    typeT.GetMethod(setterName) != .Err(.NoResults);
                        */
                    }
    
    				if (!found)
    				{
    					Runtime.FatalError(scope $"{nameT} does not contains all fields/properties of {nameV}. Requiring \"{fieldV.Name}\".");
    				}
    			}
            }

			// Generation tween function
			let code = scope String();
			code.Append("#unwarn\n");
			code.Append("V startValue = ?;\n");
			for (let fieldV in typeV.GetFields())
			{
				let fieldName = fieldV.Name;
				code.Append(scope $"startValue.{fieldName} = target.{fieldName};\n");
			}
			code.Append("\n");

			code.Append("readonly TweenFuncDel<T, V> routine = new [=startValue, =easeFunc](target, value, time) =>\n");
			code.Append("{\n");

			for (let fieldV in typeV.GetFields())
			{
				let fieldName = fieldV.Name;
				code.Append(scope $"	target.{fieldName} = easeFunc(startValue.{fieldName}, value.{fieldName}, time);\n");
			}

			code.Append("};");
			Compiler.MixinRoot(code);
		}
	}

	struct TweenState
	{
		public bool done = false;
		public float totalTime = 0.0f;
	}

	public static TweenRunner Tween<T, V>(T target, V value, float duration, EaseFunc easeFunc, Action onDone = null)
	{
		// Generate tween function with comptime features
		TweenFuncs.GenTweenFunc<T, V>();

		// States
		// With syntax like new:SchedulerArena
		let state = new TweenState();

		// Runner, can add schedule allocator
		// With syntax like new:SchedulerArena
		TweenRunner runner = new [=](dt) => {
			if (state.done)
			{
				return;
			}

			state.totalTime += dt;
			state.totalTime = Math.Min(state.totalTime, duration);

			routine(target, value, state.totalTime / duration);

			if (state.totalTime >= duration)
			{
				state.done = true;
				onDone?.Invoke();

				// Unschedule
			}
		} ~ {
			// Should use better dellocations
			delete state;
			delete routine;
		};

		// Add runner to timer/scheduler
		return runner;
	}

    struct Vector2
    {
        public float x;
        public float y;
    }
    
	class Entity
	{
		// Reflection cannot find fields "x", "y"
        using public Vector2 position;

		//public Vector2 position;

        //public float x { get => position.x; set => position.x = value; }
        //public float y { get => position.y; set => position.y = value; }
	}

	public static int Main(String[] args)
	{
		Console.WriteLine("Comptime Type Info");
		defer {
			Console.WriteLine("Press any key to close...");
			Console.Read();
		}

        //PrintTypeInfo<Vector2>();
        //PrintTypeInfo<Vector2*>(noUnderlyingType: true); -> will print void*
        //PrintTypeInfo<Entity>();
		//PrintTypeInfo<StringView>();

		Entity entity = new Entity() { x = 0.0f, y = 0.0f };
		defer delete entity;

		let tweenerX = Tween(entity, (x: 10.0f), 1.0f, => DefEaseFunc);
		defer delete tweenerX;

		tweenerX(1.0f);
		Console.WriteLine("entity.x = {}", entity.x);
		
		let tweenerY = Tween(entity, (y: 20.0f), 1.0f, => DefEaseFunc);
		defer delete tweenerY;

		tweenerY(0.5f);
		Console.WriteLine("entity.y = {}", entity.y);
		
		let tweenerPos = Tween(&entity.position, Vector2 { x = 0.0f, y = 0.0f }, 1.0f, => DefEaseFunc);
		defer delete tweenerPos;

		tweenerPos(0.5f);
		Console.WriteLine("entity.position = ({}, {})", entity.x, entity.y);
		
		let tweener = Tween(entity, Vector2 { x = 0.0f, y = 0.0f }, 1.0f, => DefEaseFunc);
		defer delete tweener;

		tweener(0.5f);
		Console.WriteLine("entity.position = ({}, {})", entity.x, entity.y);

		// This will cause compile error
		// Tween(entity, (z: 0.0f), 1.0f, => DefEaseFunc);

		return 0;
	}
}