#pragma once

#ifdef MW_PLATFORM_WINDOWS

extern Mellow::Application* Mellow::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Mellow::CreateApplication();
	app->Run();
	delete app;
}



#else
#error Mellow only supports windows!
#endif