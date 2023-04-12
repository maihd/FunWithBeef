namespace ImGuiExample;

using SDL2;
using ImGui;
using OpenGL;
using System;

class Program
{
    static void Main()
    {
        SDL.Init(.Video);
		let window = SDL.CreateWindow("ImGui Example", .Centered, .Centered, 800, 600, .Shown | .OpenGL);
		SDL.SetWindowBordered(window, true);

		let context = SDL.GL_CreateContext(window);
		SDL.SDL_GL_MakeCurrent(window, context);
		GL.LoadProcs((name) => SDL.SDL_GL_GetProcAddress(name.Ptr));

		ImGui.CreateContext();

		ImGuiImplSDL2.InitForOpenGL(window, BitConverter.Convert<decltype(context), void*>(context));
		SDL.SetWindowBordered(window, true);

		ImGuiImplOpenGL3.Init();

		bool done = false;
		while (!done)
		{
			SDL.Event event;
			while (SDL.PollEvent(out event) != 0)
			{
				ImGuiImplSDL2.ProcessEvent(&event);

				if (event.type == .Quit)
				{
					done = true;
					break;
				}
			}

			ImGuiImplOpenGL3.NewFrame();
			ImGuiImplSDL2.NewFrame();
			ImGui.NewFrame();

			ImGui.ShowDemoWindow();

			GL.ClearColor(0.45f, 0.55f, 0.6f, 1);
			GL.Clear(GL.COLOR_BUFFER_BIT);

			ImGui.Render();
			ImGuiImplOpenGL3.RenderDrawData(ImGui.GetDrawData());
			
			SDL.SetWindowBordered(window, true);
			SDL.GL_SwapWindow(window);
		}

		ImGuiImplOpenGL3.Shutdown();
		ImGuiImplSDL2.Shutdown();
		ImGui.DestroyContext();

		SDL.DestroyWindow(window);
		SDL.Quit();
    }
}