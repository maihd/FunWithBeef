#include "SDLFont.h"

#include <string>

namespace SDL2
{
    static bool StartsWith(std::string_view str, std::string_view substr)
    {
        return str.find_first_of(substr) == 0;
    }

    static bool EndsWith(std::string_view str, std::string_view substr)
    {
        return str.find_last_of(substr) == str.size() - substr.size();
    }

    static bool CheckVal(std::string_view text, std::string_view key, int32_t* val)
    {
        if (!StartsWith(text, key))
            return false;

        if (text[key.size()] != '=')
            return false;

        sscanf(text.substr(key.size() + 1).data(), "%d", val);
        return true;
    }

    static bool CheckVal(std::string_view text, const std::string& key, std::string& val)
    {
        if (!StartsWith(text, key))
            return false;

        if (text[key.size()] != '=')
            return false;

        std::string_view sv = text.substr(key.size() + 1);
        if (StartsWith(sv, "\""))
            sv = sv.substr(1);

        if (EndsWith(sv, "\""))
            sv = sv.substr(0, sv.size() - 1);

        val.append(sv);
        return true;
    }

    Font::~Font()
	{
		if (mFont != nullptr)
			SDLTTF_CloseFont(mFont);

		delete mBMFont;
	}

	bool Font::Load(std::string_view fileName, int32_t pointSize)
	{
		if (EndsWith(fileName, ".fnt"))
		{
			mBMFont = new BitmapFont();

			var contents = File.ReadAllText(fileName, .. scope .());
			contents.Replace("\r", "");

			for (var line in contents.Split('\n', .RemoveEmptyEntries))
			{
				if (line.StartsWith("page"))
				{
					std::string imageFileName;

					for (const auto text : line.split(' ', .RemoveEmptyEntries))
						CheckVal(text, "file", imageFileName);

					var dir = Path.GetDirectoryPath(fileName, .. scope .());
					var imagePath = scope $"{dir}/{imageFileName}";

					BitmapFont.Page page = new BitmapFont.Page();
					page.mImage = new Image()..Load(imagePath);
					mBMFont.mPages.Add(page);
				}
					
				if (line.StartsWith("char"))
				{
					BitmapFont.CharData* charData = null;

					for (var text in line.Split(' ', .RemoveEmptyEntries))
					{
						int32 id = 0;
						if (CheckVal(text, "id", ref id))
						{
							while (id >= mBMFont.mCharData.Count)
								mBMFont.mCharData.Add(default);
							charData = &mBMFont.mCharData[id];
						}

						if (charData != null)
						{
							CheckVal(text, "x", ref charData.mX);
							CheckVal(text, "y", ref charData.mY);
							CheckVal(text, "width", ref charData.mWidth);
							CheckVal(text, "height", ref charData.mHeight);
							CheckVal(text, "xoffset", ref charData.mXOfs);
							CheckVal(text, "yoffset", ref charData.mYOfs);
							CheckVal(text, "xadvance", ref charData.mXAdvance);
							CheckVal(text, "page", ref charData.mPage);
						}
					}
				}
			}

			return true;
		}

		mFont = SDLTTF_OpenFont(fileName.data(), pointSize);
		if (mFont == nullptr)
			return false;

		return true;
	}
}
