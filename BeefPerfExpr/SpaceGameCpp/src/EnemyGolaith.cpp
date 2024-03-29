#include "EnemyGolaith.h"

void SpaceGame::EnemyGolaith::Update()
{
    if ((mHealth <= 0) && (mState != State::Death))
    {
        mState = State::Death;
        mStateTick = 0;
        gGameApp.mScore += 500;
    }

    switch (mState)
    {
    case State::Lowering:
        mY += 2.0f;
        if (mY >= 300)
            mState = (State)((int)mState + 1);
        break;

    case State::Firing:
        mStateTick++;
        if (mStateTick % 4 == 0)
        {
            let enemyLaser = new EnemyLaser();
            enemyLaser.mX = mX;
            enemyLaser.mY = mY;
            float angle = ((float)gGameApp.mRand.NextDouble() - 0.5f) * 3.0f + (float)Math.PI_d / 2;
            float speed = 3.0f;
            enemyLaser.mVelX = (float)Math.Cos(angle) * speed;
            enemyLaser.mVelY = (float)Math.Sin(angle) * speed;
            gGameApp.AddEntity(enemyLaser);
        }
        if (mStateTick == 200)
            mState = (State)((int)mState + 1);
        break;

    case State::Raising:
        mY -= 2.0f;
        if (mY < -300)
            mIsDeleting = true;

    case State::Death:
        mStateTick++;
        if (mStateTick % 6 == 0)
        {
            gGameApp.ExplodeAt(mX + (float)gGameApp.mRand.NextDoubleSigned() * 40, mY + (float)gGameApp.mRand.NextDoubleSigned() * 40, 1.0f, 0.4f);
            gGameApp.PlaySound(Sounds.sExplode, 1.0f, 1.0f);
        }
        mAlpha = Math.Max(0.0f, mAlpha - 0.015f);
        if (mAlpha <= 0)
            mIsDeleting = true;
    }
}