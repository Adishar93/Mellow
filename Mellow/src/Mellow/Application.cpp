#include "mwpch.h"
#include "Application.h"

//added includes after Event Setup
#include "Mellow/Events/Event.h"
#include "Mellow/Events/ApplicationEvent.h"
#include "Mellow/Log.h"

#include <GLFW/glfw3.h>

namespace Mellow
{
	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		
		while (m_Running)
		{
			glClearColor(1, 0, 1, 1);
			glClear(GL_COLOR_BUFFER_BIT);
			m_Window->OnUpdate();
		}
	}
}
