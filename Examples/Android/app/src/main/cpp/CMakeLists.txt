cmake_minimum_required(VERSION 3.4.1)

message("Generating for Android ABI ${ANDROID_ABI} in '${CMAKE_SOURCE_DIR}'...")

set(BEEF_PROJECT_PATH "${CMAKE_SOURCE_DIR}/../../../..")

if (${ANDROID_ABI} STREQUAL "arm64-v8a")
    set(BEEF_ARCH "Debug_aarch64-none-linux-android29")
elseif (${ANDROID_ABI} STREQUAL "armeabi-v7a")
    set(BEEF_ARCH "Debug_armv7-none-linux-androideabi29")
elseif (${ANDROID_ABI} STREQUAL "x86_64")
    set(BEEF_ARCH "Debug_x86_64-none-linux-android29")
elseif (${ANDROID_ABI} STREQUAL "x86")
    set(BEEF_ARCH "/Debug_i686-none-linux-android29")
endif()

add_library( native-lib
             SHARED
             native-lib.cpp )

set(CMAKE_SHARED_LINKER_FLAGS
        "${CMAKE_SHARED_LINKER_FLAGS} -u ANativeActivity_onCreate")

target_link_libraries(
        native-lib
        log
        m
        c
        android
        EGL
        GLESv2
        OpenSLES
        dl
        ${BEEF_PROJECT_PATH}/BeefProject/build/${BEEF_ARCH}/BeefProject/BeefProject.a
        ${BEEF_PROJECT_PATH}/BeefLibs/${ANDROID_ABI}/libBeefRT_d.a
        ${BEEF_PROJECT_PATH}/BeefLibs/${ANDROID_ABI}/libraylib.a
        )
