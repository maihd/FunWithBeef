const std = @import("std");

pub fn build(b: *std.Build) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    // const mode = .ReleaseFast;

    const lib = b.addStaticLibrary(.{ 
        .name = "CInterop", 
        .root_source_file = b.path("src/main.zig"),
        .target = b.standardTargetOptions(.{}),
    });
    // lib.setBuildMode(mode);
    b.installArtifact(lib);

    const main_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = b.standardTargetOptions(.{}),
    });
    // main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
