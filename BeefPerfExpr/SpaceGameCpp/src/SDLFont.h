#pragma once

#include <stdint.h>
#include <string_view>
#include "SDLBitmapFont.h"

namespace SDL2
{
    class Font
	{
    public:
		SDLTTF_Font* mFont = nullptr;
		BitmapFont*  mBMFont = nullptr;

    public:
		~Font();
		bool Load(std::string_view fileName, int32_t pointSize);
	}
}