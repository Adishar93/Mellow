#pragma once

#include "Mellow/Layer.h"

#include "Mellow/Events/Event.h"
#include "Mellow/Events/KeyEvent.h"
#include "Mellow/Events/MouseEvent.h"
#include "Mellow/Events/ApplicationEvent.h"




namespace Mellow
{

	class MELLOW_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();

	private:
		float m_Time=0.0f;
		
	};
}

