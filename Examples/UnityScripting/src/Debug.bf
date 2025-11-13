namespace UnityScripting;

using System;

public static class Debug
{
	public static IUnityLog* sLogger;

	public static void Log(StringView text)
	{
		if (sLogger != null)
		{
			sLogger.Log(.Log, text.ToScopeCStr!(), Compiler.CallerFilePath, (int32)Compiler.CallerLineNum);
		}
	}
}