local ROOT_DIR = path.getabsolute(".")
local PROJECT_DIR = path.join(ROOT_DIR, "projects")

local TARGET_PROJECT_DIR = path.join(PROJECT_DIR, _ACTION)

workspace ("BeefExtendCpp_" .. _ACTION)
do
    location(TARGET_PROJECT_DIR)
    
    rtti "Off"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    platforms {
        "x64"
    }

    configurations {
        "Debug",
        "Release"
    }

    filter {}
end

project ("BeefExtendCpp_CppLib_" .. _ACTION)
do
    kind "SharedLib"

    defines {
        "CPP_LIB_EXPORT"
    }

    files {
        "cpp_lib/src/*.h",
        "cpp_lib/src/*.cpp"
    }

    filter {}
end

project ("BeefExtendCpp_CppProgram_" .. _ACTION)
do
    kind "ConsoleApp"

    links {
        "BeefExtendCpp_CppLib_" .. _ACTION,
        path.join(ROOT_DIR, "build/Debug_Win64/BeefExtendCpp/BeefExtendCpp.lib")
    }

    defines {
        "CPP_LIB_IMPORT"
    }

    files {
        "cpp_program/src/*.h",
        "cpp_program/src/*.cpp",

        "cpp_generated/*.h",
        "cpp_generated/*.cpp",
    }

    includedirs {
        "cpp_lib/src",
        "cpp_generated",
    }

    -- Alternative: postbuildcommands in BeefExtendCpp_CppLib
    prebuildcommands {
        "cd " .. ROOT_DIR .. " && BeefBuild.exe"
    }

    postbuildcommands {
        "xcopy " 
            .. "$(ProjectDir)\\..\\..\\build\\Debug_Win64\\BeefExtendCpp\\BeefExtendCpp.dll"
            .. " /Y /Q"
    }

    filter {}
end