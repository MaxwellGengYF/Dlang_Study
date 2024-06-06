#include "export_class.h"
#include "config.h"
#include <iostream>
Transform::Transform() {
    std::cout << "ctor " << (size_t)this << "\n";
	memset(&position, 0, sizeof(position));
}
Transform::~Transform() {
    std::cout << "dtor " << (size_t)this << "\n";
}
void Transform::add(Vector3 dst) {
	position.x += dst.x;
	position.y += dst.y;
	position.z += dst.z;
}
Vector3 Transform::get() {
    return position;
}

/////////// EXPORT AREA
D_API void _Transform_ctor(Transform* ptr) {	
    new (ptr) Transform();
}
D_API void _Transform_dtor(Transform* ptr) {
    ptr->~Transform();
}
D_API void Transform_add(Transform* ptr, Vector3 value) {
    ptr->add(value);
}
D_API Vector3 Transform_get(Transform* ptr) {
    return ptr->get();
}