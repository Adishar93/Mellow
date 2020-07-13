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
		MW_INFO("ExampleLayer::Update");
	}

	void OnEvent(Mellow::Event& event) override
	{
		MW_TRACE("{0}",event);
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

