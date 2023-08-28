#include "SDLApp.h"
#include "SDLImage.h"

namespace SDL2
{
    bool Image::Load(std::string_view fileName)
    {
        auto origSurface = SDLImage_Load(&fileName);
        if (origSurface == nullptr)
            return false;

        mSurface = origSurface;

        SDL_Rect rect = SDL_Rect{0, 0, mSurface->w, mSurface->h};
        mTexture = SDL_CreateTexture(gApp.mRenderer, SDL.PIXELFORMAT_ABGR8888, (.)SDL.TextureAccess.Static, mSurface.w, mSurface.h);

        uint32_t* data = new uint32_t[mSurface->w * mSurface->h];
        defer delete data;

        int res = SDL.ConvertPixels(mSurface.w, mSurface.h, mSurface.format.format, mSurface.pixels, mSurface.pitch, SDL.PIXELFORMAT_ABGR8888, data, mSurface.w * 4);
        if (res == -1)
        {
            for (int y = 0; y < mSurface.h; y++)
                memcpy(data + y * mSurface.w, (uint8*)mSurface.pixels + y * mSurface.pitch, mSurface.w * 4);
        }

        SDL.UpdateTexture(mTexture, &rect, data, mSurface.w * 4);
        SDL.SetTextureBlendMode(mTexture, .Blend);

        mWidth = mSurface.w;
        mHeight = mSurface.h;

        return Result<void>::Ok;
    }
}