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
IncludeDir["glm"] = "Mellow/vendor/glm"

group "Dependencies"
	include "Mellow/vendor/GLFW"
	include "Mellow/vendor/Glad"
	include "Mellow/vendor/imgui"
group ""

project "Mellow"
	location "Mellow"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "mwpch.h"
	pchsource "Mellow/src/mwpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	defines
		{
			"_CRT_SECURE_NO_WARNINGS"
		}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}
	
	filter "system:windows"
		systemversion "latest"

		defines
		{
			"MW_PLATFORM_WINDOWS",
			"MW_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

	

	filter "configurations:Debug" 
		defines "MW_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "MW_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "MW_DIST"
		runtime "Release"
		optimize "on"
		



project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

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
		"Mellow/src",
		"Mellow/vendor",
		"%{IncludeDir.glm}"
	}

	links
	{
		"Mellow"
	}
	
	filter "system:windows"
		systemversion "latest"

		defines
		{
			"MW_PLATFORM_WINDOWS"
		}


	filter "configurations:Debug" 
		defines "MW_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "MW_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "MW_DIST"
		runtime "Release"
		optimize "on"
		