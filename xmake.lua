set_xmakever('2.9.2')
set_policy("check.auto_ignore_flags", true)
add_rules('mode.release', 'mode.debug')
set_toolchains("ldc")
set_policy('build.ccache', not is_plat('windows'))
includes("xmake/xmake_func.lua")

target("cpp_interface")
_config_project({
    project_kind = "shared"
})
add_files("src/cpp/**.cpp")
target_end()

target("test_d")
set_kind("binary")
set_runtimes("MD")
set_optimize("aggressive")
add_files("src/dlang/**.d")
-- add_deps("cpp_interface")
target_end()
