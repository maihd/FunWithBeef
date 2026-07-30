namespace StateMachine;

using System;
using System.Reflection;

enum Status
{
	Running,
	Finished,
}

/*
static class StepMacro
{
	private static int* __step;
	private static int __macroStep;

	public static mixin Start(var step) { __step = &step; __macroStep = 0; }

	public static mixin InStep()
	{
		*__step == __macroStep++
	}

	public static mixin Stepping()
	{
		(*__step)++ == __macroStep++
	}

	public static mixin WaitWhile(bool condition)
	{
		if (StepMacro.InStep!())
		{
			if (condition)
			{
				return Status.Running;
			}
			else
			{
				*__step += 1;
			}
		}
	}

	// Add more mixing here
}
*/

struct StepMachine
{
	protected int step;
	private int stepMarker;

	// You can have timer to make some useful like Wait(duration) and TweenAndWait(tweenParams)
	//private float timer;
	//private float waitTimer;

	public mixin __Start() mut
	{
		stepMarker = 0;
	}

	public mixin InStep() mut
	{
		step == stepMarker++
	}

	public mixin Stepping() mut
	{
		step++ == stepMarker++
	}

	public mixin WaitWhile(bool condition) mut
	{
		if (InStep!())
		{
			if (condition)
			{
				return Status.Running;
			}
			else
			{
				step += 1;
			}
		}
	}
}

[AttributeUsage(.Method)]
struct StepMachineFuncAttribute : Attribute, IOnMethodInit
{
	[Comptime]
	public void OnMethodInit(MethodInfo info, Self* prev) mut
	{
		Compiler.EmitMethodEntry(info, "__Start!();");
	}
}

struct BossRoutine : StepMachine
{
	public bool attacking;

	[StepMachineFunc]
	public Status Attack() mut
	{
		Console.WriteLine("--- Attack ---");
		Console.WriteLine("Step: {}", step);

		if (Stepping!())
		{
			Console.WriteLine("Doing Attacking..."); // This will be printed 1 time
		}

		WaitWhile!(attacking);
		
		Console.WriteLine("Finished, do nothings!");  // This will be printed 1 time
		Console.WriteLine();
		return Status.Finished;
	}
}

static class Program
{
	static void Main()
	{
		Console.WriteLine("StateMachine with Beef");

		BossRoutine routine = .();
		routine.attacking = true;
		routine.Attack();

		routine.attacking = false;
		routine.Attack();

		Console.Read();
	}
}