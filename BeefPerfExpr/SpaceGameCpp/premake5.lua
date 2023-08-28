local ROOT_DIR = path.getabsolute(".")
local SDL2_DIR = "C:/Program Files/BeefLang/BeefLibs/SDL2"
local BUILD_DIR = path.join(ROOT_DIR, "build")

workspace "SpaceGame"
do
    language "C++"
    location (BUILD_DIR)

    configurations { "Debug", "Release" }

    cppdialect "C++17"

    filter "configurations:Debug"
    do
        defines { "DEBUG" }
        symbols "On"
    end

    filter "configurations:Release"
    do
        defines { "NDEBUG" }
        optimize "On"
    end

    filter {}
end

project "SpaceGame"
do
    kind "WindowedApp"

    files { "src/**.cpp", "src/**.h" }
    includedirs { "src", path.join(SDL2_DIR, "include") }
    links { "SDL2", "SDL2main" }
    libdirs { path.join(SDL2_DIR, "dist") }

    filter {}
end