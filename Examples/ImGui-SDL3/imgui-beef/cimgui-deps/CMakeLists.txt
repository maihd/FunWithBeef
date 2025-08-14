cmake_minimum_required(VERSION 3.18)

project(cimgui)

set(CIMGUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../cimgui)

#general settings
file(GLOB IMGUI_SOURCES
    ${CIMGUI_DIR}/cimgui.cpp
    ${CIMGUI_DIR}/imgui/imgui.cpp
    ${CIMGUI_DIR}/imgui/imgui_draw.cpp
    ${CIMGUI_DIR}/imgui/imgui_demo.cpp
    ${CIMGUI_DIR}/imgui/imgui_widgets.cpp
    ${CIMGUI_DIR}/imgui/imgui_tables.cpp
    # ${CIMGUI_DIR}/imgui/backends/imgui_impl_glfw.h
    # ${CIMGUI_DIR}/imgui/backends/imgui_impl_glfw.cpp
    # ${CIMGUI_DIR}/imgui/backends/imgui_impl_opengl3.h
    # ${CIMGUI_DIR}/imgui/backends/imgui_impl_opengl3.cpp
    # ${CIMGUI_DIR}/imgui/backends/imgui_impl_sdl2.h
    # ${CIMGUI_DIR}/imgui/backends/imgui_impl_sdl2.cpp
    ${CIMGUI_DIR}/imgui/backends/imgui_impl_sdl3.h
    ${CIMGUI_DIR}/imgui/backends/imgui_impl_sdl3.cpp
    ${CIMGUI_DIR}/imgui/backends/imgui_impl_sdlgpu3.h
    ${CIMGUI_DIR}/imgui/backends/imgui_impl_sdlgpu3.cpp

    # glad/glad.h
    # glad/glad.c
)

set(IMGUI_STATIC "no" CACHE STRING "Build as a static library")
set(IMGUI_FREETYPE "no" CACHE STRING "Build with freetype library")
set(IMGUI_LIBRARIES )

if(IMGUI_FREETYPE)
	FIND_PACKAGE(freetype REQUIRED PATHS ${FREETYPE_PATH})
	list(APPEND IMGUI_LIBRARIES freetype)
	list(APPEND IMGUI_SOURCES imgui/misc/freetype/imgui_freetype.cpp)
	add_definitions("-DCIMGUI_FREETYPE=1")
endif(IMGUI_FREETYPE)

#add library and link
if (IMGUI_STATIC)
    add_library(cimgui STATIC ${IMGUI_SOURCES})
else (IMGUI_STATIC)
    add_library(cimgui STATIC ${IMGUI_SOURCES})
endif (IMGUI_STATIC)

set_property(TARGET cimgui PROPERTY MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

target_compile_definitions(cimgui PUBLIC IMGUI_DISABLE_OBSOLETE_FUNCTIONS=1)
if (WIN32)
    target_compile_definitions(cimgui PUBLIC IMGUI_IMPL_API=extern\t\"C\"\t__declspec\(dllexport\))
else (WIN32)
    target_compile_definitions(cimgui PUBLIC IMGUI_IMPL_API=extern\t\"C\"\t)
endif (WIN32)

target_include_directories(cimgui PUBLIC ${CIMGUI_DIR})
target_include_directories(cimgui PUBLIC ${CIMGUI_DIR}/imgui)
target_include_directories(cimgui PUBLIC ${CIMGUI_DIR}/../../SDL3-beef/dist/SDL3-3.2.14/include)
set_target_properties(cimgui PROPERTIES PREFIX "")
target_link_libraries(cimgui ${IMGUI_LIBRARIES})

#install
install(TARGETS cimgui
    RUNTIME DESTINATION  .
    LIBRARY DESTINATION  .
    ARCHIVE DESTINATION  .
)

#test
set(CIMGUI_TEST "no" CACHE STRING "Enable compilation of a test unit based on imgui null")

if (CIMGUI_TEST)
  add_subdirectory(test)
endif ()
