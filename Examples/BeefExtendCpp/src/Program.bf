namespace BeefExtendCpp;

using System;

[CRepr]
struct CppNode
{
    void* VTable;

    [LinkName("Node_Update")]
    public static extern void Update(Self* node, float dt);

    [LinkName("Node_Draw")]
    public static extern void Draw(Self* node);
}

[CRepr]
struct CppSprite : CppNode
{
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
class BfSprite : BfNode
{
    protected CppSprite* cppSprite => (.)cppNode;

    [Export, LinkName("BfSprite_Ctor")]
    public static Self Ctor(CppNode* node, void* memory)
    {
        let alloc = PlacementAlloc(memory);
        let self = new:alloc Self();
        self.cppNode = node;
        return self;
    }

    [Export, LinkName("BfSprite_Dtor")]
    public static void Dtor(Self self)
    {
        delete:null self;
    }

    [Export, LinkName("BfSprite_Update")]
    public static void BfSprite_Update(Self self, float dt)
    {
        self.Update(dt);
    }

    [Export, LinkName("BfSprite_Draw")]
    public static void BfSprite_Draw(Self self)
    {
        self.Draw();
    }

    public override void Update(float dt)
    {
        CppSprite.Update(cppSprite, dt);
    }

    public override void Draw()
    {
        CppSprite.Draw(cppSprite);
        Console.WriteLine("BfSprite.Draw");
    }
}