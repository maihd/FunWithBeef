#include <jni.h>
#include <android/log.h>
#include <string>

extern "C" void BeefMain(int argc, char** argv);

extern "C" JNIEXPORT void JNICALL Java_com_beeflang_tester_MainActivity_nativeBeefMain(JNIEnv*, jobject) {
    //BeefMain(0, nullptr);
}

extern "C"
int main()
{
    BeefMain(0, nullptr);
    return 0;
}
