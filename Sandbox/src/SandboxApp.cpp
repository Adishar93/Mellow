#pragma once

#include "Mellow.h"

class Sandbox : public Mellow::Application
{
public:

	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Mellow::Application* Mellow::CreateApplication()
{
	return new Sandbox();
}

