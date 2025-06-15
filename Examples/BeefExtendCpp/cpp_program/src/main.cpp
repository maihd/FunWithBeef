#include <stdio.h>

#include "CppLib.h"

extern "C" __declspec(dllimport) void BfSprite_Ctor(Node* node, void* memory);
extern "C" __declspec(dllimport) void BfSprite_Dtor(void* memory);

extern "C" __declspec(dllimport) void BfSprite_Update(void* memory, float dt);
extern "C" __declspec(dllimport) void BfSprite_Draw(void* memory);

class BfSprite : public Sprite
{
private:
	char buffer[128]; // Just redeem it's big enough to hold BfSprite data
	
public:
	BfSprite()
	{
		BfSprite_Ctor(this, buffer);
	}

	~BfSprite()
	{
		BfSprite_Dtor(buffer);
	}

public:
	virtual void Update(float dt) override
	{
		BfSprite_Update(buffer, dt);
		printf("BfSprite.Update from C++\n");
	}

	virtual void Draw() override
	{
		BfSprite_Draw(buffer);
		printf("BfSprite.Draw from C++\n");
	}
};


int main()
{
	printf("BeefExtendCpp CppProgram\n");

	BfSprite* sprite = new BfSprite();
	sprite->Draw();

	delete sprite;

	return 0;
}


//! EOF
