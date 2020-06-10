#pragma once

#ifdef MW_PLATFORM_WINDOWS
	#ifdef MW_BUILD_DLL
		#define MELLOW_API __declspec(dllexport)
	#else
		#define MELLOW_API __declspec(dllimport)
	#endif
#else
	#error Mellow only supports windows!
#endif