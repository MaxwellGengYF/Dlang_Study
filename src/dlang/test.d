import std.stdio;
import std.algorithm;
import std.range;
import std.string;
import src.dlang.dynamic_module;
// import src.dlang.test_delegate;
// import src.dlang.test_struct;


void main()
{
    auto dll = new DynamicModule("cpp_interface");
    int function(int, int) get_value;
    dll.get_func(&get_value, "get_value");
    writeln(get_value(5, 3));
    dll.destroy();

    // test_struct
}
