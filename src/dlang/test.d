import std.stdio;
import std.algorithm;
import std.range;
import std.string;
import src.dlang.dynamic_module;
// import src.dlang.test_struct;
// import src.dlang.test_delegate;
// import src.dlang.test_struct;
// import src.dlang.test_container;
// import src.dlang.test_export;

DynamicModule dll;
void main()
{
    ////////////// Test DLL
    // dll = new DynamicModule("cpp_interface", true);
    // int function(int, int) get_value;
    // dll.get_func(&get_value, "get_value");
    // writeln(get_value(5, 3));
    // dll.destroy();

    ////////////// class export
    // Transform._init_(dll);
    // auto tr = new Transform();
    // tr.add(Vector3(5,6,7));
    // tr.add(Vector3(8,9,10));
    // writeln(tr.get().to_string());


    ////////////// test_delegate
    // test_delegate(5);

    ////////////// test_struct
    // writeln(Vector3.zero.to_string());

    ////////////// test container
    // test_containers();
}
