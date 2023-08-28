#pragma once

#include <stdint.h>
#include <string_view>

namespace SDL2
{
    class Sound
	{
    public:
		SDLMixer_Chunk* mChunk = nullptr;

    public:
		inline ~Sound()
		{
			if (mChunk != nullptr)
				SDLMixer_FreeChunk(mChunk);
		}

    public:
		inline bool Load(std::string_view fileName)
		{
			mChunk = SDLMixer_LoadWAV(fileName.data());
			if (mChunk == nullptr)
				return false;
			return true;
		}
	}
}