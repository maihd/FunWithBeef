#pragma once

#include <stdint.h>
#include <SDL2/SDL.h>

#include <string>
#include <string_view>

namespace SDL2
{
    class Font;
    class Image;
    class Sound;

    extern SDLApp* gApp;
	class SDLApp
	{
    public:
		SDL_Window*         mWindow             = nullptr;
		SDL_Renderer*       mRenderer           = nullptr;
		SDL_Surface*        mScreen             = nullptr;
		int32_t             mUpdateCnt          = 0;
		std::string         mTitle              = "Beef Sample";
		int32_t             mWidth              = 1024;
		int32_t             mHeight             = 768;
		const uint8_t*      mKeyboardState      = nullptr;
		bool                mHasAudio           = false;
		bool                mDidInit            = false;

    private:
		Stopwatch           mFPSStopwatch       = default;
		int32_t             mFPSCount           = 0;
		Stopwatch           mStopwatch          = default;
		int                 mCurPhysTickCount   = 0;

    public:
		SDLApp();
		~SDLApp();

    public:
		void PreInit();

		virtual void Init();

		bool IsKeyDown(SDL_Scancode scancode);

		virtual void Update();
		virtual void Draw();

		virtual void KeyDown(const SDL_KeyboardEvent& evt);
		virtual void KeyUp(const SDL_KeyboardEvent& evt);

		virtual void MouseDown(const SDL_MouseButtonEvent& evt);
		virtual void MouseUp(const SDL_MouseButtonEvent& evt);

		virtual void HandleEvent(const SDL_Event& evt);

		void Draw(Image* image, float x, float y);
		void Draw(Image* image, float x, float y, float rot, float centerX, float centerY);
		void DrawString(Font* font, float x, float y, std::string_view str, SDL_Color color, bool centerX = false);
		void PlaySound(Sound* sound, float volume = 1.0f, float pan = 0.5f);
		void Render();
		void Run();
		bool RunOneFrame();
	};
}
