#include "SDLApp.h"

#include "SDLFont.h"
#include "SDLImage.h"
#include "SDLSound.h"

namespace SDL2
{
    SDLApp* gApp;

    SDLApp::SDLApp()
    {
        gApp = this;
    }

    SDLApp::~SDLApp()
    {
        if (mRenderer != nullptr)
            SDL_DestroyRenderer(mRenderer);
        if (mWindow != nullptr)
            SDL_DestroyWindow(mWindow);
    }

    void SDLApp::PreInit()
    {
#if BF_PLATFORM_WASM
        emscripten_set_main_loop(= > EmscriptenMainLoop, 0, 1);
#endif
    }

    void SDLApp::Init()
    {
        mDidInit = true;

        //char* exePath = SDL_GetBasePath();
        //Environment.GetExecutableFilePath(exePath);

        //std::string exeDir = SDL_GetBasePath();
        //if (Path.GetDirectoryPath(exePath, exeDir) case.Ok)
        //    Directory.SetCurrentDirectory(exeDir);

        SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_AUDIO);
        SDL_EventState(.JoyAxisMotion, .Disable);
        SDL_EventState(.JoyBallMotion, .Disable);
        SDL_EventState(.JoyHatMotion, .Disable);
        SDL_EventState(.JoyButtonDown, .Disable);
        SDL_EventState(.JoyButtonUp, .Disable);
        SDL_EventState(.JoyDeviceAdded, .Disable);
        SDL_EventState(.JoyDeviceRemoved, .Disable);

        //mWindow = SDL_CreateWindow(mTitle, .Undefined, .Undefined, mWidth, mHeight, .Hidden); // Initially hide window
        mWindow = SDL_CreateWindow(mTitle.c_str(), SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, mWidth, mHeight, SDL_WINDOW_SHOWN); // Initially hide window

        mRenderer = SDL_CreateRenderer(mWindow, -1, .Accelerated);
        mScreen = SDL_GetWindowSurface(mWindow);

        SDLImage_Init(.PNG);

        mHasAudio = SDLMixer_OpenAudio(44100, SDLMixer.MIX_DEFAULT_FORMAT, 2, 4096) >= 0;

        SDL_SetRenderDrawBlendMode(mRenderer, .Blend);

        SDLTTF_Init();
    }

    bool SDLApp::IsKeyDown(SDL_Scancode scancode)
    {
        if (mKeyboardState == nullptr)
            return false;

        return mKeyboardState[(int)scancode];
    }

    void SDLApp::Update()
    {

    }

    void SDLApp::Draw()
    {

    }

    void SDLApp::KeyDown(const SDL_KeyboardEvent& evt)
    {
        if (evt.keysym.scancode == SDL_SCANCODE_GRAVE)
        {
            //GC.Report();
        }
    }

    void SDLApp::KeyUp(const SDL_KeyboardEvent& evt)
    {

    }

    void SDLApp::MouseDown(const SDL_MouseButtonEvent& evt)
    {

    }

    void SDLApp::MouseUp(const SDL_MouseButtonEvent& evt)
    {

    }

    void SDLApp::HandleEvent(const SDL_Event& evt)
    {

    }

    void SDLApp::Draw(Image* image, float x, float y)
    {
        SDL_Rect srcRect = SDL_Rect{ 0, 0, image->mWidth, image->mHeight};
        SDL_Rect destRect = SDL_Rect{ (int)x, (int)y, image->mWidth, image->mHeight};
        SDL_RenderCopy(mRenderer, image->mTexture, &srcRect, &destRect);
    }

    void SDLApp::Draw(Image* image, float x, float y, float rot, float centerX, float centerY)
    {
        SDL_Rect srcRect = SDL_Rect{0, 0, image->mWidth, image->mHeight};
        SDL_Rect destRect = SDL_Rect{(int)x, (int)y, image->mWidth, image->mHeight};
        SDL_Point centerPoint = SDL_Point{(int)centerX, (int)centerY};
        SDL_RenderCopyEx(mRenderer, image->mTexture, &srcRect, &destRect, rot, &centerPoint, SDL_FLIP_NONE);
    }

    void SDLApp::DrawString(Font* font, float x, float y, std::string_view str, SDL_Color color, bool centerX = false)
    {
        if (font->mBMFont != nullptr)
        {
            for (const auto page : font->mBMFont->mPages)
                SDL_SetTextureColorMod(page.mImage->mTexture, color.r, color.g, color.b);

            float drawX = x;
            float drawY = y;

            if (centerX)
            {
                float width = 0;

                for (const auto c : str)
                {
                    if (c >= font->mBMFont->mCharData.size())
                        continue;

                    const auto& charData = font->mBMFont->mCharData[c];
                    width += charData.mXAdvance;
                }

                drawX -= width / 2;
            }

            for (const auto c : str)
            {
                if (c >= font->mBMFont->mCharData.size())
                    continue;

                auto& charData = font->mBMFont->mCharData[c];

                SDL_Rect srcRect = SDL_Rect{charData.mX, charData.mY, charData.mWidth, charData.mHeight};
                SDL_Rect destRect = SDL_Rect{(int)drawX + charData.mXOfs, (int)drawY + charData.mYOfs, charData.mWidth, charData.mHeight};
                SDL_RenderCopy(mRenderer, font->mBMFont->mPages[charData.mPage].mImage->mTexture, &srcRect, &destRect);

                drawX += charData.mXAdvance;
            }
        }
        else
        {
#if !NOTTF
            SDL_SetRenderDrawColor(mRenderer, 255, 255, 255, 255);

            const auto surface = SDLTTF_RenderUTF8_Blended(font->mFont, str, color);
            const auto texture = SDL_CreateTextureFromSurface(mRenderer, surface);
            SDL_Rect srcRect = SDL_Rect{0, 0, surface.w, surface.h};

            if (centerX)
                x -= surface.w / 2;

            SDL_Rect destRect = SDL_Rect{(int)x, (int)y, surface.w, surface.h};
            SDL_RenderCopy(mRenderer, texture, &srcRect, &destRect);
            SDL_FreeSurface(surface);
            SDL_DestroyTexture(texture);
#endif
        }
    }

    void SDLApp::PlaySound(Sound* sound, float volume = 1.0f, float pan = 0.5f)
    {
        if (sound == nullptr)
            return;

        int32_t channel = SDLMixer_PlayChannelTimed(-1, sound->mChunk, 0, 0);
        if (channel < 0)
            return;
        SDLMixer_Volume(channel, (int32_t)(volume * 128));
    }

    void SDLApp::Render()
    {
        SDL_SetRenderDrawColor(mRenderer, 0, 0, 0, 255);
        SDL_RenderClear(mRenderer);
        Draw();
        SDL_RenderPresent(mRenderer);
    }

#if BF_PLATFORM_WASM
    private function void em_callback_func();

    [CLink, CallingConvention(.Stdcall)]
    private static extern void emscripten_set_main_loop(em_callback_func func, int32 fps, int32 simulateInfinteLoop);

    [CLink, CallingConvention(.Stdcall)]
    private static extern int32 emscripten_set_main_loop_timing(int32 mode, int32 value);

    [CLink, CallingConvention(.Stdcall)]
    private static extern double emscripten_get_now();

    private static void EmscriptenMainLoop()
    {
        if (!gApp.mDidInit)
        {
            gApp.Init();
            gApp.mStopwatch.Start();
        }
        gApp.RunOneFrame();
    }
#endif

    void SDLApp::Run()
    {
        mStopwatch.Start();

#if BF_PLATFORM_WASM
        emscripten_set_main_loop(= > EmscriptenMainLoop, 0, 1);
#else
        while (RunOneFrame()) {}

#endif
    }

    bool SDLApp::RunOneFrame()
    {
        if (!mFPSStopwatch.IsRunning)
            mFPSStopwatch.Start();
        mFPSCount++;
        if (mFPSStopwatch.ElapsedMilliseconds > 1000)
        {
            //Debug.WriteLine($"FPS: {mFPSCount} @ {mStopwatch.Elapsed} now: {emscripten_get_now()}");
            mFPSCount = 0;
            mFPSStopwatch.Restart();
        }

        SDL_Event event;
        int waitTime = 1;
        while (SDL_PollEvent(&event) != 0)
        {
            switch (event.type)
            {
            case SDL_QUIT:
                return false;

            case SDL_KEYDOWN:
                KeyDown(event.key);
                break;

            case SDL_KEYUP:
                KeyUp(event.key);
                break;

            case SDL_MOUSEBUTTONDOWN:
                MouseDown(event.button);
                break;

            case SDL_MOUSEBUTTONUP:
                MouseUp(event.button);
                break;

            default:
                break;
            }

            HandleEvent(event);

            waitTime = 0;
        }

        // Fixed 60 Hz update
        double msPerTick = 1000 / 60.0;
        int newPhysTickCount = (int)(mStopwatch.ElapsedMilliseconds / msPerTick);

        int addTicks = newPhysTickCount - mCurPhysTickCount;
        if (mCurPhysTickCount == 0)
        {
            // Initial render
            Render();
            // Show initially hidden window, mitigates white flash on slow startups
            SDL_ShowWindow(mWindow);
        }
        else
        {
            mKeyboardState = SDL_GetKeyboardState(nullptr);

            addTicks = fminf(addTicks, 20); // Limit catchup
            if (addTicks > 0)
            {
                for (int i = 0; i < addTicks; i++)
                {
                    mUpdateCnt++;
                    Update();
                }
                Render();
            }
            else
            {
                SDL_Delay(1);
            }
        }

        mCurPhysTickCount = newPhysTickCount;
        return true;
    }
}