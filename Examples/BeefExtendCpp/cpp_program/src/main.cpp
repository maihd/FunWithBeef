#include <stdio.h>

#include "CppLib.h"
#include "BfSprite.h"

class CppBfSprite : public BfSprite
{
public:
	CppBfSprite()
		: BfSprite()
	{
	}

	virtual ~CppBfSprite()
	{
	}

public:
	virtual void Update(float dt) override
	{
		BfSprite::Update(dt);
		printf("CppBfSprite: call BfSprite.Update from C++\n");
	}

	virtual void Draw() override
	{
		BfSprite::Draw();
		printf("CppBfSprite: call BfSprite.Draw from C++\n");
	}
};


int main()
{
	printf("BeefExtendCpp CppProgram\n");

	CppBfSprite* sprite = new CppBfSprite();
	sprite->Update(0.0f);

	Sprite* nativeSprite = sprite;
	nativeSprite->Draw();

	delete sprite;

	return 0;
}


//! EOF
