module dlang.test_delegate;
import std.stdio;

void test_delegate(int outside_value)
{
    int delegate(int, int) get_value_delegate;
    // func is a "delegate" type
    int func(int a, int b)
    {
        // Capture here
        return outside_value + a + b;
    }

    get_value_delegate = &func;
    writeln(get_value_delegate(2, 3));
    // Lambda
    get_value_delegate = (int a, int b) { return outside_value + a + b; };
    writeln(get_value_delegate(2, 3));
}
