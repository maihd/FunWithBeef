namespace BeefExtendCpp;

using System;

struct CppVector<T>
{
    // Oops, cannot read the code from C++ stdlib, so we need to create bindings that work on C++ stdlib
    // Suggestion: bindings depends on Beef's Span
}

struct CppString
{
    // Oops, cannot read the code from C++ stdlib, so we need to create bindings that work on C++ stdlib
    // Suggestion: bindings depends on Beef's StringView
}

[CRepr]
struct CppNode
{
    void* VTable;

    float x;
    float y;

    CppVector<CppNode*> children;

    [LinkName("Node_Update")]
    public static extern void Update(Self* node, float dt);

    [LinkName("Node_Draw")]
    public static extern void Draw(Self* node);
}

[CRepr]
struct CppSprite : CppNode
{
    CppString image;

    [LinkName("Sprite_Create")]
    public static extern Self* Create();

    [LinkName("Sprite_Destroy")]
    public static extern void Destroy(Self* sprite);

    [LinkName("Sprite_Update")]
    public static extern void Update(Self* node, float dt);

    [LinkName("Sprite_Draw")]
    public static extern void Draw(Self* node);
}

struct PlacementAlloc : this(void* memory)
{
    public void* Alloc(int size, int align)
    {
        return memory;
    }

    public static mixin New<T>(void* memory)
        where T : new
    {
        let alloc = PlacementAlloc(memory);
        new:alloc T()
    }
}

[AlwaysInclude]
class BfNode
{
    protected CppNode* cppNode;

    public virtual void Update(float dt)
    {
        CppNode.Update(cppNode, dt);
    }

    public virtual void Draw()
    {
        CppNode.Draw(cppNode);
    }
}

[AlwaysInclude]
[GenCppWrapper("Sprite")]
class BfSprite : BfNode
{
    protected CppSprite* cppSprite => (.)cppNode;

    [GenCppMethod]
    public this(CppNode* node)
    {
        this.cppNode = node;
    }

    [GenCppMethod]
    public ~this()
    {
    }
    
    [GenCppMethod]
    public override void Update(float dt)
    {
        CppSprite.Update(cppSprite, dt);
    }

    [GenCppMethod]
    public override void Draw()
    {
        CppSprite.Draw(cppSprite);
        Console.WriteLine("BfSprite.Draw");
    }
}

[AlwaysInclude]
[GenCppBinds(typeof(BfSprite))]
internal static class BfSpriteBinds
{
}