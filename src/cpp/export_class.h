#pragma once
#include <string>
struct Vector3 {
	float x, y, z;
};
class Transform {
public:
	Vector3 position;
	Transform();
	~Transform();
	void add(Vector3 dst);
	Vector3 get();
};