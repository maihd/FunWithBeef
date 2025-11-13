namespace UnityScripting;

public static class Utils
{
	// Do this in C instead, purpose to prevent crash
	public static void SafeCall<TFunc>(TFunc func)
		where TFunc: delegate void()
	{
		func();
	}
}