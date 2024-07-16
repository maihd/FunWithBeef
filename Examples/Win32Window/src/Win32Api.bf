namespace Win32Window;

using System;
using System.Interop;

public enum WndClassStyle : uint32
{
    CS_BYTEALIGNCLIENT     = 0x00001000,
    CS_BYTEALIGNWINDOW     = 0x00002000,
    CS_CLASSDC             = 0x00000040,
    CS_DBLCLKS             = 0x00000008,
    CS_DROPSHADOW          = 0x00020000,
    CS_GLOBALCLASS         = 0x00004000,
    CS_HREDRAW             = 0x00000002,
    CS_VREDRAW             = 0x00000001,
    CS_NOCLOSE             = 0x00000200,
    CS_OWNDC               = 0x00000020,
    CS_PARENTDC            = 0x00000080,
    CS_SAVEBITS            = 0x00000800,
}

[AllowDuplicates]
public enum WndStyle : uint32
{
    WS_BORDER              = 0x00800000L,
    WS_CAPTION             = 0x00C00000L,
    WS_CHILD               = 0x40000000L,
    WS_CHILDWINDOW         = WS_CHILD,
    WS_CLIPCHILDREN        = 0x02000000L,
    WS_VISIBLE             = 0x10000000L,
    WS_OVERLAPPED          = 0x00000000L,
    WS_SYSMENU             = 0x00080000L,
    WS_THICKFRAME          = 0x00040000L,
    WS_MINIMIZEBOX         = 0x00020000L,
    WS_MAXIMIZEBOX         = 0x00010000L,
    WS_OVERLAPPEDWINDOW    = (WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX)
}

[CRepr]
public struct WndClass
{
    public WndClassStyle         style;
    public Windows.WndProc       lpfnWndProc;
    public int32                 cbClsExtra;
    public int32                 cbWndExtra;
    public Windows.HInstance     hInstance;
    public Windows.Handle        hIcon;
    public Windows.Handle        hCursor;
    public Windows.Handle        hBrush;
    public char8*                lpszMenuName;
    public char8*                lpszClassName;
}

[CRepr]
public struct Point
{
    public int32                 x;
    public int32                 y;
}

[CRepr]
public struct Msg
{
    public Windows.HWnd          hwnd;
    public uint32                message;
    public uint                  wParam;
    public int                   lParam;
    public uint32                time;
    public Point                 pt;
}

public enum RemoveMsg : uint32
{
    PM_NOREMOVE         = 0x0000,
    PM_REMOVE           = 0x0001,
    PM_NOYIELD          = 0x0002,
}

public static class Win32Api
{
	[Import("User32.dll"), LinkName("RegisterClassA"), CallingConvention(.Stdcall)]
    public static extern uint16 RegisterClass([MangleConst]WndClass* wndClass);

    [Import("User32.dll"), LinkName("CreateWindowExA"), CallingConvention(.Stdcall)]
    public static extern Windows.HWnd CreateWindow
		( uint32 dwExStyle
		, [MangleConst]char8* lpClassName
        , [MangleConst]char8* lpWindowName
        , WndStyle dwStyle
        , int32 x
        , int32 y
        , int32 nWidth
        , int32 nHeight
        , Windows.HWnd hWndParent
        , Windows.HWnd hMenu
        , Windows.HInstance hInstance
        , void* lpParam
		);

    [Import("User32.dll"), LinkName("DestroyWindow"), CallingConvention(.Stdcall)]
    public static extern void DestroyWindow(Windows.HWnd hWnd);

    [Import("User32.dll"), LinkName("DefWindowProcA"), CallingConvention(.Stdcall)]
    public static extern int DefWindowProc(Windows.HWnd hWnd, int32 msg, int wParam, int lParam);

    [Import("User32.dll"), LinkName("PeekMessageA"), CallingConvention(.Stdcall)]
    public static extern Windows.IntBool PeekMessage(Msg* lpMsg, Windows.HWnd hWnd, uint32 wMsgFilterMin, uint32 wMsgFilterMax, RemoveMsg wRemoveMsg); 

    [Import("User32.dll"), LinkName("TranslateMessage"), CallingConvention(.Stdcall)]
    public static extern Windows.IntBool TranslateMessage([MangleConst]Msg* lpMsg); 

    [Import("User32.dll"), LinkName("DispatchMessageA"), CallingConvention(.Stdcall)]
    public static extern int DispatchMessage([MangleConst]Msg* lpMsg);
}