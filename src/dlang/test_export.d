module dlang.test_export;
import src.dlang.dynamic_module;
import src.dlang.test_struct;

class Transform
{
    int[3] v;
    static void function(void*, Vector3) _add_;
    static Vector3 function(void*) _get_;
    static void function(void*) _ctor_;
    static void function(void*) _dtor_;

    static void _init_(DynamicModule mod){
        mod.get_func(&_ctor_, "_Transform_ctor");
        mod.get_func(&_dtor_, "_Transform_dtor");
        mod.get_func(&_get_, "Transform_get");
        mod.get_func(&_add_, "Transform_add");
    }
    void add(Vector3 vec){
        _add_(&v, vec);
    }
    Vector3 get(){
        return _get_(&v);
    }
    this(){
        _ctor_(&v);
    }
    ~this(){
        _dtor_(&v);
    }
}
