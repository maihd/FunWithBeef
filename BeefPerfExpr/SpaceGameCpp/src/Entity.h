#pragma once

#include <stdint.h>

namespace SpaceGame
{
	class Entity
	{
	public:
		bool 		mIsDeleting;
		uint32_t 	mUpdateCnt;
		float 		mX;
		float 		mY;
		
	public:
		inline bool IsOffscreen(float marginX, float marginY)
		{
			return ((mX < -marginX) || (mX >= gGameApp.mWidth + marginX) || (mY < -marginY) || (mY >= gGameApp.mHeight + marginY));
		}

	public:
		virtual void Update();
		virtual void Draw();
	};
}
