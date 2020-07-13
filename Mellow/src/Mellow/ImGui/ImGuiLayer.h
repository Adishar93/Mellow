#pragma once

#include "Mellow/Layer.h"

#include "Mellow/Events/Event.h"
#include "Mellow/Events/KeyEvent.h"
#include "Mellow/Events/MouseEvent.h"
#include "Mellow/Events/ApplicationEvent.h"


extern struct ImGuiIO;


namespace Mellow
{

	class MELLOW_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		void OnAttach();
		void OnDetach();
		void OnUpdate();
		void OnEvent(Event& event);

	private:
		float m_Time=0.0f;
		static ImGuiIO* io;
	private:
		bool OnWindowResizeEvent(WindowResizeEvent& e);
		
		bool OnMouseButtonPressedEvent(MouseButtonPressedEvent& e);
		bool OnMouseButtonReleasedEvent(MouseButtonReleasedEvent& e);
		bool OnMouseMovedEvent(MouseMovedEvent& e);
		bool OnMouseScrolledEvent(MouseScrolledEvent& e);
		
		bool OnKeyPressedEvent(KeyPressedEvent& e);
		bool OnKeyReleasedEvent(KeyReleasedEvent& e);
		bool OnKeyTypedEvent(KeyTypedEvent& e);
		
	};
}

