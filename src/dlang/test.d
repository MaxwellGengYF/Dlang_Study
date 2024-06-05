import std.stdio;
import std.string;
import std.algorithm;
import std.range;
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

    this(string path)
    {
        if (!std.path.isAbsolute(path))
        {
            path = std.path.absolutePath(path);
        }
        string dir = std.path.dirName(path);
        string ext = std.path.extension(path);
        string baseName = std.path.baseName(path);
        if(ext.length == 0){
            baseName = (baseName ~ ".dll").idup;
        }
        SetDllDirectoryA(dir.ptr);
        string load_path = std.path.chainPath(dir,  baseName).array;
        handle = LoadLibraryA(load_path.ptr);
        SetDllDirectoryA(null);
    }

    ~this()
    {
        FreeLibrary(handle);
    }

    void get_func(T)(T* t, string name)
    {
        *t = cast(T) GetProcAddress(handle, name.ptr);
    }
};
void main()
{
    auto dll = new DynamicModule("cpp_interface");
    int function(int, int) get_value;
    dll.get_func(&get_value, "get_value");
    writeln(get_value(5, 3));
    dll.destroy();
}
