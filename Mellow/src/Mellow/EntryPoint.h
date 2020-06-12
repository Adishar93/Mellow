#pragma once

#ifdef MW_PLATFORM_WINDOWS

extern Mellow::Application* Mellow::CreateApplication();

int main(int argc, char** argv)
{
	Mellow::Log::Init();
	MW_CORE_WARN("Initialized Log!");
	int a = 5;
	MW_INFO("Hello! Var={0}",a);
	auto app = Mellow::CreateApplication();
	app->Run();
	delete app;
}



#else
#error Mellow only supports windows!
#endif