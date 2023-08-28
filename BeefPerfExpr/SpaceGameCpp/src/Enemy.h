#pragma once

#include <SDL2/SDL.h>
#include "Entity.h"

namespace SpaceGame
{
	class Enemy : public Entity
	{
    public:
		int 		mHealth;
		SDL_Rect 	mBoundingBox;
	};
}
