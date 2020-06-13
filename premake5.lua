workspace "Mellow"
	architecture "x64"
	

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	startproject "Sandbox"

outputdir= "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Mellow"
	location "Mellow"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"MW_PLATFORM_WINDOWS",
			"MW_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" ..outputdir.. "/Sandbox")
		}

	filter "configurations:Debug" 
		defines "MW_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "MW_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "MW_DIST"
		optimize "On"
		



project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Mellow/vendor/spdlog/include",
		"Mellow/src"
	}

	links
	{
		"Mellow"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"MW_PLATFORM_WINDOWS"
		}


	filter "configurations:Debug" 
		defines "MW_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "MW_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "MW_DIST"
		optimize "On"
		