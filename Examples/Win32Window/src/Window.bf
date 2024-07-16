namespace Win32Window;

using System;

class Window
{
    Windows.HWnd hWnd;

    public bool shouldClose { get; private set; }

    private const StringView ClassName = "Win32Beef\0";
    private static bool RegisterWindow(Windows.HInstance hInstance)
    {
        var wndClass = WndClass{
            hInstance = hInstance,
            lpszClassName = ClassName.Ptr,
            lpfnWndProc = => WndProc
		};

        return Win32Api.RegisterClass(&wndClass) != 0;
    }

    [CallingConvention(.Stdcall)]
    private static int WndProc(Windows.HWnd hWnd, int32 msg, int wParam, int lParam)
    {
        switch (msg)
        {
        case 0x0010: // WM_CLOSE
            Win32Api.DestroyWindow(hWnd);
            return 0;

		case 0x0012: // WM_QUIT
            return 0;
        }

        return Win32Api.DefWindowProc(hWnd, msg, wParam, lParam);
    }

	public Result<void, StringView> Create()
	{
		Windows.HInstance hInstance = (.)Windows.GetModuleHandleA(null);
        if (!RegisterWindow(hInstance))
        {
            return .Err("Failed to register window class");
        }

        hWnd = Win32Api.CreateWindow(0, ClassName.Ptr, ClassName.Ptr, .WS_OVERLAPPEDWINDOW | .WS_VISIBLE, 0, 0, 800, 600, default, default, hInstance, null);
        if (hWnd == default)
        {
            return .Err("Failed to create window");
        }

		return .Ok;
	}

	public void Destroy()
	{
        if (hWnd != default)
        {
            Win32Api.DestroyWindow(hWnd);
            hWnd = default;
        }
	}

    public void Update()
    {
        if (shouldClose)
        {
            return;
        }

        Msg msg = ?;
        while (Win32Api.PeekMessage(&msg, 0, 0, 0, .PM_REMOVE))
        {
            Win32Api.TranslateMessage(&msg);
            Win32Api.DispatchMessage(&msg);

            if (msg.message == 0x0012 || msg.message == 0x0010)
            {
                shouldClose = true;
                break;
            }

            // Tricks
            if (!Windows.IsWindowVisible(hWnd))
            {
                shouldClose = true;
                break;
            }
        }
    }
}