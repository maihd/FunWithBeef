#include "GameApp.h"

namespace SpaceGame
{
    GameApp gGameApp;

    GameApp::GameApp()
    {
        gGameApp = this;

        mHero = new Hero();
        AddEntity(mHero);

        mHero.mY = 650;
        mHero.mX = 512;
    }
}