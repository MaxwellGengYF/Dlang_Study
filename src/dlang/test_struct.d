module dlang.test_struct;
import std;

struct Vector3
{
    float x, y, z;
    // default constructor not allowed because it is a POD type.
    // this(){
    // }

    this(float x, float y, float z)
    {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    // Default is public
    private string priv_to_string()
    {
        return std.string.format("Vector3: %f, %f, %f", x, y, z);
    }

    string to_string()
    {
        return priv_to_string();
    }

    static void test()
    {
        Vector3 vec = Vector3(1, 2, 3);
        writeln(vec.to_string());
        Vector3* vec_ptr = new Vector3(4, 5, 6);
        writeln(vec_ptr.to_string());
    }
}
