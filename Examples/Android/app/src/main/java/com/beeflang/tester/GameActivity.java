package com.beeflang.tester;

import android.app.NativeActivity;

public class GameActivity extends NativeActivity {
    static {
        System.loadLibrary("native-lib");
    }
}
