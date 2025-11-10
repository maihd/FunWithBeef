namespace ImGui_SDL3;

using System;
using ImGui;
using SDL3;

class Program
{
    public static void Main(String[] args)
    {
		SDL_Init(.SDL_INIT_VIDEO | .SDL_INIT_GAMEPAD);
		defer SDL_Quit();

		float mainScale = SDL_GetDisplayContentScale(SDL_GetPrimaryDisplay());
		SDL_WindowFlags window_flags = .SDL_WINDOW_RESIZABLE | .SDL_WINDOW_HIDDEN | .SDL_WINDOW_HIGH_PIXEL_DENSITY;
		let window = SDL_CreateWindow("ImGui SDL3 GPU Example", .(800 * mainScale), .(600 * mainScale), window_flags);
		if (window == null)
		{
			Console.Error.WriteLine("Error: Failed to create display window!");
			return;
		}
		defer
		{
			SDL_DestroyWindow(window);
		}
		SDL_SetWindowPosition(window, (.)SDL_WINDOWPOS_CENTERED(), (.)SDL_WINDOWPOS_CENTERED());
		SDL_ShowWindow(window);

		let gpuDevice = SDL_CreateGPUDevice(.SDL_GPU_SHADERFORMAT_SPIRV| .SDL_GPU_SHADERFORMAT_DXIL | .SDL_GPU_SHADERFORMAT_METALLIB, false, null);
		if (gpuDevice == null)
		{
			Console.Error.WriteLine("Error: Failed to create GPU device!");
			return;
		}
		defer
		{
			SDL_DestroyGPUDevice(gpuDevice);
		}
		SDL_ClaimWindowForGPUDevice(gpuDevice, window);
    	SDL_SetGPUSwapchainParameters(gpuDevice, window, .SDL_GPU_SWAPCHAINCOMPOSITION_SDR, .SDL_GPU_PRESENTMODE_MAILBOX);
		
		ImGui.CreateContext();
		defer ImGui.DestroyContext();

		let io = ImGui.GetIO();
		io.ConfigFlags |= .NavEnableKeyboard;
		io.ConfigFlags |= .NavEnableGamepad;
		io.ConfigFlags |= .DockingEnable;
		io.ConfigFlags |= .ViewportsEnable;

		ImGui.StyleColorsDark();

		let style = ImGui.GetStyle();
		style.ScaleAllSizes(mainScale);
		style.FontScaleDpi = mainScale;
		io.ConfigDpiScaleFonts = true;
		io.ConfigDpiScaleViewports = true;
		if (io.ConfigFlags & .ViewportsEnable != 0)
		{
		    style.WindowRounding = 0.0f;
		    style.Colors[(.)ImGui.Col.WindowBg].w = 1.0f;
		}

		ImGuiImplSDL3.InitForSDLGPU(window);
		
		ImGuiImplSDLGPU3.InitInfo initInfo = .{
			Device = gpuDevice,
			ColorTargetFormat = SDL_GetGPUSwapchainTextureFormat(gpuDevice, window),
			MSAASamples = .SDL_GPU_SAMPLECOUNT_1
		};
		ImGuiImplSDLGPU3.Init(&initInfo);

		bool done = false;
		while (!done)
		{
			SDL_Event event = default;
			while (SDL_PollEvent(&event))
			{
				ImGuiImplSDL3.ProcessEvent(&event);

				if (event.type == (int)SDL_EventType.SDL_EVENT_QUIT)
				{
					done = true;
					break;
				}
			}

			ImGuiImplSDLGPU3.NewFrame();
			ImGuiImplSDL3.NewFrame();
			ImGui.NewFrame();

			ImGui.ShowDemoWindow();

			ImGui.Render();
			let draw_data = ImGui.GetDrawData();

			SDL_GPUCommandBuffer* commandBuffer = SDL_AcquireGPUCommandBuffer(gpuDevice);

			uint32 width = 0, height = 0;
			SDL_GPUTexture* swapchainTexture = null;
			SDL_WaitAndAcquireGPUSwapchainTexture(commandBuffer, window, &swapchainTexture, &width, &height);
			if (swapchainTexture == null)
			{
				SDL_SubmitGPUCommandBuffer(commandBuffer);
				continue;
			}

			// This is mandatory: call ImGui_ImplSDLGPU3_PrepareDrawData() to upload the vertex/index buffer!
			ImGuiImplSDLGPU3.PrepareDrawData(draw_data, commandBuffer);

			SDL_GPUColorTargetInfo targetInfo = .{
				clear_color = .{ r = 0, g = 0, b = 0, a = 1.0f },
				load_op = .SDL_GPU_LOADOP_CLEAR,
				store_op = .SDL_GPU_STOREOP_STORE,
				texture = swapchainTexture,
				mip_level = 0,
				layer_or_depth_plane = 0,
				cycle = false
			};

			SDL_GPURenderPass* renderPass = SDL_BeginGPURenderPass(commandBuffer, &targetInfo, 1, null);

			ImGuiImplSDLGPU3.RenderDrawData(draw_data, commandBuffer, renderPass);
			SDL_EndGPURenderPass(renderPass);

			// Update and Render additional Platform Windows
			if (io.ConfigFlags & .ViewportsEnable != 0)
			{
			    ImGui.UpdatePlatformWindows();
			    ImGui.RenderPlatformWindowsDefault();
			}

			SDL_SubmitGPUCommandBuffer(commandBuffer);
		}

		SDL_WaitForGPUIdle(gpuDevice);
		ImGuiImplSDLGPU3.Shutdown();
		ImGuiImplSDL3.Shutdown();

		SDL_ReleaseWindowFromGPUDevice(gpuDevice, window);
    }
}
    