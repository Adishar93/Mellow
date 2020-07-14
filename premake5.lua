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

--Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Mellow/vendor/GLFW/include"
IncludeDir["Glad"] = "Mellow/vendor/Glad/include"
IncludeDir["ImGui"] = "Mellow/vendor/imgui"

group "Dependencies"
	include "Mellow/vendor/GLFW"
	include "Mellow/vendor/Glad"
	include "Mellow/vendor/imgui"
group ""

project "Mellow"
	location "Mellow"
	kind "SharedLib"
	language "C++"
	staticruntime "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "mwpch.h"
	pchsource "Mellow/src/mwpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

		defines
		{
			"MW_PLATFORM_WINDOWS",
			"MW_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" ..outputdir.. "/Sandbox/\"")
		}

	filter "configurations:Debug" 
		defines "MW_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "MW_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "MW_DIST"
		runtime "Release"
		optimize "On"
		



project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	staticruntime "Off"

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
		systemversion "latest"

		defines
		{
			"MW_PLATFORM_WINDOWS"
		}


	filter "configurations:Debug" 
		defines "MW_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "MW_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "MW_DIST"
		runtime "Release"
		optimize "On"
		