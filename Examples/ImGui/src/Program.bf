namespace ImGuiExample;

using SDL2;
using ImGui;
using OpenGL;
using System;

[AlwaysInclude]
class Program
{
    static void Main()
    {
        SDL.Init(.Video);
		defer SDL.Quit();

		let window = SDL.CreateWindow("ImGui Example", .Centered, .Centered, 800, 600, .Shown | .OpenGL);
		if (window == null)
		{
			Console.Error.WriteLine("Error: Failed to create display window!");
			return;
		}
		defer
		{
			SDL.DestroyWindow(window);
		}

		let context = SDL.GL_CreateContext(window);
		if (context == 0)
		{
			Console.Error.WriteLine("Error: Failed to create OpenGL context!");
			return;
		}
		defer
		{
			SDL.GL_DeleteContext(context);
		}

		SDL.SDL_GL_MakeCurrent(window, context);
		if (GL.LoadProcs((name) => SDL.SDL_GL_GetProcAddress(name.Ptr)) case .Err)
		{
			Console.Error.WriteLine("Error: Failed to load OpenGL functions!");
			return;
		}

		ImGui.CreateContext();
		defer ImGui.DestroyContext();

		ImGuiImplSDL2.InitForOpenGL(window, BitConverter.Convert<decltype(context), void*>(context));
		defer ImGuiImplSDL2.Shutdown();

		ImGuiImplOpenGL3.Init();
		defer ImGuiImplOpenGL3.Shutdown();

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
			
			SDL.GL_SwapWindow(window);
		}
    }
}