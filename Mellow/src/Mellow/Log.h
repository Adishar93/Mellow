#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"


namespace Mellow
{
	class MELLOW_API Log
	{
	public:
		
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() {return s_ClientLogger;}
	
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}

//Core log Macros
#define MW_CORE_TRACE(...)   ::Mellow::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define MW_CORE_INFO(...)    ::Mellow::Log::GetCoreLogger()->info(__VA_ARGS__)
#define MW_CORE_WARN(...)    ::Mellow::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define MW_CORE_ERROR(...)   ::Mellow::Log::GetCoreLogger()->error(__VA_ARGS__)
#define MW_CORE_FATAL(...)   ::Mellow::Log::GetCoreLogger()->fatal(__VA_ARGS__)

//Client log Macros
#define MW_TRACE(...)   ::Mellow::Log::GetClientLogger()->trace(__VA_ARGS__)
#define MW_INFO(...)    ::Mellow::Log::GetClientLogger()->info(__VA_ARGS__)
#define MW_WARN(...)    ::Mellow::Log::GetClientLogger()->warn(__VA_ARGS__)
#define MW_ERROR(...)   ::Mellow::Log::GetClientLogger()->error(__VA_ARGS__)
#define MW_FATAL(...)   ::Mellow::Log::GetClientLogger()->fatal(__VA_ARGS__)