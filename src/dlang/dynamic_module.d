module dlang.dynamic_module;

import std.string;
import std;

// DLL load
import core.sys.windows.windows;

// WIN API
extern (C) BOOL SetDllDirectoryA(LPCSTR);
extern (C) HINSTANCE LoadLibraryA(LPCSTR);
extern (C) BOOL FreeLibrary(HMODULE);

class DynamicModule
{
    HINSTANCE handle;
    private bool never_unload;

    this(string path, bool never_unload = false)
    {
        this.never_unload = never_unload;
        if (!std.path.isAbsolute(path))
        {
            path = std.path.absolutePath(path);
        }
        string dir = std.path.dirName(path);
        string ext = std.path.extension(path);
        string baseName = std.path.baseName(path);
        if (ext.length == 0)
        {
            baseName = (baseName ~ ".dll").idup;
        }
        SetDllDirectoryA(dir.ptr);
        string load_path = std.path.chainPath(dir, baseName).array;
        handle = LoadLibraryA(load_path.ptr);
        SetDllDirectoryA(null);
    }

    ~this()
    {
        if (!never_unload)
            FreeLibrary(handle);
    }

    void get_func(T)(T* t, string name)
    {
        *t = cast(T) GetProcAddress(handle, name.ptr);
    }
};
