// C++ wrapper for BfSprite

#include "CppLib.h"

extern "C" __declspec(dllimport) void* BfSprite_Ctor(void* memory, void* node);
extern "C" __declspec(dllimport) void BfSprite_Dtor(void* self);
extern "C" __declspec(dllimport) void BfSprite_Update(void* self, float dt);
extern "C" __declspec(dllimport) void BfSprite_Draw(void* self);


class BfSprite : public Sprite
{
public:

    BfSprite()
    {
        auto self = this;
        BfSprite_Ctor(buffer, self);
    }

    ~BfSprite()
    {
        BfSprite_Dtor(buffer);
    }

    virtual void Update(float dt)
    {
        BfSprite_Update(buffer, dt);
    }

    virtual void Draw()
    {
        BfSprite_Draw(buffer);
    }



private:
    char buffer[24];
};

//! EOF
