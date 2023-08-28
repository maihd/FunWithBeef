#include "SDLBitmapFont.h"

namespace SDL2
{
    BitmapFont::~BitmapFont()
    {
        for (const auto page : mPages)
        {
            delete page.mImage;
        }
    }
}