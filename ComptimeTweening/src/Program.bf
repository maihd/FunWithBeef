using System;
using System.Collections;

namespace ComptimeTypeInfo;

class Program
{
	[Comptime]
	public static void PrintTypeInfo<T>()
	{
		Type type = typeof(T);
		String name = type.GetName(..scope String());
		Compiler.MixinRoot(scope $"""
			System.Console.WriteLine($"typeof(T) = {name}");
		""");
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
			let typeT = typeof(T);
			let typeV = typeof(V);

			let nameT = typeT.GetFullName(..scope String());
			let nameV = typeV.GetFullName(..scope String());

			// Make sure T is reference type
			if (typeT.IsValueType)
			{
				Runtime.FatalError(scope $"{nameT} must be a reference type");
			}
		
			// T must has all fields of V
			for (let fieldV in typeV.GetFields())
			{
				var found = false;
				for (let fieldT in typeT.GetFields())
				{
					if (fieldV.Name == fieldT.Name)
					{
						found = true;
						break;
					}
				}

				if (!found)
				{
					Runtime.FatalError(scope $"{nameT} does not contains all fields of {nameV}");
				}
			}

			// Generation tween function
			let code = scope String(10 * 1024);
			code.Append("V startValue = ?;\n");

			for (let fieldV in typeV.GetFields())
			{
				code.Append(scope $"startValue.{fieldV.Name} = target.{fieldV.Name};");
			}
			
			code.Append("\n");
			code.Append("TweenFuncDel<T, V> routine = new [=startValue, =easeFunc](target, value, time) =>\n");
			code.Append("{\n");

			for (let fieldV in typeV.GetFields())
			{
				code.Append(scope $"	target.{fieldV.Name} = easeFunc(startValue.{fieldV.Name}, value.{fieldV.Name}, time);\n");
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

	class Entity
	{
		public float x;
		public float y;
	}

	public static int Main(String[] args)
	{
		Console.WriteLine("Comptime Type Info");
		defer {
			Console.WriteLine("Press any key to close...");
			Console.Read();
		}

		PrintTypeInfo<StringView>();

		Entity entity = new Entity() { x = 0.0f, y = 0.0f };
		defer delete entity;

		let runner = Tween(entity, (x: 10.0f), 1.0f, => DefEaseFunc);
		defer delete runner;

		runner(1.0f);
		Console.WriteLine("entity.x = {}", entity.x);
		
		let runnerY = Tween(entity, (y: 20.0f), 1.0f, => DefEaseFunc);
		defer delete runnerY;

		runnerY(0.5f);
		Console.WriteLine("entity.y = {}", entity.y);

		// This will cause compile error
		//Tween(object, (z: 0.0f), 1.0f);

		return 0;
	}
}