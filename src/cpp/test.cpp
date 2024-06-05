#include <iostream>

extern "C" __declspec(dllexport) int get_value(int x, int y) {
	std::cout << x << " " << y << "\n";
	return x * 2 + y;
}