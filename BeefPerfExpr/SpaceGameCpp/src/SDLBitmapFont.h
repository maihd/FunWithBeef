#pragma once

#include <stdint.h>
#include <vector>

namespace SDL2
{
    class Image;

	class BitmapFont
	{
    public:
		struct Page
		{
            Image*              mImage;
		};

		struct CharData
		{
			int32_t             mX;
			int32_t             mY;
			int32_t             mWidth;
			int32_t             mHeight;
			int32_t             mXOfs;
			int32_t             mYOfs;
			int32_t             mXAdvance;
			int32_t             mPage;
		};

    public:
		std::vector<Page>       mPages;
		std::vector<CharData>   mCharData;

    public:
        ~BitmapFont();
	};
}