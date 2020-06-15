#include "Application.h"

//added includes after Event Setup
#include "Mellow/Events/Event.h"
#include "Mellow/Events/ApplicationEvent.h"
#include "Mellow/Log.h"

namespace Mellow
{
	Application::Application()
	{
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{

			MW_TRACE(e);
		}

		if (e.IsInCategory(EventCategoryInput))
		{

			MW_TRACE(e);
		}
		while (true);
	}
}
