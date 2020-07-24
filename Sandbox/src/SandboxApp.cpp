#pragma once

#include <Mellow.h>


class ExampleLayer : public Mellow::Layer
{
public:
	ExampleLayer()
		:Layer("Example")
	{

	}

	void OnUpdate() override
	{
		if (Mellow::Input::IsKeyPressed(MW_KEY_TAB))
			MW_TRACE("TAB Key Was Pressed! (Poll)");
	}

	void OnEvent(Mellow::Event& event) override
	{
		if (event.GetEventType()==Mellow::EventType::KeyPressed)
		{
			Mellow::KeyPressedEvent& e = (Mellow::KeyPressedEvent&)event;
			
			if (e.GetKeyCode() == MW_KEY_TAB)
				MW_TRACE("TAB Key was pressed! (Event)");

			MW_TRACE("Button Pressed {0}", (char)e.GetKeyCode());
		}
		//MW_TRACE("{0}",event);
	}
};

class Sandbox : public Mellow::Application
{
public:

	Sandbox()
	{
		//PushLayer(new ExampleLayer());
		PushOverlay(new Mellow::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

Mellow::Application* Mellow::CreateApplication()
{
	return new Sandbox();
}

