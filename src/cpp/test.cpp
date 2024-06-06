#include "config.h"
#include <iostream>

D_API int get_value(int x, int y) {
	std::cout << x << " " << y << "\n";
	return x * 2 + y;
}