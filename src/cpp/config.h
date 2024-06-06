#pragma once
#ifdef _MSC_VER
#define D_API extern "C" __declspec(dllexport)
#else
#define D_API extern "C" __attribute__((visibility("default")))
#endif