namespace UnityScripting;

using System;

[UnityExport]
public struct BeefComponent : UnityEngine.MonoBehaviour
{
	public String CharacterName;
    public int Level;

    public this(void* ptr) : base(ptr)
    {
        CharacterName = "";
        Level = 0;
    }
}