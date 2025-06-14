local ROOT_DIR = path.getabsolute(".")
local PROJECT_DIR = path.join(ROOT_DIR, "projects")

local TARGET_PROJECT_DIR = path.join(PROJECT_DIR, _ACTION)

workspace ("BeefExtendCpp_" .. _ACTION)
do
    language "C++"
    location(PROJECT_DIR)

    configurations {
        "Debug",
        "Release"
    }

    filter {}
end

project ("BeefExtendCpp_" .. _ACTION)
do
    kind "StaticLib"

    files {

    }

    filter {}
end