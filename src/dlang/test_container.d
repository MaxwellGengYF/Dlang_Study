module dlang.test_container;
import std.container;
import std.stdio;
void test_containers()
{
    int[] slice = new int[10];
    // a class, so no pointer
    RedBlackTree!int rb_tree = new RedBlackTree!int();
    rb_tree.insert(5);
    rb_tree.insert(4);
    foreach (a; rb_tree)
    {
        writeln(a);
    }
    // a struct, require pointer;
    Array!int* arr = new Array!int();
    arr.reserve(10);
    arr.insertBack(1);
    arr.insertBack(2);
    arr.insertBack(3);
    foreach(i; *arr) {
        writeln(i);
    }
}
