namespace pbc;

using System;

struct PbcMessage
{

}

struct PbcEnum
{

}

struct PbcField
{
	public int        id;
	public char8*     name;
	public int        type;
	public int        label;

	public TypeName   typeName;

	[Union]
	public struct TypeName
	{
        char8* n;
        PbcMessage* m;
        PbcEnum* e;
	}
}

struct PbcEnv
{
	public void* 	files;
	public void* 	enums;
	public void* 	msgs;
	public char8* 	lastError;
}