#pragma once

#include <SDL2/SDL.h>
#include "Enemy.h"

namespace SpaceGame
{
	class EnemyGolaith : public Enemy
	{
		enum State
		{
			Lowering,
			Firing,
			Raising,

			Death
		};

		State       mState;
		int         mStateTick;
		float       mAlpha = 1.0f;

    public:
		EnemyGolaith()
		{
			mBoundingBox = SDL_Rect{ -60, -150, 120, 300 };
			mHealth = 20;
		}

		virtual void Update() override;

        virtual void Draw() override
		{
			SDL.SetTextureAlphaMod(Images.sEnemyGoliath.mTexture, (.)(255 * mAlpha));
			gGameApp.Draw(Images.sEnemyGoliath, mX - 63, mY - 168);
			SDL.SetTextureAlphaMod(Images.sEnemyGoliath.mTexture, 255);
		}
	}
}
