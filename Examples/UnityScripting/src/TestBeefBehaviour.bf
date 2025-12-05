namespace UnityScripting;

[UnityExport]
public class TestBeefBehaviour : BeefBehaviour
{
    public int32 X;
    public int32 Y;
    public int32 Z;

    protected override void OnStart()
    {
        DebugLog("TestBeefBehaviour Start");

        X = 1;
        Y = 2;
        Z = 3;
    }

    protected override void OnUpdate()
    {
        DebugLog("TestBeefBehaviour Update");

        X += 1;
        Y += 2;
        Z += 3;
    }
}