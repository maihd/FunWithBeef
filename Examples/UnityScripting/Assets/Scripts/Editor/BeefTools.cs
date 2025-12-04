using System.Diagnostics;
using System.IO;
using UnityEditor;
using UnityEngine;

public static class BeefTools
{
    [MenuItem("Assets/Open Beef Workspace")]
    public static void OpenWorkspace()
    {
        var command = $"-workspace={Path.GetFullPath("./")}";
        
        var processInfo = new ProcessStartInfo();
        processInfo.FileName = "BeefIDE.exe";
        processInfo.Arguments = command;
        Process.Start(processInfo);
    }
}
