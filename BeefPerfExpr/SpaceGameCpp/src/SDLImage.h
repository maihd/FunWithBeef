#pragma once

#include <stdint.h>
#include <string_view>
#include <SDL2/SDL.h>

namespace SDL2
{
	class Image
	{
    public:
		SDL_Surface*    mSurface;
		SDL_Texture*    mTexture;
		int32_t         mWidth;
		int32_t         mHeight;

    public:
        inline Image()
            : mSurface(nullptr)
            , mTexture(nullptr)
            , mWidth(0)
            , mHeight(0)
        {
        }

		inline ~Image()
		{
			if (mTexture != nullptr)
				SDL_DestroyTexture(mTexture);

			if (mSurface != nullptr)
				SDL_FreeSurface(mSurface);
		}

		bool Load(std::string_view fileName);
	};
}
