// -- GENERATION INFORMATION --
// Date: 08/06/2025 14:16:00
// Constructors: 113
// Destructors: 90
// Enums: 85
// Global methods: 1014
// Instance methods: 377
// Structs: 133
// Typedefs: 33

using System;

namespace ImGui
{
    public extension ImGui
    {
        public extension Vec2
        {
            public readonly static Vec2 Zero = .(0, 0);
            public readonly static Vec2 Ones = .(1, 1);
            public readonly static Vec2 OneZero = .(1, 0);
            public readonly static Vec2 ZeroOne = .(0, 1);
            public readonly static Vec2 NOneZero = .(-1, 0);
        }

        public extension Vec4
        {
            public readonly static Vec4 Zero = .(0, 0, 0, 0);
            public readonly static Vec4 Ones = .(1, 1, 1, 1);
        }
    }

	public static class ImGui
    {
		public static char8* VERSION = "1.92.1";
		public static int VERSION_NUM = 192100;
		public static bool CHECKVERSION()
		{
			bool result = DebugCheckVersionAndDataLayout(VERSION, sizeof(IO), sizeof(Style), sizeof(Vec2), sizeof(Vec4), sizeof(DrawVert), sizeof(DrawIdx));
			Runtime.Assert(result);
			return result;
		}

		public static mixin ASSERT(bool condition) { Runtime.Assert(condition); }
		public static mixin ASSERT(bool condition, String errorMsg) { Runtime.Assert(condition, errorMsg); }

		public static DrawCallback* DrawCallback_ResetRenderState = (.)(void*)-1;

        typealias char = char8;
        typealias uchar = uint8;
        typealias ushort = uint16;
        typealias short = int16;
        typealias size = uint64;
        typealias charPtr = char8*;

        [CRepr]
        public struct FILE
        {
            void* _Placeholder;
        }

        [CRepr]
		public enum DockRequestType
		{
		    None,
		    Dock,
		    Undock,
		    Split
		}

		[CRepr]
		public struct DockRequest
		{
		    DockRequestType Type;
		    Window* DockTargetWindow;
		    DockNode* DockTargetNode;
		    Window* DockPayload;
		    Dir DockSplitDir;
		    float DockSplitRatio;
		    bool DockSplitOuter;
		    Window* UndockTargetWindow;
		    DockNode* UndockTargetNode;
		}

		[CRepr]
		public struct DockNodeSettings
		{
		    ID             ID;
		    ID             ParentNodeId;
		    ID             ParentWindowId;
		    ID             SelectedWindowId;
		    char         SplitAxis;
		    char                Depth;
		    DockNodeFlags  Flags;
		    Vec2ih            Pos;
		    Vec2ih            Size;
		    Vec2ih            SizeRef;
		}

		[CRepr]
		public struct DockPreviewData
		{
		    DockNode FutureNode;
		    bool IsDropAllowed;
		    bool IsCenterAvailable;
		    bool IsSidesAvailable;
		    bool IsSplitDirExplicit;
		    DockNode* SplitNode;
		    Dir SplitDir;
		    float SplitRatio;
		    Rect[(.) Dir.COUNT] DropRectsDraw;
		}

		public static void FullscreenDockspace()
		{
			var viewport = ImGui.GetMainViewport();
			ImGui.SetNextWindowPos(viewport.Pos);
			ImGui.SetNextWindowSize(viewport.Size);
			ImGui.SetNextWindowViewport(viewport.ID);

			ImGui.PushStyleVar(.WindowPadding, .(0, 0));
			ImGui.PushStyleVar(.WindowRounding, 0.0f);
			ImGui.PushStyleVar(.WindowBorderSize, 0.0f);
			ImGui.WindowFlags windowFlags = .MenuBar | .NoDocking | .NoTitleBar | .NoResize | .NoMove | .NoBringToFrontOnFocus | .NoNavFocus;
			ImGui.Begin("MainDockspaceWindow", null, windowFlags);
			ImGui.PopStyleVar(3);

			ImGui.ID dockspaceId = ImGui.GetID("MainDockspace");
			ImGui.DockSpace(dockspaceId);
			ImGui.End();
		}

        // -- Auto-Generated --

        public typealias BitArrayForNamedKeys = BitArray<const Key.NamedKey_COUNT, const -Key.NamedKey_BEGIN>;
        public typealias BitArrayPtr = U32*;
        public typealias DrawCallback = function void (DrawList* parent_list, DrawCmd* cmd);
        public typealias DrawIdx = ushort;
        public typealias FileHandle = FILE*;
        public typealias FontAtlasRectId = int32;
        public typealias ContextHookCallback = function void (Context* ctx, ContextHook* hook);
        public typealias ErrorCallback = function void (Context* ctx, void* user_data, char* msg);
        public typealias ID = uint32;
        public typealias InputTextCallback = function int (InputTextCallbackData* data);
        public typealias KeyChord = int32;
        public typealias KeyRoutingIndex = S16;
        public typealias MemAllocFunc = function void* (size sz, void* user_data);
        public typealias MemFreeFunc = function void (void* ptr, void* user_data);
        public typealias SelectionUserData = S64;
        public typealias SizeCallback = function void (SizeCallbackData* data);
        public typealias TableColumnIdx = S16;
        public typealias TableDrawChannelIdx = U16;
        public typealias PoolIdx = int32;
        public typealias S16 = short;
        public typealias S32 = int32;
        public typealias S64 = int64;
        public typealias S8 = char;
        public typealias StbTexteditState = void*;
        public typealias TextureID = U64;
        public typealias U16 = ushort;
        public typealias U32 = uint32;
        public typealias U64 = uint64;
        public typealias U8 = uchar;
        public typealias Wchar = Wchar16;
        public typealias Wchar16 = ushort;
        public typealias Wchar32 = uint32;
        public typealias stbrp_node_im = void*;
        
        [AllowDuplicates]
        public enum DrawFlags : int32
        {
            None = 0,
            Closed = 1,
            RoundCornersTopLeft = 16,
            RoundCornersTopRight = 32,
            RoundCornersBottomLeft = 64,
            RoundCornersBottomRight = 128,
            RoundCornersNone = 256,
            RoundCornersTop = 48,
            RoundCornersBottom = 192,
            RoundCornersLeft = 80,
            RoundCornersRight = 160,
            RoundCornersAll = 240,
            RoundCornersDefault_ = 240,
            RoundCornersMask_ = 496,
        
        }
        
        [AllowDuplicates]
        public enum DrawListFlags : int32
        {
            None = 0,
            AntiAliasedLines = 1,
            AntiAliasedLinesUseTex = 2,
            AntiAliasedFill = 4,
            AllowVtxOffset = 8,
        
        }
        
        [AllowDuplicates]
        public enum FontAtlasFlags : int32
        {
            None = 0,
            NoPowerOfTwoHeight = 1,
            NoMouseCursors = 2,
            NoBakedLines = 4,
        
        }
        
        [AllowDuplicates]
        public enum FontFlags : int32
        {
            None = 0,
            NoLoadError = 2,
            NoLoadGlyphs = 4,
            LockBakedSizes = 8,
        
        }
        
        [AllowDuplicates]
        public enum ActivateFlags : int32
        {
            None = 0,
            PreferInput = 1,
            PreferTweak = 2,
            TryToPreserveState = 4,
            FromTabbing = 8,
            FromShortcut = 16,
        
        }
        
        [AllowDuplicates]
        public enum Axis : int32
        {
            None = -1,
            X = 0,
            Y = 1,
        
        }
        
        [AllowDuplicates]
        public enum BackendFlags : int32
        {
            None = 0,
            HasGamepad = 1,
            HasMouseCursors = 2,
            HasSetMousePos = 4,
            RendererHasVtxOffset = 8,
            RendererHasTextures = 16,
            PlatformHasViewports = 1024,
            HasMouseHoveredViewport = 2048,
            RendererHasViewports = 4096,
        
        }
        
        [AllowDuplicates]
        public enum ButtonFlagsPrivate : int32
        {
            ButtonFlags_PressedOnClick = 16,
            ButtonFlags_PressedOnClickRelease = 32,
            ButtonFlags_PressedOnClickReleaseAnywhere = 64,
            ButtonFlags_PressedOnRelease = 128,
            ButtonFlags_PressedOnDoubleClick = 256,
            ButtonFlags_PressedOnDragDropHold = 512,
            ButtonFlags_FlattenChildren = 2048,
            ButtonFlags_AllowOverlap = 4096,
            ButtonFlags_AlignTextBaseLine = 32768,
            ButtonFlags_NoKeyModsAllowed = 65536,
            ButtonFlags_NoHoldingActiveId = 131072,
            ButtonFlags_NoNavFocus = 262144,
            ButtonFlags_NoHoveredOnFocus = 524288,
            ButtonFlags_NoSetKeyOwner = 1048576,
            ButtonFlags_NoTestKeyOwner = 2097152,
            ButtonFlags_NoFocus = 4194304,
            ButtonFlags_PressedOnMask_ = 1008,
            ButtonFlags_PressedOnDefault_ = 32,
        
        }
        
        [AllowDuplicates]
        public enum ButtonFlags : int32
        {
            None = 0,
            MouseButtonLeft = 1,
            MouseButtonRight = 2,
            MouseButtonMiddle = 4,
            MouseButtonMask_ = 7,
            EnableNav = 8,
        
        }
        
        [AllowDuplicates]
        public enum ChildFlags : int32
        {
            None = 0,
            Borders = 1,
            AlwaysUseWindowPadding = 2,
            ResizeX = 4,
            ResizeY = 8,
            AutoResizeX = 16,
            AutoResizeY = 32,
            AlwaysAutoResize = 64,
            FrameStyle = 128,
            NavFlattened = 256,
        
        }
        
        [AllowDuplicates]
        public enum Col : int32
        {
            Text = 0,
            TextDisabled = 1,
            WindowBg = 2,
            ChildBg = 3,
            PopupBg = 4,
            Border = 5,
            BorderShadow = 6,
            FrameBg = 7,
            FrameBgHovered = 8,
            FrameBgActive = 9,
            TitleBg = 10,
            TitleBgActive = 11,
            TitleBgCollapsed = 12,
            MenuBarBg = 13,
            ScrollbarBg = 14,
            ScrollbarGrab = 15,
            ScrollbarGrabHovered = 16,
            ScrollbarGrabActive = 17,
            CheckMark = 18,
            SliderGrab = 19,
            SliderGrabActive = 20,
            Button = 21,
            ButtonHovered = 22,
            ButtonActive = 23,
            Header = 24,
            HeaderHovered = 25,
            HeaderActive = 26,
            Separator = 27,
            SeparatorHovered = 28,
            SeparatorActive = 29,
            ResizeGrip = 30,
            ResizeGripHovered = 31,
            ResizeGripActive = 32,
            InputTextCursor = 33,
            TabHovered = 34,
            Tab = 35,
            TabSelected = 36,
            TabSelectedOverline = 37,
            TabDimmed = 38,
            TabDimmedSelected = 39,
            TabDimmedSelectedOverline = 40,
            DockingPreview = 41,
            DockingEmptyBg = 42,
            PlotLines = 43,
            PlotLinesHovered = 44,
            PlotHistogram = 45,
            PlotHistogramHovered = 46,
            TableHeaderBg = 47,
            TableBorderStrong = 48,
            TableBorderLight = 49,
            TableRowBg = 50,
            TableRowBgAlt = 51,
            TextLink = 52,
            TextSelectedBg = 53,
            TreeLines = 54,
            DragDropTarget = 55,
            NavCursor = 56,
            NavWindowingHighlight = 57,
            NavWindowingDimBg = 58,
            ModalWindowDimBg = 59,
            COUNT = 60,
        
        }
        
        [AllowDuplicates]
        public enum ColorEditFlags : int32
        {
            None = 0,
            NoAlpha = 2,
            NoPicker = 4,
            NoOptions = 8,
            NoSmallPreview = 16,
            NoInputs = 32,
            NoTooltip = 64,
            NoLabel = 128,
            NoSidePreview = 256,
            NoDragDrop = 512,
            NoBorder = 1024,
            AlphaOpaque = 2048,
            AlphaNoBg = 4096,
            AlphaPreviewHalf = 8192,
            AlphaBar = 65536,
            HDR = 524288,
            DisplayRGB = 1048576,
            DisplayHSV = 2097152,
            DisplayHex = 4194304,
            Uint8 = 8388608,
            Float = 16777216,
            PickerHueBar = 33554432,
            PickerHueWheel = 67108864,
            InputRGB = 134217728,
            InputHSV = 268435456,
            DefaultOptions_ = 177209344,
            AlphaMask_ = 14338,
            DisplayMask_ = 7340032,
            DataTypeMask_ = 25165824,
            PickerMask_ = 100663296,
            InputMask_ = 402653184,
        
        }
        
        [AllowDuplicates]
        public enum ComboFlagsPrivate : int32
        {
            ComboFlags_CustomPreview = 1048576,
        
        }
        
        [AllowDuplicates]
        public enum ComboFlags : int32
        {
            None = 0,
            PopupAlignLeft = 1,
            HeightSmall = 2,
            HeightRegular = 4,
            HeightLarge = 8,
            HeightLargest = 16,
            NoArrowButton = 32,
            NoPreview = 64,
            WidthFitPreview = 128,
            HeightMask_ = 30,
        
        }
        
        [AllowDuplicates]
        public enum Cond : int32
        {
            None = 0,
            Always = 1,
            Once = 2,
            FirstUseEver = 4,
            Appearing = 8,
        
        }
        
        [AllowDuplicates]
        public enum ConfigFlags : int32
        {
            None = 0,
            NavEnableKeyboard = 1,
            NavEnableGamepad = 2,
            NoMouse = 16,
            NoMouseCursorChange = 32,
            NoKeyboard = 64,
            DockingEnable = 128,
            ViewportsEnable = 1024,
            IsSRGB = 1048576,
            IsTouchScreen = 2097152,
        
        }
        
        [AllowDuplicates]
        public enum ContextHookType : int32
        {
            NewFramePre = 0,
            NewFramePost = 1,
            EndFramePre = 2,
            EndFramePost = 3,
            RenderPre = 4,
            RenderPost = 5,
            Shutdown = 6,
            PendingRemoval_ = 7,
        
        }
        
        [AllowDuplicates]
        public enum DataAuthority : int32
        {
            Auto = 0,
            DockNode = 1,
            Window = 2,
        
        }
        
        [AllowDuplicates]
        public enum DataTypePrivate : int32
        {
            DataType_Pointer = 12,
            DataType_ID = 13,
        
        }
        
        [AllowDuplicates]
        public enum DataType : int32
        {
            S8 = 0,
            U8 = 1,
            S16 = 2,
            U16 = 3,
            S32 = 4,
            U32 = 5,
            S64 = 6,
            U64 = 7,
            Float = 8,
            Double = 9,
            Bool = 10,
            String = 11,
            COUNT = 12,
        
        }
        
        [AllowDuplicates]
        public enum DebugLogFlags : int32
        {
            None = 0,
            EventError = 1,
            EventActiveId = 2,
            EventFocus = 4,
            EventPopup = 8,
            EventNav = 16,
            EventClipper = 32,
            EventSelection = 64,
            EventIO = 128,
            EventFont = 256,
            EventInputRouting = 512,
            EventDocking = 1024,
            EventViewport = 2048,
            EventMask_ = 4095,
            OutputToTTY = 1048576,
            OutputToTestEngine = 2097152,
        
        }
        
        [AllowDuplicates]
        public enum Dir : int32
        {
            None = -1,
            Left = 0,
            Right = 1,
            Up = 2,
            Down = 3,
            COUNT = 4,
        
        }
        
        [AllowDuplicates]
        public enum DockNodeFlagsPrivate : int32
        {
            DockNodeFlags_DockSpace = 1024,
            DockNodeFlags_CentralNode = 2048,
            DockNodeFlags_NoTabBar = 4096,
            DockNodeFlags_HiddenTabBar = 8192,
            DockNodeFlags_NoWindowMenuButton = 16384,
            DockNodeFlags_NoCloseButton = 32768,
            DockNodeFlags_NoResizeX = 65536,
            DockNodeFlags_NoResizeY = 131072,
            DockNodeFlags_DockedWindowsInFocusRoute = 262144,
            DockNodeFlags_NoDockingSplitOther = 524288,
            DockNodeFlags_NoDockingOverMe = 1048576,
            DockNodeFlags_NoDockingOverOther = 2097152,
            DockNodeFlags_NoDockingOverEmpty = 4194304,
            DockNodeFlags_NoDocking = 7864336,
            DockNodeFlags_SharedFlagsInheritMask_ = -1,
            DockNodeFlags_NoResizeFlagsMask_ = 196640,
            DockNodeFlags_LocalFlagsTransferMask_ = 260208,
            DockNodeFlags_SavedFlagsMask_ = 261152,
        
        }
        
        [AllowDuplicates]
        public enum DockNodeFlags : int32
        {
            None = 0,
            KeepAliveOnly = 1,
            NoDockingOverCentralNode = 4,
            PassthruCentralNode = 8,
            NoDockingSplit = 16,
            NoResize = 32,
            AutoHideTabBar = 64,
            NoUndocking = 128,
        
        }
        
        [AllowDuplicates]
        public enum DockNodeState : int32
        {
            Unknown = 0,
            HostWindowHiddenBecauseSingleWindow = 1,
            HostWindowHiddenBecauseWindowsAreResizing = 2,
            HostWindowVisible = 3,
        
        }
        
        [AllowDuplicates]
        public enum DragDropFlags : int32
        {
            None = 0,
            SourceNoPreviewTooltip = 1,
            SourceNoDisableHover = 2,
            SourceNoHoldToOpenOthers = 4,
            SourceAllowNullID = 8,
            SourceExtern = 16,
            PayloadAutoExpire = 32,
            PayloadNoCrossContext = 64,
            PayloadNoCrossProcess = 128,
            AcceptBeforeDelivery = 1024,
            AcceptNoDrawDefaultRect = 2048,
            AcceptNoPreviewTooltip = 4096,
            AcceptPeekOnly = 3072,
        
        }
        
        [AllowDuplicates]
        public enum FocusRequestFlags : int32
        {
            None = 0,
            RestoreFocusedChild = 1,
            UnlessBelowModal = 2,
        
        }
        
        [AllowDuplicates]
        public enum FocusedFlags : int32
        {
            None = 0,
            ChildWindows = 1,
            RootWindow = 2,
            AnyWindow = 4,
            NoPopupHierarchy = 8,
            DockHierarchy = 16,
            RootAndChildWindows = 3,
        
        }
        
        [AllowDuplicates]
        public enum FreeTypeLoaderFlags : int32
        {
            NoHinting = 1,
            NoAutoHint = 2,
            ForceAutoHint = 4,
            LightHinting = 8,
            MonoHinting = 16,
            Bold = 32,
            Oblique = 64,
            Monochrome = 128,
            LoadColor = 256,
            Bitmap = 512,
        
        }
        
        [AllowDuplicates]
        public enum HoveredFlagsPrivate : int32
        {
            HoveredFlags_DelayMask_ = 245760,
            HoveredFlags_AllowedMaskForIsWindowHovered = 12479,
            HoveredFlags_AllowedMaskForIsItemHovered = 262048,
        
        }
        
        [AllowDuplicates]
        public enum HoveredFlags : int32
        {
            None = 0,
            ChildWindows = 1,
            RootWindow = 2,
            AnyWindow = 4,
            NoPopupHierarchy = 8,
            DockHierarchy = 16,
            AllowWhenBlockedByPopup = 32,
            AllowWhenBlockedByActiveItem = 128,
            AllowWhenOverlappedByItem = 256,
            AllowWhenOverlappedByWindow = 512,
            AllowWhenDisabled = 1024,
            NoNavOverride = 2048,
            AllowWhenOverlapped = 768,
            RectOnly = 928,
            RootAndChildWindows = 3,
            ForTooltip = 4096,
            Stationary = 8192,
            DelayNone = 16384,
            DelayShort = 32768,
            DelayNormal = 65536,
            NoSharedDelay = 131072,
        
        }
        
        [AllowDuplicates]
        public enum InputEventType : int32
        {
            None = 0,
            MousePos = 1,
            MouseWheel = 2,
            MouseButton = 3,
            MouseViewport = 4,
            Key = 5,
            Text = 6,
            Focus = 7,
            COUNT = 8,
        
        }
        
        [AllowDuplicates]
        public enum InputFlagsPrivate : int32
        {
            InputFlags_RepeatRateDefault = 2,
            InputFlags_RepeatRateNavMove = 4,
            InputFlags_RepeatRateNavTweak = 8,
            InputFlags_RepeatUntilRelease = 16,
            InputFlags_RepeatUntilKeyModsChange = 32,
            InputFlags_RepeatUntilKeyModsChangeFromNone = 64,
            InputFlags_RepeatUntilOtherKeyPress = 128,
            InputFlags_LockThisFrame = 1048576,
            InputFlags_LockUntilRelease = 2097152,
            InputFlags_CondHovered = 4194304,
            InputFlags_CondActive = 8388608,
            InputFlags_CondDefault_ = 12582912,
            InputFlags_RepeatRateMask_ = 14,
            InputFlags_RepeatUntilMask_ = 240,
            InputFlags_RepeatMask_ = 255,
            InputFlags_CondMask_ = 12582912,
            InputFlags_RouteTypeMask_ = 15360,
            InputFlags_RouteOptionsMask_ = 245760,
            InputFlags_SupportedByIsKeyPressed = 255,
            InputFlags_SupportedByIsMouseClicked = 1,
            InputFlags_SupportedByShortcut = 261375,
            InputFlags_SupportedBySetNextItemShortcut = 523519,
            InputFlags_SupportedBySetKeyOwner = 3145728,
            InputFlags_SupportedBySetItemKeyOwner = 15728640,
        
        }
        
        [AllowDuplicates]
        public enum InputFlags : int32
        {
            None = 0,
            Repeat = 1,
            RouteActive = 1024,
            RouteFocused = 2048,
            RouteGlobal = 4096,
            RouteAlways = 8192,
            RouteOverFocused = 16384,
            RouteOverActive = 32768,
            RouteUnlessBgFocused = 65536,
            RouteFromRootWindow = 131072,
            Tooltip = 262144,
        
        }
        
        [AllowDuplicates]
        public enum InputSource : int32
        {
            None = 0,
            Mouse = 1,
            Keyboard = 2,
            Gamepad = 3,
            COUNT = 4,
        
        }
        
        [AllowDuplicates]
        public enum InputTextFlagsPrivate : int32
        {
            InputTextFlags_Multiline = 67108864,
            InputTextFlags_MergedItem = 134217728,
            InputTextFlags_LocalizeDecimalPoint = 268435456,
        
        }
        
        [AllowDuplicates]
        public enum InputTextFlags : int32
        {
            None = 0,
            CharsDecimal = 1,
            CharsHexadecimal = 2,
            CharsScientific = 4,
            CharsUppercase = 8,
            CharsNoBlank = 16,
            AllowTabInput = 32,
            EnterReturnsTrue = 64,
            EscapeClearsAll = 128,
            CtrlEnterForNewLine = 256,
            ReadOnly = 512,
            Password = 1024,
            AlwaysOverwrite = 2048,
            AutoSelectAll = 4096,
            ParseEmptyRefVal = 8192,
            DisplayEmptyRefVal = 16384,
            NoHorizontalScroll = 32768,
            NoUndoRedo = 65536,
            ElideLeft = 131072,
            CallbackCompletion = 262144,
            CallbackHistory = 524288,
            CallbackAlways = 1048576,
            CallbackCharFilter = 2097152,
            CallbackResize = 4194304,
            CallbackEdit = 8388608,
        
        }
        
        [AllowDuplicates]
        public enum ItemFlagsPrivate : int32
        {
            ItemFlags_Disabled = 1024,
            ItemFlags_ReadOnly = 2048,
            ItemFlags_MixedValue = 4096,
            ItemFlags_NoWindowHoverableCheck = 8192,
            ItemFlags_AllowOverlap = 16384,
            ItemFlags_NoNavDisableMouseHover = 32768,
            ItemFlags_NoMarkEdited = 65536,
            ItemFlags_NoFocus = 131072,
            ItemFlags_Inputable = 1048576,
            ItemFlags_HasSelectionUserData = 2097152,
            ItemFlags_IsMultiSelect = 4194304,
            ItemFlags_Default_ = 16,
        
        }
        
        [AllowDuplicates]
        public enum ItemFlags : int32
        {
            None = 0,
            NoTabStop = 1,
            NoNav = 2,
            NoNavDefaultFocus = 4,
            ButtonRepeat = 8,
            AutoClosePopups = 16,
            AllowDuplicateId = 32,
        
        }
        
        [AllowDuplicates]
        public enum ItemStatusFlags : int32
        {
            None = 0,
            HoveredRect = 1,
            HasDisplayRect = 2,
            Edited = 4,
            ToggledSelection = 8,
            ToggledOpen = 16,
            HasDeactivated = 32,
            Deactivated = 64,
            HoveredWindow = 128,
            Visible = 256,
            HasClipRect = 512,
            HasShortcut = 1024,
        
        }
        
        [AllowDuplicates]
        public enum Key : int32
        {
            None = 0,
            NamedKey_BEGIN = 512,
            Tab = 512,
            LeftArrow = 513,
            RightArrow = 514,
            UpArrow = 515,
            DownArrow = 516,
            PageUp = 517,
            PageDown = 518,
            Home = 519,
            End = 520,
            Insert = 521,
            Delete = 522,
            Backspace = 523,
            Space = 524,
            Enter = 525,
            Escape = 526,
            LeftCtrl = 527,
            LeftShift = 528,
            LeftAlt = 529,
            LeftSuper = 530,
            RightCtrl = 531,
            RightShift = 532,
            RightAlt = 533,
            RightSuper = 534,
            Menu = 535,
            N0 = 536,
            N1 = 537,
            N2 = 538,
            N3 = 539,
            N4 = 540,
            N5 = 541,
            N6 = 542,
            N7 = 543,
            N8 = 544,
            N9 = 545,
            A = 546,
            B = 547,
            C = 548,
            D = 549,
            E = 550,
            F = 551,
            G = 552,
            H = 553,
            I = 554,
            J = 555,
            K = 556,
            L = 557,
            M = 558,
            N = 559,
            O = 560,
            P = 561,
            Q = 562,
            R = 563,
            S = 564,
            T = 565,
            U = 566,
            V = 567,
            W = 568,
            X = 569,
            Y = 570,
            Z = 571,
            F1 = 572,
            F2 = 573,
            F3 = 574,
            F4 = 575,
            F5 = 576,
            F6 = 577,
            F7 = 578,
            F8 = 579,
            F9 = 580,
            F10 = 581,
            F11 = 582,
            F12 = 583,
            F13 = 584,
            F14 = 585,
            F15 = 586,
            F16 = 587,
            F17 = 588,
            F18 = 589,
            F19 = 590,
            F20 = 591,
            F21 = 592,
            F22 = 593,
            F23 = 594,
            F24 = 595,
            Apostrophe = 596,
            Comma = 597,
            Minus = 598,
            Period = 599,
            Slash = 600,
            Semicolon = 601,
            Equal = 602,
            LeftBracket = 603,
            Backslash = 604,
            RightBracket = 605,
            GraveAccent = 606,
            CapsLock = 607,
            ScrollLock = 608,
            NumLock = 609,
            PrintScreen = 610,
            Pause = 611,
            Keypad0 = 612,
            Keypad1 = 613,
            Keypad2 = 614,
            Keypad3 = 615,
            Keypad4 = 616,
            Keypad5 = 617,
            Keypad6 = 618,
            Keypad7 = 619,
            Keypad8 = 620,
            Keypad9 = 621,
            KeypadDecimal = 622,
            KeypadDivide = 623,
            KeypadMultiply = 624,
            KeypadSubtract = 625,
            KeypadAdd = 626,
            KeypadEnter = 627,
            KeypadEqual = 628,
            AppBack = 629,
            AppForward = 630,
            Oem102 = 631,
            GamepadStart = 632,
            GamepadBack = 633,
            GamepadFaceLeft = 634,
            GamepadFaceRight = 635,
            GamepadFaceUp = 636,
            GamepadFaceDown = 637,
            GamepadDpadLeft = 638,
            GamepadDpadRight = 639,
            GamepadDpadUp = 640,
            GamepadDpadDown = 641,
            GamepadL1 = 642,
            GamepadR1 = 643,
            GamepadL2 = 644,
            GamepadR2 = 645,
            GamepadL3 = 646,
            GamepadR3 = 647,
            GamepadLStickLeft = 648,
            GamepadLStickRight = 649,
            GamepadLStickUp = 650,
            GamepadLStickDown = 651,
            GamepadRStickLeft = 652,
            GamepadRStickRight = 653,
            GamepadRStickUp = 654,
            GamepadRStickDown = 655,
            MouseLeft = 656,
            MouseRight = 657,
            MouseMiddle = 658,
            MouseX1 = 659,
            MouseX2 = 660,
            MouseWheelX = 661,
            MouseWheelY = 662,
            ReservedForModCtrl = 663,
            ReservedForModShift = 664,
            ReservedForModAlt = 665,
            ReservedForModSuper = 666,
            NamedKey_END = 667,
            NamedKey_COUNT = 155,
            Mod_None = 0,
            Mod_Ctrl = 4096,
            Mod_Shift = 8192,
            Mod_Alt = 16384,
            Mod_Super = 32768,
            Mod_Mask_ = 61440,
        
        }
        
        [AllowDuplicates]
        public enum LayoutType : int32
        {
            Horizontal = 0,
            Vertical = 1,
        
        }
        
        [AllowDuplicates]
        public enum LocKey : int32
        {
            VersionStr = 0,
            TableSizeOne = 1,
            TableSizeAllFit = 2,
            TableSizeAllDefault = 3,
            TableResetOrder = 4,
            WindowingMainMenuBar = 5,
            WindowingPopup = 6,
            WindowingUntitled = 7,
            OpenLink_s = 8,
            CopyLink = 9,
            DockingHideTabBar = 10,
            DockingHoldShiftToDock = 11,
            DockingDragToUndockOrMoveNode = 12,
            COUNT = 13,
        
        }
        
        [AllowDuplicates]
        public enum LogFlags : int32
        {
            None = 0,
            OutputTTY = 1,
            OutputFile = 2,
            OutputBuffer = 4,
            OutputClipboard = 8,
            OutputMask_ = 15,
        
        }
        
        [AllowDuplicates]
        public enum MouseButton : int32
        {
            Left = 0,
            Right = 1,
            Middle = 2,
            COUNT = 5,
        
        }
        
        [AllowDuplicates]
        public enum MouseCursor : int32
        {
            None = -1,
            Arrow = 0,
            TextInput = 1,
            ResizeAll = 2,
            ResizeNS = 3,
            ResizeEW = 4,
            ResizeNESW = 5,
            ResizeNWSE = 6,
            Hand = 7,
            Wait = 8,
            Progress = 9,
            NotAllowed = 10,
            COUNT = 11,
        
        }
        
        [AllowDuplicates]
        public enum MouseSource : int32
        {
            Mouse = 0,
            TouchScreen = 1,
            Pen = 2,
            COUNT = 3,
        
        }
        
        [AllowDuplicates]
        public enum MultiSelectFlags : int32
        {
            None = 0,
            SingleSelect = 1,
            NoSelectAll = 2,
            NoRangeSelect = 4,
            NoAutoSelect = 8,
            NoAutoClear = 16,
            NoAutoClearOnReselect = 32,
            BoxSelect1d = 64,
            BoxSelect2d = 128,
            BoxSelectNoScroll = 256,
            ClearOnEscape = 512,
            ClearOnClickVoid = 1024,
            ScopeWindow = 2048,
            ScopeRect = 4096,
            SelectOnClick = 8192,
            SelectOnClickRelease = 16384,
            NavWrapX = 65536,
        
        }
        
        [AllowDuplicates]
        public enum NavLayer : int32
        {
            Main = 0,
            Menu = 1,
            COUNT = 2,
        
        }
        
        [AllowDuplicates]
        public enum NavMoveFlags : int32
        {
            None = 0,
            LoopX = 1,
            LoopY = 2,
            WrapX = 4,
            WrapY = 8,
            WrapMask_ = 15,
            AllowCurrentNavId = 16,
            AlsoScoreVisibleSet = 32,
            ScrollToEdgeY = 64,
            Forwarded = 128,
            DebugNoResult = 256,
            FocusApi = 512,
            IsTabbing = 1024,
            IsPageMove = 2048,
            Activate = 4096,
            NoSelect = 8192,
            NoSetNavCursorVisible = 16384,
            NoClearActiveId = 32768,
        
        }
        
        [AllowDuplicates]
        public enum NavRenderCursorFlags : int32
        {
            None = 0,
            Compact = 2,
            AlwaysDraw = 4,
            NoRounding = 8,
        
        }
        
        [AllowDuplicates]
        public enum NextItemDataFlags : int32
        {
            None = 0,
            HasWidth = 1,
            HasOpen = 2,
            HasShortcut = 4,
            HasRefVal = 8,
            HasStorageID = 16,
        
        }
        
        [AllowDuplicates]
        public enum NextWindowDataFlags : int32
        {
            None = 0,
            HasPos = 1,
            HasSize = 2,
            HasContentSize = 4,
            HasCollapsed = 8,
            HasSizeConstraint = 16,
            HasFocus = 32,
            HasBgAlpha = 64,
            HasScroll = 128,
            HasWindowFlags = 256,
            HasChildFlags = 512,
            HasRefreshPolicy = 1024,
            HasViewport = 2048,
            HasDock = 4096,
            HasWindowClass = 8192,
        
        }
        
        [AllowDuplicates]
        public enum OldColumnFlags : int32
        {
            None = 0,
            NoBorder = 1,
            NoResize = 2,
            NoPreserveWidths = 4,
            NoForceWithinWindow = 8,
            GrowParentContentsSize = 16,
        
        }
        
        [AllowDuplicates]
        public enum PlotType : int32
        {
            Lines = 0,
            Histogram = 1,
        
        }
        
        [AllowDuplicates]
        public enum PopupFlags : int32
        {
            None = 0,
            MouseButtonLeft = 0,
            MouseButtonRight = 1,
            MouseButtonMiddle = 2,
            MouseButtonMask_ = 31,
            MouseButtonDefault_ = 1,
            NoReopen = 32,
            NoOpenOverExistingPopup = 128,
            NoOpenOverItems = 256,
            AnyPopupId = 1024,
            AnyPopupLevel = 2048,
            AnyPopup = 3072,
        
        }
        
        [AllowDuplicates]
        public enum PopupPositionPolicy : int32
        {
            Default = 0,
            ComboBox = 1,
            Tooltip = 2,
        
        }
        
        [AllowDuplicates]
        public enum ScrollFlags : int32
        {
            None = 0,
            KeepVisibleEdgeX = 1,
            KeepVisibleEdgeY = 2,
            KeepVisibleCenterX = 4,
            KeepVisibleCenterY = 8,
            AlwaysCenterX = 16,
            AlwaysCenterY = 32,
            NoScrollParent = 64,
            MaskX_ = 21,
            MaskY_ = 42,
        
        }
        
        [AllowDuplicates]
        public enum SelectableFlagsPrivate : int32
        {
            SelectableFlags_NoHoldingActiveID = 1048576,
            SelectableFlags_SelectOnNav = 2097152,
            SelectableFlags_SelectOnClick = 4194304,
            SelectableFlags_SelectOnRelease = 8388608,
            SelectableFlags_SpanAvailWidth = 16777216,
            SelectableFlags_SetNavIdOnHover = 33554432,
            SelectableFlags_NoPadWithHalfSpacing = 67108864,
            SelectableFlags_NoSetKeyOwner = 134217728,
        
        }
        
        [AllowDuplicates]
        public enum SelectableFlags : int32
        {
            None = 0,
            NoAutoClosePopups = 1,
            SpanAllColumns = 2,
            AllowDoubleClick = 4,
            Disabled = 8,
            AllowOverlap = 16,
            Highlight = 32,
        
        }
        
        [AllowDuplicates]
        public enum SelectionRequestType : int32
        {
            None = 0,
            SetAll = 1,
            SetRange = 2,
        
        }
        
        [AllowDuplicates]
        public enum SeparatorFlags : int32
        {
            None = 0,
            Horizontal = 1,
            Vertical = 2,
            SpanAllColumns = 4,
        
        }
        
        [AllowDuplicates]
        public enum SliderFlagsPrivate : int32
        {
            SliderFlags_Vertical = 1048576,
            SliderFlags_ReadOnly = 2097152,
        
        }
        
        [AllowDuplicates]
        public enum SliderFlags : int32
        {
            None = 0,
            Logarithmic = 32,
            NoRoundToFormat = 64,
            NoInput = 128,
            WrapAround = 256,
            ClampOnInput = 512,
            ClampZeroRange = 1024,
            NoSpeedTweaks = 2048,
            AlwaysClamp = 1536,
            InvalidMask_ = 1879048207,
        
        }
        
        [AllowDuplicates]
        public enum SortDirection : int32
        {
            None = 0,
            Ascending = 1,
            Descending = 2,
        
        }
        
        [AllowDuplicates]
        public enum StyleVar : int32
        {
            Alpha = 0,
            DisabledAlpha = 1,
            WindowPadding = 2,
            WindowRounding = 3,
            WindowBorderSize = 4,
            WindowMinSize = 5,
            WindowTitleAlign = 6,
            ChildRounding = 7,
            ChildBorderSize = 8,
            PopupRounding = 9,
            PopupBorderSize = 10,
            FramePadding = 11,
            FrameRounding = 12,
            FrameBorderSize = 13,
            ItemSpacing = 14,
            ItemInnerSpacing = 15,
            IndentSpacing = 16,
            CellPadding = 17,
            ScrollbarSize = 18,
            ScrollbarRounding = 19,
            GrabMinSize = 20,
            GrabRounding = 21,
            ageBorderSize = 22,
            TabRounding = 23,
            TabBorderSize = 24,
            TabBarBorderSize = 25,
            TabBarOverlineSize = 26,
            TableAngledHeadersAngle = 27,
            TableAngledHeadersTextAlign = 28,
            TreeLinesSize = 29,
            TreeLinesRounding = 30,
            ButtonTextAlign = 31,
            SelectableTextAlign = 32,
            SeparatorTextBorderSize = 33,
            SeparatorTextAlign = 34,
            SeparatorTextPadding = 35,
            DockingSeparatorSize = 36,
            COUNT = 37,
        
        }
        
        [AllowDuplicates]
        public enum TabBarFlagsPrivate : int32
        {
            TabBarFlags_DockNode = 1048576,
            TabBarFlags_IsFocused = 2097152,
            TabBarFlags_SaveSettings = 4194304,
        
        }
        
        [AllowDuplicates]
        public enum TabBarFlags : int32
        {
            None = 0,
            Reorderable = 1,
            AutoSelectNewTabs = 2,
            TabListPopupButton = 4,
            NoCloseWithMiddleMouseButton = 8,
            NoTabListScrollingButtons = 16,
            NoTooltip = 32,
            DrawSelectedOverline = 64,
            FittingPolicyResizeDown = 128,
            FittingPolicyScroll = 256,
            FittingPolicyMask_ = 384,
            FittingPolicyDefault_ = 128,
        
        }
        
        [AllowDuplicates]
        public enum TabItemFlagsPrivate : int32
        {
            TabItemFlags_SectionMask_ = 192,
            TabItemFlags_NoCloseButton = 1048576,
            TabItemFlags_Button = 2097152,
            TabItemFlags_Invisible = 4194304,
            TabItemFlags_Unsorted = 8388608,
        
        }
        
        [AllowDuplicates]
        public enum TabItemFlags : int32
        {
            None = 0,
            UnsavedDocument = 1,
            SetSelected = 2,
            NoCloseWithMiddleMouseButton = 4,
            NoPushId = 8,
            NoTooltip = 16,
            NoReorder = 32,
            Leading = 64,
            Trailing = 128,
            NoAssumedClosure = 256,
        
        }
        
        [AllowDuplicates]
        public enum TableBgTarget : int32
        {
            None = 0,
            RowBg0 = 1,
            RowBg1 = 2,
            CellBg = 3,
        
        }
        
        [AllowDuplicates]
        public enum TableColumnFlags : int32
        {
            None = 0,
            Disabled = 1,
            DefaultHide = 2,
            DefaultSort = 4,
            WidthStretch = 8,
            WidthFixed = 16,
            NoResize = 32,
            NoReorder = 64,
            NoHide = 128,
            NoClip = 256,
            NoSort = 512,
            NoSortAscending = 1024,
            NoSortDescending = 2048,
            NoHeaderLabel = 4096,
            NoHeaderWidth = 8192,
            PreferSortAscending = 16384,
            PreferSortDescending = 32768,
            IndentEnable = 65536,
            IndentDisable = 131072,
            AngledHeader = 262144,
            IsEnabled = 16777216,
            IsVisible = 33554432,
            IsSorted = 67108864,
            IsHovered = 134217728,
            WidthMask_ = 24,
            IndentMask_ = 196608,
            StatusMask_ = 251658240,
            NoDirectResize_ = 1073741824,
        
        }
        
        [AllowDuplicates]
        public enum TableFlags : int32
        {
            None = 0,
            Resizable = 1,
            Reorderable = 2,
            Hideable = 4,
            Sortable = 8,
            NoSavedSettings = 16,
            ContextMenuInBody = 32,
            RowBg = 64,
            BordersInnerH = 128,
            BordersOuterH = 256,
            BordersInnerV = 512,
            BordersOuterV = 1024,
            BordersH = 384,
            BordersV = 1536,
            BordersInner = 640,
            BordersOuter = 1280,
            Borders = 1920,
            NoBordersInBody = 2048,
            NoBordersInBodyUntilResize = 4096,
            SizingFixedFit = 8192,
            SizingFixedSame = 16384,
            SizingStretchProp = 24576,
            SizingStretchSame = 32768,
            NoHostExtendX = 65536,
            NoHostExtendY = 131072,
            NoKeepColumnsVisible = 262144,
            PreciseWidths = 524288,
            NoClip = 1048576,
            PadOuterX = 2097152,
            NoPadOuterX = 4194304,
            NoPadInnerX = 8388608,
            ScrollX = 16777216,
            ScrollY = 33554432,
            SortMulti = 67108864,
            SortTristate = 134217728,
            HighlightHoveredColumn = 268435456,
            SizingMask_ = 57344,
        
        }
        
        [AllowDuplicates]
        public enum TableRowFlags : int32
        {
            None = 0,
            Headers = 1,
        
        }
        
        [AllowDuplicates]
        public enum TextFlags : int32
        {
            None = 0,
            NoWidthForLargeClippedText = 1,
        
        }
        
        [AllowDuplicates]
        public enum TooltipFlags : int32
        {
            None = 0,
            OverridePrevious = 2,
        
        }
        
        [AllowDuplicates]
        public enum TreeNodeFlagsPrivate : int32
        {
            TreeNodeFlags_NoNavFocus = 134217728,
            TreeNodeFlags_ClipLabelForTrailingButton = 268435456,
            TreeNodeFlags_UpsideDownArrow = 536870912,
            TreeNodeFlags_OpenOnMask_ = 192,
            TreeNodeFlags_DrawLinesMask_ = 1835008,
        
        }
        
        [AllowDuplicates]
        public enum TreeNodeFlags : int32
        {
            None = 0,
            Selected = 1,
            Framed = 2,
            AllowOverlap = 4,
            NoTreePushOnOpen = 8,
            NoAutoOpenOnLog = 16,
            DefaultOpen = 32,
            OpenOnDoubleClick = 64,
            OpenOnArrow = 128,
            Leaf = 256,
            Bullet = 512,
            FramePadding = 1024,
            SpanAvailWidth = 2048,
            SpanFullWidth = 4096,
            SpanLabelWidth = 8192,
            SpanAllColumns = 16384,
            LabelSpanAllColumns = 32768,
            NavLeftJumpsToParent = 131072,
            CollapsingHeader = 26,
            DrawLinesNone = 262144,
            DrawLinesFull = 524288,
            DrawLinesToNodes = 1048576,
        
        }
        
        [AllowDuplicates]
        public enum TypingSelectFlags : int32
        {
            None = 0,
            AllowBackspace = 1,
            AllowSingleCharMode = 2,
        
        }
        
        [AllowDuplicates]
        public enum ViewportFlags : int32
        {
            None = 0,
            IsPlatformWindow = 1,
            IsPlatformMonitor = 2,
            OwnedByApp = 4,
            NoDecoration = 8,
            NoTaskBarIcon = 16,
            NoFocusOnAppearing = 32,
            NoFocusOnClick = 64,
            NoInputs = 128,
            NoRendererClear = 256,
            NoAutoMerge = 512,
            TopMost = 1024,
            CanHostOtherWindows = 2048,
            IsMinimized = 4096,
            IsFocused = 8192,
        
        }
        
        [AllowDuplicates]
        public enum WindowDockStyleCol : int32
        {
            Text = 0,
            TabHovered = 1,
            TabFocused = 2,
            TabSelected = 3,
            TabSelectedOverline = 4,
            TabDimmed = 5,
            TabDimmedSelected = 6,
            TabDimmedSelectedOverline = 7,
            COUNT = 8,
        
        }
        
        [AllowDuplicates]
        public enum WindowFlags : int32
        {
            None = 0,
            NoTitleBar = 1,
            NoResize = 2,
            NoMove = 4,
            NoScrollbar = 8,
            NoScrollWithMouse = 16,
            NoCollapse = 32,
            AlwaysAutoResize = 64,
            NoBackground = 128,
            NoSavedSettings = 256,
            NoMouseInputs = 512,
            MenuBar = 1024,
            HorizontalScrollbar = 2048,
            NoFocusOnAppearing = 4096,
            NoBringToFrontOnFocus = 8192,
            AlwaysVerticalScrollbar = 16384,
            AlwaysHorizontalScrollbar = 32768,
            NoNavInputs = 65536,
            NoNavFocus = 131072,
            UnsavedDocument = 262144,
            NoDocking = 524288,
            NoNav = 196608,
            NoDecoration = 43,
            NoInputs = 197120,
            DockNodeHost = 8388608,
            ChildWindow = 16777216,
            Tooltip = 33554432,
            Popup = 67108864,
            Modal = 134217728,
            ChildMenu = 268435456,
        
        }
        
        [AllowDuplicates]
        public enum WindowRefreshFlags : int32
        {
            None = 0,
            TryToAvoidRefresh = 1,
            RefreshOnHover = 2,
            RefreshOnFocus = 4,
        
        }
        
        [AllowDuplicates]
        public enum TextureFormat : int32
        {
            RGBA32 = 0,
            Alpha8 = 1,
        
        }
        
        [AllowDuplicates]
        public enum TextureStatus : int32
        {
            OK = 0,
            Destroyed = 1,
            WantCreate = 2,
            WantUpdates = 3,
            WantDestroy = 4,
        
        }
        
        [CRepr]
        public struct BitVector
        {
            public Vector<U32> Storage;
        
            [LinkName("ImBitVector_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImBitVector_ClearBit")]
            private static extern void ClearBitImpl(Self* self, int32 n);
            public void ClearBit(int32 n) mut=> ClearBitImpl(&this, n);
            
            [LinkName("ImBitVector_Create")]
            private static extern void CreateImpl(Self* self, int32 sz);
            public void Create(int32 sz) mut=> CreateImpl(&this, sz);
            
            [LinkName("ImBitVector_SetBit")]
            private static extern void SetBitImpl(Self* self, int32 n);
            public void SetBit(int32 n) mut=> SetBitImpl(&this, n);
            
            [LinkName("ImBitVector_TestBit")]
            private static extern bool TestBitImpl(Self* self, int32 n);
            public bool TestBit(int32 n) mut=> TestBitImpl(&this, n);
            
        }
        
        [CRepr]
        public struct Color
        {
            public Vec4 Value;
        
            [LinkName("ImColor_ImColor_Nil")]
            private static extern Color* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImColor_ImColor_Float")]
            private static extern Color* CtorImpl(float r, float g, float b, float a);
            public this(float r, float g, float b, float a = (float) 1.0f)
            {
                this = *CtorImpl(r, g, b, a);
            }
            
            [LinkName("ImColor_ImColor_Vec4")]
            private static extern Color* CtorImpl(Vec4 col);
            public this(Vec4 col)
            {
                this = *CtorImpl(col);
            }
            
            [LinkName("ImColor_ImColor_Int")]
            private static extern Color* CtorImpl(int32 r, int32 g, int32 b, int32 a);
            public this(int32 r, int32 g, int32 b, int32 a = (int32) 255)
            {
                this = *CtorImpl(r, g, b, a);
            }
            
            [LinkName("ImColor_ImColor_U32")]
            private static extern Color* CtorImpl(U32 rgba);
            public this(U32 rgba)
            {
                this = *CtorImpl(rgba);
            }
            
            [LinkName("ImColor_SetHSV")]
            private static extern void SetHSVImpl(Self* self, float h, float s, float v, float a);
            public void SetHSV(float h, float s, float v, float a = (float) 1.0f) mut=> SetHSVImpl(&this, h, s, v, a);
            
        }
        
        [CRepr]
        public struct DrawChannel
        {
            public Vector<DrawCmd> _CmdBuffer;
            public Vector<DrawIdx> _IdxBuffer;
        
        }
        
        [CRepr]
        public struct DrawCmd
        {
            public Vec4 ClipRect;
            public TextureRef TexRef;
            public uint32 VtxOffset;
            public uint32 IdxOffset;
            public uint32 ElemCount;
            public DrawCallback UserCallback;
            public void* UserCallbackData;
            public int32 UserCallbackDataSize;
            public int32 UserCallbackDataOffset;
        
            [LinkName("ImDrawCmd_ImDrawCmd")]
            private static extern DrawCmd* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawCmd_GetTexID")]
            private static extern TextureID GetTexIDImpl(Self* self);
            public TextureID GetTexID() mut=> GetTexIDImpl(&this);
            
        }
        
        [CRepr]
        public struct DrawCmdHeader
        {
            public Vec4 ClipRect;
            public TextureRef TexRef;
            public uint32 VtxOffset;
        
        }
        
        [CRepr]
        public struct DrawData
        {
            public bool Valid;
            public int32 CmdListsCount;
            public int32 TotalIdxCount;
            public int32 TotalVtxCount;
            public Vector<DrawList*> CmdLists;
            public Vec2 DisplayPos;
            public Vec2 DisplaySize;
            public Vec2 FramebufferScale;
            public Viewport* OwnerViewport;
            public Vector<TextureData*>* Textures;
        
            [LinkName("ImDrawData_ImDrawData")]
            private static extern DrawData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawData_AddDrawList")]
            private static extern void AddDrawListImpl(Self* self, DrawList* draw_list);
            public void AddDrawList(DrawList* draw_list) mut=> AddDrawListImpl(&this, draw_list);
            
            [LinkName("ImDrawData_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImDrawData_DeIndexAllBuffers")]
            private static extern void DeIndexAllBuffersImpl(Self* self);
            public void DeIndexAllBuffers() mut=> DeIndexAllBuffersImpl(&this);
            
            [LinkName("ImDrawData_ScaleClipRects")]
            private static extern void ScaleClipRectsImpl(Self* self, Vec2 fb_scale);
            public void ScaleClipRects(Vec2 fb_scale) mut=> ScaleClipRectsImpl(&this, fb_scale);
            
        }
        
        [CRepr]
        public struct DrawDataBuilder
        {
            public Vector<DrawList*>*[2] Layers;
            public Vector<DrawList*> LayerData1;
        
            [LinkName("ImDrawDataBuilder_ImDrawDataBuilder")]
            private static extern DrawDataBuilder* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct DrawList
        {
            public Vector<DrawCmd> CmdBuffer;
            public Vector<DrawIdx> IdxBuffer;
            public Vector<DrawVert> VtxBuffer;
            public DrawListFlags Flags;
            public uint32 _VtxCurrentIdx;
            public DrawListSharedData* _Data;
            public DrawVert* _VtxWritePtr;
            public DrawIdx* _IdxWritePtr;
            public Vector<Vec2> _Path;
            public DrawCmdHeader _CmdHeader;
            public DrawListSplitter _Splitter;
            public Vector<Vec4> _ClipRectStack;
            public Vector<TextureRef> _TextureStack;
            public Vector<U8> _CallbacksDataBuf;
            public float _FringeScale;
            public char* _OwnerName;
        
            [LinkName("ImDrawList_ImDrawList")]
            private static extern DrawList* CtorImpl(DrawListSharedData* shared_data);
            public this(DrawListSharedData* shared_data)
            {
                this = *CtorImpl(shared_data);
            }
            
            [LinkName("ImDrawList_AddBezierCubic")]
            private static extern void AddBezierCubicImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness, int32 num_segments);
            public void AddBezierCubic(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness, int32 num_segments = (int32) 0) mut=> AddBezierCubicImpl(&this, p1, p2, p3, p4, col, thickness, num_segments);
            
            [LinkName("ImDrawList_AddBezierQuadratic")]
            private static extern void AddBezierQuadraticImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness, int32 num_segments);
            public void AddBezierQuadratic(Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness, int32 num_segments = (int32) 0) mut=> AddBezierQuadraticImpl(&this, p1, p2, p3, col, thickness, num_segments);
            
            [LinkName("ImDrawList_AddCallback")]
            private static extern void AddCallbackImpl(Self* self, DrawCallback callback, void* userdata, size userdata_size);
            public void AddCallback(DrawCallback callback, void* userdata, size userdata_size = (size) 0) mut=> AddCallbackImpl(&this, callback, userdata, userdata_size);
            
            [LinkName("ImDrawList_AddCircle")]
            private static extern void AddCircleImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments, float thickness);
            public void AddCircle(Vec2 center, float radius, U32 col, int32 num_segments = (int32) 0, float thickness = (float) 1.0f) mut=> AddCircleImpl(&this, center, radius, col, num_segments, thickness);
            
            [LinkName("ImDrawList_AddCircleFilled")]
            private static extern void AddCircleFilledImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments);
            public void AddCircleFilled(Vec2 center, float radius, U32 col, int32 num_segments = (int32) 0) mut=> AddCircleFilledImpl(&this, center, radius, col, num_segments);
            
            [LinkName("ImDrawList_AddConcavePolyFilled")]
            private static extern void AddConcavePolyFilledImpl(Self* self, Vec2* points, int32 num_points, U32 col);
            public void AddConcavePolyFilled(Vec2* points, int32 num_points, U32 col) mut=> AddConcavePolyFilledImpl(&this, points, num_points, col);
            
            [LinkName("ImDrawList_AddConvexPolyFilled")]
            private static extern void AddConvexPolyFilledImpl(Self* self, Vec2* points, int32 num_points, U32 col);
            public void AddConvexPolyFilled(Vec2* points, int32 num_points, U32 col) mut=> AddConvexPolyFilledImpl(&this, points, num_points, col);
            
            [LinkName("ImDrawList_AddDrawCmd")]
            private static extern void AddDrawCmdImpl(Self* self);
            public void AddDrawCmd() mut=> AddDrawCmdImpl(&this);
            
            [LinkName("ImDrawList_AddEllipse")]
            private static extern void AddEllipseImpl(Self* self, Vec2 center, Vec2 radius, U32 col, float rot, int32 num_segments, float thickness);
            public void AddEllipse(Vec2 center, Vec2 radius, U32 col, float rot = (float) 0.0f, int32 num_segments = (int32) 0, float thickness = (float) 1.0f) mut=> AddEllipseImpl(&this, center, radius, col, rot, num_segments, thickness);
            
            [LinkName("ImDrawList_AddEllipseFilled")]
            private static extern void AddEllipseFilledImpl(Self* self, Vec2 center, Vec2 radius, U32 col, float rot, int32 num_segments);
            public void AddEllipseFilled(Vec2 center, Vec2 radius, U32 col, float rot = (float) 0.0f, int32 num_segments = (int32) 0) mut=> AddEllipseFilledImpl(&this, center, radius, col, rot, num_segments);
            
            [LinkName("ImDrawList_AddImage")]
            private static extern void AddImageImpl(Self* self, TextureRef tex_ref, Vec2 p_min, Vec2 p_max, Vec2 uv_min, Vec2 uv_max, U32 col);
            public void AddImage(TextureRef tex_ref, Vec2 p_min, Vec2 p_max, Vec2 uv_min = Vec2.Zero, Vec2 uv_max = Vec2.Ones, U32 col = (U32) 4294967295) mut=> AddImageImpl(&this, tex_ref, p_min, p_max, uv_min, uv_max, col);
            
            [LinkName("ImDrawList_AddImageQuad")]
            private static extern void AddImageQuadImpl(Self* self, TextureRef tex_ref, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 uv1, Vec2 uv2, Vec2 uv3, Vec2 uv4, U32 col);
            public void AddImageQuad(TextureRef tex_ref, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 uv1 = Vec2.Zero, Vec2 uv2 = Vec2.OneZero, Vec2 uv3 = Vec2.Ones, Vec2 uv4 = Vec2.ZeroOne, U32 col = (U32) 4294967295) mut=> AddImageQuadImpl(&this, tex_ref, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col);
            
            [LinkName("ImDrawList_AddImageRounded")]
            private static extern void AddImageRoundedImpl(Self* self, TextureRef tex_ref, Vec2 p_min, Vec2 p_max, Vec2 uv_min, Vec2 uv_max, U32 col, float rounding, DrawFlags flags);
            public void AddImageRounded(TextureRef tex_ref, Vec2 p_min, Vec2 p_max, Vec2 uv_min, Vec2 uv_max, U32 col, float rounding, DrawFlags flags = (DrawFlags) 0) mut=> AddImageRoundedImpl(&this, tex_ref, p_min, p_max, uv_min, uv_max, col, rounding, flags);
            
            [LinkName("ImDrawList_AddLine")]
            private static extern void AddLineImpl(Self* self, Vec2 p1, Vec2 p2, U32 col, float thickness);
            public void AddLine(Vec2 p1, Vec2 p2, U32 col, float thickness = (float) 1.0f) mut=> AddLineImpl(&this, p1, p2, col, thickness);
            
            [LinkName("ImDrawList_AddNgon")]
            private static extern void AddNgonImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments, float thickness);
            public void AddNgon(Vec2 center, float radius, U32 col, int32 num_segments, float thickness = (float) 1.0f) mut=> AddNgonImpl(&this, center, radius, col, num_segments, thickness);
            
            [LinkName("ImDrawList_AddNgonFilled")]
            private static extern void AddNgonFilledImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments);
            public void AddNgonFilled(Vec2 center, float radius, U32 col, int32 num_segments) mut=> AddNgonFilledImpl(&this, center, radius, col, num_segments);
            
            [LinkName("ImDrawList_AddPolyline")]
            private static extern void AddPolylineImpl(Self* self, Vec2* points, int32 num_points, U32 col, DrawFlags flags, float thickness);
            public void AddPolyline(Vec2* points, int32 num_points, U32 col, DrawFlags flags, float thickness) mut=> AddPolylineImpl(&this, points, num_points, col, flags, thickness);
            
            [LinkName("ImDrawList_AddQuad")]
            private static extern void AddQuadImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness);
            public void AddQuad(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness = (float) 1.0f) mut=> AddQuadImpl(&this, p1, p2, p3, p4, col, thickness);
            
            [LinkName("ImDrawList_AddQuadFilled")]
            private static extern void AddQuadFilledImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col);
            public void AddQuadFilled(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col) mut=> AddQuadFilledImpl(&this, p1, p2, p3, p4, col);
            
            [LinkName("ImDrawList_AddRect")]
            private static extern void AddRectImpl(Self* self, Vec2 p_min, Vec2 p_max, U32 col, float rounding, DrawFlags flags, float thickness);
            public void AddRect(Vec2 p_min, Vec2 p_max, U32 col, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0, float thickness = (float) 1.0f) mut=> AddRectImpl(&this, p_min, p_max, col, rounding, flags, thickness);
            
            [LinkName("ImDrawList_AddRectFilled")]
            private static extern void AddRectFilledImpl(Self* self, Vec2 p_min, Vec2 p_max, U32 col, float rounding, DrawFlags flags);
            public void AddRectFilled(Vec2 p_min, Vec2 p_max, U32 col, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0) mut=> AddRectFilledImpl(&this, p_min, p_max, col, rounding, flags);
            
            [LinkName("ImDrawList_AddRectFilledMultiColor")]
            private static extern void AddRectFilledMultiColorImpl(Self* self, Vec2 p_min, Vec2 p_max, U32 col_upr_left, U32 col_upr_right, U32 col_bot_right, U32 col_bot_left);
            public void AddRectFilledMultiColor(Vec2 p_min, Vec2 p_max, U32 col_upr_left, U32 col_upr_right, U32 col_bot_right, U32 col_bot_left) mut=> AddRectFilledMultiColorImpl(&this, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left);
            
            [LinkName("ImDrawList_AddText_Vec2")]
            private static extern void AddTextImpl(Self* self, Vec2 pos, U32 col, char* text_begin, char* text_end);
            public void AddText(Vec2 pos, U32 col, char* text_begin, char* text_end = null) mut=> AddTextImpl(&this, pos, col, text_begin, text_end);
            
            [LinkName("ImDrawList_AddText_FontPtr")]
            private static extern void AddTextImpl(Self* self, Font* font, float font_size, Vec2 pos, U32 col, char* text_begin, char* text_end, float wrap_width, Vec4* cpu_fine_clip_rect);
            public void AddText(Font* font, float font_size, Vec2 pos, U32 col, char* text_begin, char* text_end = null, float wrap_width = (float) 0.0f, Vec4* cpu_fine_clip_rect = null) mut=> AddTextImpl(&this, font, font_size, pos, col, text_begin, text_end, wrap_width, cpu_fine_clip_rect);
            
            [LinkName("ImDrawList_AddTriangle")]
            private static extern void AddTriangleImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness);
            public void AddTriangle(Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness = (float) 1.0f) mut=> AddTriangleImpl(&this, p1, p2, p3, col, thickness);
            
            [LinkName("ImDrawList_AddTriangleFilled")]
            private static extern void AddTriangleFilledImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, U32 col);
            public void AddTriangleFilled(Vec2 p1, Vec2 p2, Vec2 p3, U32 col) mut=> AddTriangleFilledImpl(&this, p1, p2, p3, col);
            
            [LinkName("ImDrawList_ChannelsMerge")]
            private static extern void ChannelsMergeImpl(Self* self);
            public void ChannelsMerge() mut=> ChannelsMergeImpl(&this);
            
            [LinkName("ImDrawList_ChannelsSetCurrent")]
            private static extern void ChannelsSetCurrentImpl(Self* self, int32 n);
            public void ChannelsSetCurrent(int32 n) mut=> ChannelsSetCurrentImpl(&this, n);
            
            [LinkName("ImDrawList_ChannelsSplit")]
            private static extern void ChannelsSplitImpl(Self* self, int32 count);
            public void ChannelsSplit(int32 count) mut=> ChannelsSplitImpl(&this, count);
            
            [LinkName("ImDrawList_CloneOutput")]
            private static extern DrawList* CloneOutputImpl(Self* self);
            public DrawList* CloneOutput() mut=> CloneOutputImpl(&this);
            
            [LinkName("ImDrawList_GetClipRectMax")]
            private static extern Vec2 GetClipRectMaxImpl(Vec2* pOut, Self* self);
            public Vec2 GetClipRectMax() mut
            {
                Vec2 pOut = default;
                GetClipRectMaxImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImDrawList_GetClipRectMin")]
            private static extern Vec2 GetClipRectMinImpl(Vec2* pOut, Self* self);
            public Vec2 GetClipRectMin() mut
            {
                Vec2 pOut = default;
                GetClipRectMinImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImDrawList_PathArcTo")]
            private static extern void PathArcToImpl(Self* self, Vec2 center, float radius, float a_min, float a_max, int32 num_segments);
            public void PathArcTo(Vec2 center, float radius, float a_min, float a_max, int32 num_segments = (int32) 0) mut=> PathArcToImpl(&this, center, radius, a_min, a_max, num_segments);
            
            [LinkName("ImDrawList_PathArcToFast")]
            private static extern void PathArcToFastImpl(Self* self, Vec2 center, float radius, int32 a_min_of_12, int32 a_max_of_12);
            public void PathArcToFast(Vec2 center, float radius, int32 a_min_of_12, int32 a_max_of_12) mut=> PathArcToFastImpl(&this, center, radius, a_min_of_12, a_max_of_12);
            
            [LinkName("ImDrawList_PathBezierCubicCurveTo")]
            private static extern void PathBezierCubicCurveToImpl(Self* self, Vec2 p2, Vec2 p3, Vec2 p4, int32 num_segments);
            public void PathBezierCubicCurveTo(Vec2 p2, Vec2 p3, Vec2 p4, int32 num_segments = (int32) 0) mut=> PathBezierCubicCurveToImpl(&this, p2, p3, p4, num_segments);
            
            [LinkName("ImDrawList_PathBezierQuadraticCurveTo")]
            private static extern void PathBezierQuadraticCurveToImpl(Self* self, Vec2 p2, Vec2 p3, int32 num_segments);
            public void PathBezierQuadraticCurveTo(Vec2 p2, Vec2 p3, int32 num_segments = (int32) 0) mut=> PathBezierQuadraticCurveToImpl(&this, p2, p3, num_segments);
            
            [LinkName("ImDrawList_PathClear")]
            private static extern void PathClearImpl(Self* self);
            public void PathClear() mut=> PathClearImpl(&this);
            
            [LinkName("ImDrawList_PathEllipticalArcTo")]
            private static extern void PathEllipticalArcToImpl(Self* self, Vec2 center, Vec2 radius, float rot, float a_min, float a_max, int32 num_segments);
            public void PathEllipticalArcTo(Vec2 center, Vec2 radius, float rot, float a_min, float a_max, int32 num_segments = (int32) 0) mut=> PathEllipticalArcToImpl(&this, center, radius, rot, a_min, a_max, num_segments);
            
            [LinkName("ImDrawList_PathFillConcave")]
            private static extern void PathFillConcaveImpl(Self* self, U32 col);
            public void PathFillConcave(U32 col) mut=> PathFillConcaveImpl(&this, col);
            
            [LinkName("ImDrawList_PathFillConvex")]
            private static extern void PathFillConvexImpl(Self* self, U32 col);
            public void PathFillConvex(U32 col) mut=> PathFillConvexImpl(&this, col);
            
            [LinkName("ImDrawList_PathLineTo")]
            private static extern void PathLineToImpl(Self* self, Vec2 pos);
            public void PathLineTo(Vec2 pos) mut=> PathLineToImpl(&this, pos);
            
            [LinkName("ImDrawList_PathLineToMergeDuplicate")]
            private static extern void PathLineToMergeDuplicateImpl(Self* self, Vec2 pos);
            public void PathLineToMergeDuplicate(Vec2 pos) mut=> PathLineToMergeDuplicateImpl(&this, pos);
            
            [LinkName("ImDrawList_PathRect")]
            private static extern void PathRectImpl(Self* self, Vec2 rect_min, Vec2 rect_max, float rounding, DrawFlags flags);
            public void PathRect(Vec2 rect_min, Vec2 rect_max, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0) mut=> PathRectImpl(&this, rect_min, rect_max, rounding, flags);
            
            [LinkName("ImDrawList_PathStroke")]
            private static extern void PathStrokeImpl(Self* self, U32 col, DrawFlags flags, float thickness);
            public void PathStroke(U32 col, DrawFlags flags = (DrawFlags) 0, float thickness = (float) 1.0f) mut=> PathStrokeImpl(&this, col, flags, thickness);
            
            [LinkName("ImDrawList_PopClipRect")]
            private static extern void PopClipRectImpl(Self* self);
            public void PopClipRect() mut=> PopClipRectImpl(&this);
            
            [LinkName("ImDrawList_PopTexture")]
            private static extern void PopTextureImpl(Self* self);
            public void PopTexture() mut=> PopTextureImpl(&this);
            
            [LinkName("ImDrawList_PrimQuadUV")]
            private static extern void PrimQuadUVImpl(Self* self, Vec2 a, Vec2 b, Vec2 c, Vec2 d, Vec2 uv_a, Vec2 uv_b, Vec2 uv_c, Vec2 uv_d, U32 col);
            public void PrimQuadUV(Vec2 a, Vec2 b, Vec2 c, Vec2 d, Vec2 uv_a, Vec2 uv_b, Vec2 uv_c, Vec2 uv_d, U32 col) mut=> PrimQuadUVImpl(&this, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col);
            
            [LinkName("ImDrawList_PrimRect")]
            private static extern void PrimRectImpl(Self* self, Vec2 a, Vec2 b, U32 col);
            public void PrimRect(Vec2 a, Vec2 b, U32 col) mut=> PrimRectImpl(&this, a, b, col);
            
            [LinkName("ImDrawList_PrimRectUV")]
            private static extern void PrimRectUVImpl(Self* self, Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, U32 col);
            public void PrimRectUV(Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, U32 col) mut=> PrimRectUVImpl(&this, a, b, uv_a, uv_b, col);
            
            [LinkName("ImDrawList_PrimReserve")]
            private static extern void PrimReserveImpl(Self* self, int32 idx_count, int32 vtx_count);
            public void PrimReserve(int32 idx_count, int32 vtx_count) mut=> PrimReserveImpl(&this, idx_count, vtx_count);
            
            [LinkName("ImDrawList_PrimUnreserve")]
            private static extern void PrimUnreserveImpl(Self* self, int32 idx_count, int32 vtx_count);
            public void PrimUnreserve(int32 idx_count, int32 vtx_count) mut=> PrimUnreserveImpl(&this, idx_count, vtx_count);
            
            [LinkName("ImDrawList_PrimVtx")]
            private static extern void PrimVtxImpl(Self* self, Vec2 pos, Vec2 uv, U32 col);
            public void PrimVtx(Vec2 pos, Vec2 uv, U32 col) mut=> PrimVtxImpl(&this, pos, uv, col);
            
            [LinkName("ImDrawList_PrimWriteIdx")]
            private static extern void PrimWriteIdxImpl(Self* self, DrawIdx idx);
            public void PrimWriteIdx(DrawIdx idx) mut=> PrimWriteIdxImpl(&this, idx);
            
            [LinkName("ImDrawList_PrimWriteVtx")]
            private static extern void PrimWriteVtxImpl(Self* self, Vec2 pos, Vec2 uv, U32 col);
            public void PrimWriteVtx(Vec2 pos, Vec2 uv, U32 col) mut=> PrimWriteVtxImpl(&this, pos, uv, col);
            
            [LinkName("ImDrawList_PushClipRect")]
            private static extern void PushClipRectImpl(Self* self, Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect);
            public void PushClipRect(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect = false) mut=> PushClipRectImpl(&this, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);
            
            [LinkName("ImDrawList_PushClipRectFullScreen")]
            private static extern void PushClipRectFullScreenImpl(Self* self);
            public void PushClipRectFullScreen() mut=> PushClipRectFullScreenImpl(&this);
            
            [LinkName("ImDrawList_PushTexture")]
            private static extern void PushTextureImpl(Self* self, TextureRef tex_ref);
            public void PushTexture(TextureRef tex_ref) mut=> PushTextureImpl(&this, tex_ref);
            
            [LinkName("ImDrawList__CalcCircleAutoSegmentCount")]
            private static extern int32 CalcCircleAutoSegmentCountImpl(Self* self, float radius);
            public int32 CalcCircleAutoSegmentCount(float radius) mut=> CalcCircleAutoSegmentCountImpl(&this, radius);
            
            [LinkName("ImDrawList__ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
            [LinkName("ImDrawList__OnChangedClipRect")]
            private static extern void OnChangedClipRectImpl(Self* self);
            public void OnChangedClipRect() mut=> OnChangedClipRectImpl(&this);
            
            [LinkName("ImDrawList__OnChangedTexture")]
            private static extern void OnChangedTextureImpl(Self* self);
            public void OnChangedTexture() mut=> OnChangedTextureImpl(&this);
            
            [LinkName("ImDrawList__OnChangedVtxOffset")]
            private static extern void OnChangedVtxOffsetImpl(Self* self);
            public void OnChangedVtxOffset() mut=> OnChangedVtxOffsetImpl(&this);
            
            [LinkName("ImDrawList__PathArcToFastEx")]
            private static extern void PathArcToFastExImpl(Self* self, Vec2 center, float radius, int32 a_min_sample, int32 a_max_sample, int32 a_step);
            public void PathArcToFastEx(Vec2 center, float radius, int32 a_min_sample, int32 a_max_sample, int32 a_step) mut=> PathArcToFastExImpl(&this, center, radius, a_min_sample, a_max_sample, a_step);
            
            [LinkName("ImDrawList__PathArcToN")]
            private static extern void PathArcToNImpl(Self* self, Vec2 center, float radius, float a_min, float a_max, int32 num_segments);
            public void PathArcToN(Vec2 center, float radius, float a_min, float a_max, int32 num_segments) mut=> PathArcToNImpl(&this, center, radius, a_min, a_max, num_segments);
            
            [LinkName("ImDrawList__PopUnusedDrawCmd")]
            private static extern void PopUnusedDrawCmdImpl(Self* self);
            public void PopUnusedDrawCmd() mut=> PopUnusedDrawCmdImpl(&this);
            
            [LinkName("ImDrawList__ResetForNewFrame")]
            private static extern void ResetForNewFrameImpl(Self* self);
            public void ResetForNewFrame() mut=> ResetForNewFrameImpl(&this);
            
            [LinkName("ImDrawList__SetDrawListSharedData")]
            private static extern void SetDrawListSharedDataImpl(Self* self, DrawListSharedData* data);
            public void SetDrawListSharedData(DrawListSharedData* data) mut=> SetDrawListSharedDataImpl(&this, data);
            
            [LinkName("ImDrawList__SetTexture")]
            private static extern void SetTextureImpl(Self* self, TextureRef tex_ref);
            public void SetTexture(TextureRef tex_ref) mut=> SetTextureImpl(&this, tex_ref);
            
            [LinkName("ImDrawList__TryMergeDrawCmds")]
            private static extern void TryMergeDrawCmdsImpl(Self* self);
            public void TryMergeDrawCmds() mut=> TryMergeDrawCmdsImpl(&this);
            
        }
        
        [CRepr]
        public struct DrawListSharedData
        {
            public Vec2 TexUvWhitePixel;
            public Vec4* TexUvLines;
            public FontAtlas* FontAtlas;
            public Font* Font;
            public float FontSize;
            public float FontScale;
            public float CurveTessellationTol;
            public float CircleSegmentMaxError;
            public float InitialFringeScale;
            public DrawListFlags InitialFlags;
            public Vec4 ClipRectFullscreen;
            public Vector<Vec2> TempBuffer;
            public Vector<DrawList*> DrawLists;
            public Context* Context;
            public Vec2[48] ArcFastVtx;
            public float ArcFastRadiusCutoff;
            public U8[64] CircleSegmentCounts;
        
            [LinkName("ImDrawListSharedData_ImDrawListSharedData")]
            private static extern DrawListSharedData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawListSharedData_SetCircleTessellationMaxError")]
            private static extern void SetCircleTessellationMaxErrorImpl(Self* self, float max_error);
            public void SetCircleTessellationMaxError(float max_error) mut=> SetCircleTessellationMaxErrorImpl(&this, max_error);
            
        }
        
        [CRepr]
        public struct DrawListSplitter
        {
            public int32 _Current;
            public int32 _Count;
            public Vector<DrawChannel> _Channels;
        
            [LinkName("ImDrawListSplitter_ImDrawListSplitter")]
            private static extern DrawListSplitter* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawListSplitter_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImDrawListSplitter_ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
            [LinkName("ImDrawListSplitter_Merge")]
            private static extern void MergeImpl(Self* self, DrawList* draw_list);
            public void Merge(DrawList* draw_list) mut=> MergeImpl(&this, draw_list);
            
            [LinkName("ImDrawListSplitter_SetCurrentChannel")]
            private static extern void SetCurrentChannelImpl(Self* self, DrawList* draw_list, int32 channel_idx);
            public void SetCurrentChannel(DrawList* draw_list, int32 channel_idx) mut=> SetCurrentChannelImpl(&this, draw_list, channel_idx);
            
            [LinkName("ImDrawListSplitter_Split")]
            private static extern void SplitImpl(Self* self, DrawList* draw_list, int32 count);
            public void Split(DrawList* draw_list, int32 count) mut=> SplitImpl(&this, draw_list, count);
            
        }
        
        [CRepr]
        public struct DrawVert
        {
            public Vec2 pos;
            public Vec2 uv;
            public U32 col;
        
        }
        
        [CRepr]
        public struct Font
        {
            public FontBaked* LastBaked;
            public FontAtlas* ContainerAtlas;
            public FontFlags Flags;
            public float CurrentRasterizerDensity;
            public ID FontId;
            public float LegacySize;
            public Vector<FontConfig*> Sources;
            public Wchar EllipsisChar;
            public Wchar FallbackChar;
            public U8[1] Used8kPagesMap;
            public bool EllipsisAutoBake;
            public Storage RemapPairs;
        
            [LinkName("ImFont_ImFont")]
            private static extern Font* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFont_AddRemapChar")]
            private static extern void AddRemapCharImpl(Self* self, Wchar from_codepoint, Wchar to_codepoint);
            public void AddRemapChar(Wchar from_codepoint, Wchar to_codepoint) mut=> AddRemapCharImpl(&this, from_codepoint, to_codepoint);
            
            [LinkName("ImFont_CalcTextSizeA")]
            private static extern Vec2 CalcTextSizeAImpl(Vec2* pOut, Self* self, float size, float max_width, float wrap_width, char* text_begin, char* text_end, char** remaining);
            public Vec2 CalcTextSizeA(float size, float max_width, float wrap_width, char* text_begin, char* text_end = null, char** remaining = null) mut
            {
                Vec2 pOut = default;
                CalcTextSizeAImpl(&pOut, &this, size, max_width, wrap_width, text_begin, text_end, remaining);
                return pOut;
            }
            
            [LinkName("ImFont_CalcWordWrapPosition")]
            private static extern char* CalcWordWrapPositionImpl(Self* self, float size, char* text, char* text_end, float wrap_width);
            public char* CalcWordWrapPosition(float size, char* text, char* text_end, float wrap_width) mut=> CalcWordWrapPositionImpl(&this, size, text, text_end, wrap_width);
            
            [LinkName("ImFont_ClearOutputData")]
            private static extern void ClearOutputDataImpl(Self* self);
            public void ClearOutputData() mut=> ClearOutputDataImpl(&this);
            
            [LinkName("ImFont_GetDebugName")]
            private static extern char* GetDebugNameImpl(Self* self);
            public char* GetDebugName() mut=> GetDebugNameImpl(&this);
            
            [LinkName("ImFont_GetFontBaked")]
            private static extern FontBaked* GetFontBakedImpl(Self* self, float font_size, float density);
            public FontBaked* GetFontBaked(float font_size, float density = -1.0f) mut=> GetFontBakedImpl(&this, font_size, density);
            
            [LinkName("ImFont_IsGlyphInFont")]
            private static extern bool IsGlyphInFontImpl(Self* self, Wchar c);
            public bool IsGlyphInFont(Wchar c) mut=> IsGlyphInFontImpl(&this, c);
            
            [LinkName("ImFont_IsGlyphRangeUnused")]
            private static extern bool IsGlyphRangeUnusedImpl(Self* self, uint32 c_begin, uint32 c_last);
            public bool IsGlyphRangeUnused(uint32 c_begin, uint32 c_last) mut=> IsGlyphRangeUnusedImpl(&this, c_begin, c_last);
            
            [LinkName("ImFont_IsLoaded")]
            private static extern bool IsLoadedImpl(Self* self);
            public bool IsLoaded() mut=> IsLoadedImpl(&this);
            
            [LinkName("ImFont_RenderChar")]
            private static extern void RenderCharImpl(Self* self, DrawList* draw_list, float size, Vec2 pos, U32 col, Wchar c, Vec4* cpu_fine_clip);
            public void RenderChar(DrawList* draw_list, float size, Vec2 pos, U32 col, Wchar c, Vec4* cpu_fine_clip = null) mut=> RenderCharImpl(&this, draw_list, size, pos, col, c, cpu_fine_clip);
            
            [LinkName("ImFont_RenderText")]
            private static extern void RenderTextImpl(Self* self, DrawList* draw_list, float size, Vec2 pos, U32 col, Vec4 clip_rect, char* text_begin, char* text_end, float wrap_width, bool cpu_fine_clip);
            public void RenderText(DrawList* draw_list, float size, Vec2 pos, U32 col, Vec4 clip_rect, char* text_begin, char* text_end, float wrap_width = (float) 0.0f, bool cpu_fine_clip = false) mut=> RenderTextImpl(&this, draw_list, size, pos, col, clip_rect, text_begin, text_end, wrap_width, cpu_fine_clip);
            
        }
        
        [CRepr]
        public struct FontAtlas
        {
            public FontAtlasFlags Flags;
            public TextureFormat TexDesiredFormat;
            public int32 TexGlyphPadding;
            public int32 TexMinWidth;
            public int32 TexMinHeight;
            public int32 TexMaxWidth;
            public int32 TexMaxHeight;
            public void* UserData;
            public TextureRef TexRef;
            public TextureData* TexData;
            public Vector<TextureData*> TexList;
            public bool Locked;
            public bool RendererHasTextures;
            public bool TexIsBuilt;
            public bool TexPixelsUseColors;
            public Vec2 TexUvScale;
            public Vec2 TexUvWhitePixel;
            public Vector<Font*> Fonts;
            public Vector<FontConfig> Sources;
            public Vec4[33] TexUvLines;
            public int32 TexNextUniqueID;
            public int32 FontNextUniqueID;
            public Vector<DrawListSharedData*> DrawListSharedDatas;
            public FontAtlasBuilder* Builder;
            public FontLoader* FontLoader;
            public char* FontLoaderName;
            public void* FontLoaderData;
            public uint32 FontLoaderFlags;
            public int32 RefCount;
            public Context* OwnerContext;
        
            [LinkName("ImFontAtlas_ImFontAtlas")]
            private static extern FontAtlas* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFontAtlas_AddCustomRect")]
            private static extern FontAtlasRectId AddCustomRectImpl(Self* self, int32 width, int32 height, FontAtlasRect* out_r);
            public FontAtlasRectId AddCustomRect(int32 width, int32 height, FontAtlasRect* out_r = null) mut=> AddCustomRectImpl(&this, width, height, out_r);
            
            [LinkName("ImFontAtlas_AddFont")]
            private static extern Font* AddFontImpl(Self* self, FontConfig* font_cfg);
            public Font* AddFont(FontConfig* font_cfg) mut=> AddFontImpl(&this, font_cfg);
            
            [LinkName("ImFontAtlas_AddFontDefault")]
            private static extern Font* AddFontDefaultImpl(Self* self, FontConfig* font_cfg);
            public Font* AddFontDefault(FontConfig* font_cfg = null) mut=> AddFontDefaultImpl(&this, font_cfg);
            
            [LinkName("ImFontAtlas_AddFontFromFileTTF")]
            private static extern Font* AddFontFromFileTTFImpl(Self* self, char* filename, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromFileTTF(char* filename, float size_pixels = (float) 0.0f, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromFileTTFImpl(&this, filename, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_AddFontFromMemoryCompressedBase85TTF")]
            private static extern Font* AddFontFromMemoryCompressedBase85TTFImpl(Self* self, char* compressed_font_data_base85, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromMemoryCompressedBase85TTF(char* compressed_font_data_base85, float size_pixels = (float) 0.0f, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromMemoryCompressedBase85TTFImpl(&this, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_AddFontFromMemoryCompressedTTF")]
            private static extern Font* AddFontFromMemoryCompressedTTFImpl(Self* self, void* compressed_font_data, int32 compressed_font_data_size, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromMemoryCompressedTTF(void* compressed_font_data, int32 compressed_font_data_size, float size_pixels = (float) 0.0f, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromMemoryCompressedTTFImpl(&this, compressed_font_data, compressed_font_data_size, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_AddFontFromMemoryTTF")]
            private static extern Font* AddFontFromMemoryTTFImpl(Self* self, void* font_data, int32 font_data_size, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromMemoryTTF(void* font_data, int32 font_data_size, float size_pixels = (float) 0.0f, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromMemoryTTFImpl(&this, font_data, font_data_size, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImFontAtlas_ClearFonts")]
            private static extern void ClearFontsImpl(Self* self);
            public void ClearFonts() mut=> ClearFontsImpl(&this);
            
            [LinkName("ImFontAtlas_ClearInputData")]
            private static extern void ClearInputDataImpl(Self* self);
            public void ClearInputData() mut=> ClearInputDataImpl(&this);
            
            [LinkName("ImFontAtlas_ClearTexData")]
            private static extern void ClearTexDataImpl(Self* self);
            public void ClearTexData() mut=> ClearTexDataImpl(&this);
            
            [LinkName("ImFontAtlas_CompactCache")]
            private static extern void CompactCacheImpl(Self* self);
            public void CompactCache() mut=> CompactCacheImpl(&this);
            
            [LinkName("ImFontAtlas_GetCustomRect")]
            private static extern bool GetCustomRectImpl(Self* self, FontAtlasRectId id, FontAtlasRect* out_r);
            public bool GetCustomRect(FontAtlasRectId id, out FontAtlasRect out_r) mut
            {
                out_r = ?;
                return GetCustomRectImpl(&this, id, &out_r);
            }
            
            [LinkName("ImFontAtlas_GetGlyphRangesDefault")]
            private static extern Wchar* GetGlyphRangesDefaultImpl(Self* self);
            public Wchar* GetGlyphRangesDefault() mut=> GetGlyphRangesDefaultImpl(&this);
            
            [LinkName("ImFontAtlas_RemoveCustomRect")]
            private static extern void RemoveCustomRectImpl(Self* self, FontAtlasRectId id);
            public void RemoveCustomRect(FontAtlasRectId id) mut=> RemoveCustomRectImpl(&this, id);
            
            [LinkName("ImFontAtlas_RemoveFont")]
            private static extern void RemoveFontImpl(Self* self, Font* font);
            public void RemoveFont(Font* font) mut=> RemoveFontImpl(&this, font);
            
            [LinkName("ImFontAtlas_SetFontLoader")]
            private static extern void SetFontLoaderImpl(Self* self, FontLoader* font_loader);
            public void SetFontLoader(FontLoader* font_loader) mut=> SetFontLoaderImpl(&this, font_loader);
            
        }
        
        [CRepr]
        public struct FontAtlasBuilder
        {
            public void* PackContext;
            public Vector<void*> PackNodes;
            public Vector<TextureRect> Rects;
            public Vector<FontAtlasRectEntry> RectsIndex;
            public Vector<uchar> TempBuffer;
            public int32 RectsIndexFreeListStart;
            public int32 RectsPackedCount;
            public int32 RectsPackedSurface;
            public int32 RectsDiscardedCount;
            public int32 RectsDiscardedSurface;
            public int32 FrameCount;
            public Vec2i MaxRectSize;
            public Vec2i MaxRectBounds;
            public bool LockDisableResize;
            public bool PreloadedAllGlyphsRanges;
            public StableVector<FontBaked> BakedPool;
            public Storage BakedMap;
            public int32 BakedDiscardedCount;
            public FontAtlasRectId PackIdMouseCursors;
            public FontAtlasRectId PackIdLinesTexData;
        
            [LinkName("ImFontAtlasBuilder_ImFontAtlasBuilder")]
            private static extern FontAtlasBuilder* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct FontAtlasPostProcessData
        {
            public FontAtlas* FontAtlas;
            public Font* Font;
            public FontConfig* FontSrc;
            public FontBaked* FontBaked;
            public FontGlyph* Glyph;
            public void* Pixels;
            public TextureFormat Format;
            public int32 Pitch;
            public int32 Width;
            public int32 Height;
        
        }
        
        [CRepr]
        public struct FontAtlasRect
        {
            public ushort x;
            public ushort y;
            public ushort w;
            public ushort h;
            public Vec2 uv0;
            public Vec2 uv1;
        
            [LinkName("ImFontAtlasRect_ImFontAtlasRect")]
            private static extern FontAtlasRect* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct FontAtlasRectEntry
        {
            public int32 TargetIndex;
            public int32 Generation;
            public uint32 IsUsed;
        
        }
        
        [CRepr]
        public struct FontBaked
        {
            public Vector<float> IndexAdvanceX;
            public float FallbackAdvanceX;
            public float Size;
            public float RasterizerDensity;
            public Vector<U16> IndexLookup;
            public Vector<FontGlyph> Glyphs;
            public int32 FallbackGlyphIndex;
            public float Ascent;
            public float Descent;
            public uint32 MetricsTotalSurface;
            public uint32 WantDestroy;
            public uint32 LockLoadingFallback;
            public int32 LastUsedFrame;
            public ID BakedId;
            public Font* ContainerFont;
            public void* FontLoaderDatas;
        
            [LinkName("ImFontBaked_ImFontBaked")]
            private static extern FontBaked* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFontBaked_ClearOutputData")]
            private static extern void ClearOutputDataImpl(Self* self);
            public void ClearOutputData() mut=> ClearOutputDataImpl(&this);
            
            [LinkName("ImFontBaked_FindGlyph")]
            private static extern FontGlyph* FindGlyphImpl(Self* self, Wchar c);
            public FontGlyph* FindGlyph(Wchar c) mut=> FindGlyphImpl(&this, c);
            
            [LinkName("ImFontBaked_FindGlyphNoFallback")]
            private static extern FontGlyph* FindGlyphNoFallbackImpl(Self* self, Wchar c);
            public FontGlyph* FindGlyphNoFallback(Wchar c) mut=> FindGlyphNoFallbackImpl(&this, c);
            
            [LinkName("ImFontBaked_GetCharAdvance")]
            private static extern float GetCharAdvanceImpl(Self* self, Wchar c);
            public float GetCharAdvance(Wchar c) mut=> GetCharAdvanceImpl(&this, c);
            
            [LinkName("ImFontBaked_IsGlyphLoaded")]
            private static extern bool IsGlyphLoadedImpl(Self* self, Wchar c);
            public bool IsGlyphLoaded(Wchar c) mut=> IsGlyphLoadedImpl(&this, c);
            
        }
        
        [CRepr]
        public struct FontConfig
        {
            public char[40] Name;
            public void* FontData;
            public int32 FontDataSize;
            public bool FontDataOwnedByAtlas;
            public bool MergeMode;
            public bool PixelSnapH;
            public bool PixelSnapV;
            public S8 OversampleH;
            public S8 OversampleV;
            public Wchar EllipsisChar;
            public float SizePixels;
            public Wchar* GlyphRanges;
            public Wchar* GlyphExcludeRanges;
            public Vec2 GlyphOffset;
            public float GlyphMinAdvanceX;
            public float GlyphMaxAdvanceX;
            public float GlyphExtraAdvanceX;
            public U32 FontNo;
            public uint32 FontLoaderFlags;
            public float RasterizerMultiply;
            public float RasterizerDensity;
            public FontFlags Flags;
            public Font* DstFont;
            public FontLoader* FontLoader;
            public void* FontLoaderData;
        
            [LinkName("ImFontConfig_ImFontConfig")]
            private static extern FontConfig* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct FontGlyph
        {
            public uint32 Colored;
            public uint32 Visible;
            public uint32 SourceIdx;
            public uint32 Codepoint;
            public float AdvanceX;
            public float X0;
            public float Y0;
            public float X1;
            public float Y1;
            public float U0;
            public float V0;
            public float U1;
            public float V1;
            public int32 PackId;
        
            [LinkName("ImFontGlyph_ImFontGlyph")]
            private static extern FontGlyph* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct FontGlyphRangesBuilder
        {
            public Vector<U32> UsedChars;
        
            [LinkName("ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder")]
            private static extern FontGlyphRangesBuilder* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFontGlyphRangesBuilder_AddChar")]
            private static extern void AddCharImpl(Self* self, Wchar c);
            public void AddChar(Wchar c) mut=> AddCharImpl(&this, c);
            
            [LinkName("ImFontGlyphRangesBuilder_AddRanges")]
            private static extern void AddRangesImpl(Self* self, Wchar* ranges);
            public void AddRanges(Wchar* ranges) mut=> AddRangesImpl(&this, ranges);
            
            [LinkName("ImFontGlyphRangesBuilder_AddText")]
            private static extern void AddTextImpl(Self* self, char* text, char* text_end);
            public void AddText(char* text, char* text_end = null) mut=> AddTextImpl(&this, text, text_end);
            
            [LinkName("ImFontGlyphRangesBuilder_BuildRanges")]
            private static extern void BuildRangesImpl(Self* self, Vector<Wchar*> out_ranges);
            public void BuildRanges(Vector<Wchar*> out_ranges) mut=> BuildRangesImpl(&this, out_ranges);
            
            [LinkName("ImFontGlyphRangesBuilder_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImFontGlyphRangesBuilder_GetBit")]
            private static extern bool GetBitImpl(Self* self, size n);
            public bool GetBit(size n) mut=> GetBitImpl(&this, n);
            
            [LinkName("ImFontGlyphRangesBuilder_SetBit")]
            private static extern void SetBitImpl(Self* self, size n);
            public void SetBit(size n) mut=> SetBitImpl(&this, n);
            
        }
        
        [CRepr]
        public struct FontLoader
        {
            public char* Name;
            public function bool(FontAtlas* atlas) LoaderInit;
            public function void(FontAtlas* atlas) LoaderShutdown;
            public function bool(FontAtlas* atlas, FontConfig* src) FontSrcInit;
            public function void(FontAtlas* atlas, FontConfig* src) FontSrcDestroy;
            public function bool(FontAtlas* atlas, FontConfig* src, Wchar codepoint) FontSrcContainsGlyph;
            public function bool(FontAtlas* atlas, FontConfig* src, FontBaked* baked, void* loader_data_for_baked_src) FontBakedInit;
            public function void(FontAtlas* atlas, FontConfig* src, FontBaked* baked, void* loader_data_for_baked_src) FontBakedDestroy;
            public function bool(FontAtlas* atlas, FontConfig* src, FontBaked* baked, void* loader_data_for_baked_src, Wchar codepoint, FontGlyph* out_glyph, float* out_advance_x) FontBakedLoadGlyph;
            public size FontBakedSrcLoaderDataSize;
        
            [LinkName("ImFontLoader_ImFontLoader")]
            private static extern FontLoader* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct FontStackData
        {
            public Font* Font;
            public float FontSizeBeforeScaling;
            public float FontSizeAfterScaling;
        
        }
        
        [CRepr]
        public struct BoxSelectState
        {
            public ID ID;
            public bool IsActive;
            public bool IsStarting;
            public bool IsStartedFromVoid;
            public bool IsStartedSetNavIdOnce;
            public bool RequestClear;
            public KeyChord KeyMods;
            public Vec2 StartPosRel;
            public Vec2 EndPosRel;
            public Vec2 ScrollAccum;
            public Window* Window;
            public bool UnclipMode;
            public Rect UnclipRect;
            public Rect BoxSelectRectPrev;
            public Rect BoxSelectRectCurr;
        
            [LinkName("ImGuiBoxSelectState_ImGuiBoxSelectState")]
            private static extern BoxSelectState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct ColorMod
        {
            public Col Col;
            public Vec4 BackupValue;
        
        }
        
        [CRepr]
        public struct ComboPreviewData
        {
            public Rect PreviewRect;
            public Vec2 BackupCursorPos;
            public Vec2 BackupCursorMaxPos;
            public Vec2 BackupCursorPosPrevLine;
            public float BackupPrevLineTextBaseOffset;
            public LayoutType BackupLayout;
        
            [LinkName("ImGuiComboPreviewData_ImGuiComboPreviewData")]
            private static extern ComboPreviewData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Context
        {
            public bool Initialized;
            public IO IO;
            public PlatformIO PlatformIO;
            public Style Style;
            public ConfigFlags ConfigFlagsCurrFrame;
            public ConfigFlags ConfigFlagsLastFrame;
            public Vector<FontAtlas*> FontAtlases;
            public Font* Font;
            public FontBaked* FontBaked;
            public float FontSize;
            public float FontSizeBase;
            public float FontBakedScale;
            public float FontRasterizerDensity;
            public float CurrentDpiScale;
            public DrawListSharedData DrawListSharedData;
            public double Time;
            public int32 FrameCount;
            public int32 FrameCountEnded;
            public int32 FrameCountPlatformEnded;
            public int32 FrameCountRendered;
            public ID WithinEndChildID;
            public bool WithinFrameScope;
            public bool WithinFrameScopeWithImplicitWindow;
            public bool GcCompactAll;
            public bool TestEngineHookItems;
            public void* TestEngine;
            public char[16] ContextName;
            public Vector<InputEvent> InputEventsQueue;
            public Vector<InputEvent> InputEventsTrail;
            public MouseSource InputEventsNextMouseSource;
            public U32 InputEventsNextEventId;
            public Vector<Window*> Windows;
            public Vector<Window*> WindowsFocusOrder;
            public Vector<Window*> WindowsTempSortBuffer;
            public Vector<WindowStackData> CurrentWindowStack;
            public Storage WindowsById;
            public int32 WindowsActiveCount;
            public float WindowsBorderHoverPadding;
            public ID DebugBreakInWindow;
            public Window* CurrentWindow;
            public Window* HoveredWindow;
            public Window* HoveredWindowUnderMovingWindow;
            public Window* HoveredWindowBeforeClear;
            public Window* MovingWindow;
            public Window* WheelingWindow;
            public Vec2 WheelingWindowRefMousePos;
            public int32 WheelingWindowStartFrame;
            public int32 WheelingWindowScrolledFrame;
            public float WheelingWindowReleaseTimer;
            public Vec2 WheelingWindowWheelRemainder;
            public Vec2 WheelingAxisAvg;
            public ID DebugDrawIdConflictsId;
            public ID DebugHookIdInfo;
            public ID HoveredId;
            public ID HoveredIdPreviousFrame;
            public int32 HoveredIdPreviousFrameItemCount;
            public float HoveredIdTimer;
            public float HoveredIdNotActiveTimer;
            public bool HoveredIdAllowOverlap;
            public bool HoveredIdIsDisabled;
            public bool ItemUnclipByLog;
            public ID ActiveId;
            public ID ActiveIdIsAlive;
            public float ActiveIdTimer;
            public bool ActiveIdIsJustActivated;
            public bool ActiveIdAllowOverlap;
            public bool ActiveIdNoClearOnFocusLoss;
            public bool ActiveIdHasBeenPressedBefore;
            public bool ActiveIdHasBeenEditedBefore;
            public bool ActiveIdHasBeenEditedThisFrame;
            public bool ActiveIdFromShortcut;
            public int32 ActiveIdMouseButton;
            public Vec2 ActiveIdClickOffset;
            public Window* ActiveIdWindow;
            public InputSource ActiveIdSource;
            public ID ActiveIdPreviousFrame;
            public DeactivatedItemData DeactivatedItemData;
            public DataTypeStorage ActiveIdValueOnActivation;
            public ID LastActiveId;
            public float LastActiveIdTimer;
            public double LastKeyModsChangeTime;
            public double LastKeyModsChangeFromNoneTime;
            public double LastKeyboardKeyPressTime;
            public BitArrayForNamedKeys KeysMayBeCharInput;
            public KeyOwnerData[155] KeysOwnerData;
            public KeyRoutingTable KeysRoutingTable;
            public U32 ActiveIdUsingNavDirMask;
            public bool ActiveIdUsingAllKeyboardKeys;
            public KeyChord DebugBreakInShortcutRouting;
            public ID CurrentFocusScopeId;
            public ItemFlags CurrentItemFlags;
            public ID DebugLocateId;
            public NextItemData NextItemData;
            public LastItemData LastItemData;
            public NextWindowData NextWindowData;
            public bool DebugShowGroupRects;
            public Col DebugFlashStyleColorIdx;
            public Vector<ColorMod> ColorStack;
            public Vector<StyleMod> StyleVarStack;
            public Vector<FontStackData> FontStack;
            public Vector<FocusScopeData> FocusScopeStack;
            public Vector<ItemFlags> ItemFlagsStack;
            public Vector<GroupData> GroupStack;
            public Vector<PopupData> OpenPopupStack;
            public Vector<PopupData> BeginPopupStack;
            public Vector<TreeNodeStackData> TreeNodeStack;
            public Vector<ViewportP*> Viewports;
            public ViewportP* CurrentViewport;
            public ViewportP* MouseViewport;
            public ViewportP* MouseLastHoveredViewport;
            public ID PlatformLastFocusedViewportId;
            public PlatformMonitor FallbackMonitor;
            public Rect PlatformMonitorsFullWorkRect;
            public int32 ViewportCreatedCount;
            public int32 PlatformWindowsCreatedCount;
            public int32 ViewportFocusedStampCount;
            public bool NavCursorVisible;
            public bool NavHighlightItemUnderNav;
            public bool NavMousePosDirty;
            public bool NavIdIsAlive;
            public ID NavId;
            public Window* NavWindow;
            public ID NavFocusScopeId;
            public NavLayer NavLayer;
            public ID NavActivateId;
            public ID NavActivateDownId;
            public ID NavActivatePressedId;
            public ActivateFlags NavActivateFlags;
            public Vector<FocusScopeData> NavFocusRoute;
            public ID NavHighlightActivatedId;
            public float NavHighlightActivatedTimer;
            public ID NavNextActivateId;
            public ActivateFlags NavNextActivateFlags;
            public InputSource NavInputSource;
            public SelectionUserData NavLastValidSelectionUserData;
            public S8 NavCursorHideFrames;
            public bool NavAnyRequest;
            public bool NavInitRequest;
            public bool NavInitRequestFromMove;
            public NavItemData NavInitResult;
            public bool NavMoveSubmitted;
            public bool NavMoveScoringItems;
            public bool NavMoveForwardToNextFrame;
            public NavMoveFlags NavMoveFlags;
            public ScrollFlags NavMoveScrollFlags;
            public KeyChord NavMoveKeyMods;
            public Dir NavMoveDir;
            public Dir NavMoveDirForDebug;
            public Dir NavMoveClipDir;
            public Rect NavScoringRect;
            public Rect NavScoringNoClipRect;
            public int32 NavScoringDebugCount;
            public int32 NavTabbingDir;
            public int32 NavTabbingCounter;
            public NavItemData NavMoveResultLocal;
            public NavItemData NavMoveResultLocalVisible;
            public NavItemData NavMoveResultOther;
            public NavItemData NavTabbingResultFirst;
            public ID NavJustMovedFromFocusScopeId;
            public ID NavJustMovedToId;
            public ID NavJustMovedToFocusScopeId;
            public KeyChord NavJustMovedToKeyMods;
            public bool NavJustMovedToIsTabbing;
            public bool NavJustMovedToHasSelectionData;
            public bool ConfigNavWindowingWithGamepad;
            public KeyChord ConfigNavWindowingKeyNext;
            public KeyChord ConfigNavWindowingKeyPrev;
            public Window* NavWindowingTarget;
            public Window* NavWindowingTargetAnim;
            public Window* NavWindowingListWindow;
            public float NavWindowingTimer;
            public float NavWindowingHighlightAlpha;
            public InputSource NavWindowingInputSource;
            public bool NavWindowingToggleLayer;
            public Key NavWindowingToggleKey;
            public Vec2 NavWindowingAccumDeltaPos;
            public Vec2 NavWindowingAccumDeltaSize;
            public float DimBgRatio;
            public bool DragDropActive;
            public bool DragDropWithinSource;
            public bool DragDropWithinTarget;
            public DragDropFlags DragDropSourceFlags;
            public int32 DragDropSourceFrameCount;
            public int32 DragDropMouseButton;
            public Payload DragDropPayload;
            public Rect DragDropTargetRect;
            public Rect DragDropTargetClipRect;
            public ID DragDropTargetId;
            public DragDropFlags DragDropAcceptFlags;
            public float DragDropAcceptIdCurrRectSurface;
            public ID DragDropAcceptIdCurr;
            public ID DragDropAcceptIdPrev;
            public int32 DragDropAcceptFrameCount;
            public ID DragDropHoldJustPressedId;
            public Vector<uchar> DragDropPayloadBufHeap;
            public uchar[16] DragDropPayloadBufLocal;
            public int32 ClipperTempDataStacked;
            public Vector<ListClipperData> ClipperTempData;
            public Table* CurrentTable;
            public ID DebugBreakInTable;
            public int32 TablesTempDataStacked;
            public Vector<TableTempData> TablesTempData;
            public Pool<Table> Tables;
            public Vector<float> TablesLastTimeActive;
            public Vector<DrawChannel> DrawChannelsTempMergeBuffer;
            public TabBar* CurrentTabBar;
            public Pool<TabBar> TabBars;
            public Vector<PtrOrIndex> CurrentTabBarStack;
            public Vector<ShrinkWidthItem> ShrinkWidthBuffer;
            public BoxSelectState BoxSelectState;
            public MultiSelectTempData* CurrentMultiSelect;
            public int32 MultiSelectTempDataStacked;
            public Vector<MultiSelectTempData> MultiSelectTempData;
            public Pool<MultiSelectState> MultiSelectStorage;
            public ID HoverItemDelayId;
            public ID HoverItemDelayIdPreviousFrame;
            public float HoverItemDelayTimer;
            public float HoverItemDelayClearTimer;
            public ID HoverItemUnlockedStationaryId;
            public ID HoverWindowUnlockedStationaryId;
            public MouseCursor MouseCursor;
            public float MouseStationaryTimer;
            public Vec2 MouseLastValidPos;
            public InputTextState InputTextState;
            public InputTextDeactivatedState InputTextDeactivatedState;
            public FontBaked InputTextPasswordFontBackupBaked;
            public FontFlags InputTextPasswordFontBackupFlags;
            public ID TempInputId;
            public DataTypeStorage DataTypeZeroValue;
            public int32 BeginMenuDepth;
            public int32 BeginComboDepth;
            public ColorEditFlags ColorEditOptions;
            public ID ColorEditCurrentID;
            public ID ColorEditSavedID;
            public float ColorEditSavedHue;
            public float ColorEditSavedSat;
            public U32 ColorEditSavedColor;
            public Vec4 ColorPickerRef;
            public ComboPreviewData ComboPreviewData;
            public Rect WindowResizeBorderExpectedRect;
            public bool WindowResizeRelativeMode;
            public short ScrollbarSeekMode;
            public float ScrollbarClickDeltaToGrabCenter;
            public float SliderGrabClickOffset;
            public float SliderCurrentAccum;
            public bool SliderCurrentAccumDirty;
            public bool DragCurrentAccumDirty;
            public float DragCurrentAccum;
            public float DragSpeedDefaultRatio;
            public float DisabledAlphaBackup;
            public short DisabledStackSize;
            public short TooltipOverrideCount;
            public Window* TooltipPreviousWindow;
            public Vector<char> ClipboardHandlerData;
            public Vector<ID> MenusIdSubmittedThisFrame;
            public TypingSelectState TypingSelectState;
            public PlatformImeData PlatformImeData;
            public PlatformImeData PlatformImeDataPrev;
            public Vector<TextureData*> UserTextures;
            public DockContext DockContext;
            public function void(Context* ctx, DockNode* node, TabBar* tab_bar) DockNodeWindowMenuHandler;
            public bool SettingsLoaded;
            public float SettingsDirtyTimer;
            public TextBuffer SettingsIniData;
            public Vector<SettingsHandler> SettingsHandlers;
            public ChunkStream<WindowSettings> SettingsWindows;
            public ChunkStream<TableSettings> SettingsTables;
            public Vector<ContextHook> Hooks;
            public ID HookIdNext;
            public char*[13] LocalizationTable;
            public bool LogEnabled;
            public LogFlags LogFlags;
            public Window* LogWindow;
            public FileHandle LogFile;
            public TextBuffer LogBuffer;
            public char* LogNextPrefix;
            public char* LogNextSuffix;
            public float LogLinePosY;
            public bool LogLineFirstItem;
            public int32 LogDepthRef;
            public int32 LogDepthToExpand;
            public int32 LogDepthToExpandDefault;
            public ErrorCallback ErrorCallback;
            public void* ErrorCallbackUserData;
            public Vec2 ErrorTooltipLockedPos;
            public bool ErrorFirst;
            public int32 ErrorCountCurrentFrame;
            public ErrorRecoveryState StackSizesInNewFrame;
            public ErrorRecoveryState* StackSizesInBeginForCurrentWindow;
            public int32 DebugDrawIdConflictsCount;
            public DebugLogFlags DebugLogFlags;
            public TextBuffer DebugLogBuf;
            public TextIndex DebugLogIndex;
            public int32 DebugLogSkippedErrors;
            public DebugLogFlags DebugLogAutoDisableFlags;
            public U8 DebugLogAutoDisableFrames;
            public U8 DebugLocateFrames;
            public bool DebugBreakInLocateId;
            public KeyChord DebugBreakKeyChord;
            public S8 DebugBeginReturnValueCullDepth;
            public bool DebugItemPickerActive;
            public U8 DebugItemPickerMouseButton;
            public ID DebugItemPickerBreakId;
            public float DebugFlashStyleColorTime;
            public Vec4 DebugFlashStyleColorBackup;
            public MetricsConfig DebugMetricsConfig;
            public IDStackTool DebugIDStackTool;
            public DebugAllocInfo DebugAllocInfo;
            public DockNode* DebugHoveredDockNode;
            public float[60] FramerateSecPerFrame;
            public int32 FramerateSecPerFrameIdx;
            public int32 FramerateSecPerFrameCount;
            public float FramerateSecPerFrameAccum;
            public int32 WantCaptureMouseNextFrame;
            public int32 WantCaptureKeyboardNextFrame;
            public int32 WantTextInputNextFrame;
            public Vector<char> TempBuffer;
            public char[64] TempKeychordName;
        
            [LinkName("ImGuiContext_ImGuiContext")]
            private static extern Context* CtorImpl(FontAtlas* shared_font_atlas);
            public this(FontAtlas* shared_font_atlas)
            {
                this = *CtorImpl(shared_font_atlas);
            }
            
        }
        
        [CRepr]
        public struct ContextHook
        {
            public ID HookId;
            public ContextHookType Type;
            public ID Owner;
            public ContextHookCallback Callback;
            public void* UserData;
        
            [LinkName("ImGuiContextHook_ImGuiContextHook")]
            private static extern ContextHook* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct DataTypeInfo
        {
            public size Size;
            public char* Name;
            public char* PrintFmt;
            public char* ScanFmt;
        
        }
        
        [CRepr]
        public struct DataTypeStorage
        {
            public U8[8] Data;
        
        }
        
        [CRepr]
        public struct DeactivatedItemData
        {
            public ID ID;
            public int32 ElapseFrame;
            public bool HasBeenEditedBefore;
            public bool IsAlive;
        
        }
        
        [CRepr]
        public struct DebugAllocEntry
        {
            public int32 FrameCount;
            public S16 AllocCount;
            public S16 FreeCount;
        
        }
        
        [CRepr]
        public struct DebugAllocInfo
        {
            public int32 TotalAllocCount;
            public int32 TotalFreeCount;
            public S16 LastEntriesIdx;
            public DebugAllocEntry[6] LastEntriesBuf;
        
            [LinkName("ImGuiDebugAllocInfo_ImGuiDebugAllocInfo")]
            private static extern DebugAllocInfo* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct DockContext
        {
            public Storage Nodes;
            public Vector<DockRequest> Requests;
            public Vector<DockNodeSettings> NodesSettings;
            public bool WantFullRebuild;
        
            [LinkName("ImGuiDockContext_ImGuiDockContext")]
            private static extern DockContext* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct DockNode
        {
            public ID ID;
            public DockNodeFlags SharedFlags;
            public DockNodeFlags LocalFlags;
            public DockNodeFlags LocalFlagsInWindows;
            public DockNodeFlags MergedFlags;
            public DockNodeState State;
            public DockNode* ParentNode;
            public DockNode*[2] ChildNodes;
            public Vector<Window*> Windows;
            public TabBar* TabBar;
            public Vec2 Pos;
            public Vec2 Size;
            public Vec2 SizeRef;
            public Axis SplitAxis;
            public WindowClass WindowClass;
            public U32 LastBgColor;
            public Window* HostWindow;
            public Window* VisibleWindow;
            public DockNode* CentralNode;
            public DockNode* OnlyNodeWithWindows;
            public int32 CountNodeWithWindows;
            public int32 LastFrameAlive;
            public int32 LastFrameActive;
            public int32 LastFrameFocused;
            public ID LastFocusedNodeId;
            public ID SelectedTabId;
            public ID WantCloseTabId;
            public ID RefViewportId;
            public DataAuthority AuthorityForPos;
            public DataAuthority AuthorityForSize;
            public DataAuthority AuthorityForViewport;
            public bool IsVisible;
            public bool IsFocused;
            public bool IsBgDrawnThisFrame;
            public bool HasCloseButton;
            public bool HasWindowMenuButton;
            public bool HasCentralNodeChild;
            public bool WantCloseAll;
            public bool WantLockSizeOnce;
            public bool WantMouseMove;
            public bool WantHiddenTabBarUpdate;
            public bool WantHiddenTabBarToggle;
        
            [LinkName("ImGuiDockNode_ImGuiDockNode")]
            private static extern DockNode* CtorImpl(ID id);
            public this(ID id)
            {
                this = *CtorImpl(id);
            }
            
            [LinkName("ImGuiDockNode_IsCentralNode")]
            private static extern bool IsCentralNodeImpl(Self* self);
            public bool IsCentralNode() mut=> IsCentralNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsDockSpace")]
            private static extern bool IsDockSpaceImpl(Self* self);
            public bool IsDockSpace() mut=> IsDockSpaceImpl(&this);
            
            [LinkName("ImGuiDockNode_IsEmpty")]
            private static extern bool IsEmptyImpl(Self* self);
            public bool IsEmpty() mut=> IsEmptyImpl(&this);
            
            [LinkName("ImGuiDockNode_IsFloatingNode")]
            private static extern bool IsFloatingNodeImpl(Self* self);
            public bool IsFloatingNode() mut=> IsFloatingNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsHiddenTabBar")]
            private static extern bool IsHiddenTabBarImpl(Self* self);
            public bool IsHiddenTabBar() mut=> IsHiddenTabBarImpl(&this);
            
            [LinkName("ImGuiDockNode_IsLeafNode")]
            private static extern bool IsLeafNodeImpl(Self* self);
            public bool IsLeafNode() mut=> IsLeafNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsNoTabBar")]
            private static extern bool IsNoTabBarImpl(Self* self);
            public bool IsNoTabBar() mut=> IsNoTabBarImpl(&this);
            
            [LinkName("ImGuiDockNode_IsRootNode")]
            private static extern bool IsRootNodeImpl(Self* self);
            public bool IsRootNode() mut=> IsRootNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsSplitNode")]
            private static extern bool IsSplitNodeImpl(Self* self);
            public bool IsSplitNode() mut=> IsSplitNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_Rect")]
            private static extern Rect RectImpl(Rect* pOut, Self* self);
            public Rect Rect() mut
            {
                Rect pOut = default;
                RectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiDockNode_SetLocalFlags")]
            private static extern void SetLocalFlagsImpl(Self* self, DockNodeFlags flags);
            public void SetLocalFlags(DockNodeFlags flags) mut=> SetLocalFlagsImpl(&this, flags);
            
            [LinkName("ImGuiDockNode_UpdateMergedFlags")]
            private static extern void UpdateMergedFlagsImpl(Self* self);
            public void UpdateMergedFlags() mut=> UpdateMergedFlagsImpl(&this);
            
        }
        
        [CRepr]
        public struct ErrorRecoveryState
        {
            public short SizeOfWindowStack;
            public short SizeOfIDStack;
            public short SizeOfTreeStack;
            public short SizeOfColorStack;
            public short SizeOfStyleVarStack;
            public short SizeOfFontStack;
            public short SizeOfFocusScopeStack;
            public short SizeOfGroupStack;
            public short SizeOfItemFlagsStack;
            public short SizeOfBeginPopupStack;
            public short SizeOfDisabledStack;
        
            [LinkName("ImGuiErrorRecoveryState_ImGuiErrorRecoveryState")]
            private static extern ErrorRecoveryState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct FocusScopeData
        {
            public ID ID;
            public ID WindowID;
        
        }
        
        [CRepr]
        public struct GroupData
        {
            public ID WindowID;
            public Vec2 BackupCursorPos;
            public Vec2 BackupCursorMaxPos;
            public Vec2 BackupCursorPosPrevLine;
            public Vec1 BackupIndent;
            public Vec1 BackupGroupOffset;
            public Vec2 BackupCurrLineSize;
            public float BackupCurrLineTextBaseOffset;
            public ID BackupActiveIdIsAlive;
            public bool BackupDeactivatedIdIsAlive;
            public bool BackupHoveredIdIsAlive;
            public bool BackupIsSameLine;
            public bool EmitItem;
        
        }
        
        [CRepr]
        public struct IDStackTool
        {
            public int32 LastActiveFrame;
            public int32 StackLevel;
            public ID QueryId;
            public Vector<StackLevelInfo> Results;
            public bool CopyToClipboardOnCtrlC;
            public float CopyToClipboardLastTime;
            public TextBuffer ResultPathBuf;
        
            [LinkName("ImGuiIDStackTool_ImGuiIDStackTool")]
            private static extern IDStackTool* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct IO
        {
            public ConfigFlags ConfigFlags;
            public BackendFlags BackendFlags;
            public Vec2 DisplaySize;
            public Vec2 DisplayFramebufferScale;
            public float DeltaTime;
            public float IniSavingRate;
            public char* IniFilename;
            public char* LogFilename;
            public void* UserData;
            public FontAtlas* Fonts;
            public Font* FontDefault;
            public bool FontAllowUserScaling;
            public bool ConfigNavSwapGamepadButtons;
            public bool ConfigNavMoveSetMousePos;
            public bool ConfigNavCaptureKeyboard;
            public bool ConfigNavEscapeClearFocusItem;
            public bool ConfigNavEscapeClearFocusWindow;
            public bool ConfigNavCursorVisibleAuto;
            public bool ConfigNavCursorVisibleAlways;
            public bool ConfigDockingNoSplit;
            public bool ConfigDockingWithShift;
            public bool ConfigDockingAlwaysTabBar;
            public bool ConfigDockingTransparentPayload;
            public bool ConfigViewportsNoAutoMerge;
            public bool ConfigViewportsNoTaskBarIcon;
            public bool ConfigViewportsNoDecoration;
            public bool ConfigViewportsNoDefaultParent;
            public bool ConfigDpiScaleFonts;
            public bool ConfigDpiScaleViewports;
            public bool MouseDrawCursor;
            public bool ConfigMacOSXBehaviors;
            public bool ConfigInputTrickleEventQueue;
            public bool ConfigInputTextCursorBlink;
            public bool ConfigInputTextEnterKeepActive;
            public bool ConfigDragClickToInputText;
            public bool ConfigWindowsResizeFromEdges;
            public bool ConfigWindowsMoveFromTitleBarOnly;
            public bool ConfigWindowsCopyContentsWithCtrlC;
            public bool ConfigScrollbarScrollByPage;
            public float ConfigMemoryCompactTimer;
            public float MouseDoubleClickTime;
            public float MouseDoubleClickMaxDist;
            public float MouseDragThreshold;
            public float KeyRepeatDelay;
            public float KeyRepeatRate;
            public bool ConfigErrorRecovery;
            public bool ConfigErrorRecoveryEnableAssert;
            public bool ConfigErrorRecoveryEnableDebugLog;
            public bool ConfigErrorRecoveryEnableTooltip;
            public bool ConfigDebugIsDebuggerPresent;
            public bool ConfigDebugHighlightIdConflicts;
            public bool ConfigDebugHighlightIdConflictsShowItemPicker;
            public bool ConfigDebugBeginReturnValueOnce;
            public bool ConfigDebugBeginReturnValueLoop;
            public bool ConfigDebugIgnoreFocusLoss;
            public bool ConfigDebugIniSettings;
            public char* BackendPlatformName;
            public char* BackendRendererName;
            public void* BackendPlatformUserData;
            public void* BackendRendererUserData;
            public void* BackendLanguageUserData;
            public bool WantCaptureMouse;
            public bool WantCaptureKeyboard;
            public bool WantTextInput;
            public bool WantSetMousePos;
            public bool WantSaveIniSettings;
            public bool NavActive;
            public bool NavVisible;
            public float Framerate;
            public int32 MetricsRenderVertices;
            public int32 MetricsRenderIndices;
            public int32 MetricsRenderWindows;
            public int32 MetricsActiveWindows;
            public Vec2 MouseDelta;
            public Context* Ctx;
            public Vec2 MousePos;
            public bool[5] MouseDown;
            public float MouseWheel;
            public float MouseWheelH;
            public MouseSource MouseSource;
            public ID MouseHoveredViewport;
            public bool KeyCtrl;
            public bool KeyShift;
            public bool KeyAlt;
            public bool KeySuper;
            public KeyChord KeyMods;
            public KeyData[155] KeysData;
            public bool WantCaptureMouseUnlessPopupClose;
            public Vec2 MousePosPrev;
            public Vec2[5] MouseClickedPos;
            public double[5] MouseClickedTime;
            public bool[5] MouseClicked;
            public bool[5] MouseDoubleClicked;
            public U16[5] MouseClickedCount;
            public U16[5] MouseClickedLastCount;
            public bool[5] MouseReleased;
            public double[5] MouseReleasedTime;
            public bool[5] MouseDownOwned;
            public bool[5] MouseDownOwnedUnlessPopupClose;
            public bool MouseWheelRequestAxisSwap;
            public bool MouseCtrlLeftAsRightClick;
            public float[5] MouseDownDuration;
            public float[5] MouseDownDurationPrev;
            public Vec2[5] MouseDragMaxDistanceAbs;
            public float[5] MouseDragMaxDistanceSqr;
            public float PenPressure;
            public bool AppFocusLost;
            public bool AppAcceptingEvents;
            public Wchar16 InputQueueSurrogate;
            public Vector<Wchar> InputQueueCharacters;
        
            [LinkName("ImGuiIO_ImGuiIO")]
            private static extern IO* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiIO_AddFocusEvent")]
            private static extern void AddFocusEventImpl(Self* self, bool focused);
            public void AddFocusEvent(bool focused) mut=> AddFocusEventImpl(&this, focused);
            
            [LinkName("ImGuiIO_AddInputCharacter")]
            private static extern void AddInputCharacterImpl(Self* self, uint32 c);
            public void AddInputCharacter(uint32 c) mut=> AddInputCharacterImpl(&this, c);
            
            [LinkName("ImGuiIO_AddInputCharacterUTF16")]
            private static extern void AddInputCharacterUTF16Impl(Self* self, Wchar16 c);
            public void AddInputCharacterUTF16(Wchar16 c) mut=> AddInputCharacterUTF16Impl(&this, c);
            
            [LinkName("ImGuiIO_AddInputCharactersUTF8")]
            private static extern void AddInputCharactersUTF8Impl(Self* self, char* str);
            public void AddInputCharactersUTF8(char* str) mut=> AddInputCharactersUTF8Impl(&this, str);
            
            [LinkName("ImGuiIO_AddKeyAnalogEvent")]
            private static extern void AddKeyAnalogEventImpl(Self* self, Key key, bool down, float v);
            public void AddKeyAnalogEvent(Key key, bool down, float v) mut=> AddKeyAnalogEventImpl(&this, key, down, v);
            
            [LinkName("ImGuiIO_AddKeyEvent")]
            private static extern void AddKeyEventImpl(Self* self, Key key, bool down);
            public void AddKeyEvent(Key key, bool down) mut=> AddKeyEventImpl(&this, key, down);
            
            [LinkName("ImGuiIO_AddMouseButtonEvent")]
            private static extern void AddMouseButtonEventImpl(Self* self, int32 button, bool down);
            public void AddMouseButtonEvent(int32 button, bool down) mut=> AddMouseButtonEventImpl(&this, button, down);
            
            [LinkName("ImGuiIO_AddMousePosEvent")]
            private static extern void AddMousePosEventImpl(Self* self, float x, float y);
            public void AddMousePosEvent(float x, float y) mut=> AddMousePosEventImpl(&this, x, y);
            
            [LinkName("ImGuiIO_AddMouseSourceEvent")]
            private static extern void AddMouseSourceEventImpl(Self* self, MouseSource source);
            public void AddMouseSourceEvent(MouseSource source) mut=> AddMouseSourceEventImpl(&this, source);
            
            [LinkName("ImGuiIO_AddMouseViewportEvent")]
            private static extern void AddMouseViewportEventImpl(Self* self, ID id);
            public void AddMouseViewportEvent(ID id) mut=> AddMouseViewportEventImpl(&this, id);
            
            [LinkName("ImGuiIO_AddMouseWheelEvent")]
            private static extern void AddMouseWheelEventImpl(Self* self, float wheel_x, float wheel_y);
            public void AddMouseWheelEvent(float wheel_x, float wheel_y) mut=> AddMouseWheelEventImpl(&this, wheel_x, wheel_y);
            
            [LinkName("ImGuiIO_ClearEventsQueue")]
            private static extern void ClearEventsQueueImpl(Self* self);
            public void ClearEventsQueue() mut=> ClearEventsQueueImpl(&this);
            
            [LinkName("ImGuiIO_ClearInputKeys")]
            private static extern void ClearInputKeysImpl(Self* self);
            public void ClearInputKeys() mut=> ClearInputKeysImpl(&this);
            
            [LinkName("ImGuiIO_ClearInputMouse")]
            private static extern void ClearInputMouseImpl(Self* self);
            public void ClearInputMouse() mut=> ClearInputMouseImpl(&this);
            
            [LinkName("ImGuiIO_SetAppAcceptingEvents")]
            private static extern void SetAppAcceptingEventsImpl(Self* self, bool accepting_events);
            public void SetAppAcceptingEvents(bool accepting_events) mut=> SetAppAcceptingEventsImpl(&this, accepting_events);
            
            [LinkName("ImGuiIO_SetKeyEventNativeData")]
            private static extern void SetKeyEventNativeDataImpl(Self* self, Key key, int32 native_keycode, int32 native_scancode, int32 native_legacy_index);
            public void SetKeyEventNativeData(Key key, int32 native_keycode, int32 native_scancode, int32 native_legacy_index = -1) mut=> SetKeyEventNativeDataImpl(&this, key, native_keycode, native_scancode, native_legacy_index);
            
        }
        
        [CRepr]
        public struct InputEvent
        {
            public InputEventType Type;
            public InputSource Source;
            public U32 EventId;
            private InputEventUnion0 Union0 = .();
            public InputEventMousePos MousePos { get { return Union0.MousePos; } set mut { Union0.MousePos = value; } };
            public InputEventMouseWheel MouseWheel { get { return Union0.MouseWheel; } set mut { Union0.MouseWheel = value; } };
            public InputEventMouseButton MouseButton { get { return Union0.MouseButton; } set mut { Union0.MouseButton = value; } };
            public InputEventMouseViewport MouseViewport { get { return Union0.MouseViewport; } set mut { Union0.MouseViewport = value; } };
            public InputEventKey Key { get { return Union0.Key; } set mut { Union0.Key = value; } };
            public InputEventText Text { get { return Union0.Text; } set mut { Union0.Text = value; } };
            public InputEventAppFocused AppFocused { get { return Union0.AppFocused; } set mut { Union0.AppFocused = value; } };
            public bool AddedByTestEngine;
        
            [LinkName("ImGuiInputEvent_ImGuiInputEvent")]
            private static extern InputEvent* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            [CRepr, Union]
            public struct InputEventUnion0
            {
                public InputEventMousePos MousePos;
                public InputEventMouseWheel MouseWheel;
                public InputEventMouseButton MouseButton;
                public InputEventMouseViewport MouseViewport;
                public InputEventKey Key;
                public InputEventText Text;
                public InputEventAppFocused AppFocused;
            
            }
        }
        
        [CRepr]
        public struct InputEventAppFocused
        {
            public bool Focused;
        
        }
        
        [CRepr]
        public struct InputEventKey
        {
            public Key Key;
            public bool Down;
            public float AnalogValue;
        
        }
        
        [CRepr]
        public struct InputEventMouseButton
        {
            public int32 Button;
            public bool Down;
            public MouseSource MouseSource;
        
        }
        
        [CRepr]
        public struct InputEventMousePos
        {
            public float PosX;
            public float PosY;
            public MouseSource MouseSource;
        
        }
        
        [CRepr]
        public struct InputEventMouseViewport
        {
            public ID HoveredViewportID;
        
        }
        
        [CRepr]
        public struct InputEventMouseWheel
        {
            public float WheelX;
            public float WheelY;
            public MouseSource MouseSource;
        
        }
        
        [CRepr]
        public struct InputEventText
        {
            public uint32 Char;
        
        }
        
        [CRepr]
        public struct InputTextCallbackData
        {
            public Context* Ctx;
            public InputTextFlags EventFlag;
            public InputTextFlags Flags;
            public void* UserData;
            public Wchar EventChar;
            public Key EventKey;
            public char* Buf;
            public int32 BufTextLen;
            public int32 BufSize;
            public bool BufDirty;
            public int32 CursorPos;
            public int32 SelectionStart;
            public int32 SelectionEnd;
        
            [LinkName("ImGuiInputTextCallbackData_ImGuiInputTextCallbackData")]
            private static extern InputTextCallbackData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiInputTextCallbackData_ClearSelection")]
            private static extern void ClearSelectionImpl(Self* self);
            public void ClearSelection() mut=> ClearSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextCallbackData_DeleteChars")]
            private static extern void DeleteCharsImpl(Self* self, int32 pos, int32 bytes_count);
            public void DeleteChars(int32 pos, int32 bytes_count) mut=> DeleteCharsImpl(&this, pos, bytes_count);
            
            [LinkName("ImGuiInputTextCallbackData_HasSelection")]
            private static extern bool HasSelectionImpl(Self* self);
            public bool HasSelection() mut=> HasSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextCallbackData_InsertChars")]
            private static extern void InsertCharsImpl(Self* self, int32 pos, char* text, char* text_end);
            public void InsertChars(int32 pos, char* text, char* text_end = null) mut=> InsertCharsImpl(&this, pos, text, text_end);
            
            [LinkName("ImGuiInputTextCallbackData_SelectAll")]
            private static extern void SelectAllImpl(Self* self);
            public void SelectAll() mut=> SelectAllImpl(&this);
            
        }
        
        [CRepr]
        public struct InputTextDeactivatedState
        {
            public ID ID;
            public Vector<char> TextA;
        
            [LinkName("ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState")]
            private static extern InputTextDeactivatedState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiInputTextDeactivatedState_ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
        }
        
        [CRepr]
        public struct InputTextState
        {
            public Context* Ctx;
            public StbTexteditState* Stb;
            public InputTextFlags Flags;
            public ID ID;
            public int32 TextLen;
            public char* TextSrc;
            public Vector<char> TextA;
            public Vector<char> TextToRevertTo;
            public Vector<char> CallbackTextBackup;
            public int32 BufCapacity;
            public Vec2 Scroll;
            public float CursorAnim;
            public bool CursorFollow;
            public bool SelectedAllMouseLock;
            public bool Edited;
            public bool WantReloadUserBuf;
            public int32 ReloadSelectionStart;
            public int32 ReloadSelectionEnd;
        
            [LinkName("ImGuiInputTextState_ImGuiInputTextState")]
            private static extern InputTextState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiInputTextState_ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
            [LinkName("ImGuiInputTextState_ClearSelection")]
            private static extern void ClearSelectionImpl(Self* self);
            public void ClearSelection() mut=> ClearSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextState_ClearText")]
            private static extern void ClearTextImpl(Self* self);
            public void ClearText() mut=> ClearTextImpl(&this);
            
            [LinkName("ImGuiInputTextState_CursorAnimReset")]
            private static extern void CursorAnimResetImpl(Self* self);
            public void CursorAnimReset() mut=> CursorAnimResetImpl(&this);
            
            [LinkName("ImGuiInputTextState_CursorClamp")]
            private static extern void CursorClampImpl(Self* self);
            public void CursorClamp() mut=> CursorClampImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetCursorPos")]
            private static extern int32 GetCursorPosImpl(Self* self);
            public int32 GetCursorPos() mut=> GetCursorPosImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetSelectionEnd")]
            private static extern int32 GetSelectionEndImpl(Self* self);
            public int32 GetSelectionEnd() mut=> GetSelectionEndImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetSelectionStart")]
            private static extern int32 GetSelectionStartImpl(Self* self);
            public int32 GetSelectionStart() mut=> GetSelectionStartImpl(&this);
            
            [LinkName("ImGuiInputTextState_HasSelection")]
            private static extern bool HasSelectionImpl(Self* self);
            public bool HasSelection() mut=> HasSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextState_OnCharPressed")]
            private static extern void OnCharPressedImpl(Self* self, uint32 c);
            public void OnCharPressed(uint32 c) mut=> OnCharPressedImpl(&this, c);
            
            [LinkName("ImGuiInputTextState_OnKeyPressed")]
            private static extern void OnKeyPressedImpl(Self* self, int32 key);
            public void OnKeyPressed(int32 key) mut=> OnKeyPressedImpl(&this, key);
            
            [LinkName("ImGuiInputTextState_ReloadUserBufAndKeepSelection")]
            private static extern void ReloadUserBufAndKeepSelectionImpl(Self* self);
            public void ReloadUserBufAndKeepSelection() mut=> ReloadUserBufAndKeepSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextState_ReloadUserBufAndMoveToEnd")]
            private static extern void ReloadUserBufAndMoveToEndImpl(Self* self);
            public void ReloadUserBufAndMoveToEnd() mut=> ReloadUserBufAndMoveToEndImpl(&this);
            
            [LinkName("ImGuiInputTextState_ReloadUserBufAndSelectAll")]
            private static extern void ReloadUserBufAndSelectAllImpl(Self* self);
            public void ReloadUserBufAndSelectAll() mut=> ReloadUserBufAndSelectAllImpl(&this);
            
            [LinkName("ImGuiInputTextState_SelectAll")]
            private static extern void SelectAllImpl(Self* self);
            public void SelectAll() mut=> SelectAllImpl(&this);
            
        }
        
        [CRepr]
        public struct KeyData
        {
            public bool Down;
            public float DownDuration;
            public float DownDurationPrev;
            public float AnalogValue;
        
        }
        
        [CRepr]
        public struct KeyOwnerData
        {
            public ID OwnerCurr;
            public ID OwnerNext;
            public bool LockThisFrame;
            public bool LockUntilRelease;
        
            [LinkName("ImGuiKeyOwnerData_ImGuiKeyOwnerData")]
            private static extern KeyOwnerData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct KeyRoutingData
        {
            public KeyRoutingIndex NextEntryIndex;
            public U16 Mods;
            public U8 RoutingCurrScore;
            public U8 RoutingNextScore;
            public ID RoutingCurr;
            public ID RoutingNext;
        
            [LinkName("ImGuiKeyRoutingData_ImGuiKeyRoutingData")]
            private static extern KeyRoutingData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct KeyRoutingTable
        {
            public KeyRoutingIndex[155] Index;
            public Vector<KeyRoutingData> Entries;
            public Vector<KeyRoutingData> EntriesNext;
        
            [LinkName("ImGuiKeyRoutingTable_ImGuiKeyRoutingTable")]
            private static extern KeyRoutingTable* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiKeyRoutingTable_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
        }
        
        [CRepr]
        public struct LastItemData
        {
            public ID ID;
            public ItemFlags ItemFlags;
            public ItemStatusFlags StatusFlags;
            public Rect Rect;
            public Rect NavRect;
            public Rect DisplayRect;
            public Rect ClipRect;
            public KeyChord Shortcut;
        
            [LinkName("ImGuiLastItemData_ImGuiLastItemData")]
            private static extern LastItemData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct ListClipper
        {
            public Context* Ctx;
            public int32 DisplayStart;
            public int32 DisplayEnd;
            public int32 ItemsCount;
            public float ItemsHeight;
            public double StartPosY;
            public double StartSeekOffsetY;
            public void* TempData;
        
            [LinkName("ImGuiListClipper_ImGuiListClipper")]
            private static extern ListClipper* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiListClipper_Begin")]
            private static extern void BeginImpl(Self* self, int32 items_count, float items_height);
            public void Begin(int32 items_count, float items_height = -1.0f) mut=> BeginImpl(&this, items_count, items_height);
            
            [LinkName("ImGuiListClipper_End")]
            private static extern void EndImpl(Self* self);
            public void End() mut=> EndImpl(&this);
            
            [LinkName("ImGuiListClipper_IncludeItemByIndex")]
            private static extern void IncludeItemByIndexImpl(Self* self, int32 item_index);
            public void IncludeItemByIndex(int32 item_index) mut=> IncludeItemByIndexImpl(&this, item_index);
            
            [LinkName("ImGuiListClipper_IncludeItemsByIndex")]
            private static extern void IncludeItemsByIndexImpl(Self* self, int32 item_begin, int32 item_end);
            public void IncludeItemsByIndex(int32 item_begin, int32 item_end) mut=> IncludeItemsByIndexImpl(&this, item_begin, item_end);
            
            [LinkName("ImGuiListClipper_SeekCursorForItem")]
            private static extern void SeekCursorForItemImpl(Self* self, int32 item_index);
            public void SeekCursorForItem(int32 item_index) mut=> SeekCursorForItemImpl(&this, item_index);
            
            [LinkName("ImGuiListClipper_Step")]
            private static extern bool StepImpl(Self* self);
            public bool Step() mut=> StepImpl(&this);
            
        }
        
        [CRepr]
        public struct ListClipperData
        {
            public ListClipper* ListClipper;
            public float LossynessOffset;
            public int32 StepNo;
            public int32 ItemsFrozen;
            public Vector<ListClipperRange> Ranges;
        
            [LinkName("ImGuiListClipperData_ImGuiListClipperData")]
            private static extern ListClipperData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiListClipperData_Reset")]
            private static extern void ResetImpl(Self* self, ListClipper* clipper);
            public void Reset(ListClipper* clipper) mut=> ResetImpl(&this, clipper);
            
        }
        
        [CRepr]
        public struct ListClipperRange
        {
            public int32 Min;
            public int32 Max;
            public bool PosToIndexConvert;
            public S8 PosToIndexOffsetMin;
            public S8 PosToIndexOffsetMax;
        
        }
        
        [CRepr]
        public struct LocEntry
        {
            public LocKey Key;
            public char* Text;
        
        }
        
        [CRepr]
        public struct MenuColumns
        {
            public U32 TotalWidth;
            public U32 NextTotalWidth;
            public U16 Spacing;
            public U16 OffsetIcon;
            public U16 OffsetLabel;
            public U16 OffsetShortcut;
            public U16 OffsetMark;
            public U16[4] Widths;
        
            [LinkName("ImGuiMenuColumns_ImGuiMenuColumns")]
            private static extern MenuColumns* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiMenuColumns_CalcNextTotalWidth")]
            private static extern void CalcNextTotalWidthImpl(Self* self, bool update_offsets);
            public void CalcNextTotalWidth(bool update_offsets) mut=> CalcNextTotalWidthImpl(&this, update_offsets);
            
            [LinkName("ImGuiMenuColumns_DeclColumns")]
            private static extern float DeclColumnsImpl(Self* self, float w_icon, float w_label, float w_shortcut, float w_mark);
            public float DeclColumns(float w_icon, float w_label, float w_shortcut, float w_mark) mut=> DeclColumnsImpl(&this, w_icon, w_label, w_shortcut, w_mark);
            
            [LinkName("ImGuiMenuColumns_Update")]
            private static extern void UpdateImpl(Self* self, float spacing, bool window_reappearing);
            public void Update(float spacing, bool window_reappearing) mut=> UpdateImpl(&this, spacing, window_reappearing);
            
        }
        
        [CRepr]
        public struct MetricsConfig
        {
            public bool ShowDebugLog;
            public bool ShowIDStackTool;
            public bool ShowWindowsRects;
            public bool ShowWindowsBeginOrder;
            public bool ShowTablesRects;
            public bool ShowDrawCmdMesh;
            public bool ShowDrawCmdBoundingBoxes;
            public bool ShowTextEncodingViewer;
            public bool ShowTextureUsedRect;
            public bool ShowDockingNodes;
            public int32 ShowWindowsRectsType;
            public int32 ShowTablesRectsType;
            public int32 HighlightMonitorIdx;
            public ID HighlightViewportID;
            public bool ShowFontPreview;
        
        }
        
        [CRepr]
        public struct MultiSelectIO
        {
            public Vector<SelectionRequest> Requests;
            public SelectionUserData RangeSrcItem;
            public SelectionUserData NavIdItem;
            public bool NavIdSelected;
            public bool RangeSrcReset;
            public int32 ItemsCount;
        
        }
        
        [CRepr]
        public struct MultiSelectState
        {
            public Window* Window;
            public ID ID;
            public int32 LastFrameActive;
            public int32 LastSelectionSize;
            public S8 RangeSelected;
            public S8 NavIdSelected;
            public SelectionUserData RangeSrcItem;
            public SelectionUserData NavIdItem;
        
            [LinkName("ImGuiMultiSelectState_ImGuiMultiSelectState")]
            private static extern MultiSelectState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct MultiSelectTempData
        {
            public MultiSelectIO IO;
            public MultiSelectState* Storage;
            public ID FocusScopeId;
            public MultiSelectFlags Flags;
            public Vec2 ScopeRectMin;
            public Vec2 BackupCursorMaxPos;
            public SelectionUserData LastSubmittedItem;
            public ID BoxSelectId;
            public KeyChord KeyMods;
            public S8 LoopRequestSetAll;
            public bool IsEndIO;
            public bool IsFocused;
            public bool IsKeyboardSetRange;
            public bool NavIdPassedBy;
            public bool RangeSrcPassedBy;
            public bool RangeDstPassedBy;
        
            [LinkName("ImGuiMultiSelectTempData_ImGuiMultiSelectTempData")]
            private static extern MultiSelectTempData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiMultiSelectTempData_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiMultiSelectTempData_ClearIO")]
            private static extern void ClearIOImpl(Self* self);
            public void ClearIO() mut=> ClearIOImpl(&this);
            
        }
        
        [CRepr]
        public struct NavItemData
        {
            public Window* Window;
            public ID ID;
            public ID FocusScopeId;
            public Rect RectRel;
            public ItemFlags ItemFlags;
            public float DistBox;
            public float DistCenter;
            public float DistAxial;
            public SelectionUserData SelectionUserData;
        
            [LinkName("ImGuiNavItemData_ImGuiNavItemData")]
            private static extern NavItemData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiNavItemData_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
        }
        
        [CRepr]
        public struct NextItemData
        {
            public NextItemDataFlags HasFlags;
            public ItemFlags ItemFlags;
            public ID FocusScopeId;
            public SelectionUserData SelectionUserData;
            public float Width;
            public KeyChord Shortcut;
            public InputFlags ShortcutFlags;
            public bool OpenVal;
            public U8 OpenCond;
            public DataTypeStorage RefVal;
            public ID StorageId;
        
            [LinkName("ImGuiNextItemData_ImGuiNextItemData")]
            private static extern NextItemData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiNextItemData_ClearFlags")]
            private static extern void ClearFlagsImpl(Self* self);
            public void ClearFlags() mut=> ClearFlagsImpl(&this);
            
        }
        
        [CRepr]
        public struct NextWindowData
        {
            public NextWindowDataFlags HasFlags;
            public Cond PosCond;
            public Cond SizeCond;
            public Cond CollapsedCond;
            public Cond DockCond;
            public Vec2 PosVal;
            public Vec2 PosPivotVal;
            public Vec2 SizeVal;
            public Vec2 ContentSizeVal;
            public Vec2 ScrollVal;
            public WindowFlags WindowFlags;
            public ChildFlags ChildFlags;
            public bool PosUndock;
            public bool CollapsedVal;
            public Rect SizeConstraintRect;
            public SizeCallback SizeCallback;
            public void* SizeCallbackUserData;
            public float BgAlphaVal;
            public ID ViewportId;
            public ID DockId;
            public WindowClass WindowClass;
            public Vec2 MenuBarOffsetMinVal;
            public WindowRefreshFlags RefreshFlagsVal;
        
            [LinkName("ImGuiNextWindowData_ImGuiNextWindowData")]
            private static extern NextWindowData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiNextWindowData_ClearFlags")]
            private static extern void ClearFlagsImpl(Self* self);
            public void ClearFlags() mut=> ClearFlagsImpl(&this);
            
        }
        
        [CRepr]
        public struct OldColumnData
        {
            public float OffsetNorm;
            public float OffsetNormBeforeResize;
            public OldColumnFlags Flags;
            public Rect ClipRect;
        
            [LinkName("ImGuiOldColumnData_ImGuiOldColumnData")]
            private static extern OldColumnData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct OldColumns
        {
            public ID ID;
            public OldColumnFlags Flags;
            public bool IsFirstFrame;
            public bool IsBeingResized;
            public int32 Current;
            public int32 Count;
            public float OffMinX;
            public float OffMaxX;
            public float LineMinY;
            public float LineMaxY;
            public float HostCursorPosY;
            public float HostCursorMaxPosX;
            public Rect HostInitialClipRect;
            public Rect HostBackupClipRect;
            public Rect HostBackupParentWorkRect;
            public Vector<OldColumnData> Columns;
            public DrawListSplitter Splitter;
        
            [LinkName("ImGuiOldColumns_ImGuiOldColumns")]
            private static extern OldColumns* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct OnceUponAFrame
        {
            public int32 RefFrame;
        
            [LinkName("ImGuiOnceUponAFrame_ImGuiOnceUponAFrame")]
            private static extern OnceUponAFrame* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Payload
        {
            public void* Data;
            public int32 DataSize;
            public ID SourceId;
            public ID SourceParentId;
            public int32 DataFrameCount;
            public char[33] DataType;
            public bool Preview;
            public bool Delivery;
        
            [LinkName("ImGuiPayload_ImGuiPayload")]
            private static extern Payload* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiPayload_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiPayload_IsDataType")]
            private static extern bool IsDataTypeImpl(Self* self, char* type);
            public bool IsDataType(char* type) mut=> IsDataTypeImpl(&this, type);
            
            [LinkName("ImGuiPayload_IsDelivery")]
            private static extern bool IsDeliveryImpl(Self* self);
            public bool IsDelivery() mut=> IsDeliveryImpl(&this);
            
            [LinkName("ImGuiPayload_IsPreview")]
            private static extern bool IsPreviewImpl(Self* self);
            public bool IsPreview() mut=> IsPreviewImpl(&this);
            
        }
        
        [CRepr]
        public struct PlatformIO
        {
            public function char*(Context* ctx) Platform_GetClipboardTextFn;
            public function void(Context* ctx, char* text) Platform_SetClipboardTextFn;
            public void* Platform_ClipboardUserData;
            public function bool(Context* ctx, char* path) Platform_OpenInShellFn;
            public void* Platform_OpenInShellUserData;
            public function void(Context* ctx, Viewport* viewport, PlatformImeData* data) Platform_SetImeDataFn;
            public void* Platform_ImeUserData;
            public Wchar Platform_LocaleDecimalPoint;
            public int32 Renderer_TextureMaxWidth;
            public int32 Renderer_TextureMaxHeight;
            public void* Renderer_RenderState;
            public function void(Viewport* vp) Platform_CreateWindow;
            public function void(Viewport* vp) Platform_DestroyWindow;
            public function void(Viewport* vp) Platform_ShowWindow;
            public function void(Viewport* vp, Vec2 pos) Platform_SetWindowPos;
            public function Vec2(Viewport* vp) Platform_GetWindowPos;
            public function void(Viewport* vp, Vec2 size) Platform_SetWindowSize;
            public function Vec2(Viewport* vp) Platform_GetWindowSize;
            public function Vec2(Viewport* vp) Platform_GetWindowFramebufferScale;
            public function void(Viewport* vp) Platform_SetWindowFocus;
            public function bool(Viewport* vp) Platform_GetWindowFocus;
            public function bool(Viewport* vp) Platform_GetWindowMinimized;
            public function void(Viewport* vp, char* str) Platform_SetWindowTitle;
            public function void(Viewport* vp, float alpha) Platform_SetWindowAlpha;
            public function void(Viewport* vp) Platform_UpdateWindow;
            public function void(Viewport* vp, void* render_arg) Platform_RenderWindow;
            public function void(Viewport* vp, void* render_arg) Platform_SwapBuffers;
            public function float(Viewport* vp) Platform_GetWindowDpiScale;
            public function void(Viewport* vp) Platform_OnChangedViewport;
            public function Vec4(Viewport* vp) Platform_GetWindowWorkAreaInsets;
            public function int(Viewport* vp, U64 vk_inst, void* vk_allocators, U64* out_vk_surface) Platform_CreateVkSurface;
            public function void(Viewport* vp) Renderer_CreateWindow;
            public function void(Viewport* vp) Renderer_DestroyWindow;
            public function void(Viewport* vp, Vec2 size) Renderer_SetWindowSize;
            public function void(Viewport* vp, void* render_arg) Renderer_RenderWindow;
            public function void(Viewport* vp, void* render_arg) Renderer_SwapBuffers;
            public Vector<PlatformMonitor> Monitors;
            public Vector<TextureData*> Textures;
            public Vector<Viewport*> Viewports;
        
            [LinkName("ImGuiPlatformIO_ImGuiPlatformIO")]
            private static extern PlatformIO* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PlatformImeData
        {
            public bool WantVisible;
            public bool WantTextInput;
            public Vec2 InputPos;
            public float InputLineHeight;
            public ID ViewportId;
        
            [LinkName("ImGuiPlatformImeData_ImGuiPlatformImeData")]
            private static extern PlatformImeData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PlatformMonitor
        {
            public Vec2 MainPos;
            public Vec2 MainSize;
            public Vec2 WorkPos;
            public Vec2 WorkSize;
            public float DpiScale;
            public void* PlatformHandle;
        
            [LinkName("ImGuiPlatformMonitor_ImGuiPlatformMonitor")]
            private static extern PlatformMonitor* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PopupData
        {
            public ID PopupId;
            public Window* Window;
            public Window* RestoreNavWindow;
            public int32 ParentNavLayer;
            public int32 OpenFrameCount;
            public ID OpenParentId;
            public Vec2 OpenPopupPos;
            public Vec2 OpenMousePos;
        
            [LinkName("ImGuiPopupData_ImGuiPopupData")]
            private static extern PopupData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PtrOrIndex
        {
            public void* Ptr;
            public int32 Index;
        
            [LinkName("ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr")]
            private static extern PtrOrIndex* CtorImpl(void* ptr);
            public this(void* ptr)
            {
                this = *CtorImpl(ptr);
            }
            
            [LinkName("ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int")]
            private static extern PtrOrIndex* CtorImpl(int32 index);
            public this(int32 index)
            {
                this = *CtorImpl(index);
            }
            
        }
        
        [CRepr]
        public struct SelectionBasicStorage
        {
            public int32 Size;
            public bool PreserveOrder;
            public void* UserData;
            public function ID(Self* self, int32 idx) AdapterIndexToStorageId;
            public int32 _SelectionOrder;
            public Storage _Storage;
        
            [LinkName("ImGuiSelectionBasicStorage_ImGuiSelectionBasicStorage")]
            private static extern SelectionBasicStorage* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiSelectionBasicStorage_ApplyRequests")]
            private static extern void ApplyRequestsImpl(Self* self, MultiSelectIO* ms_io);
            public void ApplyRequests(MultiSelectIO* ms_io) mut=> ApplyRequestsImpl(&this, ms_io);
            
            [LinkName("ImGuiSelectionBasicStorage_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiSelectionBasicStorage_Contains")]
            private static extern bool ContainsImpl(Self* self, ID id);
            public bool Contains(ID id) mut=> ContainsImpl(&this, id);
            
            [LinkName("ImGuiSelectionBasicStorage_GetNextSelectedItem")]
            private static extern bool GetNextSelectedItemImpl(Self* self, void** opaque_it, ID* out_id);
            public bool GetNextSelectedItem(void** opaque_it, out ID out_id) mut
            {
                out_id = ?;
                return GetNextSelectedItemImpl(&this, opaque_it, &out_id);
            }
            
            [LinkName("ImGuiSelectionBasicStorage_GetStorageIdFromIndex")]
            private static extern ID GetStorageIdFromIndexImpl(Self* self, int32 idx);
            public ID GetStorageIdFromIndex(int32 idx) mut=> GetStorageIdFromIndexImpl(&this, idx);
            
            [LinkName("ImGuiSelectionBasicStorage_SetItemSelected")]
            private static extern void SetItemSelectedImpl(Self* self, ID id, bool selected);
            public void SetItemSelected(ID id, bool selected) mut=> SetItemSelectedImpl(&this, id, selected);
            
            [LinkName("ImGuiSelectionBasicStorage_Swap")]
            private static extern void SwapImpl(Self* self, SelectionBasicStorage* r);
            public void Swap(ref SelectionBasicStorage r) mut=> SwapImpl(&this, &r);
            
        }
        
        [CRepr]
        public struct SelectionExternalStorage
        {
            public void* UserData;
            public function void(Self* self, int32 idx, bool selected) AdapterSetItemSelected;
        
            [LinkName("ImGuiSelectionExternalStorage_ImGuiSelectionExternalStorage")]
            private static extern SelectionExternalStorage* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiSelectionExternalStorage_ApplyRequests")]
            private static extern void ApplyRequestsImpl(Self* self, MultiSelectIO* ms_io);
            public void ApplyRequests(MultiSelectIO* ms_io) mut=> ApplyRequestsImpl(&this, ms_io);
            
        }
        
        [CRepr]
        public struct SelectionRequest
        {
            public SelectionRequestType Type;
            public bool Selected;
            public S8 RangeDirection;
            public SelectionUserData RangeFirstItem;
            public SelectionUserData RangeLastItem;
        
        }
        
        [CRepr]
        public struct SettingsHandler
        {
            public char* TypeName;
            public ID TypeHash;
            public function void(Context* ctx, SettingsHandler* handler) ClearAllFn;
            public function void(Context* ctx, SettingsHandler* handler) ReadInitFn;
            public function void*(Context* ctx, SettingsHandler* handler, char* name) ReadOpenFn;
            public function void(Context* ctx, SettingsHandler* handler, void* entry, char* line) ReadLineFn;
            public function void(Context* ctx, SettingsHandler* handler) ApplyAllFn;
            public function void(Context* ctx, SettingsHandler* handler, TextBuffer* out_buf) WriteAllFn;
            public void* UserData;
        
            [LinkName("ImGuiSettingsHandler_ImGuiSettingsHandler")]
            private static extern SettingsHandler* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct ShrinkWidthItem
        {
            public int32 Index;
            public float Width;
            public float InitialWidth;
        
        }
        
        [CRepr]
        public struct SizeCallbackData
        {
            public void* UserData;
            public Vec2 Pos;
            public Vec2 CurrentSize;
            public Vec2 DesiredSize;
        
        }
        
        [CRepr]
        public struct StackLevelInfo
        {
            public ID ID;
            public S8 QueryFrameCount;
            public bool QuerySuccess;
            public DataType DataType;
            public char[57] Desc;
        
            [LinkName("ImGuiStackLevelInfo_ImGuiStackLevelInfo")]
            private static extern StackLevelInfo* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Storage
        {
            public Vector<StoragePair> Data;
        
            [LinkName("ImGuiStorage_BuildSortByKey")]
            private static extern void BuildSortByKeyImpl(Self* self);
            public void BuildSortByKey() mut=> BuildSortByKeyImpl(&this);
            
            [LinkName("ImGuiStorage_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiStorage_GetBool")]
            private static extern bool GetBoolImpl(Self* self, ID key, bool default_val);
            public bool GetBool(ID key, bool default_val = false) mut=> GetBoolImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetBoolRef")]
            private static extern bool* GetBoolRefImpl(Self* self, ID key, bool default_val);
            public bool* GetBoolRef(ID key, bool default_val = false) mut=> GetBoolRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetFloat")]
            private static extern float GetFloatImpl(Self* self, ID key, float default_val);
            public float GetFloat(ID key, float default_val = (float) 0.0f) mut=> GetFloatImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetFloatRef")]
            private static extern float* GetFloatRefImpl(Self* self, ID key, float default_val);
            public float* GetFloatRef(ID key, float default_val = (float) 0.0f) mut=> GetFloatRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetInt")]
            private static extern int32 GetIntImpl(Self* self, ID key, int32 default_val);
            public int32 GetInt(ID key, int32 default_val = (int32) 0) mut=> GetIntImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetIntRef")]
            private static extern int32* GetIntRefImpl(Self* self, ID key, int32 default_val);
            public int32* GetIntRef(ID key, int32 default_val = (int32) 0) mut=> GetIntRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetVoidPtr")]
            private static extern void* GetVoidPtrImpl(Self* self, ID key);
            public void* GetVoidPtr(ID key) mut=> GetVoidPtrImpl(&this, key);
            
            [LinkName("ImGuiStorage_GetVoidPtrRef")]
            private static extern void** GetVoidPtrRefImpl(Self* self, ID key, void* default_val);
            public void** GetVoidPtrRef(ID key, void* default_val = null) mut=> GetVoidPtrRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_SetAllInt")]
            private static extern void SetAllIntImpl(Self* self, int32 val);
            public void SetAllInt(int32 val) mut=> SetAllIntImpl(&this, val);
            
            [LinkName("ImGuiStorage_SetBool")]
            private static extern void SetBoolImpl(Self* self, ID key, bool val);
            public void SetBool(ID key, bool val) mut=> SetBoolImpl(&this, key, val);
            
            [LinkName("ImGuiStorage_SetFloat")]
            private static extern void SetFloatImpl(Self* self, ID key, float val);
            public void SetFloat(ID key, float val) mut=> SetFloatImpl(&this, key, val);
            
            [LinkName("ImGuiStorage_SetInt")]
            private static extern void SetIntImpl(Self* self, ID key, int32 val);
            public void SetInt(ID key, int32 val) mut=> SetIntImpl(&this, key, val);
            
            [LinkName("ImGuiStorage_SetVoidPtr")]
            private static extern void SetVoidPtrImpl(Self* self, ID key, void* val);
            public void SetVoidPtr(ID key, void* val) mut=> SetVoidPtrImpl(&this, key, val);
            
        }
        
        [CRepr]
        public struct StoragePair
        {
            public ID key;
            private StoragePairUnion0 Union0 = .();
            public int32 val_i { get { return Union0.val_i; } set mut { Union0.val_i = value; } };
            public float val_f { get { return Union0.val_f; } set mut { Union0.val_f = value; } };
            public void* val_p { get { return Union0.val_p; } set mut { Union0.val_p = value; } };
        
            [LinkName("ImGuiStoragePair_ImGuiStoragePair_Int")]
            private static extern StoragePair* CtorImpl(ID _key, int32 _val);
            public this(ID _key, int32 _val)
            {
                this = *CtorImpl(_key, _val);
            }
            
            [LinkName("ImGuiStoragePair_ImGuiStoragePair_Float")]
            private static extern StoragePair* CtorImpl(ID _key, float _val);
            public this(ID _key, float _val)
            {
                this = *CtorImpl(_key, _val);
            }
            
            [LinkName("ImGuiStoragePair_ImGuiStoragePair_Ptr")]
            private static extern StoragePair* CtorImpl(ID _key, void* _val);
            public this(ID _key, void* _val)
            {
                this = *CtorImpl(_key, _val);
            }
            [CRepr, Union]
            public struct StoragePairUnion0
            {
                public int32 val_i;
                public float val_f;
                public void* val_p;
            
            }
        }
        
        [CRepr]
        public struct Style
        {
            public float FontSizeBase;
            public float FontScaleMain;
            public float FontScaleDpi;
            public float Alpha;
            public float DisabledAlpha;
            public Vec2 WindowPadding;
            public float WindowRounding;
            public float WindowBorderSize;
            public float WindowBorderHoverPadding;
            public Vec2 WindowMinSize;
            public Vec2 WindowTitleAlign;
            public Dir WindowMenuButtonPosition;
            public float ChildRounding;
            public float ChildBorderSize;
            public float PopupRounding;
            public float PopupBorderSize;
            public Vec2 FramePadding;
            public float FrameRounding;
            public float FrameBorderSize;
            public Vec2 ItemSpacing;
            public Vec2 ItemInnerSpacing;
            public Vec2 CellPadding;
            public Vec2 TouchExtraPadding;
            public float IndentSpacing;
            public float ColumnsMinSpacing;
            public float ScrollbarSize;
            public float ScrollbarRounding;
            public float GrabMinSize;
            public float GrabRounding;
            public float LogSliderDeadzone;
            public float ImageBorderSize;
            public float TabRounding;
            public float TabBorderSize;
            public float TabCloseButtonMinWidthSelected;
            public float TabCloseButtonMinWidthUnselected;
            public float TabBarBorderSize;
            public float TabBarOverlineSize;
            public float TableAngledHeadersAngle;
            public Vec2 TableAngledHeadersTextAlign;
            public TreeNodeFlags TreeLinesFlags;
            public float TreeLinesSize;
            public float TreeLinesRounding;
            public Dir ColorButtonPosition;
            public Vec2 ButtonTextAlign;
            public Vec2 SelectableTextAlign;
            public float SeparatorTextBorderSize;
            public Vec2 SeparatorTextAlign;
            public Vec2 SeparatorTextPadding;
            public Vec2 DisplayWindowPadding;
            public Vec2 DisplaySafeAreaPadding;
            public float DockingSeparatorSize;
            public float MouseCursorScale;
            public bool AntiAliasedLines;
            public bool AntiAliasedLinesUseTex;
            public bool AntiAliasedFill;
            public float CurveTessellationTol;
            public float CircleTessellationMaxError;
            public Vec4[60] Colors;
            public float HoverStationaryDelay;
            public float HoverDelayShort;
            public float HoverDelayNormal;
            public HoveredFlags HoverFlagsForTooltipMouse;
            public HoveredFlags HoverFlagsForTooltipNav;
            public float _MainScale;
            public float _NextFrameFontSizeBase;
        
            [LinkName("ImGuiStyle_ImGuiStyle")]
            private static extern Style* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiStyle_ScaleAllSizes")]
            private static extern void ScaleAllSizesImpl(Self* self, float scale_factor);
            public void ScaleAllSizes(float scale_factor) mut=> ScaleAllSizesImpl(&this, scale_factor);
            
        }
        
        [CRepr]
        public struct StyleMod
        {
            public StyleVar VarIdx;
            private StyleModUnion0 Union0 = .();
            public int32[2] BackupInt { get { return Union0.BackupInt; } set mut { Union0.BackupInt = value; } };
            public float[2] BackupFloat { get { return Union0.BackupFloat; } set mut { Union0.BackupFloat = value; } };
        
            [LinkName("ImGuiStyleMod_ImGuiStyleMod_Int")]
            private static extern StyleMod* CtorImpl(StyleVar idx, int32 v);
            public this(StyleVar idx, int32 v)
            {
                this = *CtorImpl(idx, v);
            }
            
            [LinkName("ImGuiStyleMod_ImGuiStyleMod_Float")]
            private static extern StyleMod* CtorImpl(StyleVar idx, float v);
            public this(StyleVar idx, float v)
            {
                this = *CtorImpl(idx, v);
            }
            
            [LinkName("ImGuiStyleMod_ImGuiStyleMod_Vec2")]
            private static extern StyleMod* CtorImpl(StyleVar idx, Vec2 v);
            public this(StyleVar idx, Vec2 v)
            {
                this = *CtorImpl(idx, v);
            }
            [CRepr, Union]
            public struct StyleModUnion0
            {
                public int32[2] BackupInt;
                public float[2] BackupFloat;
            
            }
        }
        
        [CRepr]
        public struct StyleVarInfo
        {
            public U32 Count;
            public DataType DataType;
            public U32 Offset;
        
            [LinkName("ImGuiStyleVarInfo_GetVarPtr")]
            private static extern void* GetVarPtrImpl(Self* self, void* parent);
            public void* GetVarPtr(void* parent) mut=> GetVarPtrImpl(&this, parent);
            
        }
        
        [CRepr]
        public struct TabBar
        {
            public Window* Window;
            public Vector<TabItem> Tabs;
            public TabBarFlags Flags;
            public ID ID;
            public ID SelectedTabId;
            public ID NextSelectedTabId;
            public ID VisibleTabId;
            public int32 CurrFrameVisible;
            public int32 PrevFrameVisible;
            public Rect BarRect;
            public float CurrTabsContentsHeight;
            public float PrevTabsContentsHeight;
            public float WidthAllTabs;
            public float WidthAllTabsIdeal;
            public float ScrollingAnim;
            public float ScrollingTarget;
            public float ScrollingTargetDistToVisibility;
            public float ScrollingSpeed;
            public float ScrollingRectMinX;
            public float ScrollingRectMaxX;
            public float SeparatorMinX;
            public float SeparatorMaxX;
            public ID ReorderRequestTabId;
            public S16 ReorderRequestOffset;
            public S8 BeginCount;
            public bool WantLayout;
            public bool VisibleTabWasSubmitted;
            public bool TabsAddedNew;
            public S16 TabsActiveCount;
            public S16 LastTabItemIdx;
            public float ItemSpacingY;
            public Vec2 FramePadding;
            public Vec2 BackupCursorPos;
            public TextBuffer TabsNames;
        
            [LinkName("ImGuiTabBar_ImGuiTabBar")]
            private static extern TabBar* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TabItem
        {
            public ID ID;
            public TabItemFlags Flags;
            public Window* Window;
            public int32 LastFrameVisible;
            public int32 LastFrameSelected;
            public float Offset;
            public float Width;
            public float ContentWidth;
            public float RequestedWidth;
            public S32 NameOffset;
            public S16 BeginOrder;
            public S16 IndexDuringLayout;
            public bool WantClose;
        
            [LinkName("ImGuiTabItem_ImGuiTabItem")]
            private static extern TabItem* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Table
        {
            public ID ID;
            public TableFlags Flags;
            public void* RawData;
            public TableTempData* TempData;
            public Span<TableColumn> Columns;
            public Span<TableColumnIdx> DisplayOrderToIndex;
            public Span<TableCellData> RowCellData;
            public BitArrayPtr EnabledMaskByDisplayOrder;
            public BitArrayPtr EnabledMaskByIndex;
            public BitArrayPtr VisibleMaskByIndex;
            public TableFlags SettingsLoadedFlags;
            public int32 SettingsOffset;
            public int32 LastFrameActive;
            public int32 ColumnsCount;
            public int32 CurrentRow;
            public int32 CurrentColumn;
            public S16 InstanceCurrent;
            public S16 InstanceInteracted;
            public float RowPosY1;
            public float RowPosY2;
            public float RowMinHeight;
            public float RowCellPaddingY;
            public float RowTextBaseline;
            public float RowIndentOffsetX;
            public TableRowFlags RowFlags;
            public TableRowFlags LastRowFlags;
            public int32 RowBgColorCounter;
            public U32[2] RowBgColor;
            public U32 BorderColorStrong;
            public U32 BorderColorLight;
            public float BorderX1;
            public float BorderX2;
            public float HostIndentX;
            public float MinColumnWidth;
            public float OuterPaddingX;
            public float CellPaddingX;
            public float CellSpacingX1;
            public float CellSpacingX2;
            public float InnerWidth;
            public float ColumnsGivenWidth;
            public float ColumnsAutoFitWidth;
            public float ColumnsStretchSumWeights;
            public float ResizedColumnNextWidth;
            public float ResizeLockMinContentsX2;
            public float RefScale;
            public float AngledHeadersHeight;
            public float AngledHeadersSlope;
            public Rect OuterRect;
            public Rect InnerRect;
            public Rect WorkRect;
            public Rect InnerClipRect;
            public Rect BgClipRect;
            public Rect Bg0ClipRectForDrawCmd;
            public Rect Bg2ClipRectForDrawCmd;
            public Rect HostClipRect;
            public Rect HostBackupInnerClipRect;
            public Window* OuterWindow;
            public Window* InnerWindow;
            public TextBuffer ColumnsNames;
            public DrawListSplitter* DrawSplitter;
            public TableInstanceData InstanceDataFirst;
            public Vector<TableInstanceData> InstanceDataExtra;
            public TableColumnSortSpecs SortSpecsSingle;
            public Vector<TableColumnSortSpecs> SortSpecsMulti;
            public TableSortSpecs SortSpecs;
            public TableColumnIdx SortSpecsCount;
            public TableColumnIdx ColumnsEnabledCount;
            public TableColumnIdx ColumnsEnabledFixedCount;
            public TableColumnIdx DeclColumnsCount;
            public TableColumnIdx AngledHeadersCount;
            public TableColumnIdx HoveredColumnBody;
            public TableColumnIdx HoveredColumnBorder;
            public TableColumnIdx HighlightColumnHeader;
            public TableColumnIdx AutoFitSingleColumn;
            public TableColumnIdx ResizedColumn;
            public TableColumnIdx LastResizedColumn;
            public TableColumnIdx HeldHeaderColumn;
            public TableColumnIdx ReorderColumn;
            public TableColumnIdx ReorderColumnDir;
            public TableColumnIdx LeftMostEnabledColumn;
            public TableColumnIdx RightMostEnabledColumn;
            public TableColumnIdx LeftMostStretchedColumn;
            public TableColumnIdx RightMostStretchedColumn;
            public TableColumnIdx ContextPopupColumn;
            public TableColumnIdx FreezeRowsRequest;
            public TableColumnIdx FreezeRowsCount;
            public TableColumnIdx FreezeColumnsRequest;
            public TableColumnIdx FreezeColumnsCount;
            public TableColumnIdx RowCellDataCurrent;
            public TableDrawChannelIdx DummyDrawChannel;
            public TableDrawChannelIdx Bg2DrawChannelCurrent;
            public TableDrawChannelIdx Bg2DrawChannelUnfrozen;
            public S8 NavLayer;
            public bool IsLayoutLocked;
            public bool IsInsideRow;
            public bool IsInitializing;
            public bool IsSortSpecsDirty;
            public bool IsUsingHeaders;
            public bool IsContextPopupOpen;
            public bool DisableDefaultContextMenu;
            public bool IsSettingsRequestLoad;
            public bool IsSettingsDirty;
            public bool IsDefaultDisplayOrder;
            public bool IsResetAllRequest;
            public bool IsResetDisplayOrderRequest;
            public bool IsUnfrozenRows;
            public bool IsDefaultSizingPolicy;
            public bool IsActiveIdAliveBeforeTable;
            public bool IsActiveIdInTable;
            public bool HasScrollbarYCurr;
            public bool HasScrollbarYPrev;
            public bool MemoryCompacted;
            public bool HostSkipItems;
        
            [LinkName("ImGuiTable_ImGuiTable")]
            private static extern Table* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableCellData
        {
            public U32 BgColor;
            public TableColumnIdx Column;
        
        }
        
        [CRepr]
        public struct TableColumn
        {
            public TableColumnFlags Flags;
            public float WidthGiven;
            public float MinX;
            public float MaxX;
            public float WidthRequest;
            public float WidthAuto;
            public float WidthMax;
            public float StretchWeight;
            public float InitStretchWeightOrWidth;
            public Rect ClipRect;
            public ID UserID;
            public float WorkMinX;
            public float WorkMaxX;
            public float ItemWidth;
            public float ContentMaxXFrozen;
            public float ContentMaxXUnfrozen;
            public float ContentMaxXHeadersUsed;
            public float ContentMaxXHeadersIdeal;
            public S16 NameOffset;
            public TableColumnIdx DisplayOrder;
            public TableColumnIdx IndexWithinEnabledSet;
            public TableColumnIdx PrevEnabledColumn;
            public TableColumnIdx NextEnabledColumn;
            public TableColumnIdx SortOrder;
            public TableDrawChannelIdx DrawChannelCurrent;
            public TableDrawChannelIdx DrawChannelFrozen;
            public TableDrawChannelIdx DrawChannelUnfrozen;
            public bool IsEnabled;
            public bool IsUserEnabled;
            public bool IsUserEnabledNextFrame;
            public bool IsVisibleX;
            public bool IsVisibleY;
            public bool IsRequestOutput;
            public bool IsSkipItems;
            public bool IsPreserveWidthAuto;
            public S8 NavLayerCurrent;
            public U8 AutoFitQueue;
            public U8 CannotSkipItemsQueue;
            public U8 SortDirection;
            public U8 SortDirectionsAvailCount;
            public U8 SortDirectionsAvailMask;
            public U8 SortDirectionsAvailList;
        
            [LinkName("ImGuiTableColumn_ImGuiTableColumn")]
            private static extern TableColumn* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableColumnSettings
        {
            public float WidthOrWeight;
            public ID UserID;
            public TableColumnIdx Index;
            public TableColumnIdx DisplayOrder;
            public TableColumnIdx SortOrder;
            public U8 SortDirection;
            public S8 IsEnabled;
            public U8 IsStretch;
        
            [LinkName("ImGuiTableColumnSettings_ImGuiTableColumnSettings")]
            private static extern TableColumnSettings* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableColumnSortSpecs
        {
            public ID ColumnUserID;
            public S16 ColumnIndex;
            public S16 SortOrder;
            public SortDirection SortDirection;
        
            [LinkName("ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs")]
            private static extern TableColumnSortSpecs* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableHeaderData
        {
            public TableColumnIdx Index;
            public U32 TextColor;
            public U32 BgColor0;
            public U32 BgColor1;
        
        }
        
        [CRepr]
        public struct TableInstanceData
        {
            public ID TableInstanceID;
            public float LastOuterHeight;
            public float LastTopHeadersRowHeight;
            public float LastFrozenHeight;
            public int32 HoveredRowLast;
            public int32 HoveredRowNext;
        
            [LinkName("ImGuiTableInstanceData_ImGuiTableInstanceData")]
            private static extern TableInstanceData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableSettings
        {
            public ID ID;
            public TableFlags SaveFlags;
            public float RefScale;
            public TableColumnIdx ColumnsCount;
            public TableColumnIdx ColumnsCountMax;
            public bool WantApply;
        
            [LinkName("ImGuiTableSettings_ImGuiTableSettings")]
            private static extern TableSettings* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiTableSettings_GetColumnSettings")]
            private static extern TableColumnSettings* GetColumnSettingsImpl(Self* self);
            public TableColumnSettings* GetColumnSettings() mut=> GetColumnSettingsImpl(&this);
            
        }
        
        [CRepr]
        public struct TableSortSpecs
        {
            public TableColumnSortSpecs* Specs;
            public int32 SpecsCount;
            public bool SpecsDirty;
        
            [LinkName("ImGuiTableSortSpecs_ImGuiTableSortSpecs")]
            private static extern TableSortSpecs* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableTempData
        {
            public int32 TableIndex;
            public float LastTimeActive;
            public float AngledHeadersExtraWidth;
            public Vector<TableHeaderData> AngledHeadersRequests;
            public Vec2 UserOuterSize;
            public DrawListSplitter DrawSplitter;
            public Rect HostBackupWorkRect;
            public Rect HostBackupParentWorkRect;
            public Vec2 HostBackupPrevLineSize;
            public Vec2 HostBackupCurrLineSize;
            public Vec2 HostBackupCursorMaxPos;
            public Vec1 HostBackupColumnsOffset;
            public float HostBackupItemWidth;
            public int32 HostBackupItemWidthStackSize;
        
            [LinkName("ImGuiTableTempData_ImGuiTableTempData")]
            private static extern TableTempData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TextBuffer
        {
            public Vector<char> Buf;
        
            [LinkName("ImGuiTextBuffer_ImGuiTextBuffer")]
            private static extern TextBuffer* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiTextBuffer_append")]
            private static extern void AppendImpl(Self* self, char* str, char* str_end);
            public void Append(char* str, char* str_end = null) mut=> AppendImpl(&this, str, str_end);
            
            [LinkName("ImGuiTextBuffer_appendf")]
            private static extern void AppendfImpl(Self* self, char* fmt, ...);
            public void Appendf(char* fmt, params Object[] args) mut=> AppendfImpl(&this, scope String()..AppendF(StringView(fmt), params args));
            
            [LinkName("ImGuiTextBuffer_begin")]
            private static extern char* BeginImpl(Self* self);
            public char* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImGuiTextBuffer_c_str")]
            private static extern char* CStrImpl(Self* self);
            public char* CStr() mut=> CStrImpl(&this);
            
            [LinkName("ImGuiTextBuffer_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiTextBuffer_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImGuiTextBuffer_end")]
            private static extern char* EndImpl(Self* self);
            public char* End() mut=> EndImpl(&this);
            
            [LinkName("ImGuiTextBuffer_reserve")]
            private static extern void ReserveImpl(Self* self, int32 capacity);
            public void Reserve(int32 capacity) mut=> ReserveImpl(&this, capacity);
            
            [LinkName("ImGuiTextBuffer_resize")]
            private static extern void ResizeImpl(Self* self, int32 size);
            public void Resize(int32 size) mut=> ResizeImpl(&this, size);
            
            [LinkName("ImGuiTextBuffer_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
        }
        
        [CRepr]
        public struct TextFilter
        {
            public char[256] InputBuf;
            public Vector<TextRange> Filters;
            public int32 CountGrep;
        
            [LinkName("ImGuiTextFilter_ImGuiTextFilter")]
            private static extern TextFilter* CtorImpl(char* default_filter);
            public this(char* default_filter = "")
            {
                this = *CtorImpl(default_filter);
            }
            
            [LinkName("ImGuiTextFilter_Build")]
            private static extern void BuildImpl(Self* self);
            public void Build() mut=> BuildImpl(&this);
            
            [LinkName("ImGuiTextFilter_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiTextFilter_Draw")]
            private static extern bool DrawImpl(Self* self, char* label, float width);
            public bool Draw(char* label = "Filter(inc,-exc)", float width = (float) 0.0f) mut=> DrawImpl(&this, label, width);
            
            [LinkName("ImGuiTextFilter_IsActive")]
            private static extern bool IsActiveImpl(Self* self);
            public bool IsActive() mut=> IsActiveImpl(&this);
            
            [LinkName("ImGuiTextFilter_PassFilter")]
            private static extern bool PassFilterImpl(Self* self, char* text, char* text_end);
            public bool PassFilter(char* text, char* text_end = null) mut=> PassFilterImpl(&this, text, text_end);
            
        }
        
        [CRepr]
        public struct TextIndex
        {
            public Vector<int32> LineOffsets;
            public int32 EndOffset;
        
            [LinkName("ImGuiTextIndex_append")]
            private static extern void AppendImpl(Self* self, char* base_, int32 old_size, int32 new_size);
            public void Append(char* base_, int32 old_size, int32 new_size) mut=> AppendImpl(&this, base_, old_size, new_size);
            
            [LinkName("ImGuiTextIndex_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiTextIndex_get_line_begin")]
            private static extern char* GetLineBeginImpl(Self* self, char* base_, int32 n);
            public char* GetLineBegin(char* base_, int32 n) mut=> GetLineBeginImpl(&this, base_, n);
            
            [LinkName("ImGuiTextIndex_get_line_end")]
            private static extern char* GetLineEndImpl(Self* self, char* base_, int32 n);
            public char* GetLineEnd(char* base_, int32 n) mut=> GetLineEndImpl(&this, base_, n);
            
            [LinkName("ImGuiTextIndex_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
        }
        
        [CRepr]
        public struct TextRange
        {
            public char* b;
            public char* e;
        
            [LinkName("ImGuiTextRange_ImGuiTextRange_Nil")]
            private static extern TextRange* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiTextRange_ImGuiTextRange_Str")]
            private static extern TextRange* CtorImpl(char* _b, char* _e);
            public this(char* _b, char* _e)
            {
                this = *CtorImpl(_b, _e);
            }
            
            [LinkName("ImGuiTextRange_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImGuiTextRange_split")]
            private static extern void SplitImpl(Self* self, char separator, Vector<TextRange*> out_);
            public void Split(char separator, Vector<TextRange*> out_) mut=> SplitImpl(&this, separator, out_);
            
        }
        
        [CRepr]
        public struct TreeNodeStackData
        {
            public ID ID;
            public TreeNodeFlags TreeFlags;
            public ItemFlags ItemFlags;
            public Rect NavRect;
            public float DrawLinesX1;
            public float DrawLinesToNodesY2;
            public TableColumnIdx DrawLinesTableColumn;
        
        }
        
        [CRepr]
        public struct TypingSelectRequest
        {
            public TypingSelectFlags Flags;
            public int32 SearchBufferLen;
            public char* SearchBuffer;
            public bool SelectRequest;
            public bool SingleCharMode;
            public S8 SingleCharSize;
        
        }
        
        [CRepr]
        public struct TypingSelectState
        {
            public TypingSelectRequest Request;
            public char[64] SearchBuffer;
            public ID FocusScope;
            public int32 LastRequestFrame;
            public float LastRequestTime;
            public bool SingleCharModeLock;
        
            [LinkName("ImGuiTypingSelectState_ImGuiTypingSelectState")]
            private static extern TypingSelectState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiTypingSelectState_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
        }
        
        [CRepr]
        public struct Viewport
        {
            public ID ID;
            public ViewportFlags Flags;
            public Vec2 Pos;
            public Vec2 Size;
            public Vec2 FramebufferScale;
            public Vec2 WorkPos;
            public Vec2 WorkSize;
            public float DpiScale;
            public ID ParentViewportId;
            public DrawData* DrawData;
            public void* RendererUserData;
            public void* PlatformUserData;
            public void* PlatformHandle;
            public void* PlatformHandleRaw;
            public bool PlatformWindowCreated;
            public bool PlatformRequestMove;
            public bool PlatformRequestResize;
            public bool PlatformRequestClose;
        
            [LinkName("ImGuiViewport_ImGuiViewport")]
            private static extern Viewport* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiViewport_GetCenter")]
            private static extern Vec2 GetCenterImpl(Vec2* pOut, Self* self);
            public Vec2 GetCenter() mut
            {
                Vec2 pOut = default;
                GetCenterImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewport_GetWorkCenter")]
            private static extern Vec2 GetWorkCenterImpl(Vec2* pOut, Self* self);
            public Vec2 GetWorkCenter() mut
            {
                Vec2 pOut = default;
                GetWorkCenterImpl(&pOut, &this);
                return pOut;
            }
            
        }
        
        [CRepr]
        public struct ViewportP
        {
            public Viewport _ImGuiViewport;
            public Window* Window;
            public int32 Idx;
            public int32 LastFrameActive;
            public int32 LastFocusedStampCount;
            public ID LastNameHash;
            public Vec2 LastPos;
            public Vec2 LastSize;
            public float Alpha;
            public float LastAlpha;
            public bool LastFocusedHadNavWindow;
            public short PlatformMonitor;
            public int32[2] BgFgDrawListsLastFrame;
            public DrawList*[2] BgFgDrawLists;
            public DrawData DrawDataP;
            public DrawDataBuilder DrawDataBuilder;
            public Vec2 LastPlatformPos;
            public Vec2 LastPlatformSize;
            public Vec2 LastRendererSize;
            public Vec2 WorkInsetMin;
            public Vec2 WorkInsetMax;
            public Vec2 BuildWorkInsetMin;
            public Vec2 BuildWorkInsetMax;
        
            [LinkName("ImGuiViewportP_ImGuiViewportP")]
            private static extern ViewportP* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiViewportP_CalcWorkRectPos")]
            private static extern Vec2 CalcWorkRectPosImpl(Vec2* pOut, Self* self, Vec2 inset_min);
            public Vec2 CalcWorkRectPos(Vec2 inset_min) mut
            {
                Vec2 pOut = default;
                CalcWorkRectPosImpl(&pOut, &this, inset_min);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_CalcWorkRectSize")]
            private static extern Vec2 CalcWorkRectSizeImpl(Vec2* pOut, Self* self, Vec2 inset_min, Vec2 inset_max);
            public Vec2 CalcWorkRectSize(Vec2 inset_min, Vec2 inset_max) mut
            {
                Vec2 pOut = default;
                CalcWorkRectSizeImpl(&pOut, &this, inset_min, inset_max);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_ClearRequestFlags")]
            private static extern void ClearRequestFlagsImpl(Self* self);
            public void ClearRequestFlags() mut=> ClearRequestFlagsImpl(&this);
            
            [LinkName("ImGuiViewportP_GetBuildWorkRect")]
            private static extern Rect GetBuildWorkRectImpl(Rect* pOut, Self* self);
            public Rect GetBuildWorkRect() mut
            {
                Rect pOut = default;
                GetBuildWorkRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_GetMainRect")]
            private static extern Rect GetMainRectImpl(Rect* pOut, Self* self);
            public Rect GetMainRect() mut
            {
                Rect pOut = default;
                GetMainRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_GetWorkRect")]
            private static extern Rect GetWorkRectImpl(Rect* pOut, Self* self);
            public Rect GetWorkRect() mut
            {
                Rect pOut = default;
                GetWorkRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_UpdateWorkRect")]
            private static extern void UpdateWorkRectImpl(Self* self);
            public void UpdateWorkRect() mut=> UpdateWorkRectImpl(&this);
            
        }
        
        [CRepr]
        public struct Window
        {
            public Context* Ctx;
            public char* Name;
            public ID ID;
            public WindowFlags Flags;
            public WindowFlags FlagsPreviousFrame;
            public ChildFlags ChildFlags;
            public WindowClass WindowClass;
            public ViewportP* Viewport;
            public ID ViewportId;
            public Vec2 ViewportPos;
            public int32 ViewportAllowPlatformMonitorExtend;
            public Vec2 Pos;
            public Vec2 Size;
            public Vec2 SizeFull;
            public Vec2 ContentSize;
            public Vec2 ContentSizeIdeal;
            public Vec2 ContentSizeExplicit;
            public Vec2 WindowPadding;
            public float WindowRounding;
            public float WindowBorderSize;
            public float TitleBarHeight;
            public float MenuBarHeight;
            public float DecoOuterSizeX1;
            public float DecoOuterSizeY1;
            public float DecoOuterSizeX2;
            public float DecoOuterSizeY2;
            public float DecoInnerSizeX1;
            public float DecoInnerSizeY1;
            public int32 NameBufLen;
            public ID MoveId;
            public ID TabId;
            public ID ChildId;
            public ID PopupId;
            public Vec2 Scroll;
            public Vec2 ScrollMax;
            public Vec2 ScrollTarget;
            public Vec2 ScrollTargetCenterRatio;
            public Vec2 ScrollTargetEdgeSnapDist;
            public Vec2 ScrollbarSizes;
            public bool ScrollbarX;
            public bool ScrollbarY;
            public bool ScrollbarXStabilizeEnabled;
            public U8 ScrollbarXStabilizeToggledHistory;
            public bool ViewportOwned;
            public bool Active;
            public bool WasActive;
            public bool WriteAccessed;
            public bool Collapsed;
            public bool WantCollapseToggle;
            public bool SkipItems;
            public bool SkipRefresh;
            public bool Appearing;
            public bool Hidden;
            public bool IsFallbackWindow;
            public bool IsExplicitChild;
            public bool HasCloseButton;
            public char ResizeBorderHovered;
            public char ResizeBorderHeld;
            public short BeginCount;
            public short BeginCountPreviousFrame;
            public short BeginOrderWithinParent;
            public short BeginOrderWithinContext;
            public short FocusOrder;
            public S8 AutoFitFramesX;
            public S8 AutoFitFramesY;
            public bool AutoFitOnlyGrows;
            public Dir AutoPosLastDirection;
            public S8 HiddenFramesCanSkipItems;
            public S8 HiddenFramesCannotSkipItems;
            public S8 HiddenFramesForRenderOnly;
            public S8 DisableInputsFrames;
            public Cond SetWindowPosAllowFlags;
            public Cond SetWindowSizeAllowFlags;
            public Cond SetWindowCollapsedAllowFlags;
            public Cond SetWindowDockAllowFlags;
            public Vec2 SetWindowPosVal;
            public Vec2 SetWindowPosPivot;
            public Vector<ID> IDStack;
            public WindowTempData DC;
            public Rect OuterRectClipped;
            public Rect InnerRect;
            public Rect InnerClipRect;
            public Rect WorkRect;
            public Rect ParentWorkRect;
            public Rect ClipRect;
            public Rect ContentRegionRect;
            public Vec2ih HitTestHoleSize;
            public Vec2ih HitTestHoleOffset;
            public int32 LastFrameActive;
            public int32 LastFrameJustFocused;
            public float LastTimeActive;
            public float ItemWidthDefault;
            public Storage StateStorage;
            public Vector<OldColumns> ColumnsStorage;
            public float FontWindowScale;
            public float FontWindowScaleParents;
            public float FontRefSize;
            public int32 SettingsOffset;
            public DrawList* DrawList;
            public DrawList DrawListInst;
            public Window* ParentWindow;
            public Window* ParentWindowInBeginStack;
            public Window* RootWindow;
            public Window* RootWindowPopupTree;
            public Window* RootWindowDockTree;
            public Window* RootWindowForTitleBarHighlight;
            public Window* RootWindowForNav;
            public Window* ParentWindowForFocusRoute;
            public Window* NavLastChildNavWindow;
            public ID[2] NavLastIds;
            public Rect[2] NavRectRel;
            public Vec2[2] NavPreferredScoringPosRel;
            public ID NavRootFocusScopeId;
            public int32 MemoryDrawListIdxCapacity;
            public int32 MemoryDrawListVtxCapacity;
            public bool MemoryCompacted;
            public bool DockIsActive;
            public bool DockNodeIsVisible;
            public bool DockTabIsVisible;
            public bool DockTabWantClose;
            public short DockOrder;
            public WindowDockStyle DockStyle;
            public DockNode* DockNode;
            public DockNode* DockNodeAsHost;
            public ID DockId;
        
            [LinkName("ImGuiWindow_ImGuiWindow")]
            private static extern Window* CtorImpl(Context* context, char* name);
            public this(Context* context, char* name)
            {
                this = *CtorImpl(context, name);
            }
            
            [LinkName("ImGuiWindow_GetID_Str")]
            private static extern ID GetIDImpl(Self* self, char* str, char* str_end);
            public ID GetID(char* str, char* str_end = null) mut=> GetIDImpl(&this, str, str_end);
            
            [LinkName("ImGuiWindow_GetID_Ptr")]
            private static extern ID GetIDImpl(Self* self, void* ptr);
            public ID GetID(void* ptr) mut=> GetIDImpl(&this, ptr);
            
            [LinkName("ImGuiWindow_GetID_Int")]
            private static extern ID GetIDImpl(Self* self, int32 n);
            public ID GetID(int32 n) mut=> GetIDImpl(&this, n);
            
            [LinkName("ImGuiWindow_GetIDFromPos")]
            private static extern ID GetIDFromPosImpl(Self* self, Vec2 p_abs);
            public ID GetIDFromPos(Vec2 p_abs) mut=> GetIDFromPosImpl(&this, p_abs);
            
            [LinkName("ImGuiWindow_GetIDFromRectangle")]
            private static extern ID GetIDFromRectangleImpl(Self* self, Rect r_abs);
            public ID GetIDFromRectangle(Rect r_abs) mut=> GetIDFromRectangleImpl(&this, r_abs);
            
            [LinkName("ImGuiWindow_MenuBarRect")]
            private static extern Rect MenuBarRectImpl(Rect* pOut, Self* self);
            public Rect MenuBarRect() mut
            {
                Rect pOut = default;
                MenuBarRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiWindow_Rect")]
            private static extern Rect RectImpl(Rect* pOut, Self* self);
            public Rect Rect() mut
            {
                Rect pOut = default;
                RectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiWindow_TitleBarRect")]
            private static extern Rect TitleBarRectImpl(Rect* pOut, Self* self);
            public Rect TitleBarRect() mut
            {
                Rect pOut = default;
                TitleBarRectImpl(&pOut, &this);
                return pOut;
            }
            
        }
        
        [CRepr]
        public struct WindowClass
        {
            public ID ClassId;
            public ID ParentViewportId;
            public ID FocusRouteParentWindowId;
            public ViewportFlags ViewportFlagsOverrideSet;
            public ViewportFlags ViewportFlagsOverrideClear;
            public TabItemFlags TabItemFlagsOverrideSet;
            public DockNodeFlags DockNodeFlagsOverrideSet;
            public bool DockingAlwaysTabBar;
            public bool DockingAllowUnclassed;
        
            [LinkName("ImGuiWindowClass_ImGuiWindowClass")]
            private static extern WindowClass* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct WindowDockStyle
        {
            public U32[8] Colors;
        
        }
        
        [CRepr]
        public struct WindowSettings
        {
            public ID ID;
            public Vec2ih Pos;
            public Vec2ih Size;
            public Vec2ih ViewportPos;
            public ID ViewportId;
            public ID DockId;
            public ID ClassId;
            public short DockOrder;
            public bool Collapsed;
            public bool IsChild;
            public bool WantApply;
            public bool WantDelete;
        
            [LinkName("ImGuiWindowSettings_ImGuiWindowSettings")]
            private static extern WindowSettings* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiWindowSettings_GetName")]
            private static extern char* GetNameImpl(Self* self);
            public char* GetName() mut=> GetNameImpl(&this);
            
        }
        
        [CRepr]
        public struct WindowStackData
        {
            public Window* Window;
            public LastItemData ParentLastItemDataBackup;
            public ErrorRecoveryState StackSizesInBegin;
            public bool DisabledOverrideReenable;
            public float DisabledOverrideReenableAlphaBackup;
        
        }
        
        [CRepr]
        public struct WindowTempData
        {
            public Vec2 CursorPos;
            public Vec2 CursorPosPrevLine;
            public Vec2 CursorStartPos;
            public Vec2 CursorMaxPos;
            public Vec2 IdealMaxPos;
            public Vec2 CurrLineSize;
            public Vec2 PrevLineSize;
            public float CurrLineTextBaseOffset;
            public float PrevLineTextBaseOffset;
            public bool IsSameLine;
            public bool IsSetPos;
            public Vec1 Indent;
            public Vec1 ColumnsOffset;
            public Vec1 GroupOffset;
            public Vec2 CursorStartPosLossyness;
            public NavLayer NavLayerCurrent;
            public short NavLayersActiveMask;
            public short NavLayersActiveMaskNext;
            public bool NavIsScrollPushableX;
            public bool NavHideHighlightOneFrame;
            public bool NavWindowHasScrollY;
            public bool MenuBarAppending;
            public Vec2 MenuBarOffset;
            public MenuColumns MenuColumns;
            public int32 TreeDepth;
            public U32 TreeHasStackDataDepthMask;
            public U32 TreeRecordsClippedNodesY2Mask;
            public Vector<Window*> ChildWindows;
            public Storage* StateStorage;
            public OldColumns* CurrentColumns;
            public int32 CurrentTableIdx;
            public LayoutType LayoutType;
            public LayoutType ParentLayoutType;
            public U32 ModalDimBgColor;
            public ItemStatusFlags WindowItemStatusFlags;
            public ItemStatusFlags ChildItemStatusFlags;
            public ItemStatusFlags DockTabItemStatusFlags;
            public Rect DockTabItemRect;
            public float ItemWidth;
            public float TextWrapPos;
            public Vector<float> ItemWidthStack;
            public Vector<float> TextWrapPosStack;
        
        }
        
        [CRepr]
        public struct Rect
        {
            public Vec2 Min;
            public Vec2 Max;
        
            [LinkName("ImRect_ImRect_Nil")]
            private static extern Rect* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImRect_ImRect_Vec2")]
            private static extern Rect* CtorImpl(Vec2 min, Vec2 max);
            public this(Vec2 min, Vec2 max)
            {
                this = *CtorImpl(min, max);
            }
            
            [LinkName("ImRect_ImRect_Vec4")]
            private static extern Rect* CtorImpl(Vec4 v);
            public this(Vec4 v)
            {
                this = *CtorImpl(v);
            }
            
            [LinkName("ImRect_ImRect_Float")]
            private static extern Rect* CtorImpl(float x1, float y1, float x2, float y2);
            public this(float x1, float y1, float x2, float y2)
            {
                this = *CtorImpl(x1, y1, x2, y2);
            }
            
            [LinkName("ImRect_Add_Vec2")]
            private static extern void AddImpl(Self* self, Vec2 p);
            public void Add(Vec2 p) mut=> AddImpl(&this, p);
            
            [LinkName("ImRect_Add_Rect")]
            private static extern void AddImpl(Self* self, Rect r);
            public void Add(Rect r) mut=> AddImpl(&this, r);
            
            [LinkName("ImRect_ClipWith")]
            private static extern void ClipWithImpl(Self* self, Rect r);
            public void ClipWith(Rect r) mut=> ClipWithImpl(&this, r);
            
            [LinkName("ImRect_ClipWithFull")]
            private static extern void ClipWithFullImpl(Self* self, Rect r);
            public void ClipWithFull(Rect r) mut=> ClipWithFullImpl(&this, r);
            
            [LinkName("ImRect_Contains_Vec2")]
            private static extern bool ContainsImpl(Self* self, Vec2 p);
            public bool Contains(Vec2 p) mut=> ContainsImpl(&this, p);
            
            [LinkName("ImRect_Contains_Rect")]
            private static extern bool ContainsImpl(Self* self, Rect r);
            public bool Contains(Rect r) mut=> ContainsImpl(&this, r);
            
            [LinkName("ImRect_ContainsWithPad")]
            private static extern bool ContainsWithPadImpl(Self* self, Vec2 p, Vec2 pad);
            public bool ContainsWithPad(Vec2 p, Vec2 pad) mut=> ContainsWithPadImpl(&this, p, pad);
            
            [LinkName("ImRect_Expand_Float")]
            private static extern void ExpandImpl(Self* self, float amount);
            public void Expand(float amount) mut=> ExpandImpl(&this, amount);
            
            [LinkName("ImRect_Expand_Vec2")]
            private static extern void ExpandImpl(Self* self, Vec2 amount);
            public void Expand(Vec2 amount) mut=> ExpandImpl(&this, amount);
            
            [LinkName("ImRect_Floor")]
            private static extern void FloorImpl(Self* self);
            public void Floor() mut=> FloorImpl(&this);
            
            [LinkName("ImRect_GetArea")]
            private static extern float GetAreaImpl(Self* self);
            public float GetArea() mut=> GetAreaImpl(&this);
            
            [LinkName("ImRect_GetBL")]
            private static extern Vec2 GetBLImpl(Vec2* pOut, Self* self);
            public Vec2 GetBL() mut
            {
                Vec2 pOut = default;
                GetBLImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetBR")]
            private static extern Vec2 GetBRImpl(Vec2* pOut, Self* self);
            public Vec2 GetBR() mut
            {
                Vec2 pOut = default;
                GetBRImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetCenter")]
            private static extern Vec2 GetCenterImpl(Vec2* pOut, Self* self);
            public Vec2 GetCenter() mut
            {
                Vec2 pOut = default;
                GetCenterImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetHeight")]
            private static extern float GetHeightImpl(Self* self);
            public float GetHeight() mut=> GetHeightImpl(&this);
            
            [LinkName("ImRect_GetSize")]
            private static extern Vec2 GetSizeImpl(Vec2* pOut, Self* self);
            public Vec2 GetSize() mut
            {
                Vec2 pOut = default;
                GetSizeImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetTL")]
            private static extern Vec2 GetTLImpl(Vec2* pOut, Self* self);
            public Vec2 GetTL() mut
            {
                Vec2 pOut = default;
                GetTLImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetTR")]
            private static extern Vec2 GetTRImpl(Vec2* pOut, Self* self);
            public Vec2 GetTR() mut
            {
                Vec2 pOut = default;
                GetTRImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetWidth")]
            private static extern float GetWidthImpl(Self* self);
            public float GetWidth() mut=> GetWidthImpl(&this);
            
            [LinkName("ImRect_IsInverted")]
            private static extern bool IsInvertedImpl(Self* self);
            public bool IsInverted() mut=> IsInvertedImpl(&this);
            
            [LinkName("ImRect_Overlaps")]
            private static extern bool OverlapsImpl(Self* self, Rect r);
            public bool Overlaps(Rect r) mut=> OverlapsImpl(&this, r);
            
            [LinkName("ImRect_ToVec4")]
            private static extern Vec4 ToVec4Impl(Vec4* pOut, Self* self);
            public Vec4 ToVec4() mut
            {
                Vec4 pOut = default;
                ToVec4Impl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_Translate")]
            private static extern void TranslateImpl(Self* self, Vec2 d);
            public void Translate(Vec2 d) mut=> TranslateImpl(&this, d);
            
            [LinkName("ImRect_TranslateX")]
            private static extern void TranslateXImpl(Self* self, float dx);
            public void TranslateX(float dx) mut=> TranslateXImpl(&this, dx);
            
            [LinkName("ImRect_TranslateY")]
            private static extern void TranslateYImpl(Self* self, float dy);
            public void TranslateY(float dy) mut=> TranslateYImpl(&this, dy);
            
        }
        
        [CRepr]
        public struct TextureData
        {
            public int32 UniqueID;
            public TextureStatus Status;
            public void* BackendUserData;
            public TextureID TexID;
            public TextureFormat Format;
            public int32 Width;
            public int32 Height;
            public int32 BytesPerPixel;
            public uchar* Pixels;
            public TextureRect UsedRect;
            public TextureRect UpdateRect;
            public Vector<TextureRect> Updates;
            public int32 UnusedFrames;
            public ushort RefCount;
            public bool UseColors;
            public bool WantDestroyNextFrame;
        
            [LinkName("ImTextureData_ImTextureData")]
            private static extern TextureData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImTextureData_Create")]
            private static extern void CreateImpl(Self* self, TextureFormat format, int32 w, int32 h);
            public void Create(TextureFormat format, int32 w, int32 h) mut=> CreateImpl(&this, format, w, h);
            
            [LinkName("ImTextureData_DestroyPixels")]
            private static extern void DestroyPixelsImpl(Self* self);
            public void DestroyPixels() mut=> DestroyPixelsImpl(&this);
            
            [LinkName("ImTextureData_GetPitch")]
            private static extern int32 GetPitchImpl(Self* self);
            public int32 GetPitch() mut=> GetPitchImpl(&this);
            
            [LinkName("ImTextureData_GetPixels")]
            private static extern void* GetPixelsImpl(Self* self);
            public void* GetPixels() mut=> GetPixelsImpl(&this);
            
            [LinkName("ImTextureData_GetPixelsAt")]
            private static extern void* GetPixelsAtImpl(Self* self, int32 x, int32 y);
            public void* GetPixelsAt(int32 x, int32 y) mut=> GetPixelsAtImpl(&this, x, y);
            
            [LinkName("ImTextureData_GetSizeInBytes")]
            private static extern int32 GetSizeInBytesImpl(Self* self);
            public int32 GetSizeInBytes() mut=> GetSizeInBytesImpl(&this);
            
            [LinkName("ImTextureData_GetTexID")]
            private static extern TextureID GetTexIDImpl(Self* self);
            public TextureID GetTexID() mut=> GetTexIDImpl(&this);
            
            [LinkName("ImTextureData_GetTexRef")]
            private static extern TextureRef GetTexRefImpl(TextureRef* pOut, Self* self);
            public TextureRef GetTexRef() mut
            {
                TextureRef pOut = default;
                GetTexRefImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImTextureData_SetStatus")]
            private static extern void SetStatusImpl(Self* self, TextureStatus status);
            public void SetStatus(TextureStatus status) mut=> SetStatusImpl(&this, status);
            
            [LinkName("ImTextureData_SetTexID")]
            private static extern void SetTexIDImpl(Self* self, TextureID tex_id);
            public void SetTexID(TextureID tex_id) mut=> SetTexIDImpl(&this, tex_id);
            
        }
        
        [CRepr]
        public struct TextureRect
        {
            public ushort x;
            public ushort y;
            public ushort w;
            public ushort h;
        
        }
        
        [CRepr]
        public struct TextureRef
        {
            public TextureData* _TexData;
            public TextureID _TexID;
        
            [LinkName("ImTextureRef_ImTextureRef_Nil")]
            private static extern TextureRef* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImTextureRef_ImTextureRef_TextureID")]
            private static extern TextureRef* CtorImpl(TextureID tex_id);
            public this(TextureID tex_id)
            {
                this = *CtorImpl(tex_id);
            }
            
            [LinkName("ImTextureRef_GetTexID")]
            private static extern TextureID GetTexIDImpl(Self* self);
            public TextureID GetTexID() mut=> GetTexIDImpl(&this);
            
        }
        
        [CRepr]
        public struct Vec1
        {
            public float x;
        
            [LinkName("ImVec1_ImVec1_Nil")]
            private static extern Vec1* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImVec1_ImVec1_Float")]
            private static extern Vec1* CtorImpl(float _x);
            public this(float _x)
            {
                this = *CtorImpl(_x);
            }
            
        }
        
        [CRepr]
        public struct Vec2
        {
            public float x;
            public float y;
        
            public this()
            {
                x = 0;
                y = 0;
            }
            
            public this(float x, float y)
            {
                this.x = x;
                this.y = y;
            }
            
        }
        
        [CRepr]
        public struct Vec2i
        {
            public int32 x;
            public int32 y;
        
            [LinkName("ImVec2i_ImVec2i_Nil")]
            private static extern Vec2i* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImVec2i_ImVec2i_Int")]
            private static extern Vec2i* CtorImpl(int32 _x, int32 _y);
            public this(int32 _x, int32 _y)
            {
                this = *CtorImpl(_x, _y);
            }
            
        }
        
        [CRepr]
        public struct Vec2ih
        {
            public short x;
            public short y;
        
            [LinkName("ImVec2ih_ImVec2ih_Nil")]
            private static extern Vec2ih* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImVec2ih_ImVec2ih_short")]
            private static extern Vec2ih* CtorImpl(short _x, short _y);
            public this(short _x, short _y)
            {
                this = *CtorImpl(_x, _y);
            }
            
            [LinkName("ImVec2ih_ImVec2ih_Vec2")]
            private static extern Vec2ih* CtorImpl(Vec2 rhs);
            public this(Vec2 rhs)
            {
                this = *CtorImpl(rhs);
            }
            
        }
        
        [CRepr]
        public struct Vec4
        {
            public float x;
            public float y;
            public float z;
            public float w;
        
            public this()
            {
            	x = 0;
            	y = 0;
            	z = 0;
            	w = 0;
            }
            
            public this(float x, float y, float z, float w)
            {
            	this.x = x;
            	this.y = y;
            	this.z = z;
            	this.w = w;
            }
            
        }
        
        [CRepr]
        public struct stbrp_context_opaque
        {
            public char[80] data;
        
        }
        
        [CRepr]
        public struct Vector<T>
        {
            public int32 Size;
            public int32 Capacity;
            public T* Data;
        
            [LinkName("ImVector_ImVector_Nil")]
            private static extern Vector<T>* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImVector_ImVector_Vector_T_")]
            private static extern Vector<T>* CtorImpl(Vector<T> src);
            public this(Vector<T> src)
            {
                this = *CtorImpl(src);
            }
            
            [LinkName("ImVector__grow_capacity")]
            private static extern int32 GrowCapacityImpl(Self* self, int32 sz);
            public int32 GrowCapacity(int32 sz) mut=> GrowCapacityImpl(&this, sz);
            
            [LinkName("ImVector_back_Nil")]
            private static extern T* BackImpl(Self* self);
            public T* Back() mut=> BackImpl(&this);
            
            [LinkName("ImVector_begin_Nil")]
            private static extern T* BeginImpl(Self* self);
            public T* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImVector_capacity")]
            private static extern int32 CapacityImpl(Self* self);
            public int32 Capacity() mut=> CapacityImpl(&this);
            
            [LinkName("ImVector_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImVector_clear_delete")]
            private static extern void ClearDeleteImpl(Self* self);
            public void ClearDelete() mut=> ClearDeleteImpl(&this);
            
            [LinkName("ImVector_clear_destruct")]
            private static extern void ClearDestructImpl(Self* self);
            public void ClearDestruct() mut=> ClearDestructImpl(&this);
            
            [LinkName("ImVector_contains")]
            private static extern bool ContainsImpl(Self* self, T v);
            public bool Contains(T v) mut=> ContainsImpl(&this, v);
            
            [LinkName("ImVector_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImVector_end_Nil")]
            private static extern T* EndImpl(Self* self);
            public T* End() mut=> EndImpl(&this);
            
            [LinkName("ImVector_erase_Nil")]
            private static extern T* EraseImpl(Self* self, T* it);
            public T* Erase(T* it) mut=> EraseImpl(&this, it);
            
            [LinkName("ImVector_erase_TPtr")]
            private static extern T* EraseImpl(Self* self, T* it, T* it_last);
            public T* Erase(T* it, T* it_last) mut=> EraseImpl(&this, it, it_last);
            
            [LinkName("ImVector_erase_unsorted")]
            private static extern T* EraseUnsortedImpl(Self* self, T* it);
            public T* EraseUnsorted(T* it) mut=> EraseUnsortedImpl(&this, it);
            
            [LinkName("ImVector_find_Nil")]
            private static extern T* FindImpl(Self* self, T v);
            public T* Find(T v) mut=> FindImpl(&this, v);
            
            [LinkName("ImVector_find_erase")]
            private static extern bool FindEraseImpl(Self* self, T v);
            public bool FindErase(T v) mut=> FindEraseImpl(&this, v);
            
            [LinkName("ImVector_find_erase_unsorted")]
            private static extern bool FindEraseUnsortedImpl(Self* self, T v);
            public bool FindEraseUnsorted(T v) mut=> FindEraseUnsortedImpl(&this, v);
            
            [LinkName("ImVector_find_index")]
            private static extern int32 FindIndexImpl(Self* self, T v);
            public int32 FindIndex(T v) mut=> FindIndexImpl(&this, v);
            
            [LinkName("ImVector_front_Nil")]
            private static extern T* FrontImpl(Self* self);
            public T* Front() mut=> FrontImpl(&this);
            
            [LinkName("ImVector_index_from_ptr")]
            private static extern int32 IndexFromPtrImpl(Self* self, T* it);
            public int32 IndexFromPtr(T* it) mut=> IndexFromPtrImpl(&this, it);
            
            [LinkName("ImVector_insert")]
            private static extern T* InsertImpl(Self* self, T* it, T v);
            public T* Insert(T* it, T v) mut=> InsertImpl(&this, it, v);
            
            [LinkName("ImVector_max_size")]
            private static extern int32 MaxSizeImpl(Self* self);
            public int32 MaxSize() mut=> MaxSizeImpl(&this);
            
            [LinkName("ImVector_pop_back")]
            private static extern void PopBackImpl(Self* self);
            public void PopBack() mut=> PopBackImpl(&this);
            
            [LinkName("ImVector_push_back")]
            private static extern void PushBackImpl(Self* self, T v);
            public void PushBack(T v) mut=> PushBackImpl(&this, v);
            
            [LinkName("ImVector_push_front")]
            private static extern void PushFrontImpl(Self* self, T v);
            public void PushFront(T v) mut=> PushFrontImpl(&this, v);
            
            [LinkName("ImVector_reserve")]
            private static extern void ReserveImpl(Self* self, int32 new_capacity);
            public void Reserve(int32 new_capacity) mut=> ReserveImpl(&this, new_capacity);
            
            [LinkName("ImVector_reserve_discard")]
            private static extern void ReserveDiscardImpl(Self* self, int32 new_capacity);
            public void ReserveDiscard(int32 new_capacity) mut=> ReserveDiscardImpl(&this, new_capacity);
            
            [LinkName("ImVector_resize_Nil")]
            private static extern void ResizeImpl(Self* self, int32 new_size);
            public void Resize(int32 new_size) mut=> ResizeImpl(&this, new_size);
            
            [LinkName("ImVector_resize_T")]
            private static extern void ResizeImpl(Self* self, int32 new_size, T v);
            public void Resize(int32 new_size, T v) mut=> ResizeImpl(&this, new_size, v);
            
            [LinkName("ImVector_shrink")]
            private static extern void ShrinkImpl(Self* self, int32 new_size);
            public void Shrink(int32 new_size) mut=> ShrinkImpl(&this, new_size);
            
            [LinkName("ImVector_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
            [LinkName("ImVector_size_in_bytes")]
            private static extern int32 SizeInBytesImpl(Self* self);
            public int32 SizeInBytes() mut=> SizeInBytesImpl(&this);
            
            [LinkName("ImVector_swap")]
            private static extern void SwapImpl(Self* self, Vector<T>* rhs);
            public void Swap(ref Vector<T> rhs) mut=> SwapImpl(&this, &rhs);
            
        }
        
        [CRepr]
        public struct BitArray<BitCount, Offset> where BitCount : const int where Offset : const int
        {
            public U32[(BitCount + 32) >> 5] Storage;
        
            [LinkName("ImBitArray_ClearAllBits")]
            private static extern void ClearAllBitsImpl(Self* self);
            public void ClearAllBits() mut=> ClearAllBitsImpl(&this);
            
            [LinkName("ImBitArray_ClearBit")]
            private static extern void ClearBitImpl(Self* self, int32 n);
            public void ClearBit(int32 n) mut=> ClearBitImpl(&this, n);
            
            [LinkName("ImBitArray_SetAllBits")]
            private static extern void SetAllBitsImpl(Self* self);
            public void SetAllBits() mut=> SetAllBitsImpl(&this);
            
            [LinkName("ImBitArray_SetBit")]
            private static extern void SetBitImpl(Self* self, int32 n);
            public void SetBit(int32 n) mut=> SetBitImpl(&this, n);
            
            [LinkName("ImBitArray_SetBitRange")]
            private static extern void SetBitRangeImpl(Self* self, int32 n, int32 n2);
            public void SetBitRange(int32 n, int32 n2) mut=> SetBitRangeImpl(&this, n, n2);
            
            [LinkName("ImBitArray_TestBit")]
            private static extern bool TestBitImpl(Self* self, int32 n);
            public bool TestBit(int32 n) mut=> TestBitImpl(&this, n);
            
        }
        
        [CRepr]
        public struct ChunkStream<T>
        {
            public Vector<char> Buf;
        
            [LinkName("ImChunkStream_alloc_chunk")]
            private static extern T* AllocChunkImpl(Self* self, size sz);
            public T* AllocChunk(size sz) mut=> AllocChunkImpl(&this, sz);
            
            [LinkName("ImChunkStream_begin")]
            private static extern T* BeginImpl(Self* self);
            public T* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImChunkStream_chunk_size")]
            private static extern int32 ChunkSizeImpl(Self* self, T* p);
            public int32 ChunkSize(T* p) mut=> ChunkSizeImpl(&this, p);
            
            [LinkName("ImChunkStream_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImChunkStream_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImChunkStream_end")]
            private static extern T* EndImpl(Self* self);
            public T* End() mut=> EndImpl(&this);
            
            [LinkName("ImChunkStream_next_chunk")]
            private static extern T* NextChunkImpl(Self* self, T* p);
            public T* NextChunk(T* p) mut=> NextChunkImpl(&this, p);
            
            [LinkName("ImChunkStream_offset_from_ptr")]
            private static extern int32 OffsetFromPtrImpl(Self* self, T* p);
            public int32 OffsetFromPtr(T* p) mut=> OffsetFromPtrImpl(&this, p);
            
            [LinkName("ImChunkStream_ptr_from_offset")]
            private static extern T* PtrFromOffsetImpl(Self* self, int32 off);
            public T* PtrFromOffset(int32 off) mut=> PtrFromOffsetImpl(&this, off);
            
            [LinkName("ImChunkStream_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
            [LinkName("ImChunkStream_swap")]
            private static extern void SwapImpl(Self* self, ChunkStream<T>* rhs);
            public void Swap(ref ChunkStream<T> rhs) mut=> SwapImpl(&this, &rhs);
            
        }
        
        [CRepr]
        public struct Pool<T>
        {
            public Vector<T> Buf;
            public Storage Map;
            public PoolIdx FreeIdx;
            public PoolIdx AliveCount;
        
            [LinkName("ImPool_Add")]
            private static extern T* AddImpl(Self* self);
            public T* Add() mut=> AddImpl(&this);
            
            [LinkName("ImPool_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImPool_Contains")]
            private static extern bool ContainsImpl(Self* self, T* p);
            public bool Contains(T* p) mut=> ContainsImpl(&this, p);
            
            [LinkName("ImPool_GetAliveCount")]
            private static extern int32 GetAliveCountImpl(Self* self);
            public int32 GetAliveCount() mut=> GetAliveCountImpl(&this);
            
            [LinkName("ImPool_GetBufSize")]
            private static extern int32 GetBufSizeImpl(Self* self);
            public int32 GetBufSize() mut=> GetBufSizeImpl(&this);
            
            [LinkName("ImPool_GetByIndex")]
            private static extern T* GetByIndexImpl(Self* self, PoolIdx n);
            public T* GetByIndex(PoolIdx n) mut=> GetByIndexImpl(&this, n);
            
            [LinkName("ImPool_GetByKey")]
            private static extern T* GetByKeyImpl(Self* self, ID key);
            public T* GetByKey(ID key) mut=> GetByKeyImpl(&this, key);
            
            [LinkName("ImPool_GetIndex")]
            private static extern PoolIdx GetIndexImpl(Self* self, T* p);
            public PoolIdx GetIndex(T* p) mut=> GetIndexImpl(&this, p);
            
            [LinkName("ImPool_GetMapSize")]
            private static extern int32 GetMapSizeImpl(Self* self);
            public int32 GetMapSize() mut=> GetMapSizeImpl(&this);
            
            [LinkName("ImPool_GetOrAddByKey")]
            private static extern T* GetOrAddByKeyImpl(Self* self, ID key);
            public T* GetOrAddByKey(ID key) mut=> GetOrAddByKeyImpl(&this, key);
            
            [LinkName("ImPool_Remove_TPtr")]
            private static extern void RemoveImpl(Self* self, ID key, T* p);
            public void Remove(ID key, T* p) mut=> RemoveImpl(&this, key, p);
            
            [LinkName("ImPool_Remove_PoolIdx")]
            private static extern void RemoveImpl(Self* self, ID key, PoolIdx idx);
            public void Remove(ID key, PoolIdx idx) mut=> RemoveImpl(&this, key, idx);
            
            [LinkName("ImPool_Reserve")]
            private static extern void ReserveImpl(Self* self, int32 capacity);
            public void Reserve(int32 capacity) mut=> ReserveImpl(&this, capacity);
            
            [LinkName("ImPool_TryGetMapData")]
            private static extern T* TryGetMapDataImpl(Self* self, PoolIdx n);
            public T* TryGetMapData(PoolIdx n) mut=> TryGetMapDataImpl(&this, n);
            
        }
        
        [CRepr]
        public struct SpanAllocator<T> where T : const int
        {
            public charPtr BasePtr;
            int32 CurrOff;
            int32 CurrIdx;
            int32[T] Offsets;
            int32[T] Sizes;
        
            [LinkName("ImSpanAllocator_GetArenaSizeInBytes")]
            private static extern int32 GetArenaSizeInBytesImpl(Self* self);
            public int32 GetArenaSizeInBytes() mut=> GetArenaSizeInBytesImpl(&this);
            
            [LinkName("ImSpanAllocator_GetSpanPtrBegin")]
            private static extern void* GetSpanPtrBeginImpl(Self* self, int32 n);
            public void* GetSpanPtrBegin(int32 n) mut=> GetSpanPtrBeginImpl(&this, n);
            
            [LinkName("ImSpanAllocator_GetSpanPtrEnd")]
            private static extern void* GetSpanPtrEndImpl(Self* self, int32 n);
            public void* GetSpanPtrEnd(int32 n) mut=> GetSpanPtrEndImpl(&this, n);
            
            [LinkName("ImSpanAllocator_Reserve")]
            private static extern void ReserveImpl(Self* self, int32 n, size sz, int32 a);
            public void Reserve(int32 n, size sz, int32 a = (int32) 4) mut=> ReserveImpl(&this, n, sz, a);
            
            [LinkName("ImSpanAllocator_SetArenaBasePtr")]
            private static extern void SetArenaBasePtrImpl(Self* self, void* base_ptr);
            public void SetArenaBasePtr(void* base_ptr) mut=> SetArenaBasePtrImpl(&this, base_ptr);
            
        }
        
        [CRepr]
        public struct Span<T>
        {
            public T* Data;
            public T* DataEnd;
        
            [LinkName("ImSpan_begin_Nil")]
            private static extern T* BeginImpl(Self* self);
            public T* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImSpan_end_Nil")]
            private static extern T* EndImpl(Self* self);
            public T* End() mut=> EndImpl(&this);
            
            [LinkName("ImSpan_index_from_ptr")]
            private static extern int32 IndexFromPtrImpl(Self* self, T* it);
            public int32 IndexFromPtr(T* it) mut=> IndexFromPtrImpl(&this, it);
            
            [LinkName("ImSpan_set_Int")]
            private static extern void SetImpl(Self* self, T* data, int32 size);
            public void Set(T* data, int32 size) mut=> SetImpl(&this, data, size);
            
            [LinkName("ImSpan_set_TPtr")]
            private static extern void SetImpl(Self* self, T* data, T* data_end);
            public void Set(T* data, T* data_end) mut=> SetImpl(&this, data, data_end);
            
            [LinkName("ImSpan_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
            [LinkName("ImSpan_size_in_bytes")]
            private static extern int32 SizeInBytesImpl(Self* self);
            public int32 SizeInBytes() mut=> SizeInBytesImpl(&this);
            
        }
        
        [CRepr]
        public struct StableVector<T>
        {
        
            [LinkName("ImStableVector_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImStableVector_push_back")]
            private static extern T* PushBackImpl(Self* self, T v);
            public T* PushBack(T v) mut=> PushBackImpl(&this, v);
            
            [LinkName("ImStableVector_reserve")]
            private static extern void ReserveImpl(Self* self, int32 new_cap);
            public void Reserve(int32 new_cap) mut=> ReserveImpl(&this, new_cap);
            
            [LinkName("ImStableVector_resize")]
            private static extern void ResizeImpl(Self* self, int32 new_size);
            public void Resize(int32 new_size) mut=> ResizeImpl(&this, new_size);
            
        }
        
        [LinkName("igAcceptDragDropPayload")]
        private static extern Payload* AcceptDragDropPayloadImpl(char* type, DragDropFlags flags);
        #if IMGUI_USE_REF
        public static ref Payload AcceptDragDropPayload(char* type, DragDropFlags flags = (DragDropFlags) 0) { return ref *AcceptDragDropPayloadImpl(type, flags); }
        #else
        public static Payload* AcceptDragDropPayload(char* type, DragDropFlags flags = (DragDropFlags) 0) => AcceptDragDropPayloadImpl(type, flags);
        #endif
        
        [LinkName("igActivateItemByID")]
        private static extern void ActivateItemByIDImpl(ID id);
        public static void ActivateItemByID(ID id) => ActivateItemByIDImpl(id);
        
        [LinkName("igAddContextHook")]
        private static extern ID AddContextHookImpl(Context* context, ContextHook* hook);
        public static ID AddContextHook(Context* context, ContextHook* hook) => AddContextHookImpl(context, hook);
        
        [LinkName("igAddDrawListToDrawDataEx")]
        private static extern void AddDrawListToDrawDataExImpl(DrawData* draw_data, Vector<DrawList*>* out_list, DrawList* draw_list);
        public static void AddDrawListToDrawDataEx(DrawData* draw_data, Vector<DrawList*>* out_list, DrawList* draw_list) => AddDrawListToDrawDataExImpl(draw_data, out_list, draw_list);
        
        [LinkName("igAddSettingsHandler")]
        private static extern void AddSettingsHandlerImpl(SettingsHandler* handler);
        public static void AddSettingsHandler(SettingsHandler* handler) => AddSettingsHandlerImpl(handler);
        
        [LinkName("igAlignTextToFramePadding")]
        private static extern void AlignTextToFramePaddingImpl();
        public static void AlignTextToFramePadding() => AlignTextToFramePaddingImpl();
        
        [LinkName("igArrowButton")]
        private static extern bool ArrowButtonImpl(char* str_id, Dir dir);
        public static bool ArrowButton(char* str_id, Dir dir) => ArrowButtonImpl(str_id, dir);
        
        [LinkName("igArrowButtonEx")]
        private static extern bool ArrowButtonExImpl(char* str_id, Dir dir, Vec2 size_arg, ButtonFlags flags);
        public static bool ArrowButtonEx(char* str_id, Dir dir, Vec2 size_arg, ButtonFlags flags = (ButtonFlags) 0) => ArrowButtonExImpl(str_id, dir, size_arg, flags);
        
        [LinkName("igBegin")]
        private static extern bool BeginImpl(char* name, bool* p_open, WindowFlags flags);
        public static bool Begin(char* name, bool* p_open = null, WindowFlags flags = (WindowFlags) 0) => BeginImpl(name, p_open, flags);
        
        [LinkName("igBeginBoxSelect")]
        private static extern bool BeginBoxSelectImpl(Rect scope_rect, Window* window, ID box_select_id, MultiSelectFlags ms_flags);
        public static bool BeginBoxSelect(Rect scope_rect, Window* window, ID box_select_id, MultiSelectFlags ms_flags) => BeginBoxSelectImpl(scope_rect, window, box_select_id, ms_flags);
        
        [LinkName("igBeginChild_Str")]
        private static extern bool BeginChildImpl(char* str_id, Vec2 size, ChildFlags child_flags, WindowFlags window_flags);
        public static bool BeginChild(char* str_id, Vec2 size = Vec2.Zero, ChildFlags child_flags = (ChildFlags) 0, WindowFlags window_flags = (WindowFlags) 0) => BeginChildImpl(str_id, size, child_flags, window_flags);
        
        [LinkName("igBeginChild_ID")]
        private static extern bool BeginChildImpl(ID id, Vec2 size, ChildFlags child_flags, WindowFlags window_flags);
        public static bool BeginChild(ID id, Vec2 size = Vec2.Zero, ChildFlags child_flags = (ChildFlags) 0, WindowFlags window_flags = (WindowFlags) 0) => BeginChildImpl(id, size, child_flags, window_flags);
        
        [LinkName("igBeginChildEx")]
        private static extern bool BeginChildExImpl(char* name, ID id, Vec2 size_arg, ChildFlags child_flags, WindowFlags window_flags);
        public static bool BeginChildEx(char* name, ID id, Vec2 size_arg, ChildFlags child_flags, WindowFlags window_flags) => BeginChildExImpl(name, id, size_arg, child_flags, window_flags);
        
        [LinkName("igBeginColumns")]
        private static extern void BeginColumnsImpl(char* str_id, int32 count, OldColumnFlags flags);
        public static void BeginColumns(char* str_id, int32 count, OldColumnFlags flags = (OldColumnFlags) 0) => BeginColumnsImpl(str_id, count, flags);
        
        [LinkName("igBeginCombo")]
        private static extern bool BeginComboImpl(char* label, char* preview_value, ComboFlags flags);
        public static bool BeginCombo(char* label, char* preview_value, ComboFlags flags = (ComboFlags) 0) => BeginComboImpl(label, preview_value, flags);
        
        [LinkName("igBeginComboPopup")]
        private static extern bool BeginComboPopupImpl(ID popup_id, Rect bb, ComboFlags flags);
        public static bool BeginComboPopup(ID popup_id, Rect bb, ComboFlags flags) => BeginComboPopupImpl(popup_id, bb, flags);
        
        [LinkName("igBeginComboPreview")]
        private static extern bool BeginComboPreviewImpl();
        public static bool BeginComboPreview() => BeginComboPreviewImpl();
        
        [LinkName("igBeginDisabled")]
        private static extern void BeginDisabledImpl(bool disabled);
        public static void BeginDisabled(bool disabled = true) => BeginDisabledImpl(disabled);
        
        [LinkName("igBeginDisabledOverrideReenable")]
        private static extern void BeginDisabledOverrideReenableImpl();
        public static void BeginDisabledOverrideReenable() => BeginDisabledOverrideReenableImpl();
        
        [LinkName("igBeginDockableDragDropSource")]
        private static extern void BeginDockableDragDropSourceImpl(Window* window);
        public static void BeginDockableDragDropSource(Window* window) => BeginDockableDragDropSourceImpl(window);
        
        [LinkName("igBeginDockableDragDropTarget")]
        private static extern void BeginDockableDragDropTargetImpl(Window* window);
        public static void BeginDockableDragDropTarget(Window* window) => BeginDockableDragDropTargetImpl(window);
        
        [LinkName("igBeginDocked")]
        private static extern void BeginDockedImpl(Window* window, bool* p_open);
        public static void BeginDocked(Window* window, bool* p_open) => BeginDockedImpl(window, p_open);
        
        [LinkName("igBeginDragDropSource")]
        private static extern bool BeginDragDropSourceImpl(DragDropFlags flags);
        public static bool BeginDragDropSource(DragDropFlags flags = (DragDropFlags) 0) => BeginDragDropSourceImpl(flags);
        
        [LinkName("igBeginDragDropTarget")]
        private static extern bool BeginDragDropTargetImpl();
        public static bool BeginDragDropTarget() => BeginDragDropTargetImpl();
        
        [LinkName("igBeginDragDropTargetCustom")]
        private static extern bool BeginDragDropTargetCustomImpl(Rect bb, ID id);
        public static bool BeginDragDropTargetCustom(Rect bb, ID id) => BeginDragDropTargetCustomImpl(bb, id);
        
        [LinkName("igBeginErrorTooltip")]
        private static extern bool BeginErrorTooltipImpl();
        public static bool BeginErrorTooltip() => BeginErrorTooltipImpl();
        
        [LinkName("igBeginGroup")]
        private static extern void BeginGroupImpl();
        public static void BeginGroup() => BeginGroupImpl();
        
        [LinkName("igBeginItemTooltip")]
        private static extern bool BeginItemTooltipImpl();
        public static bool BeginItemTooltip() => BeginItemTooltipImpl();
        
        [LinkName("igBeginListBox")]
        private static extern bool BeginListBoxImpl(char* label, Vec2 size);
        public static bool BeginListBox(char* label, Vec2 size = Vec2.Zero) => BeginListBoxImpl(label, size);
        
        [LinkName("igBeginMainMenuBar")]
        private static extern bool BeginMainMenuBarImpl();
        public static bool BeginMainMenuBar() => BeginMainMenuBarImpl();
        
        [LinkName("igBeginMenu")]
        private static extern bool BeginMenuImpl(char* label, bool enabled);
        public static bool BeginMenu(char* label, bool enabled = true) => BeginMenuImpl(label, enabled);
        
        [LinkName("igBeginMenuBar")]
        private static extern bool BeginMenuBarImpl();
        public static bool BeginMenuBar() => BeginMenuBarImpl();
        
        [LinkName("igBeginMenuEx")]
        private static extern bool BeginMenuExImpl(char* label, char* icon, bool enabled);
        public static bool BeginMenuEx(char* label, char* icon, bool enabled = true) => BeginMenuExImpl(label, icon, enabled);
        
        [LinkName("igBeginMultiSelect")]
        private static extern MultiSelectIO* BeginMultiSelectImpl(MultiSelectFlags flags, int32 selection_size, int32 items_count);
        #if IMGUI_USE_REF
        public static ref MultiSelectIO BeginMultiSelect(MultiSelectFlags flags, int32 selection_size = -1, int32 items_count = -1) { return ref *BeginMultiSelectImpl(flags, selection_size, items_count); }
        #else
        public static MultiSelectIO* BeginMultiSelect(MultiSelectFlags flags, int32 selection_size = -1, int32 items_count = -1) => BeginMultiSelectImpl(flags, selection_size, items_count);
        #endif
        
        [LinkName("igBeginPopup")]
        private static extern bool BeginPopupImpl(char* str_id, WindowFlags flags);
        public static bool BeginPopup(char* str_id, WindowFlags flags = (WindowFlags) 0) => BeginPopupImpl(str_id, flags);
        
        [LinkName("igBeginPopupContextItem")]
        private static extern bool BeginPopupContextItemImpl(char* str_id, PopupFlags popup_flags);
        public static bool BeginPopupContextItem(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => BeginPopupContextItemImpl(str_id, popup_flags);
        
        [LinkName("igBeginPopupContextVoid")]
        private static extern bool BeginPopupContextVoidImpl(char* str_id, PopupFlags popup_flags);
        public static bool BeginPopupContextVoid(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => BeginPopupContextVoidImpl(str_id, popup_flags);
        
        [LinkName("igBeginPopupContextWindow")]
        private static extern bool BeginPopupContextWindowImpl(char* str_id, PopupFlags popup_flags);
        public static bool BeginPopupContextWindow(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => BeginPopupContextWindowImpl(str_id, popup_flags);
        
        [LinkName("igBeginPopupEx")]
        private static extern bool BeginPopupExImpl(ID id, WindowFlags extra_window_flags);
        public static bool BeginPopupEx(ID id, WindowFlags extra_window_flags) => BeginPopupExImpl(id, extra_window_flags);
        
        [LinkName("igBeginPopupMenuEx")]
        private static extern bool BeginPopupMenuExImpl(ID id, char* label, WindowFlags extra_window_flags);
        public static bool BeginPopupMenuEx(ID id, char* label, WindowFlags extra_window_flags) => BeginPopupMenuExImpl(id, label, extra_window_flags);
        
        [LinkName("igBeginPopupModal")]
        private static extern bool BeginPopupModalImpl(char* name, bool* p_open, WindowFlags flags);
        public static bool BeginPopupModal(char* name, bool* p_open = null, WindowFlags flags = (WindowFlags) 0) => BeginPopupModalImpl(name, p_open, flags);
        
        [LinkName("igBeginTabBar")]
        private static extern bool BeginTabBarImpl(char* str_id, TabBarFlags flags);
        public static bool BeginTabBar(char* str_id, TabBarFlags flags = (TabBarFlags) 0) => BeginTabBarImpl(str_id, flags);
        
        [LinkName("igBeginTabBarEx")]
        private static extern bool BeginTabBarExImpl(TabBar* tab_bar, Rect bb, TabBarFlags flags);
        public static bool BeginTabBarEx(TabBar* tab_bar, Rect bb, TabBarFlags flags) => BeginTabBarExImpl(tab_bar, bb, flags);
        
        [LinkName("igBeginTabItem")]
        private static extern bool BeginTabItemImpl(char* label, bool* p_open, TabItemFlags flags);
        public static bool BeginTabItem(char* label, bool* p_open = null, TabItemFlags flags = (TabItemFlags) 0) => BeginTabItemImpl(label, p_open, flags);
        
        [LinkName("igBeginTable")]
        private static extern bool BeginTableImpl(char* str_id, int32 columns, TableFlags flags, Vec2 outer_size, float inner_width);
        public static bool BeginTable(char* str_id, int32 columns, TableFlags flags = (TableFlags) 0, Vec2 outer_size = .(0.0f,0.0f), float inner_width = (float) 0.0f) => BeginTableImpl(str_id, columns, flags, outer_size, inner_width);
        
        [LinkName("igBeginTableEx")]
        private static extern bool BeginTableExImpl(char* name, ID id, int32 columns_count, TableFlags flags, Vec2 outer_size, float inner_width);
        public static bool BeginTableEx(char* name, ID id, int32 columns_count, TableFlags flags = (TableFlags) 0, Vec2 outer_size = Vec2.Zero, float inner_width = (float) 0.0f) => BeginTableExImpl(name, id, columns_count, flags, outer_size, inner_width);
        
        [LinkName("igBeginTooltip")]
        private static extern bool BeginTooltipImpl();
        public static bool BeginTooltip() => BeginTooltipImpl();
        
        [LinkName("igBeginTooltipEx")]
        private static extern bool BeginTooltipExImpl(TooltipFlags tooltip_flags, WindowFlags extra_window_flags);
        public static bool BeginTooltipEx(TooltipFlags tooltip_flags, WindowFlags extra_window_flags) => BeginTooltipExImpl(tooltip_flags, extra_window_flags);
        
        [LinkName("igBeginTooltipHidden")]
        private static extern bool BeginTooltipHiddenImpl();
        public static bool BeginTooltipHidden() => BeginTooltipHiddenImpl();
        
        [LinkName("igBeginViewportSideBar")]
        private static extern bool BeginViewportSideBarImpl(char* name, Viewport* viewport, Dir dir, float size, WindowFlags window_flags);
        public static bool BeginViewportSideBar(char* name, Viewport* viewport, Dir dir, float size, WindowFlags window_flags) => BeginViewportSideBarImpl(name, viewport, dir, size, window_flags);
        
        [LinkName("igBringWindowToDisplayBack")]
        private static extern void BringWindowToDisplayBackImpl(Window* window);
        public static void BringWindowToDisplayBack(Window* window) => BringWindowToDisplayBackImpl(window);
        
        [LinkName("igBringWindowToDisplayBehind")]
        private static extern void BringWindowToDisplayBehindImpl(Window* window, Window* above_window);
        public static void BringWindowToDisplayBehind(Window* window, Window* above_window) => BringWindowToDisplayBehindImpl(window, above_window);
        
        [LinkName("igBringWindowToDisplayFront")]
        private static extern void BringWindowToDisplayFrontImpl(Window* window);
        public static void BringWindowToDisplayFront(Window* window) => BringWindowToDisplayFrontImpl(window);
        
        [LinkName("igBringWindowToFocusFront")]
        private static extern void BringWindowToFocusFrontImpl(Window* window);
        public static void BringWindowToFocusFront(Window* window) => BringWindowToFocusFrontImpl(window);
        
        [LinkName("igBullet")]
        private static extern void BulletImpl();
        public static void Bullet() => BulletImpl();
        
        [LinkName("igBulletText")]
        private static extern void BulletTextImpl(char* fmt, ...);
        public static void BulletText(char* fmt, params Object[] args) => BulletTextImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igButton")]
        private static extern bool ButtonImpl(char* label, Vec2 size);
        public static bool Button(char* label, Vec2 size = Vec2.Zero) => ButtonImpl(label, size);
        
        [LinkName("igButtonBehavior")]
        private static extern bool ButtonBehaviorImpl(Rect bb, ID id, bool* out_hovered, bool* out_held, ButtonFlags flags);
        public static bool ButtonBehavior(Rect bb, ID id, out bool out_hovered, out bool out_held, ButtonFlags flags = (ButtonFlags) 0)
        {
            out_hovered = ?;
            out_held = ?;
            return ButtonBehaviorImpl(bb, id, &out_hovered, &out_held, flags);
        }
        
        [LinkName("igButtonEx")]
        private static extern bool ButtonExImpl(char* label, Vec2 size_arg, ButtonFlags flags);
        public static bool ButtonEx(char* label, Vec2 size_arg = Vec2.Zero, ButtonFlags flags = (ButtonFlags) 0) => ButtonExImpl(label, size_arg, flags);
        
        [LinkName("igCalcItemSize")]
        private static extern Vec2 CalcItemSizeImpl(Vec2* pOut, Vec2 size, float default_w, float default_h);
        public static Vec2 CalcItemSize(Vec2 size, float default_w, float default_h)
        {
            Vec2 pOut = default;
            CalcItemSizeImpl(&pOut, size, default_w, default_h);
            return pOut;
        }
        
        [LinkName("igCalcItemWidth")]
        private static extern float CalcItemWidthImpl();
        public static float CalcItemWidth() => CalcItemWidthImpl();
        
        [LinkName("igCalcRoundingFlagsForRectInRect")]
        private static extern DrawFlags CalcRoundingFlagsForRectInRectImpl(Rect r_in, Rect r_outer, float threshold);
        public static DrawFlags CalcRoundingFlagsForRectInRect(Rect r_in, Rect r_outer, float threshold) => CalcRoundingFlagsForRectInRectImpl(r_in, r_outer, threshold);
        
        [LinkName("igCalcTextSize")]
        private static extern Vec2 CalcTextSizeImpl(Vec2* pOut, char* text, char* text_end, bool hide_text_after_double_hash, float wrap_width);
        public static Vec2 CalcTextSize(char* text, char* text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f)
        {
            Vec2 pOut = default;
            CalcTextSizeImpl(&pOut, text, text_end, hide_text_after_double_hash, wrap_width);
            return pOut;
        }
        
        [LinkName("igCalcTypematicRepeatAmount")]
        private static extern int32 CalcTypematicRepeatAmountImpl(float t0, float t1, float repeat_delay, float repeat_rate);
        public static int32 CalcTypematicRepeatAmount(float t0, float t1, float repeat_delay, float repeat_rate) => CalcTypematicRepeatAmountImpl(t0, t1, repeat_delay, repeat_rate);
        
        [LinkName("igCalcWindowNextAutoFitSize")]
        private static extern Vec2 CalcWindowNextAutoFitSizeImpl(Vec2* pOut, Window* window);
        public static Vec2 CalcWindowNextAutoFitSize(Window* window)
        {
            Vec2 pOut = default;
            CalcWindowNextAutoFitSizeImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igCalcWrapWidthForPos")]
        private static extern float CalcWrapWidthForPosImpl(Vec2 pos, float wrap_pos_x);
        public static float CalcWrapWidthForPos(Vec2 pos, float wrap_pos_x) => CalcWrapWidthForPosImpl(pos, wrap_pos_x);
        
        [LinkName("igCallContextHooks")]
        private static extern void CallContextHooksImpl(Context* context, ContextHookType type);
        public static void CallContextHooks(Context* context, ContextHookType type) => CallContextHooksImpl(context, type);
        
        [LinkName("igCheckbox")]
        private static extern bool CheckboxImpl(char* label, bool* v);
        public static bool Checkbox(char* label, bool* v) => CheckboxImpl(label, v);
        
        [LinkName("igCheckboxFlags_IntPtr")]
        private static extern bool CheckboxFlagsImpl(char* label, int32* flags, int32 flags_value);
        public static bool CheckboxFlags(char* label, int32* flags, int32 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igCheckboxFlags_UintPtr")]
        private static extern bool CheckboxFlagsImpl(char* label, uint32* flags, uint32 flags_value);
        public static bool CheckboxFlags(char* label, uint32* flags, uint32 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igCheckboxFlags_S64Ptr")]
        private static extern bool CheckboxFlagsImpl(char* label, S64* flags, S64 flags_value);
        public static bool CheckboxFlags(char* label, S64* flags, S64 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igCheckboxFlags_U64Ptr")]
        private static extern bool CheckboxFlagsImpl(char* label, U64* flags, U64 flags_value);
        public static bool CheckboxFlags(char* label, U64* flags, U64 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igClearActiveID")]
        private static extern void ClearActiveIDImpl();
        public static void ClearActiveID() => ClearActiveIDImpl();
        
        [LinkName("igClearDragDrop")]
        private static extern void ClearDragDropImpl();
        public static void ClearDragDrop() => ClearDragDropImpl();
        
        [LinkName("igClearIniSettings")]
        private static extern void ClearIniSettingsImpl();
        public static void ClearIniSettings() => ClearIniSettingsImpl();
        
        [LinkName("igClearWindowSettings")]
        private static extern void ClearWindowSettingsImpl(char* name);
        public static void ClearWindowSettings(char* name) => ClearWindowSettingsImpl(name);
        
        [LinkName("igCloseButton")]
        private static extern bool CloseButtonImpl(ID id, Vec2 pos);
        public static bool CloseButton(ID id, Vec2 pos) => CloseButtonImpl(id, pos);
        
        [LinkName("igCloseCurrentPopup")]
        private static extern void CloseCurrentPopupImpl();
        public static void CloseCurrentPopup() => CloseCurrentPopupImpl();
        
        [LinkName("igClosePopupToLevel")]
        private static extern void ClosePopupToLevelImpl(int32 remaining, bool restore_focus_to_window_under_popup);
        public static void ClosePopupToLevel(int32 remaining, bool restore_focus_to_window_under_popup) => ClosePopupToLevelImpl(remaining, restore_focus_to_window_under_popup);
        
        [LinkName("igClosePopupsExceptModals")]
        private static extern void ClosePopupsExceptModalsImpl();
        public static void ClosePopupsExceptModals() => ClosePopupsExceptModalsImpl();
        
        [LinkName("igClosePopupsOverWindow")]
        private static extern void ClosePopupsOverWindowImpl(Window* ref_window, bool restore_focus_to_window_under_popup);
        public static void ClosePopupsOverWindow(Window* ref_window, bool restore_focus_to_window_under_popup) => ClosePopupsOverWindowImpl(ref_window, restore_focus_to_window_under_popup);
        
        [LinkName("igCollapseButton")]
        private static extern bool CollapseButtonImpl(ID id, Vec2 pos, DockNode* dock_node);
        public static bool CollapseButton(ID id, Vec2 pos, DockNode* dock_node) => CollapseButtonImpl(id, pos, dock_node);
        
        [LinkName("igCollapsingHeader_TreeNodeFlags")]
        private static extern bool CollapsingHeaderImpl(char* label, TreeNodeFlags flags);
        public static bool CollapsingHeader(char* label, TreeNodeFlags flags = (TreeNodeFlags) 0) => CollapsingHeaderImpl(label, flags);
        
        [LinkName("igCollapsingHeader_BoolPtr")]
        private static extern bool CollapsingHeaderImpl(char* label, bool* p_visible, TreeNodeFlags flags);
        public static bool CollapsingHeader(char* label, bool* p_visible, TreeNodeFlags flags = (TreeNodeFlags) 0) => CollapsingHeaderImpl(label, p_visible, flags);
        
        [LinkName("igColorButton")]
        private static extern bool ColorButtonImpl(char* desc_id, Vec4 col, ColorEditFlags flags, Vec2 size);
        public static bool ColorButton(char* desc_id, Vec4 col, ColorEditFlags flags = (ColorEditFlags) 0, Vec2 size = Vec2.Zero) => ColorButtonImpl(desc_id, col, flags, size);
        
        [LinkName("igColorConvertFloat4ToU32")]
        private static extern U32 ColorConvertFloat4ToU32Impl(Vec4 in_);
        public static U32 ColorConvertFloat4ToU32(Vec4 in_) => ColorConvertFloat4ToU32Impl(in_);
        
        [LinkName("igColorConvertHSVtoRGB")]
        private static extern void ColorConvertHSVtoRGBImpl(float h, float s, float v, float* out_r, float* out_g, float* out_b);
        public static void ColorConvertHSVtoRGB(float h, float s, float v, out float out_r, out float out_g, out float out_b)
        {
            out_r = ?;
            out_g = ?;
            out_b = ?;
        }
        
        [LinkName("igColorConvertRGBtoHSV")]
        private static extern void ColorConvertRGBtoHSVImpl(float r, float g, float b, float* out_h, float* out_s, float* out_v);
        public static void ColorConvertRGBtoHSV(float r, float g, float b, out float out_h, out float out_s, out float out_v)
        {
            out_h = ?;
            out_s = ?;
            out_v = ?;
        }
        
        [LinkName("igColorConvertU32ToFloat4")]
        private static extern Vec4 ColorConvertU32ToFloat4Impl(Vec4* pOut, U32 in_);
        public static Vec4 ColorConvertU32ToFloat4(U32 in_)
        {
            Vec4 pOut = default;
            ColorConvertU32ToFloat4Impl(&pOut, in_);
            return pOut;
        }
        
        [LinkName("igColorEdit3")]
        private static extern bool ColorEdit3Impl(char* label, float[3] col, ColorEditFlags flags);
        public static bool ColorEdit3(char* label, ref float[3] col, ColorEditFlags flags = (ColorEditFlags) 0) => ColorEdit3Impl(label, col, flags);
        
        [LinkName("igColorEdit4")]
        private static extern bool ColorEdit4Impl(char* label, float[4] col, ColorEditFlags flags);
        public static bool ColorEdit4(char* label, ref float[4] col, ColorEditFlags flags = (ColorEditFlags) 0) => ColorEdit4Impl(label, col, flags);
        
        [LinkName("igColorEditOptionsPopup")]
        private static extern void ColorEditOptionsPopupImpl(float* col, ColorEditFlags flags);
        public static void ColorEditOptionsPopup(float* col, ColorEditFlags flags) => ColorEditOptionsPopupImpl(col, flags);
        
        [LinkName("igColorPicker3")]
        private static extern bool ColorPicker3Impl(char* label, float[3] col, ColorEditFlags flags);
        public static bool ColorPicker3(char* label, ref float[3] col, ColorEditFlags flags = (ColorEditFlags) 0) => ColorPicker3Impl(label, col, flags);
        
        [LinkName("igColorPicker4")]
        private static extern bool ColorPicker4Impl(char* label, float[4] col, ColorEditFlags flags, float* ref_col);
        public static bool ColorPicker4(char* label, ref float[4] col, ColorEditFlags flags = (ColorEditFlags) 0, float* ref_col = null) => ColorPicker4Impl(label, col, flags, ref_col);
        
        [LinkName("igColorPickerOptionsPopup")]
        private static extern void ColorPickerOptionsPopupImpl(float* ref_col, ColorEditFlags flags);
        public static void ColorPickerOptionsPopup(float* ref_col, ColorEditFlags flags) => ColorPickerOptionsPopupImpl(ref_col, flags);
        
        [LinkName("igColorTooltip")]
        private static extern void ColorTooltipImpl(char* text, float* col, ColorEditFlags flags);
        public static void ColorTooltip(char* text, float* col, ColorEditFlags flags) => ColorTooltipImpl(text, col, flags);
        
        [LinkName("igColumns")]
        private static extern void ColumnsImpl(int32 count, char* id, bool borders);
        public static void Columns(int32 count = (int32) 1, char* id = null, bool borders = true) => ColumnsImpl(count, id, borders);
        
        [LinkName("igCombo_Str_arr")]
        private static extern bool ComboImpl(char* label, int32* current_item, char** items, int32 items_count, int32 popup_max_height_in_items);
        public static bool Combo(char* label, int32* current_item, char** items, int32 items_count, int32 popup_max_height_in_items = -1) => ComboImpl(label, current_item, items, items_count, popup_max_height_in_items);
        
        [LinkName("igCombo_Str")]
        private static extern bool ComboImpl(char* label, int32* current_item, char* items_separated_by_zeros, int32 popup_max_height_in_items);
        public static bool Combo(char* label, int32* current_item, char* items_separated_by_zeros, int32 popup_max_height_in_items = -1) => ComboImpl(label, current_item, items_separated_by_zeros, popup_max_height_in_items);
        
        [LinkName("igCombo_FnStrPtr")]
        private static extern bool ComboImpl(char* label, int32* current_item, function char*(void* user_data, int32 idx) getter, void* user_data, int32 items_count, int32 popup_max_height_in_items);
        public static bool Combo(char* label, int32* current_item, function char*(void* user_data, int32 idx) getter, void* user_data, int32 items_count, int32 popup_max_height_in_items = -1) => ComboImpl(label, current_item, getter, user_data, items_count, popup_max_height_in_items);
        
        [LinkName("igConvertSingleModFlagToKey")]
        private static extern Key ConvertSingleModFlagToKeyImpl(Key key);
        public static Key ConvertSingleModFlagToKey(Key key) => ConvertSingleModFlagToKeyImpl(key);
        
        [LinkName("igCreateContext")]
        private static extern Context* CreateContextImpl(FontAtlas* shared_font_atlas);
        #if IMGUI_USE_REF
        public static ref Context CreateContext(FontAtlas* shared_font_atlas = null) { return ref *CreateContextImpl(shared_font_atlas); }
        #else
        public static Context* CreateContext(FontAtlas* shared_font_atlas = null) => CreateContextImpl(shared_font_atlas);
        #endif
        
        [LinkName("igCreateNewWindowSettings")]
        private static extern WindowSettings* CreateNewWindowSettingsImpl(char* name);
        #if IMGUI_USE_REF
        public static ref WindowSettings CreateNewWindowSettings(char* name) { return ref *CreateNewWindowSettingsImpl(name); }
        #else
        public static WindowSettings* CreateNewWindowSettings(char* name) => CreateNewWindowSettingsImpl(name);
        #endif
        
        [LinkName("igDataTypeApplyFromText")]
        private static extern bool DataTypeApplyFromTextImpl(char* buf, DataType data_type, void* p_data, char* format, void* p_data_when_empty);
        public static bool DataTypeApplyFromText(char* buf, DataType data_type, void* p_data, char* format, void* p_data_when_empty = null) => DataTypeApplyFromTextImpl(buf, data_type, p_data, format, p_data_when_empty);
        
        [LinkName("igDataTypeApplyOp")]
        private static extern void DataTypeApplyOpImpl(DataType data_type, int32 op, void* output, void* arg_1, void* arg_2);
        public static void DataTypeApplyOp(DataType data_type, int32 op, void* output, void* arg_1, void* arg_2) => DataTypeApplyOpImpl(data_type, op, output, arg_1, arg_2);
        
        [LinkName("igDataTypeClamp")]
        private static extern bool DataTypeClampImpl(DataType data_type, void* p_data, void* p_min, void* p_max);
        public static bool DataTypeClamp(DataType data_type, void* p_data, void* p_min, void* p_max) => DataTypeClampImpl(data_type, p_data, p_min, p_max);
        
        [LinkName("igDataTypeCompare")]
        private static extern int32 DataTypeCompareImpl(DataType data_type, void* arg_1, void* arg_2);
        public static int32 DataTypeCompare(DataType data_type, void* arg_1, void* arg_2) => DataTypeCompareImpl(data_type, arg_1, arg_2);
        
        [LinkName("igDataTypeFormatString")]
        private static extern int32 DataTypeFormatStringImpl(char* buf, int32 buf_size, DataType data_type, void* p_data, char* format);
        public static int32 DataTypeFormatString(char* buf, int32 buf_size, DataType data_type, void* p_data, char* format) => DataTypeFormatStringImpl(buf, buf_size, data_type, p_data, format);
        
        [LinkName("igDataTypeGetInfo")]
        private static extern DataTypeInfo* DataTypeGetInfoImpl(DataType data_type);
        #if IMGUI_USE_REF
        public static ref DataTypeInfo DataTypeGetInfo(DataType data_type) { return ref *DataTypeGetInfoImpl(data_type); }
        #else
        public static DataTypeInfo* DataTypeGetInfo(DataType data_type) => DataTypeGetInfoImpl(data_type);
        #endif
        
        [LinkName("igDataTypeIsZero")]
        private static extern bool DataTypeIsZeroImpl(DataType data_type, void* p_data);
        public static bool DataTypeIsZero(DataType data_type, void* p_data) => DataTypeIsZeroImpl(data_type, p_data);
        
        [LinkName("igDebugAllocHook")]
        private static extern void DebugAllocHookImpl(DebugAllocInfo* info, int32 frame_count, void* ptr, size size);
        public static void DebugAllocHook(DebugAllocInfo* info, int32 frame_count, void* ptr, size size) => DebugAllocHookImpl(info, frame_count, ptr, size);
        
        [LinkName("igDebugBreakButton")]
        private static extern bool DebugBreakButtonImpl(char* label, char* description_of_location);
        public static bool DebugBreakButton(char* label, char* description_of_location) => DebugBreakButtonImpl(label, description_of_location);
        
        [LinkName("igDebugBreakButtonTooltip")]
        private static extern void DebugBreakButtonTooltipImpl(bool keyboard_only, char* description_of_location);
        public static void DebugBreakButtonTooltip(bool keyboard_only, char* description_of_location) => DebugBreakButtonTooltipImpl(keyboard_only, description_of_location);
        
        [LinkName("igDebugBreakClearData")]
        private static extern void DebugBreakClearDataImpl();
        public static void DebugBreakClearData() => DebugBreakClearDataImpl();
        
        [LinkName("igDebugCheckVersionAndDataLayout")]
        private static extern bool DebugCheckVersionAndDataLayoutImpl(char* version_str, size sz_io, size sz_style, size sz_vec2, size sz_vec4, size sz_drawvert, size sz_drawidx);
        public static bool DebugCheckVersionAndDataLayout(char* version_str, size sz_io, size sz_style, size sz_vec2, size sz_vec4, size sz_drawvert, size sz_drawidx) => DebugCheckVersionAndDataLayoutImpl(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx);
        
        [LinkName("igDebugDrawCursorPos")]
        private static extern void DebugDrawCursorPosImpl(U32 col);
        public static void DebugDrawCursorPos(U32 col = (U32) 4278190335) => DebugDrawCursorPosImpl(col);
        
        [LinkName("igDebugDrawItemRect")]
        private static extern void DebugDrawItemRectImpl(U32 col);
        public static void DebugDrawItemRect(U32 col = (U32) 4278190335) => DebugDrawItemRectImpl(col);
        
        [LinkName("igDebugDrawLineExtents")]
        private static extern void DebugDrawLineExtentsImpl(U32 col);
        public static void DebugDrawLineExtents(U32 col = (U32) 4278190335) => DebugDrawLineExtentsImpl(col);
        
        [LinkName("igDebugFlashStyleColor")]
        private static extern void DebugFlashStyleColorImpl(Col idx);
        public static void DebugFlashStyleColor(Col idx) => DebugFlashStyleColorImpl(idx);
        
        [LinkName("igDebugHookIdInfo")]
        private static extern void DebugHookIdInfoImpl(ID id, DataType data_type, void* data_id, void* data_id_end);
        public static void DebugHookIdInfo(ID id, DataType data_type, void* data_id, void* data_id_end) => DebugHookIdInfoImpl(id, data_type, data_id, data_id_end);
        
        [LinkName("igDebugLocateItem")]
        private static extern void DebugLocateItemImpl(ID target_id);
        public static void DebugLocateItem(ID target_id) => DebugLocateItemImpl(target_id);
        
        [LinkName("igDebugLocateItemOnHover")]
        private static extern void DebugLocateItemOnHoverImpl(ID target_id);
        public static void DebugLocateItemOnHover(ID target_id) => DebugLocateItemOnHoverImpl(target_id);
        
        [LinkName("igDebugLocateItemResolveWithLastItem")]
        private static extern void DebugLocateItemResolveWithLastItemImpl();
        public static void DebugLocateItemResolveWithLastItem() => DebugLocateItemResolveWithLastItemImpl();
        
        [LinkName("igDebugLog")]
        private static extern void DebugLogImpl(char* fmt, ...);
        public static void DebugLog(char* fmt, params Object[] args) => DebugLogImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igDebugNodeColumns")]
        private static extern void DebugNodeColumnsImpl(OldColumns* columns);
        public static void DebugNodeColumns(OldColumns* columns) => DebugNodeColumnsImpl(columns);
        
        [LinkName("igDebugNodeDockNode")]
        private static extern void DebugNodeDockNodeImpl(DockNode* node, char* label);
        public static void DebugNodeDockNode(DockNode* node, char* label) => DebugNodeDockNodeImpl(node, label);
        
        [LinkName("igDebugNodeDrawCmdShowMeshAndBoundingBox")]
        private static extern void DebugNodeDrawCmdShowMeshAndBoundingBoxImpl(DrawList* out_draw_list, DrawList* draw_list, DrawCmd* draw_cmd, bool show_mesh, bool show_aabb);
        public static void DebugNodeDrawCmdShowMeshAndBoundingBox(out DrawList out_draw_list, DrawList* draw_list, DrawCmd* draw_cmd, bool show_mesh, bool show_aabb)
        {
            out_draw_list = ?;
        }
        
        [LinkName("igDebugNodeDrawList")]
        private static extern void DebugNodeDrawListImpl(Window* window, ViewportP* viewport, DrawList* draw_list, char* label);
        public static void DebugNodeDrawList(Window* window, ViewportP* viewport, DrawList* draw_list, char* label) => DebugNodeDrawListImpl(window, viewport, draw_list, label);
        
        [LinkName("igDebugNodeFont")]
        private static extern void DebugNodeFontImpl(Font* font);
        public static void DebugNodeFont(Font* font) => DebugNodeFontImpl(font);
        
        [LinkName("igDebugNodeFontGlyph")]
        private static extern void DebugNodeFontGlyphImpl(Font* font, FontGlyph* glyph);
        public static void DebugNodeFontGlyph(Font* font, FontGlyph* glyph) => DebugNodeFontGlyphImpl(font, glyph);
        
        [LinkName("igDebugNodeFontGlyphesForSrcMask")]
        private static extern void DebugNodeFontGlyphesForSrcMaskImpl(Font* font, FontBaked* baked, int32 src_mask);
        public static void DebugNodeFontGlyphesForSrcMask(Font* font, FontBaked* baked, int32 src_mask) => DebugNodeFontGlyphesForSrcMaskImpl(font, baked, src_mask);
        
        [LinkName("igDebugNodeInputTextState")]
        private static extern void DebugNodeInputTextStateImpl(InputTextState* state);
        public static void DebugNodeInputTextState(InputTextState* state) => DebugNodeInputTextStateImpl(state);
        
        [LinkName("igDebugNodeMultiSelectState")]
        private static extern void DebugNodeMultiSelectStateImpl(MultiSelectState* state);
        public static void DebugNodeMultiSelectState(MultiSelectState* state) => DebugNodeMultiSelectStateImpl(state);
        
        [LinkName("igDebugNodePlatformMonitor")]
        private static extern void DebugNodePlatformMonitorImpl(PlatformMonitor* monitor, char* label, int32 idx);
        public static void DebugNodePlatformMonitor(PlatformMonitor* monitor, char* label, int32 idx) => DebugNodePlatformMonitorImpl(monitor, label, idx);
        
        [LinkName("igDebugNodeStorage")]
        private static extern void DebugNodeStorageImpl(Storage* storage, char* label);
        public static void DebugNodeStorage(Storage* storage, char* label) => DebugNodeStorageImpl(storage, label);
        
        [LinkName("igDebugNodeTabBar")]
        private static extern void DebugNodeTabBarImpl(TabBar* tab_bar, char* label);
        public static void DebugNodeTabBar(TabBar* tab_bar, char* label) => DebugNodeTabBarImpl(tab_bar, label);
        
        [LinkName("igDebugNodeTable")]
        private static extern void DebugNodeTableImpl(Table* table);
        public static void DebugNodeTable(Table* table) => DebugNodeTableImpl(table);
        
        [LinkName("igDebugNodeTableSettings")]
        private static extern void DebugNodeTableSettingsImpl(TableSettings* settings);
        public static void DebugNodeTableSettings(TableSettings* settings) => DebugNodeTableSettingsImpl(settings);
        
        [LinkName("igDebugNodeTexture")]
        private static extern void DebugNodeTextureImpl(TextureData* tex, int32 int_id, FontAtlasRect* highlight_rect);
        public static void DebugNodeTexture(TextureData* tex, int32 int_id, FontAtlasRect* highlight_rect = null) => DebugNodeTextureImpl(tex, int_id, highlight_rect);
        
        [LinkName("igDebugNodeTypingSelectState")]
        private static extern void DebugNodeTypingSelectStateImpl(TypingSelectState* state);
        public static void DebugNodeTypingSelectState(TypingSelectState* state) => DebugNodeTypingSelectStateImpl(state);
        
        [LinkName("igDebugNodeViewport")]
        private static extern void DebugNodeViewportImpl(ViewportP* viewport);
        public static void DebugNodeViewport(ViewportP* viewport) => DebugNodeViewportImpl(viewport);
        
        [LinkName("igDebugNodeWindow")]
        private static extern void DebugNodeWindowImpl(Window* window, char* label);
        public static void DebugNodeWindow(Window* window, char* label) => DebugNodeWindowImpl(window, label);
        
        [LinkName("igDebugNodeWindowSettings")]
        private static extern void DebugNodeWindowSettingsImpl(WindowSettings* settings);
        public static void DebugNodeWindowSettings(WindowSettings* settings) => DebugNodeWindowSettingsImpl(settings);
        
        [LinkName("igDebugNodeWindowsList")]
        private static extern void DebugNodeWindowsListImpl(Vector<Window*>* windows, char* label);
        public static void DebugNodeWindowsList(Vector<Window*>* windows, char* label) => DebugNodeWindowsListImpl(windows, label);
        
        [LinkName("igDebugNodeWindowsListByBeginStackParent")]
        private static extern void DebugNodeWindowsListByBeginStackParentImpl(Window** windows, int32 windows_size, Window* parent_in_begin_stack);
        public static void DebugNodeWindowsListByBeginStackParent(Window** windows, int32 windows_size, Window* parent_in_begin_stack) => DebugNodeWindowsListByBeginStackParentImpl(windows, windows_size, parent_in_begin_stack);
        
        [LinkName("igDebugRenderKeyboardPreview")]
        private static extern void DebugRenderKeyboardPreviewImpl(DrawList* draw_list);
        public static void DebugRenderKeyboardPreview(DrawList* draw_list) => DebugRenderKeyboardPreviewImpl(draw_list);
        
        [LinkName("igDebugRenderViewportThumbnail")]
        private static extern void DebugRenderViewportThumbnailImpl(DrawList* draw_list, ViewportP* viewport, Rect bb);
        public static void DebugRenderViewportThumbnail(DrawList* draw_list, ViewportP* viewport, Rect bb) => DebugRenderViewportThumbnailImpl(draw_list, viewport, bb);
        
        [LinkName("igDebugStartItemPicker")]
        private static extern void DebugStartItemPickerImpl();
        public static void DebugStartItemPicker() => DebugStartItemPickerImpl();
        
        [LinkName("igDebugTextEncoding")]
        private static extern void DebugTextEncodingImpl(char* text);
        public static void DebugTextEncoding(char* text) => DebugTextEncodingImpl(text);
        
        [LinkName("igDebugTextUnformattedWithLocateItem")]
        private static extern void DebugTextUnformattedWithLocateItemImpl(char* line_begin, char* line_end);
        public static void DebugTextUnformattedWithLocateItem(char* line_begin, char* line_end) => DebugTextUnformattedWithLocateItemImpl(line_begin, line_end);
        
        [LinkName("igDestroyContext")]
        private static extern void DestroyContextImpl(Context* ctx);
        public static void DestroyContext(Context* ctx = null) => DestroyContextImpl(ctx);
        
        [LinkName("igDestroyPlatformWindow")]
        private static extern void DestroyPlatformWindowImpl(ViewportP* viewport);
        public static void DestroyPlatformWindow(ViewportP* viewport) => DestroyPlatformWindowImpl(viewport);
        
        [LinkName("igDestroyPlatformWindows")]
        private static extern void DestroyPlatformWindowsImpl();
        public static void DestroyPlatformWindows() => DestroyPlatformWindowsImpl();
        
        [LinkName("igDockBuilderAddNode")]
        private static extern ID DockBuilderAddNodeImpl(ID node_id, DockNodeFlags flags);
        public static ID DockBuilderAddNode(ID node_id = (ID) 0, DockNodeFlags flags = (DockNodeFlags) 0) => DockBuilderAddNodeImpl(node_id, flags);
        
        [LinkName("igDockBuilderCopyDockSpace")]
        private static extern void DockBuilderCopyDockSpaceImpl(ID src_dockspace_id, ID dst_dockspace_id, Vector<char*>* in_window_remap_pairs);
        public static void DockBuilderCopyDockSpace(ID src_dockspace_id, ID dst_dockspace_id, Vector<char*>* in_window_remap_pairs) => DockBuilderCopyDockSpaceImpl(src_dockspace_id, dst_dockspace_id, in_window_remap_pairs);
        
        [LinkName("igDockBuilderCopyNode")]
        private static extern void DockBuilderCopyNodeImpl(ID src_node_id, ID dst_node_id, Vector<ID*> out_node_remap_pairs);
        public static void DockBuilderCopyNode(ID src_node_id, ID dst_node_id, Vector<ID*> out_node_remap_pairs) => DockBuilderCopyNodeImpl(src_node_id, dst_node_id, out_node_remap_pairs);
        
        [LinkName("igDockBuilderCopyWindowSettings")]
        private static extern void DockBuilderCopyWindowSettingsImpl(char* src_name, char* dst_name);
        public static void DockBuilderCopyWindowSettings(char* src_name, char* dst_name) => DockBuilderCopyWindowSettingsImpl(src_name, dst_name);
        
        [LinkName("igDockBuilderDockWindow")]
        private static extern void DockBuilderDockWindowImpl(char* window_name, ID node_id);
        public static void DockBuilderDockWindow(char* window_name, ID node_id) => DockBuilderDockWindowImpl(window_name, node_id);
        
        [LinkName("igDockBuilderFinish")]
        private static extern void DockBuilderFinishImpl(ID node_id);
        public static void DockBuilderFinish(ID node_id) => DockBuilderFinishImpl(node_id);
        
        [LinkName("igDockBuilderGetCentralNode")]
        private static extern DockNode* DockBuilderGetCentralNodeImpl(ID node_id);
        #if IMGUI_USE_REF
        public static ref DockNode DockBuilderGetCentralNode(ID node_id) { return ref *DockBuilderGetCentralNodeImpl(node_id); }
        #else
        public static DockNode* DockBuilderGetCentralNode(ID node_id) => DockBuilderGetCentralNodeImpl(node_id);
        #endif
        
        [LinkName("igDockBuilderGetNode")]
        private static extern DockNode* DockBuilderGetNodeImpl(ID node_id);
        #if IMGUI_USE_REF
        public static ref DockNode DockBuilderGetNode(ID node_id) { return ref *DockBuilderGetNodeImpl(node_id); }
        #else
        public static DockNode* DockBuilderGetNode(ID node_id) => DockBuilderGetNodeImpl(node_id);
        #endif
        
        [LinkName("igDockBuilderRemoveNode")]
        private static extern void DockBuilderRemoveNodeImpl(ID node_id);
        public static void DockBuilderRemoveNode(ID node_id) => DockBuilderRemoveNodeImpl(node_id);
        
        [LinkName("igDockBuilderRemoveNodeChildNodes")]
        private static extern void DockBuilderRemoveNodeChildNodesImpl(ID node_id);
        public static void DockBuilderRemoveNodeChildNodes(ID node_id) => DockBuilderRemoveNodeChildNodesImpl(node_id);
        
        [LinkName("igDockBuilderRemoveNodeDockedWindows")]
        private static extern void DockBuilderRemoveNodeDockedWindowsImpl(ID node_id, bool clear_settings_refs);
        public static void DockBuilderRemoveNodeDockedWindows(ID node_id, bool clear_settings_refs = true) => DockBuilderRemoveNodeDockedWindowsImpl(node_id, clear_settings_refs);
        
        [LinkName("igDockBuilderSetNodePos")]
        private static extern void DockBuilderSetNodePosImpl(ID node_id, Vec2 pos);
        public static void DockBuilderSetNodePos(ID node_id, Vec2 pos) => DockBuilderSetNodePosImpl(node_id, pos);
        
        [LinkName("igDockBuilderSetNodeSize")]
        private static extern void DockBuilderSetNodeSizeImpl(ID node_id, Vec2 size);
        public static void DockBuilderSetNodeSize(ID node_id, Vec2 size) => DockBuilderSetNodeSizeImpl(node_id, size);
        
        [LinkName("igDockBuilderSplitNode")]
        private static extern ID DockBuilderSplitNodeImpl(ID node_id, Dir split_dir, float size_ratio_for_node_at_dir, ID* out_id_at_dir, ID* out_id_at_opposite_dir);
        public static ID DockBuilderSplitNode(ID node_id, Dir split_dir, float size_ratio_for_node_at_dir, out ID out_id_at_dir, out ID out_id_at_opposite_dir)
        {
            out_id_at_dir = ?;
            out_id_at_opposite_dir = ?;
            return DockBuilderSplitNodeImpl(node_id, split_dir, size_ratio_for_node_at_dir, &out_id_at_dir, &out_id_at_opposite_dir);
        }
        
        [LinkName("igDockContextCalcDropPosForDocking")]
        private static extern bool DockContextCalcDropPosForDockingImpl(Window* target, DockNode* target_node, Window* payload_window, DockNode* payload_node, Dir split_dir, bool split_outer, Vec2* out_pos);
        public static bool DockContextCalcDropPosForDocking(Window* target, DockNode* target_node, Window* payload_window, DockNode* payload_node, Dir split_dir, bool split_outer, out Vec2 out_pos)
        {
            out_pos = ?;
            return DockContextCalcDropPosForDockingImpl(target, target_node, payload_window, payload_node, split_dir, split_outer, &out_pos);
        }
        
        [LinkName("igDockContextClearNodes")]
        private static extern void DockContextClearNodesImpl(Context* ctx, ID root_id, bool clear_settings_refs);
        public static void DockContextClearNodes(Context* ctx, ID root_id, bool clear_settings_refs) => DockContextClearNodesImpl(ctx, root_id, clear_settings_refs);
        
        [LinkName("igDockContextEndFrame")]
        private static extern void DockContextEndFrameImpl(Context* ctx);
        public static void DockContextEndFrame(Context* ctx) => DockContextEndFrameImpl(ctx);
        
        [LinkName("igDockContextFindNodeByID")]
        private static extern DockNode* DockContextFindNodeByIDImpl(Context* ctx, ID id);
        #if IMGUI_USE_REF
        public static ref DockNode DockContextFindNodeByID(Context* ctx, ID id) { return ref *DockContextFindNodeByIDImpl(ctx, id); }
        #else
        public static DockNode* DockContextFindNodeByID(Context* ctx, ID id) => DockContextFindNodeByIDImpl(ctx, id);
        #endif
        
        [LinkName("igDockContextGenNodeID")]
        private static extern ID DockContextGenNodeIDImpl(Context* ctx);
        public static ID DockContextGenNodeID(Context* ctx) => DockContextGenNodeIDImpl(ctx);
        
        [LinkName("igDockContextInitialize")]
        private static extern void DockContextInitializeImpl(Context* ctx);
        public static void DockContextInitialize(Context* ctx) => DockContextInitializeImpl(ctx);
        
        [LinkName("igDockContextNewFrameUpdateDocking")]
        private static extern void DockContextNewFrameUpdateDockingImpl(Context* ctx);
        public static void DockContextNewFrameUpdateDocking(Context* ctx) => DockContextNewFrameUpdateDockingImpl(ctx);
        
        [LinkName("igDockContextNewFrameUpdateUndocking")]
        private static extern void DockContextNewFrameUpdateUndockingImpl(Context* ctx);
        public static void DockContextNewFrameUpdateUndocking(Context* ctx) => DockContextNewFrameUpdateUndockingImpl(ctx);
        
        [LinkName("igDockContextProcessUndockNode")]
        private static extern void DockContextProcessUndockNodeImpl(Context* ctx, DockNode* node);
        public static void DockContextProcessUndockNode(Context* ctx, DockNode* node) => DockContextProcessUndockNodeImpl(ctx, node);
        
        [LinkName("igDockContextProcessUndockWindow")]
        private static extern void DockContextProcessUndockWindowImpl(Context* ctx, Window* window, bool clear_persistent_docking_ref);
        public static void DockContextProcessUndockWindow(Context* ctx, Window* window, bool clear_persistent_docking_ref = true) => DockContextProcessUndockWindowImpl(ctx, window, clear_persistent_docking_ref);
        
        [LinkName("igDockContextQueueDock")]
        private static extern void DockContextQueueDockImpl(Context* ctx, Window* target, DockNode* target_node, Window* payload, Dir split_dir, float split_ratio, bool split_outer);
        public static void DockContextQueueDock(Context* ctx, Window* target, DockNode* target_node, Window* payload, Dir split_dir, float split_ratio, bool split_outer) => DockContextQueueDockImpl(ctx, target, target_node, payload, split_dir, split_ratio, split_outer);
        
        [LinkName("igDockContextQueueUndockNode")]
        private static extern void DockContextQueueUndockNodeImpl(Context* ctx, DockNode* node);
        public static void DockContextQueueUndockNode(Context* ctx, DockNode* node) => DockContextQueueUndockNodeImpl(ctx, node);
        
        [LinkName("igDockContextQueueUndockWindow")]
        private static extern void DockContextQueueUndockWindowImpl(Context* ctx, Window* window);
        public static void DockContextQueueUndockWindow(Context* ctx, Window* window) => DockContextQueueUndockWindowImpl(ctx, window);
        
        [LinkName("igDockContextRebuildNodes")]
        private static extern void DockContextRebuildNodesImpl(Context* ctx);
        public static void DockContextRebuildNodes(Context* ctx) => DockContextRebuildNodesImpl(ctx);
        
        [LinkName("igDockContextShutdown")]
        private static extern void DockContextShutdownImpl(Context* ctx);
        public static void DockContextShutdown(Context* ctx) => DockContextShutdownImpl(ctx);
        
        [LinkName("igDockNodeBeginAmendTabBar")]
        private static extern bool DockNodeBeginAmendTabBarImpl(DockNode* node);
        public static bool DockNodeBeginAmendTabBar(DockNode* node) => DockNodeBeginAmendTabBarImpl(node);
        
        [LinkName("igDockNodeEndAmendTabBar")]
        private static extern void DockNodeEndAmendTabBarImpl();
        public static void DockNodeEndAmendTabBar() => DockNodeEndAmendTabBarImpl();
        
        [LinkName("igDockNodeGetDepth")]
        private static extern int32 DockNodeGetDepthImpl(DockNode* node);
        public static int32 DockNodeGetDepth(DockNode* node) => DockNodeGetDepthImpl(node);
        
        [LinkName("igDockNodeGetRootNode")]
        private static extern DockNode* DockNodeGetRootNodeImpl(DockNode* node);
        #if IMGUI_USE_REF
        public static ref DockNode DockNodeGetRootNode(DockNode* node) { return ref *DockNodeGetRootNodeImpl(node); }
        #else
        public static DockNode* DockNodeGetRootNode(DockNode* node) => DockNodeGetRootNodeImpl(node);
        #endif
        
        [LinkName("igDockNodeGetWindowMenuButtonId")]
        private static extern ID DockNodeGetWindowMenuButtonIdImpl(DockNode* node);
        public static ID DockNodeGetWindowMenuButtonId(DockNode* node) => DockNodeGetWindowMenuButtonIdImpl(node);
        
        [LinkName("igDockNodeIsInHierarchyOf")]
        private static extern bool DockNodeIsInHierarchyOfImpl(DockNode* node, DockNode* parent);
        public static bool DockNodeIsInHierarchyOf(DockNode* node, DockNode* parent) => DockNodeIsInHierarchyOfImpl(node, parent);
        
        [LinkName("igDockNodeWindowMenuHandler_Default")]
        private static extern void DockNodeWindowMenuHandlerDefaultImpl(Context* ctx, DockNode* node, TabBar* tab_bar);
        public static void DockNodeWindowMenuHandlerDefault(Context* ctx, DockNode* node, TabBar* tab_bar) => DockNodeWindowMenuHandlerDefaultImpl(ctx, node, tab_bar);
        
        [LinkName("igDockSpace")]
        private static extern ID DockSpaceImpl(ID dockspace_id, Vec2 size, DockNodeFlags flags, WindowClass* window_class);
        public static ID DockSpace(ID dockspace_id, Vec2 size = Vec2.Zero, DockNodeFlags flags = (DockNodeFlags) 0, WindowClass* window_class = null) => DockSpaceImpl(dockspace_id, size, flags, window_class);
        
        [LinkName("igDockSpaceOverViewport")]
        private static extern ID DockSpaceOverViewportImpl(ID dockspace_id, Viewport* viewport, DockNodeFlags flags, WindowClass* window_class);
        public static ID DockSpaceOverViewport(ID dockspace_id = (ID) 0, Viewport* viewport = null, DockNodeFlags flags = (DockNodeFlags) 0, WindowClass* window_class = null) => DockSpaceOverViewportImpl(dockspace_id, viewport, flags, window_class);
        
        [LinkName("igDragBehavior")]
        private static extern bool DragBehaviorImpl(ID id, DataType data_type, void* p_v, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool DragBehavior(ID id, DataType data_type, void* p_v, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags) => DragBehaviorImpl(id, data_type, p_v, v_speed, p_min, p_max, format, flags);
        
        [LinkName("igDragFloat")]
        private static extern bool DragFloatImpl(char* label, float* v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat(char* label, float* v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloatImpl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloat2")]
        private static extern bool DragFloat2Impl(char* label, float[2] v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat2(char* label, ref float[2] v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloat2Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloat3")]
        private static extern bool DragFloat3Impl(char* label, float[3] v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat3(char* label, ref float[3] v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloat3Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloat4")]
        private static extern bool DragFloat4Impl(char* label, float[4] v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat4(char* label, ref float[4] v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloat4Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloatRange2")]
        private static extern bool DragFloatRange2Impl(char* label, float* v_current_min, float* v_current_max, float v_speed, float v_min, float v_max, char* format, char* format_max, SliderFlags flags);
        public static bool DragFloatRange2(char* label, float* v_current_min, float* v_current_max, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", char* format_max = null, SliderFlags flags = (SliderFlags) 0) => DragFloatRange2Impl(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags);
        
        [LinkName("igDragInt")]
        private static extern bool DragIntImpl(char* label, int32* v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt(char* label, int32* v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragIntImpl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragInt2")]
        private static extern bool DragInt2Impl(char* label, int32[2] v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt2(char* label, ref int32[2] v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragInt2Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragInt3")]
        private static extern bool DragInt3Impl(char* label, int32[3] v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt3(char* label, ref int32[3] v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragInt3Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragInt4")]
        private static extern bool DragInt4Impl(char* label, int32[4] v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt4(char* label, ref int32[4] v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragInt4Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragIntRange2")]
        private static extern bool DragIntRange2Impl(char* label, int32* v_current_min, int32* v_current_max, float v_speed, int32 v_min, int32 v_max, char* format, char* format_max, SliderFlags flags);
        public static bool DragIntRange2(char* label, int32* v_current_min, int32* v_current_max, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", char* format_max = null, SliderFlags flags = (SliderFlags) 0) => DragIntRange2Impl(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags);
        
        [LinkName("igDragScalar")]
        private static extern bool DragScalarImpl(char* label, DataType data_type, void* p_data, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool DragScalar(char* label, DataType data_type, void* p_data, float v_speed = (float) 1.0f, void* p_min = null, void* p_max = null, char* format = null, SliderFlags flags = (SliderFlags) 0) => DragScalarImpl(label, data_type, p_data, v_speed, p_min, p_max, format, flags);
        
        [LinkName("igDragScalarN")]
        private static extern bool DragScalarNImpl(char* label, DataType data_type, void* p_data, int32 components, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool DragScalarN(char* label, DataType data_type, void* p_data, int32 components, float v_speed = (float) 1.0f, void* p_min = null, void* p_max = null, char* format = null, SliderFlags flags = (SliderFlags) 0) => DragScalarNImpl(label, data_type, p_data, components, v_speed, p_min, p_max, format, flags);
        
        [LinkName("igDummy")]
        private static extern void DummyImpl(Vec2 size);
        public static void Dummy(Vec2 size) => DummyImpl(size);
        
        [LinkName("igEnd")]
        private static extern void EndImpl();
        public static void End() => EndImpl();
        
        [LinkName("igEndBoxSelect")]
        private static extern void EndBoxSelectImpl(Rect scope_rect, MultiSelectFlags ms_flags);
        public static void EndBoxSelect(Rect scope_rect, MultiSelectFlags ms_flags) => EndBoxSelectImpl(scope_rect, ms_flags);
        
        [LinkName("igEndChild")]
        private static extern void EndChildImpl();
        public static void EndChild() => EndChildImpl();
        
        [LinkName("igEndColumns")]
        private static extern void EndColumnsImpl();
        public static void EndColumns() => EndColumnsImpl();
        
        [LinkName("igEndCombo")]
        private static extern void EndComboImpl();
        public static void EndCombo() => EndComboImpl();
        
        [LinkName("igEndComboPreview")]
        private static extern void EndComboPreviewImpl();
        public static void EndComboPreview() => EndComboPreviewImpl();
        
        [LinkName("igEndDisabled")]
        private static extern void EndDisabledImpl();
        public static void EndDisabled() => EndDisabledImpl();
        
        [LinkName("igEndDisabledOverrideReenable")]
        private static extern void EndDisabledOverrideReenableImpl();
        public static void EndDisabledOverrideReenable() => EndDisabledOverrideReenableImpl();
        
        [LinkName("igEndDragDropSource")]
        private static extern void EndDragDropSourceImpl();
        public static void EndDragDropSource() => EndDragDropSourceImpl();
        
        [LinkName("igEndDragDropTarget")]
        private static extern void EndDragDropTargetImpl();
        public static void EndDragDropTarget() => EndDragDropTargetImpl();
        
        [LinkName("igEndErrorTooltip")]
        private static extern void EndErrorTooltipImpl();
        public static void EndErrorTooltip() => EndErrorTooltipImpl();
        
        [LinkName("igEndFrame")]
        private static extern void EndFrameImpl();
        public static void EndFrame() => EndFrameImpl();
        
        [LinkName("igEndGroup")]
        private static extern void EndGroupImpl();
        public static void EndGroup() => EndGroupImpl();
        
        [LinkName("igEndListBox")]
        private static extern void EndListBoxImpl();
        public static void EndListBox() => EndListBoxImpl();
        
        [LinkName("igEndMainMenuBar")]
        private static extern void EndMainMenuBarImpl();
        public static void EndMainMenuBar() => EndMainMenuBarImpl();
        
        [LinkName("igEndMenu")]
        private static extern void EndMenuImpl();
        public static void EndMenu() => EndMenuImpl();
        
        [LinkName("igEndMenuBar")]
        private static extern void EndMenuBarImpl();
        public static void EndMenuBar() => EndMenuBarImpl();
        
        [LinkName("igEndMultiSelect")]
        private static extern MultiSelectIO* EndMultiSelectImpl();
        #if IMGUI_USE_REF
        public static ref MultiSelectIO EndMultiSelect() { return ref *EndMultiSelectImpl(); }
        #else
        public static MultiSelectIO* EndMultiSelect() => EndMultiSelectImpl();
        #endif
        
        [LinkName("igEndPopup")]
        private static extern void EndPopupImpl();
        public static void EndPopup() => EndPopupImpl();
        
        [LinkName("igEndTabBar")]
        private static extern void EndTabBarImpl();
        public static void EndTabBar() => EndTabBarImpl();
        
        [LinkName("igEndTabItem")]
        private static extern void EndTabItemImpl();
        public static void EndTabItem() => EndTabItemImpl();
        
        [LinkName("igEndTable")]
        private static extern void EndTableImpl();
        public static void EndTable() => EndTableImpl();
        
        [LinkName("igEndTooltip")]
        private static extern void EndTooltipImpl();
        public static void EndTooltip() => EndTooltipImpl();
        
        [LinkName("igErrorCheckEndFrameFinalizeErrorTooltip")]
        private static extern void ErrorCheckEndFrameFinalizeErrorTooltipImpl();
        public static void ErrorCheckEndFrameFinalizeErrorTooltip() => ErrorCheckEndFrameFinalizeErrorTooltipImpl();
        
        [LinkName("igErrorCheckUsingSetCursorPosToExtendParentBoundaries")]
        private static extern void ErrorCheckUsingSetCursorPosToExtendParentBoundariesImpl();
        public static void ErrorCheckUsingSetCursorPosToExtendParentBoundaries() => ErrorCheckUsingSetCursorPosToExtendParentBoundariesImpl();
        
        [LinkName("igErrorLog")]
        private static extern bool ErrorLogImpl(char* msg);
        public static bool ErrorLog(char* msg) => ErrorLogImpl(msg);
        
        [LinkName("igErrorRecoveryStoreState")]
        private static extern void ErrorRecoveryStoreStateImpl(ErrorRecoveryState* state_out);
        public static void ErrorRecoveryStoreState(ErrorRecoveryState* state_out) => ErrorRecoveryStoreStateImpl(state_out);
        
        [LinkName("igErrorRecoveryTryToRecoverState")]
        private static extern void ErrorRecoveryTryToRecoverStateImpl(ErrorRecoveryState* state_in);
        public static void ErrorRecoveryTryToRecoverState(ErrorRecoveryState* state_in) => ErrorRecoveryTryToRecoverStateImpl(state_in);
        
        [LinkName("igErrorRecoveryTryToRecoverWindowState")]
        private static extern void ErrorRecoveryTryToRecoverWindowStateImpl(ErrorRecoveryState* state_in);
        public static void ErrorRecoveryTryToRecoverWindowState(ErrorRecoveryState* state_in) => ErrorRecoveryTryToRecoverWindowStateImpl(state_in);
        
        [LinkName("igFindBestWindowPosForPopup")]
        private static extern Vec2 FindBestWindowPosForPopupImpl(Vec2* pOut, Window* window);
        public static Vec2 FindBestWindowPosForPopup(Window* window)
        {
            Vec2 pOut = default;
            FindBestWindowPosForPopupImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igFindBestWindowPosForPopupEx")]
        private static extern Vec2 FindBestWindowPosForPopupExImpl(Vec2* pOut, Vec2 ref_pos, Vec2 size, Dir* last_dir, Rect r_outer, Rect r_avoid, PopupPositionPolicy policy);
        public static Vec2 FindBestWindowPosForPopupEx(Vec2 ref_pos, Vec2 size, Dir* last_dir, Rect r_outer, Rect r_avoid, PopupPositionPolicy policy)
        {
            Vec2 pOut = default;
            FindBestWindowPosForPopupExImpl(&pOut, ref_pos, size, last_dir, r_outer, r_avoid, policy);
            return pOut;
        }
        
        [LinkName("igFindBlockingModal")]
        private static extern Window* FindBlockingModalImpl(Window* window);
        #if IMGUI_USE_REF
        public static ref Window FindBlockingModal(Window* window) { return ref *FindBlockingModalImpl(window); }
        #else
        public static Window* FindBlockingModal(Window* window) => FindBlockingModalImpl(window);
        #endif
        
        [LinkName("igFindBottomMostVisibleWindowWithinBeginStack")]
        private static extern Window* FindBottomMostVisibleWindowWithinBeginStackImpl(Window* window);
        #if IMGUI_USE_REF
        public static ref Window FindBottomMostVisibleWindowWithinBeginStack(Window* window) { return ref *FindBottomMostVisibleWindowWithinBeginStackImpl(window); }
        #else
        public static Window* FindBottomMostVisibleWindowWithinBeginStack(Window* window) => FindBottomMostVisibleWindowWithinBeginStackImpl(window);
        #endif
        
        [LinkName("igFindHoveredViewportFromPlatformWindowStack")]
        private static extern ViewportP* FindHoveredViewportFromPlatformWindowStackImpl(Vec2 mouse_platform_pos);
        #if IMGUI_USE_REF
        public static ref ViewportP FindHoveredViewportFromPlatformWindowStack(Vec2 mouse_platform_pos) { return ref *FindHoveredViewportFromPlatformWindowStackImpl(mouse_platform_pos); }
        #else
        public static ViewportP* FindHoveredViewportFromPlatformWindowStack(Vec2 mouse_platform_pos) => FindHoveredViewportFromPlatformWindowStackImpl(mouse_platform_pos);
        #endif
        
        [LinkName("igFindHoveredWindowEx")]
        private static extern void FindHoveredWindowExImpl(Vec2 pos, bool find_first_and_in_any_viewport, Window** out_hovered_window, Window** out_hovered_window_under_moving_window);
        public static void FindHoveredWindowEx(Vec2 pos, bool find_first_and_in_any_viewport, out Window* out_hovered_window, out Window* out_hovered_window_under_moving_window)
        {
            out_hovered_window = ?;
            out_hovered_window_under_moving_window = ?;
        }
        
        [LinkName("igFindOrCreateColumns")]
        private static extern OldColumns* FindOrCreateColumnsImpl(Window* window, ID id);
        #if IMGUI_USE_REF
        public static ref OldColumns FindOrCreateColumns(Window* window, ID id) { return ref *FindOrCreateColumnsImpl(window, id); }
        #else
        public static OldColumns* FindOrCreateColumns(Window* window, ID id) => FindOrCreateColumnsImpl(window, id);
        #endif
        
        [LinkName("igFindRenderedTextEnd")]
        private static extern char* FindRenderedTextEndImpl(char* text, char* text_end);
        #if IMGUI_USE_REF
        public static ref char FindRenderedTextEnd(char* text, char* text_end = null) { return ref *FindRenderedTextEndImpl(text, text_end); }
        #else
        public static char* FindRenderedTextEnd(char* text, char* text_end = null) => FindRenderedTextEndImpl(text, text_end);
        #endif
        
        [LinkName("igFindSettingsHandler")]
        private static extern SettingsHandler* FindSettingsHandlerImpl(char* type_name);
        #if IMGUI_USE_REF
        public static ref SettingsHandler FindSettingsHandler(char* type_name) { return ref *FindSettingsHandlerImpl(type_name); }
        #else
        public static SettingsHandler* FindSettingsHandler(char* type_name) => FindSettingsHandlerImpl(type_name);
        #endif
        
        [LinkName("igFindViewportByID")]
        private static extern Viewport* FindViewportByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref Viewport FindViewportByID(ID id) { return ref *FindViewportByIDImpl(id); }
        #else
        public static Viewport* FindViewportByID(ID id) => FindViewportByIDImpl(id);
        #endif
        
        [LinkName("igFindViewportByPlatformHandle")]
        private static extern Viewport* FindViewportByPlatformHandleImpl(void* platform_handle);
        #if IMGUI_USE_REF
        public static ref Viewport FindViewportByPlatformHandle(void* platform_handle) { return ref *FindViewportByPlatformHandleImpl(platform_handle); }
        #else
        public static Viewport* FindViewportByPlatformHandle(void* platform_handle) => FindViewportByPlatformHandleImpl(platform_handle);
        #endif
        
        [LinkName("igFindWindowByID")]
        private static extern Window* FindWindowByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref Window FindWindowByID(ID id) { return ref *FindWindowByIDImpl(id); }
        #else
        public static Window* FindWindowByID(ID id) => FindWindowByIDImpl(id);
        #endif
        
        [LinkName("igFindWindowByName")]
        private static extern Window* FindWindowByNameImpl(char* name);
        #if IMGUI_USE_REF
        public static ref Window FindWindowByName(char* name) { return ref *FindWindowByNameImpl(name); }
        #else
        public static Window* FindWindowByName(char* name) => FindWindowByNameImpl(name);
        #endif
        
        [LinkName("igFindWindowDisplayIndex")]
        private static extern int32 FindWindowDisplayIndexImpl(Window* window);
        public static int32 FindWindowDisplayIndex(Window* window) => FindWindowDisplayIndexImpl(window);
        
        [LinkName("igFindWindowSettingsByID")]
        private static extern WindowSettings* FindWindowSettingsByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref WindowSettings FindWindowSettingsByID(ID id) { return ref *FindWindowSettingsByIDImpl(id); }
        #else
        public static WindowSettings* FindWindowSettingsByID(ID id) => FindWindowSettingsByIDImpl(id);
        #endif
        
        [LinkName("igFindWindowSettingsByWindow")]
        private static extern WindowSettings* FindWindowSettingsByWindowImpl(Window* window);
        #if IMGUI_USE_REF
        public static ref WindowSettings FindWindowSettingsByWindow(Window* window) { return ref *FindWindowSettingsByWindowImpl(window); }
        #else
        public static WindowSettings* FindWindowSettingsByWindow(Window* window) => FindWindowSettingsByWindowImpl(window);
        #endif
        
        [LinkName("igFixupKeyChord")]
        private static extern KeyChord FixupKeyChordImpl(KeyChord key_chord);
        public static KeyChord FixupKeyChord(KeyChord key_chord) => FixupKeyChordImpl(key_chord);
        
        [LinkName("igFocusItem")]
        private static extern void FocusItemImpl();
        public static void FocusItem() => FocusItemImpl();
        
        [LinkName("igFocusTopMostWindowUnderOne")]
        private static extern void FocusTopMostWindowUnderOneImpl(Window* under_this_window, Window* ignore_window, Viewport* filter_viewport, FocusRequestFlags flags);
        public static void FocusTopMostWindowUnderOne(Window* under_this_window, Window* ignore_window, Viewport* filter_viewport, FocusRequestFlags flags) => FocusTopMostWindowUnderOneImpl(under_this_window, ignore_window, filter_viewport, flags);
        
        [LinkName("igFocusWindow")]
        private static extern void FocusWindowImpl(Window* window, FocusRequestFlags flags);
        public static void FocusWindow(Window* window, FocusRequestFlags flags = (FocusRequestFlags) 0) => FocusWindowImpl(window, flags);
        
        [LinkName("igGcAwakeTransientWindowBuffers")]
        private static extern void GcAwakeTransientWindowBuffersImpl(Window* window);
        public static void GcAwakeTransientWindowBuffers(Window* window) => GcAwakeTransientWindowBuffersImpl(window);
        
        [LinkName("igGcCompactTransientMiscBuffers")]
        private static extern void GcCompactTransientMiscBuffersImpl();
        public static void GcCompactTransientMiscBuffers() => GcCompactTransientMiscBuffersImpl();
        
        [LinkName("igGcCompactTransientWindowBuffers")]
        private static extern void GcCompactTransientWindowBuffersImpl(Window* window);
        public static void GcCompactTransientWindowBuffers(Window* window) => GcCompactTransientWindowBuffersImpl(window);
        
        [LinkName("igGetActiveID")]
        private static extern ID GetActiveIDImpl();
        public static ID GetActiveID() => GetActiveIDImpl();
        
        [LinkName("igGetAllocatorFunctions")]
        private static extern void GetAllocatorFunctionsImpl(MemAllocFunc* p_alloc_func, MemFreeFunc* p_free_func, void** p_user_data);
        public static void GetAllocatorFunctions(MemAllocFunc* p_alloc_func, MemFreeFunc* p_free_func, void** p_user_data) => GetAllocatorFunctionsImpl(p_alloc_func, p_free_func, p_user_data);
        
        [LinkName("igGetBackgroundDrawList")]
        private static extern DrawList* GetBackgroundDrawListImpl(Viewport* viewport);
        #if IMGUI_USE_REF
        public static ref DrawList GetBackgroundDrawList(Viewport* viewport = null) { return ref *GetBackgroundDrawListImpl(viewport); }
        #else
        public static DrawList* GetBackgroundDrawList(Viewport* viewport = null) => GetBackgroundDrawListImpl(viewport);
        #endif
        
        [LinkName("igGetBoxSelectState")]
        private static extern BoxSelectState* GetBoxSelectStateImpl(ID id);
        #if IMGUI_USE_REF
        public static ref BoxSelectState GetBoxSelectState(ID id) { return ref *GetBoxSelectStateImpl(id); }
        #else
        public static BoxSelectState* GetBoxSelectState(ID id) => GetBoxSelectStateImpl(id);
        #endif
        
        [LinkName("igGetClipboardText")]
        private static extern char* GetClipboardTextImpl();
        #if IMGUI_USE_REF
        public static ref char GetClipboardText() { return ref *GetClipboardTextImpl(); }
        #else
        public static char* GetClipboardText() => GetClipboardTextImpl();
        #endif
        
        [LinkName("igGetColorU32_Col")]
        private static extern U32 GetColorU32Impl(Col idx, float alpha_mul);
        public static U32 GetColorU32(Col idx, float alpha_mul = (float) 1.0f) => GetColorU32Impl(idx, alpha_mul);
        
        [LinkName("igGetColorU32_Vec4")]
        private static extern U32 GetColorU32Impl(Vec4 col);
        public static U32 GetColorU32(Vec4 col) => GetColorU32Impl(col);
        
        [LinkName("igGetColorU32_U32")]
        private static extern U32 GetColorU32Impl(U32 col, float alpha_mul);
        public static U32 GetColorU32(U32 col, float alpha_mul = (float) 1.0f) => GetColorU32Impl(col, alpha_mul);
        
        [LinkName("igGetColumnIndex")]
        private static extern int32 GetColumnIndexImpl();
        public static int32 GetColumnIndex() => GetColumnIndexImpl();
        
        [LinkName("igGetColumnNormFromOffset")]
        private static extern float GetColumnNormFromOffsetImpl(OldColumns* columns, float offset);
        public static float GetColumnNormFromOffset(OldColumns* columns, float offset) => GetColumnNormFromOffsetImpl(columns, offset);
        
        [LinkName("igGetColumnOffset")]
        private static extern float GetColumnOffsetImpl(int32 column_index);
        public static float GetColumnOffset(int32 column_index = -1) => GetColumnOffsetImpl(column_index);
        
        [LinkName("igGetColumnOffsetFromNorm")]
        private static extern float GetColumnOffsetFromNormImpl(OldColumns* columns, float offset_norm);
        public static float GetColumnOffsetFromNorm(OldColumns* columns, float offset_norm) => GetColumnOffsetFromNormImpl(columns, offset_norm);
        
        [LinkName("igGetColumnWidth")]
        private static extern float GetColumnWidthImpl(int32 column_index);
        public static float GetColumnWidth(int32 column_index = -1) => GetColumnWidthImpl(column_index);
        
        [LinkName("igGetColumnsCount")]
        private static extern int32 GetColumnsCountImpl();
        public static int32 GetColumnsCount() => GetColumnsCountImpl();
        
        [LinkName("igGetColumnsID")]
        private static extern ID GetColumnsIDImpl(char* str_id, int32 count);
        public static ID GetColumnsID(char* str_id, int32 count) => GetColumnsIDImpl(str_id, count);
        
        [LinkName("igGetContentRegionAvail")]
        private static extern Vec2 GetContentRegionAvailImpl(Vec2* pOut);
        public static Vec2 GetContentRegionAvail()
        {
            Vec2 pOut = default;
            GetContentRegionAvailImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetCurrentContext")]
        private static extern Context* GetCurrentContextImpl();
        #if IMGUI_USE_REF
        public static ref Context GetCurrentContext() { return ref *GetCurrentContextImpl(); }
        #else
        public static Context* GetCurrentContext() => GetCurrentContextImpl();
        #endif
        
        [LinkName("igGetCurrentFocusScope")]
        private static extern ID GetCurrentFocusScopeImpl();
        public static ID GetCurrentFocusScope() => GetCurrentFocusScopeImpl();
        
        [LinkName("igGetCurrentTabBar")]
        private static extern TabBar* GetCurrentTabBarImpl();
        #if IMGUI_USE_REF
        public static ref TabBar GetCurrentTabBar() { return ref *GetCurrentTabBarImpl(); }
        #else
        public static TabBar* GetCurrentTabBar() => GetCurrentTabBarImpl();
        #endif
        
        [LinkName("igGetCurrentTable")]
        private static extern Table* GetCurrentTableImpl();
        #if IMGUI_USE_REF
        public static ref Table GetCurrentTable() { return ref *GetCurrentTableImpl(); }
        #else
        public static Table* GetCurrentTable() => GetCurrentTableImpl();
        #endif
        
        [LinkName("igGetCurrentWindow")]
        private static extern Window* GetCurrentWindowImpl();
        #if IMGUI_USE_REF
        public static ref Window GetCurrentWindow() { return ref *GetCurrentWindowImpl(); }
        #else
        public static Window* GetCurrentWindow() => GetCurrentWindowImpl();
        #endif
        
        [LinkName("igGetCurrentWindowRead")]
        private static extern Window* GetCurrentWindowReadImpl();
        #if IMGUI_USE_REF
        public static ref Window GetCurrentWindowRead() { return ref *GetCurrentWindowReadImpl(); }
        #else
        public static Window* GetCurrentWindowRead() => GetCurrentWindowReadImpl();
        #endif
        
        [LinkName("igGetCursorPos")]
        private static extern Vec2 GetCursorPosImpl(Vec2* pOut);
        public static Vec2 GetCursorPos()
        {
            Vec2 pOut = default;
            GetCursorPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetCursorPosX")]
        private static extern float GetCursorPosXImpl();
        public static float GetCursorPosX() => GetCursorPosXImpl();
        
        [LinkName("igGetCursorPosY")]
        private static extern float GetCursorPosYImpl();
        public static float GetCursorPosY() => GetCursorPosYImpl();
        
        [LinkName("igGetCursorScreenPos")]
        private static extern Vec2 GetCursorScreenPosImpl(Vec2* pOut);
        public static Vec2 GetCursorScreenPos()
        {
            Vec2 pOut = default;
            GetCursorScreenPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetCursorStartPos")]
        private static extern Vec2 GetCursorStartPosImpl(Vec2* pOut);
        public static Vec2 GetCursorStartPos()
        {
            Vec2 pOut = default;
            GetCursorStartPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetDefaultFont")]
        private static extern Font* GetDefaultFontImpl();
        #if IMGUI_USE_REF
        public static ref Font GetDefaultFont() { return ref *GetDefaultFontImpl(); }
        #else
        public static Font* GetDefaultFont() => GetDefaultFontImpl();
        #endif
        
        [LinkName("igGetDragDropPayload")]
        private static extern Payload* GetDragDropPayloadImpl();
        #if IMGUI_USE_REF
        public static ref Payload GetDragDropPayload() { return ref *GetDragDropPayloadImpl(); }
        #else
        public static Payload* GetDragDropPayload() => GetDragDropPayloadImpl();
        #endif
        
        [LinkName("igGetDrawData")]
        private static extern DrawData* GetDrawDataImpl();
        #if IMGUI_USE_REF
        public static ref DrawData GetDrawData() { return ref *GetDrawDataImpl(); }
        #else
        public static DrawData* GetDrawData() => GetDrawDataImpl();
        #endif
        
        [LinkName("igGetDrawListSharedData")]
        private static extern DrawListSharedData* GetDrawListSharedDataImpl();
        #if IMGUI_USE_REF
        public static ref DrawListSharedData GetDrawListSharedData() { return ref *GetDrawListSharedDataImpl(); }
        #else
        public static DrawListSharedData* GetDrawListSharedData() => GetDrawListSharedDataImpl();
        #endif
        
        [LinkName("igGetFocusID")]
        private static extern ID GetFocusIDImpl();
        public static ID GetFocusID() => GetFocusIDImpl();
        
        [LinkName("igGetFont")]
        private static extern Font* GetFontImpl();
        #if IMGUI_USE_REF
        public static ref Font GetFont() { return ref *GetFontImpl(); }
        #else
        public static Font* GetFont() => GetFontImpl();
        #endif
        
        [LinkName("igGetFontBaked")]
        private static extern FontBaked* GetFontBakedImpl();
        #if IMGUI_USE_REF
        public static ref FontBaked GetFontBaked() { return ref *GetFontBakedImpl(); }
        #else
        public static FontBaked* GetFontBaked() => GetFontBakedImpl();
        #endif
        
        [LinkName("igGetFontRasterizerDensity")]
        private static extern float GetFontRasterizerDensityImpl();
        public static float GetFontRasterizerDensity() => GetFontRasterizerDensityImpl();
        
        [LinkName("igGetFontSize")]
        private static extern float GetFontSizeImpl();
        public static float GetFontSize() => GetFontSizeImpl();
        
        [LinkName("igGetFontTexUvWhitePixel")]
        private static extern Vec2 GetFontTexUvWhitePixelImpl(Vec2* pOut);
        public static Vec2 GetFontTexUvWhitePixel()
        {
            Vec2 pOut = default;
            GetFontTexUvWhitePixelImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetForegroundDrawList_ViewportPtr")]
        private static extern DrawList* GetForegroundDrawListImpl(Viewport* viewport);
        #if IMGUI_USE_REF
        public static ref DrawList GetForegroundDrawList(Viewport* viewport = null) { return ref *GetForegroundDrawListImpl(viewport); }
        #else
        public static DrawList* GetForegroundDrawList(Viewport* viewport = null) => GetForegroundDrawListImpl(viewport);
        #endif
        
        [LinkName("igGetForegroundDrawList_WindowPtr")]
        private static extern DrawList* GetForegroundDrawListImpl(Window* window);
        #if IMGUI_USE_REF
        public static ref DrawList GetForegroundDrawList(Window* window) { return ref *GetForegroundDrawListImpl(window); }
        #else
        public static DrawList* GetForegroundDrawList(Window* window) => GetForegroundDrawListImpl(window);
        #endif
        
        [LinkName("igGetFrameCount")]
        private static extern int32 GetFrameCountImpl();
        public static int32 GetFrameCount() => GetFrameCountImpl();
        
        [LinkName("igGetFrameHeight")]
        private static extern float GetFrameHeightImpl();
        public static float GetFrameHeight() => GetFrameHeightImpl();
        
        [LinkName("igGetFrameHeightWithSpacing")]
        private static extern float GetFrameHeightWithSpacingImpl();
        public static float GetFrameHeightWithSpacing() => GetFrameHeightWithSpacingImpl();
        
        [LinkName("igGetHoveredID")]
        private static extern ID GetHoveredIDImpl();
        public static ID GetHoveredID() => GetHoveredIDImpl();
        
        [LinkName("igGetID_Str")]
        private static extern ID GetIDImpl(char* str_id);
        public static ID GetID(char* str_id) => GetIDImpl(str_id);
        
        [LinkName("igGetID_StrStr")]
        private static extern ID GetIDImpl(char* str_id_begin, char* str_id_end);
        public static ID GetID(char* str_id_begin, char* str_id_end) => GetIDImpl(str_id_begin, str_id_end);
        
        [LinkName("igGetID_Ptr")]
        private static extern ID GetIDImpl(void* ptr_id);
        public static ID GetID(void* ptr_id) => GetIDImpl(ptr_id);
        
        [LinkName("igGetID_Int")]
        private static extern ID GetIDImpl(int32 int_id);
        public static ID GetID(int32 int_id) => GetIDImpl(int_id);
        
        [LinkName("igGetIDWithSeed_Str")]
        private static extern ID GetIDWithSeedImpl(char* str_id_begin, char* str_id_end, ID seed);
        public static ID GetIDWithSeed(char* str_id_begin, char* str_id_end, ID seed) => GetIDWithSeedImpl(str_id_begin, str_id_end, seed);
        
        [LinkName("igGetIDWithSeed_Int")]
        private static extern ID GetIDWithSeedImpl(int32 n, ID seed);
        public static ID GetIDWithSeed(int32 n, ID seed) => GetIDWithSeedImpl(n, seed);
        
        [LinkName("igGetIO_Nil")]
        private static extern IO* GetIOImpl();
        #if IMGUI_USE_REF
        public static ref IO GetIO() { return ref *GetIOImpl(); }
        #else
        public static IO* GetIO() => GetIOImpl();
        #endif
        
        [LinkName("igGetIO_ContextPtr")]
        private static extern IO* GetIOImpl(Context* ctx);
        #if IMGUI_USE_REF
        public static ref IO GetIO(Context* ctx) { return ref *GetIOImpl(ctx); }
        #else
        public static IO* GetIO(Context* ctx) => GetIOImpl(ctx);
        #endif
        
        [LinkName("igGetInputTextState")]
        private static extern InputTextState* GetInputTextStateImpl(ID id);
        #if IMGUI_USE_REF
        public static ref InputTextState GetInputTextState(ID id) { return ref *GetInputTextStateImpl(id); }
        #else
        public static InputTextState* GetInputTextState(ID id) => GetInputTextStateImpl(id);
        #endif
        
        [LinkName("igGetItemFlags")]
        private static extern ItemFlags GetItemFlagsImpl();
        public static ItemFlags GetItemFlags() => GetItemFlagsImpl();
        
        [LinkName("igGetItemID")]
        private static extern ID GetItemIDImpl();
        public static ID GetItemID() => GetItemIDImpl();
        
        [LinkName("igGetItemRectMax")]
        private static extern Vec2 GetItemRectMaxImpl(Vec2* pOut);
        public static Vec2 GetItemRectMax()
        {
            Vec2 pOut = default;
            GetItemRectMaxImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetItemRectMin")]
        private static extern Vec2 GetItemRectMinImpl(Vec2* pOut);
        public static Vec2 GetItemRectMin()
        {
            Vec2 pOut = default;
            GetItemRectMinImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetItemRectSize")]
        private static extern Vec2 GetItemRectSizeImpl(Vec2* pOut);
        public static Vec2 GetItemRectSize()
        {
            Vec2 pOut = default;
            GetItemRectSizeImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetItemStatusFlags")]
        private static extern ItemStatusFlags GetItemStatusFlagsImpl();
        public static ItemStatusFlags GetItemStatusFlags() => GetItemStatusFlagsImpl();
        
        [LinkName("igGetKeyChordName")]
        private static extern char* GetKeyChordNameImpl(KeyChord key_chord);
        #if IMGUI_USE_REF
        public static ref char GetKeyChordName(KeyChord key_chord) { return ref *GetKeyChordNameImpl(key_chord); }
        #else
        public static char* GetKeyChordName(KeyChord key_chord) => GetKeyChordNameImpl(key_chord);
        #endif
        
        [LinkName("igGetKeyData_ContextPtr")]
        private static extern KeyData* GetKeyDataImpl(Context* ctx, Key key);
        #if IMGUI_USE_REF
        public static ref KeyData GetKeyData(Context* ctx, Key key) { return ref *GetKeyDataImpl(ctx, key); }
        #else
        public static KeyData* GetKeyData(Context* ctx, Key key) => GetKeyDataImpl(ctx, key);
        #endif
        
        [LinkName("igGetKeyData_Key")]
        private static extern KeyData* GetKeyDataImpl(Key key);
        #if IMGUI_USE_REF
        public static ref KeyData GetKeyData(Key key) { return ref *GetKeyDataImpl(key); }
        #else
        public static KeyData* GetKeyData(Key key) => GetKeyDataImpl(key);
        #endif
        
        [LinkName("igGetKeyMagnitude2d")]
        private static extern Vec2 GetKeyMagnitude2dImpl(Vec2* pOut, Key key_left, Key key_right, Key key_up, Key key_down);
        public static Vec2 GetKeyMagnitude2d(Key key_left, Key key_right, Key key_up, Key key_down)
        {
            Vec2 pOut = default;
            GetKeyMagnitude2dImpl(&pOut, key_left, key_right, key_up, key_down);
            return pOut;
        }
        
        [LinkName("igGetKeyName")]
        private static extern char* GetKeyNameImpl(Key key);
        #if IMGUI_USE_REF
        public static ref char GetKeyName(Key key) { return ref *GetKeyNameImpl(key); }
        #else
        public static char* GetKeyName(Key key) => GetKeyNameImpl(key);
        #endif
        
        [LinkName("igGetKeyOwner")]
        private static extern ID GetKeyOwnerImpl(Key key);
        public static ID GetKeyOwner(Key key) => GetKeyOwnerImpl(key);
        
        [LinkName("igGetKeyOwnerData")]
        private static extern KeyOwnerData* GetKeyOwnerDataImpl(Context* ctx, Key key);
        #if IMGUI_USE_REF
        public static ref KeyOwnerData GetKeyOwnerData(Context* ctx, Key key) { return ref *GetKeyOwnerDataImpl(ctx, key); }
        #else
        public static KeyOwnerData* GetKeyOwnerData(Context* ctx, Key key) => GetKeyOwnerDataImpl(ctx, key);
        #endif
        
        [LinkName("igGetKeyPressedAmount")]
        private static extern int32 GetKeyPressedAmountImpl(Key key, float repeat_delay, float rate);
        public static int32 GetKeyPressedAmount(Key key, float repeat_delay, float rate) => GetKeyPressedAmountImpl(key, repeat_delay, rate);
        
        [LinkName("igGetMainViewport")]
        private static extern Viewport* GetMainViewportImpl();
        #if IMGUI_USE_REF
        public static ref Viewport GetMainViewport() { return ref *GetMainViewportImpl(); }
        #else
        public static Viewport* GetMainViewport() => GetMainViewportImpl();
        #endif
        
        [LinkName("igGetMouseClickedCount")]
        private static extern int32 GetMouseClickedCountImpl(MouseButton button);
        public static int32 GetMouseClickedCount(MouseButton button) => GetMouseClickedCountImpl(button);
        
        [LinkName("igGetMouseCursor")]
        private static extern MouseCursor GetMouseCursorImpl();
        public static MouseCursor GetMouseCursor() => GetMouseCursorImpl();
        
        [LinkName("igGetMouseDragDelta")]
        private static extern Vec2 GetMouseDragDeltaImpl(Vec2* pOut, MouseButton button, float lock_threshold);
        public static Vec2 GetMouseDragDelta(MouseButton button = (MouseButton) 0, float lock_threshold = -1.0f)
        {
            Vec2 pOut = default;
            GetMouseDragDeltaImpl(&pOut, button, lock_threshold);
            return pOut;
        }
        
        [LinkName("igGetMousePos")]
        private static extern Vec2 GetMousePosImpl(Vec2* pOut);
        public static Vec2 GetMousePos()
        {
            Vec2 pOut = default;
            GetMousePosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetMousePosOnOpeningCurrentPopup")]
        private static extern Vec2 GetMousePosOnOpeningCurrentPopupImpl(Vec2* pOut);
        public static Vec2 GetMousePosOnOpeningCurrentPopup()
        {
            Vec2 pOut = default;
            GetMousePosOnOpeningCurrentPopupImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetMultiSelectState")]
        private static extern MultiSelectState* GetMultiSelectStateImpl(ID id);
        #if IMGUI_USE_REF
        public static ref MultiSelectState GetMultiSelectState(ID id) { return ref *GetMultiSelectStateImpl(id); }
        #else
        public static MultiSelectState* GetMultiSelectState(ID id) => GetMultiSelectStateImpl(id);
        #endif
        
        [LinkName("igGetNavTweakPressedAmount")]
        private static extern float GetNavTweakPressedAmountImpl(Axis axis);
        public static float GetNavTweakPressedAmount(Axis axis) => GetNavTweakPressedAmountImpl(axis);
        
        [LinkName("igGetPlatformIO_Nil")]
        private static extern PlatformIO* GetPlatformIOImpl();
        #if IMGUI_USE_REF
        public static ref PlatformIO GetPlatformIO() { return ref *GetPlatformIOImpl(); }
        #else
        public static PlatformIO* GetPlatformIO() => GetPlatformIOImpl();
        #endif
        
        [LinkName("igGetPlatformIO_ContextPtr")]
        private static extern PlatformIO* GetPlatformIOImpl(Context* ctx);
        #if IMGUI_USE_REF
        public static ref PlatformIO GetPlatformIO(Context* ctx) { return ref *GetPlatformIOImpl(ctx); }
        #else
        public static PlatformIO* GetPlatformIO(Context* ctx) => GetPlatformIOImpl(ctx);
        #endif
        
        [LinkName("igGetPopupAllowedExtentRect")]
        private static extern Rect GetPopupAllowedExtentRectImpl(Rect* pOut, Window* window);
        public static Rect GetPopupAllowedExtentRect(Window* window)
        {
            Rect pOut = default;
            GetPopupAllowedExtentRectImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igGetRoundedFontSize")]
        private static extern float GetRoundedFontSizeImpl(float size);
        public static float GetRoundedFontSize(float size) => GetRoundedFontSizeImpl(size);
        
        [LinkName("igGetScrollMaxX")]
        private static extern float GetScrollMaxXImpl();
        public static float GetScrollMaxX() => GetScrollMaxXImpl();
        
        [LinkName("igGetScrollMaxY")]
        private static extern float GetScrollMaxYImpl();
        public static float GetScrollMaxY() => GetScrollMaxYImpl();
        
        [LinkName("igGetScrollX")]
        private static extern float GetScrollXImpl();
        public static float GetScrollX() => GetScrollXImpl();
        
        [LinkName("igGetScrollY")]
        private static extern float GetScrollYImpl();
        public static float GetScrollY() => GetScrollYImpl();
        
        [LinkName("igGetShortcutRoutingData")]
        private static extern KeyRoutingData* GetShortcutRoutingDataImpl(KeyChord key_chord);
        #if IMGUI_USE_REF
        public static ref KeyRoutingData GetShortcutRoutingData(KeyChord key_chord) { return ref *GetShortcutRoutingDataImpl(key_chord); }
        #else
        public static KeyRoutingData* GetShortcutRoutingData(KeyChord key_chord) => GetShortcutRoutingDataImpl(key_chord);
        #endif
        
        [LinkName("igGetStateStorage")]
        private static extern Storage* GetStateStorageImpl();
        #if IMGUI_USE_REF
        public static ref Storage GetStateStorage() { return ref *GetStateStorageImpl(); }
        #else
        public static Storage* GetStateStorage() => GetStateStorageImpl();
        #endif
        
        [LinkName("igGetStyle")]
        private static extern Style* GetStyleImpl();
        #if IMGUI_USE_REF
        public static ref Style GetStyle() { return ref *GetStyleImpl(); }
        #else
        public static Style* GetStyle() => GetStyleImpl();
        #endif
        
        [LinkName("igGetStyleColorName")]
        private static extern char* GetStyleColorNameImpl(Col idx);
        #if IMGUI_USE_REF
        public static ref char GetStyleColorName(Col idx) { return ref *GetStyleColorNameImpl(idx); }
        #else
        public static char* GetStyleColorName(Col idx) => GetStyleColorNameImpl(idx);
        #endif
        
        [LinkName("igGetStyleColorVec4")]
        private static extern Vec4* GetStyleColorVec4Impl(Col idx);
        #if IMGUI_USE_REF
        public static ref Vec4 GetStyleColorVec4(Col idx) { return ref *GetStyleColorVec4Impl(idx); }
        #else
        public static Vec4* GetStyleColorVec4(Col idx) => GetStyleColorVec4Impl(idx);
        #endif
        
        [LinkName("igGetStyleVarInfo")]
        private static extern StyleVarInfo* GetStyleVarInfoImpl(StyleVar idx);
        #if IMGUI_USE_REF
        public static ref StyleVarInfo GetStyleVarInfo(StyleVar idx) { return ref *GetStyleVarInfoImpl(idx); }
        #else
        public static StyleVarInfo* GetStyleVarInfo(StyleVar idx) => GetStyleVarInfoImpl(idx);
        #endif
        
        [LinkName("igGetTextLineHeight")]
        private static extern float GetTextLineHeightImpl();
        public static float GetTextLineHeight() => GetTextLineHeightImpl();
        
        [LinkName("igGetTextLineHeightWithSpacing")]
        private static extern float GetTextLineHeightWithSpacingImpl();
        public static float GetTextLineHeightWithSpacing() => GetTextLineHeightWithSpacingImpl();
        
        [LinkName("igGetTime")]
        private static extern double GetTimeImpl();
        public static double GetTime() => GetTimeImpl();
        
        [LinkName("igGetTopMostAndVisiblePopupModal")]
        private static extern Window* GetTopMostAndVisiblePopupModalImpl();
        #if IMGUI_USE_REF
        public static ref Window GetTopMostAndVisiblePopupModal() { return ref *GetTopMostAndVisiblePopupModalImpl(); }
        #else
        public static Window* GetTopMostAndVisiblePopupModal() => GetTopMostAndVisiblePopupModalImpl();
        #endif
        
        [LinkName("igGetTopMostPopupModal")]
        private static extern Window* GetTopMostPopupModalImpl();
        #if IMGUI_USE_REF
        public static ref Window GetTopMostPopupModal() { return ref *GetTopMostPopupModalImpl(); }
        #else
        public static Window* GetTopMostPopupModal() => GetTopMostPopupModalImpl();
        #endif
        
        [LinkName("igGetTreeNodeToLabelSpacing")]
        private static extern float GetTreeNodeToLabelSpacingImpl();
        public static float GetTreeNodeToLabelSpacing() => GetTreeNodeToLabelSpacingImpl();
        
        [LinkName("igGetTypematicRepeatRate")]
        private static extern void GetTypematicRepeatRateImpl(InputFlags flags, float* repeat_delay, float* repeat_rate);
        public static void GetTypematicRepeatRate(InputFlags flags, float* repeat_delay, float* repeat_rate) => GetTypematicRepeatRateImpl(flags, repeat_delay, repeat_rate);
        
        [LinkName("igGetTypingSelectRequest")]
        private static extern TypingSelectRequest* GetTypingSelectRequestImpl(TypingSelectFlags flags);
        #if IMGUI_USE_REF
        public static ref TypingSelectRequest GetTypingSelectRequest(TypingSelectFlags flags = .None) { return ref *GetTypingSelectRequestImpl(flags); }
        #else
        public static TypingSelectRequest* GetTypingSelectRequest(TypingSelectFlags flags = .None) => GetTypingSelectRequestImpl(flags);
        #endif
        
        [LinkName("igGetVersion")]
        private static extern char* GetVersionImpl();
        #if IMGUI_USE_REF
        public static ref char GetVersion() { return ref *GetVersionImpl(); }
        #else
        public static char* GetVersion() => GetVersionImpl();
        #endif
        
        [LinkName("igGetViewportPlatformMonitor")]
        private static extern PlatformMonitor* GetViewportPlatformMonitorImpl(Viewport* viewport);
        #if IMGUI_USE_REF
        public static ref PlatformMonitor GetViewportPlatformMonitor(Viewport* viewport) { return ref *GetViewportPlatformMonitorImpl(viewport); }
        #else
        public static PlatformMonitor* GetViewportPlatformMonitor(Viewport* viewport) => GetViewportPlatformMonitorImpl(viewport);
        #endif
        
        [LinkName("igGetWindowAlwaysWantOwnTabBar")]
        private static extern bool GetWindowAlwaysWantOwnTabBarImpl(Window* window);
        public static bool GetWindowAlwaysWantOwnTabBar(Window* window) => GetWindowAlwaysWantOwnTabBarImpl(window);
        
        [LinkName("igGetWindowDockID")]
        private static extern ID GetWindowDockIDImpl();
        public static ID GetWindowDockID() => GetWindowDockIDImpl();
        
        [LinkName("igGetWindowDockNode")]
        private static extern DockNode* GetWindowDockNodeImpl();
        #if IMGUI_USE_REF
        public static ref DockNode GetWindowDockNode() { return ref *GetWindowDockNodeImpl(); }
        #else
        public static DockNode* GetWindowDockNode() => GetWindowDockNodeImpl();
        #endif
        
        [LinkName("igGetWindowDpiScale")]
        private static extern float GetWindowDpiScaleImpl();
        public static float GetWindowDpiScale() => GetWindowDpiScaleImpl();
        
        [LinkName("igGetWindowDrawList")]
        private static extern DrawList* GetWindowDrawListImpl();
        #if IMGUI_USE_REF
        public static ref DrawList GetWindowDrawList() { return ref *GetWindowDrawListImpl(); }
        #else
        public static DrawList* GetWindowDrawList() => GetWindowDrawListImpl();
        #endif
        
        [LinkName("igGetWindowHeight")]
        private static extern float GetWindowHeightImpl();
        public static float GetWindowHeight() => GetWindowHeightImpl();
        
        [LinkName("igGetWindowPos")]
        private static extern Vec2 GetWindowPosImpl(Vec2* pOut);
        public static Vec2 GetWindowPos()
        {
            Vec2 pOut = default;
            GetWindowPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetWindowResizeBorderID")]
        private static extern ID GetWindowResizeBorderIDImpl(Window* window, Dir dir);
        public static ID GetWindowResizeBorderID(Window* window, Dir dir) => GetWindowResizeBorderIDImpl(window, dir);
        
        [LinkName("igGetWindowResizeCornerID")]
        private static extern ID GetWindowResizeCornerIDImpl(Window* window, int32 n);
        public static ID GetWindowResizeCornerID(Window* window, int32 n) => GetWindowResizeCornerIDImpl(window, n);
        
        [LinkName("igGetWindowScrollbarID")]
        private static extern ID GetWindowScrollbarIDImpl(Window* window, Axis axis);
        public static ID GetWindowScrollbarID(Window* window, Axis axis) => GetWindowScrollbarIDImpl(window, axis);
        
        [LinkName("igGetWindowScrollbarRect")]
        private static extern Rect GetWindowScrollbarRectImpl(Rect* pOut, Window* window, Axis axis);
        public static Rect GetWindowScrollbarRect(Window* window, Axis axis)
        {
            Rect pOut = default;
            GetWindowScrollbarRectImpl(&pOut, window, axis);
            return pOut;
        }
        
        [LinkName("igGetWindowSize")]
        private static extern Vec2 GetWindowSizeImpl(Vec2* pOut);
        public static Vec2 GetWindowSize()
        {
            Vec2 pOut = default;
            GetWindowSizeImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetWindowViewport")]
        private static extern Viewport* GetWindowViewportImpl();
        #if IMGUI_USE_REF
        public static ref Viewport GetWindowViewport() { return ref *GetWindowViewportImpl(); }
        #else
        public static Viewport* GetWindowViewport() => GetWindowViewportImpl();
        #endif
        
        [LinkName("igGetWindowWidth")]
        private static extern float GetWindowWidthImpl();
        public static float GetWindowWidth() => GetWindowWidthImpl();
        
        [LinkName("igImAbs_Int")]
        private static extern int32 ImAbsImpl(int32 x);
        public static int32 ImAbs(int32 x) => ImAbsImpl(x);
        
        [LinkName("igImAbs_Float")]
        private static extern float ImAbsImpl(float x);
        public static float ImAbs(float x) => ImAbsImpl(x);
        
        [LinkName("igImAbs_double")]
        private static extern double ImAbsImpl(double x);
        public static double ImAbs(double x) => ImAbsImpl(x);
        
        [LinkName("igImAlphaBlendColors")]
        private static extern U32 ImAlphaBlendColorsImpl(U32 col_a, U32 col_b);
        public static U32 ImAlphaBlendColors(U32 col_a, U32 col_b) => ImAlphaBlendColorsImpl(col_a, col_b);
        
        [LinkName("igImBezierCubicCalc")]
        private static extern Vec2 ImBezierCubicCalcImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, float t);
        public static Vec2 ImBezierCubicCalc(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, float t)
        {
            Vec2 pOut = default;
            ImBezierCubicCalcImpl(&pOut, p1, p2, p3, p4, t);
            return pOut;
        }
        
        [LinkName("igImBezierCubicClosestPoint")]
        private static extern Vec2 ImBezierCubicClosestPointImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, int32 num_segments);
        public static Vec2 ImBezierCubicClosestPoint(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, int32 num_segments)
        {
            Vec2 pOut = default;
            ImBezierCubicClosestPointImpl(&pOut, p1, p2, p3, p4, p, num_segments);
            return pOut;
        }
        
        [LinkName("igImBezierCubicClosestPointCasteljau")]
        private static extern Vec2 ImBezierCubicClosestPointCasteljauImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, float tess_tol);
        public static Vec2 ImBezierCubicClosestPointCasteljau(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, float tess_tol)
        {
            Vec2 pOut = default;
            ImBezierCubicClosestPointCasteljauImpl(&pOut, p1, p2, p3, p4, p, tess_tol);
            return pOut;
        }
        
        [LinkName("igImBezierQuadraticCalc")]
        private static extern Vec2 ImBezierQuadraticCalcImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, float t);
        public static Vec2 ImBezierQuadraticCalc(Vec2 p1, Vec2 p2, Vec2 p3, float t)
        {
            Vec2 pOut = default;
            ImBezierQuadraticCalcImpl(&pOut, p1, p2, p3, t);
            return pOut;
        }
        
        [LinkName("igImBitArrayClearAllBits")]
        private static extern void ImBitArrayClearAllBitsImpl(U32* arr, int32 bitcount);
        public static void ImBitArrayClearAllBits(U32* arr, int32 bitcount) => ImBitArrayClearAllBitsImpl(arr, bitcount);
        
        [LinkName("igImBitArrayClearBit")]
        private static extern void ImBitArrayClearBitImpl(U32* arr, int32 n);
        public static void ImBitArrayClearBit(U32* arr, int32 n) => ImBitArrayClearBitImpl(arr, n);
        
        [LinkName("igImBitArrayGetStorageSizeInBytes")]
        private static extern size ImBitArrayGetStorageSizeInBytesImpl(int32 bitcount);
        public static size ImBitArrayGetStorageSizeInBytes(int32 bitcount) => ImBitArrayGetStorageSizeInBytesImpl(bitcount);
        
        [LinkName("igImBitArraySetBit")]
        private static extern void ImBitArraySetBitImpl(U32* arr, int32 n);
        public static void ImBitArraySetBit(U32* arr, int32 n) => ImBitArraySetBitImpl(arr, n);
        
        [LinkName("igImBitArraySetBitRange")]
        private static extern void ImBitArraySetBitRangeImpl(U32* arr, int32 n, int32 n2);
        public static void ImBitArraySetBitRange(U32* arr, int32 n, int32 n2) => ImBitArraySetBitRangeImpl(arr, n, n2);
        
        [LinkName("igImBitArrayTestBit")]
        private static extern bool ImBitArrayTestBitImpl(U32* arr, int32 n);
        public static bool ImBitArrayTestBit(U32* arr, int32 n) => ImBitArrayTestBitImpl(arr, n);
        
        [LinkName("igImCharIsBlankA")]
        private static extern bool ImCharIsBlankAImpl(char c);
        public static bool ImCharIsBlankA(char c) => ImCharIsBlankAImpl(c);
        
        [LinkName("igImCharIsBlankW")]
        private static extern bool ImCharIsBlankWImpl(uint32 c);
        public static bool ImCharIsBlankW(uint32 c) => ImCharIsBlankWImpl(c);
        
        [LinkName("igImCharIsXdigitA")]
        private static extern bool ImCharIsXdigitAImpl(char c);
        public static bool ImCharIsXdigitA(char c) => ImCharIsXdigitAImpl(c);
        
        [LinkName("igImClamp")]
        private static extern Vec2 ImClampImpl(Vec2* pOut, Vec2 v, Vec2 mn, Vec2 mx);
        public static Vec2 ImClamp(Vec2 v, Vec2 mn, Vec2 mx)
        {
            Vec2 pOut = default;
            ImClampImpl(&pOut, v, mn, mx);
            return pOut;
        }
        
        [LinkName("igImCountSetBits")]
        private static extern uint32 ImCountSetBitsImpl(uint32 v);
        public static uint32 ImCountSetBits(uint32 v) => ImCountSetBitsImpl(v);
        
        [LinkName("igImDot")]
        private static extern float ImDotImpl(Vec2 a, Vec2 b);
        public static float ImDot(Vec2 a, Vec2 b) => ImDotImpl(a, b);
        
        [LinkName("igImExponentialMovingAverage")]
        private static extern float ImExponentialMovingAverageImpl(float avg, float sample, int32 n);
        public static float ImExponentialMovingAverage(float avg, float sample, int32 n) => ImExponentialMovingAverageImpl(avg, sample, n);
        
        [LinkName("igImFileClose")]
        private static extern bool ImFileCloseImpl(FileHandle file);
        public static bool ImFileClose(FileHandle file) => ImFileCloseImpl(file);
        
        [LinkName("igImFileGetSize")]
        private static extern U64 ImFileGetSizeImpl(FileHandle file);
        public static U64 ImFileGetSize(FileHandle file) => ImFileGetSizeImpl(file);
        
        [LinkName("igImFileLoadToMemory")]
        private static extern void* ImFileLoadToMemoryImpl(char* filename, char* mode, size* out_file_size, int32 padding_bytes);
        #if IMGUI_USE_REF
        public static ref void ImFileLoadToMemory(char* filename, char* mode, size* out_file_size = null, int32 padding_bytes = (int32) 0) { return ref *ImFileLoadToMemoryImpl(filename, mode, out_file_size, padding_bytes); }
        #else
        public static void* ImFileLoadToMemory(char* filename, char* mode, size* out_file_size = null, int32 padding_bytes = (int32) 0) => ImFileLoadToMemoryImpl(filename, mode, out_file_size, padding_bytes);
        #endif
        
        [LinkName("igImFileOpen")]
        private static extern FileHandle ImFileOpenImpl(char* filename, char* mode);
        public static FileHandle ImFileOpen(char* filename, char* mode) => ImFileOpenImpl(filename, mode);
        
        [LinkName("igImFileRead")]
        private static extern U64 ImFileReadImpl(void* data, U64 size, U64 count, FileHandle file);
        public static U64 ImFileRead(void* data, U64 size, U64 count, FileHandle file) => ImFileReadImpl(data, size, count, file);
        
        [LinkName("igImFileWrite")]
        private static extern U64 ImFileWriteImpl(void* data, U64 size, U64 count, FileHandle file);
        public static U64 ImFileWrite(void* data, U64 size, U64 count, FileHandle file) => ImFileWriteImpl(data, size, count, file);
        
        [LinkName("igImFloor_Float")]
        private static extern float ImFloorImpl(float f);
        public static float ImFloor(float f) => ImFloorImpl(f);
        
        [LinkName("igImFloor_Vec2")]
        private static extern Vec2 ImFloorImpl(Vec2* pOut, Vec2 v);
        public static Vec2 ImFloor(Vec2 v)
        {
            Vec2 pOut = default;
            ImFloorImpl(&pOut, v);
            return pOut;
        }
        
        [LinkName("igImFontAtlasAddDrawListSharedData")]
        private static extern void ImFontAtlasAddDrawListSharedDataImpl(FontAtlas* atlas, DrawListSharedData* data);
        public static void ImFontAtlasAddDrawListSharedData(FontAtlas* atlas, DrawListSharedData* data) => ImFontAtlasAddDrawListSharedDataImpl(atlas, data);
        
        [LinkName("igImFontAtlasBakedAdd")]
        private static extern FontBaked* ImFontAtlasBakedAddImpl(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density, ID baked_id);
        #if IMGUI_USE_REF
        public static ref FontBaked ImFontAtlasBakedAdd(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density, ID baked_id) { return ref *ImFontAtlasBakedAddImpl(atlas, font, font_size, font_rasterizer_density, baked_id); }
        #else
        public static FontBaked* ImFontAtlasBakedAdd(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density, ID baked_id) => ImFontAtlasBakedAddImpl(atlas, font, font_size, font_rasterizer_density, baked_id);
        #endif
        
        [LinkName("igImFontAtlasBakedAddFontGlyph")]
        private static extern FontGlyph* ImFontAtlasBakedAddFontGlyphImpl(FontAtlas* atlas, FontBaked* baked, FontConfig* src, FontGlyph* in_glyph);
        #if IMGUI_USE_REF
        public static ref FontGlyph ImFontAtlasBakedAddFontGlyph(FontAtlas* atlas, FontBaked* baked, FontConfig* src, FontGlyph* in_glyph) { return ref *ImFontAtlasBakedAddFontGlyphImpl(atlas, baked, src, in_glyph); }
        #else
        public static FontGlyph* ImFontAtlasBakedAddFontGlyph(FontAtlas* atlas, FontBaked* baked, FontConfig* src, FontGlyph* in_glyph) => ImFontAtlasBakedAddFontGlyphImpl(atlas, baked, src, in_glyph);
        #endif
        
        [LinkName("igImFontAtlasBakedAddFontGlyphAdvancedX")]
        private static extern void ImFontAtlasBakedAddFontGlyphAdvancedXImpl(FontAtlas* atlas, FontBaked* baked, FontConfig* src, Wchar codepoint, float advance_x);
        public static void ImFontAtlasBakedAddFontGlyphAdvancedX(FontAtlas* atlas, FontBaked* baked, FontConfig* src, Wchar codepoint, float advance_x) => ImFontAtlasBakedAddFontGlyphAdvancedXImpl(atlas, baked, src, codepoint, advance_x);
        
        [LinkName("igImFontAtlasBakedDiscard")]
        private static extern void ImFontAtlasBakedDiscardImpl(FontAtlas* atlas, Font* font, FontBaked* baked);
        public static void ImFontAtlasBakedDiscard(FontAtlas* atlas, Font* font, FontBaked* baked) => ImFontAtlasBakedDiscardImpl(atlas, font, baked);
        
        [LinkName("igImFontAtlasBakedDiscardFontGlyph")]
        private static extern void ImFontAtlasBakedDiscardFontGlyphImpl(FontAtlas* atlas, Font* font, FontBaked* baked, FontGlyph* glyph);
        public static void ImFontAtlasBakedDiscardFontGlyph(FontAtlas* atlas, Font* font, FontBaked* baked, FontGlyph* glyph) => ImFontAtlasBakedDiscardFontGlyphImpl(atlas, font, baked, glyph);
        
        [LinkName("igImFontAtlasBakedGetClosestMatch")]
        private static extern FontBaked* ImFontAtlasBakedGetClosestMatchImpl(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density);
        #if IMGUI_USE_REF
        public static ref FontBaked ImFontAtlasBakedGetClosestMatch(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density) { return ref *ImFontAtlasBakedGetClosestMatchImpl(atlas, font, font_size, font_rasterizer_density); }
        #else
        public static FontBaked* ImFontAtlasBakedGetClosestMatch(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density) => ImFontAtlasBakedGetClosestMatchImpl(atlas, font, font_size, font_rasterizer_density);
        #endif
        
        [LinkName("igImFontAtlasBakedGetId")]
        private static extern ID ImFontAtlasBakedGetIdImpl(ID font_id, float baked_size, float rasterizer_density);
        public static ID ImFontAtlasBakedGetId(ID font_id, float baked_size, float rasterizer_density) => ImFontAtlasBakedGetIdImpl(font_id, baked_size, rasterizer_density);
        
        [LinkName("igImFontAtlasBakedGetOrAdd")]
        private static extern FontBaked* ImFontAtlasBakedGetOrAddImpl(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density);
        #if IMGUI_USE_REF
        public static ref FontBaked ImFontAtlasBakedGetOrAdd(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density) { return ref *ImFontAtlasBakedGetOrAddImpl(atlas, font, font_size, font_rasterizer_density); }
        #else
        public static FontBaked* ImFontAtlasBakedGetOrAdd(FontAtlas* atlas, Font* font, float font_size, float font_rasterizer_density) => ImFontAtlasBakedGetOrAddImpl(atlas, font, font_size, font_rasterizer_density);
        #endif
        
        [LinkName("igImFontAtlasBakedSetFontGlyphBitmap")]
        private static extern void ImFontAtlasBakedSetFontGlyphBitmapImpl(FontAtlas* atlas, FontBaked* baked, FontConfig* src, FontGlyph* glyph, TextureRect* r, uchar* src_pixels, TextureFormat src_fmt, int32 src_pitch);
        public static void ImFontAtlasBakedSetFontGlyphBitmap(FontAtlas* atlas, FontBaked* baked, FontConfig* src, FontGlyph* glyph, TextureRect* r, uchar* src_pixels, TextureFormat src_fmt, int32 src_pitch) => ImFontAtlasBakedSetFontGlyphBitmapImpl(atlas, baked, src, glyph, r, src_pixels, src_fmt, src_pitch);
        
        [LinkName("igImFontAtlasBuildClear")]
        private static extern void ImFontAtlasBuildClearImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildClear(FontAtlas* atlas) => ImFontAtlasBuildClearImpl(atlas);
        
        [LinkName("igImFontAtlasBuildDestroy")]
        private static extern void ImFontAtlasBuildDestroyImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildDestroy(FontAtlas* atlas) => ImFontAtlasBuildDestroyImpl(atlas);
        
        [LinkName("igImFontAtlasBuildDiscardBakes")]
        private static extern void ImFontAtlasBuildDiscardBakesImpl(FontAtlas* atlas, int32 unused_frames);
        public static void ImFontAtlasBuildDiscardBakes(FontAtlas* atlas, int32 unused_frames) => ImFontAtlasBuildDiscardBakesImpl(atlas, unused_frames);
        
        [LinkName("igImFontAtlasBuildGetOversampleFactors")]
        private static extern void ImFontAtlasBuildGetOversampleFactorsImpl(FontConfig* src, FontBaked* baked, int32* out_oversample_h, int32* out_oversample_v);
        public static void ImFontAtlasBuildGetOversampleFactors(FontConfig* src, FontBaked* baked, out int32 out_oversample_h, out int32 out_oversample_v)
        {
            out_oversample_h = ?;
            out_oversample_v = ?;
        }
        
        [LinkName("igImFontAtlasBuildInit")]
        private static extern void ImFontAtlasBuildInitImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildInit(FontAtlas* atlas) => ImFontAtlasBuildInitImpl(atlas);
        
        [LinkName("igImFontAtlasBuildLegacyPreloadAllGlyphRanges")]
        private static extern void ImFontAtlasBuildLegacyPreloadAllGlyphRangesImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildLegacyPreloadAllGlyphRanges(FontAtlas* atlas) => ImFontAtlasBuildLegacyPreloadAllGlyphRangesImpl(atlas);
        
        [LinkName("igImFontAtlasBuildMain")]
        private static extern void ImFontAtlasBuildMainImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildMain(FontAtlas* atlas) => ImFontAtlasBuildMainImpl(atlas);
        
        [LinkName("igImFontAtlasBuildRenderBitmapFromString")]
        private static extern void ImFontAtlasBuildRenderBitmapFromStringImpl(FontAtlas* atlas, int32 x, int32 y, int32 w, int32 h, char* in_str, char in_marker_char);
        public static void ImFontAtlasBuildRenderBitmapFromString(FontAtlas* atlas, int32 x, int32 y, int32 w, int32 h, char* in_str, char in_marker_char) => ImFontAtlasBuildRenderBitmapFromStringImpl(atlas, x, y, w, h, in_str, in_marker_char);
        
        [LinkName("igImFontAtlasBuildSetupFontLoader")]
        private static extern void ImFontAtlasBuildSetupFontLoaderImpl(FontAtlas* atlas, FontLoader* font_loader);
        public static void ImFontAtlasBuildSetupFontLoader(FontAtlas* atlas, FontLoader* font_loader) => ImFontAtlasBuildSetupFontLoaderImpl(atlas, font_loader);
        
        [LinkName("igImFontAtlasBuildSetupFontSpecialGlyphs")]
        private static extern void ImFontAtlasBuildSetupFontSpecialGlyphsImpl(FontAtlas* atlas, Font* font, FontConfig* src);
        public static void ImFontAtlasBuildSetupFontSpecialGlyphs(FontAtlas* atlas, Font* font, FontConfig* src) => ImFontAtlasBuildSetupFontSpecialGlyphsImpl(atlas, font, src);
        
        [LinkName("igImFontAtlasBuildUpdatePointers")]
        private static extern void ImFontAtlasBuildUpdatePointersImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildUpdatePointers(FontAtlas* atlas) => ImFontAtlasBuildUpdatePointersImpl(atlas);
        
        [LinkName("igImFontAtlasDebugLogTextureRequests")]
        private static extern void ImFontAtlasDebugLogTextureRequestsImpl(FontAtlas* atlas);
        public static void ImFontAtlasDebugLogTextureRequests(FontAtlas* atlas) => ImFontAtlasDebugLogTextureRequestsImpl(atlas);
        
        [LinkName("igImFontAtlasFontDestroyOutput")]
        private static extern void ImFontAtlasFontDestroyOutputImpl(FontAtlas* atlas, Font* font);
        public static void ImFontAtlasFontDestroyOutput(FontAtlas* atlas, Font* font) => ImFontAtlasFontDestroyOutputImpl(atlas, font);
        
        [LinkName("igImFontAtlasFontDestroySourceData")]
        private static extern void ImFontAtlasFontDestroySourceDataImpl(FontAtlas* atlas, FontConfig* src);
        public static void ImFontAtlasFontDestroySourceData(FontAtlas* atlas, FontConfig* src) => ImFontAtlasFontDestroySourceDataImpl(atlas, src);
        
        [LinkName("igImFontAtlasFontDiscardBakes")]
        private static extern void ImFontAtlasFontDiscardBakesImpl(FontAtlas* atlas, Font* font, int32 unused_frames);
        public static void ImFontAtlasFontDiscardBakes(FontAtlas* atlas, Font* font, int32 unused_frames) => ImFontAtlasFontDiscardBakesImpl(atlas, font, unused_frames);
        
        [LinkName("igImFontAtlasFontInitOutput")]
        private static extern bool ImFontAtlasFontInitOutputImpl(FontAtlas* atlas, Font* font);
        public static bool ImFontAtlasFontInitOutput(FontAtlas* atlas, Font* font) => ImFontAtlasFontInitOutputImpl(atlas, font);
        
        [LinkName("igImFontAtlasFontSourceAddToFont")]
        private static extern void ImFontAtlasFontSourceAddToFontImpl(FontAtlas* atlas, Font* font, FontConfig* src);
        public static void ImFontAtlasFontSourceAddToFont(FontAtlas* atlas, Font* font, FontConfig* src) => ImFontAtlasFontSourceAddToFontImpl(atlas, font, src);
        
        [LinkName("igImFontAtlasFontSourceInit")]
        private static extern bool ImFontAtlasFontSourceInitImpl(FontAtlas* atlas, FontConfig* src);
        public static bool ImFontAtlasFontSourceInit(FontAtlas* atlas, FontConfig* src) => ImFontAtlasFontSourceInitImpl(atlas, src);
        
        [LinkName("igImFontAtlasGetFontLoaderForStbTruetype")]
        private static extern FontLoader* ImFontAtlasGetFontLoaderForStbTruetypeImpl();
        #if IMGUI_USE_REF
        public static ref FontLoader ImFontAtlasGetFontLoaderForStbTruetype() { return ref *ImFontAtlasGetFontLoaderForStbTruetypeImpl(); }
        #else
        public static FontLoader* ImFontAtlasGetFontLoaderForStbTruetype() => ImFontAtlasGetFontLoaderForStbTruetypeImpl();
        #endif
        
        [LinkName("igImFontAtlasGetMouseCursorTexData")]
        private static extern bool ImFontAtlasGetMouseCursorTexDataImpl(FontAtlas* atlas, MouseCursor cursor_type, Vec2* out_offset, Vec2* out_size, Vec2[2] out_uv_border, Vec2[2] out_uv_fill);
        public static bool ImFontAtlasGetMouseCursorTexData(FontAtlas* atlas, MouseCursor cursor_type, out Vec2 out_offset, out Vec2 out_size, ref Vec2[2] out_uv_border, ref Vec2[2] out_uv_fill)
        {
            out_offset = ?;
            out_size = ?;
            return ImFontAtlasGetMouseCursorTexDataImpl(atlas, cursor_type, &out_offset, &out_size, out_uv_border, out_uv_fill);
        }
        
        [LinkName("igImFontAtlasPackAddRect")]
        private static extern FontAtlasRectId ImFontAtlasPackAddRectImpl(FontAtlas* atlas, int32 w, int32 h, FontAtlasRectEntry* overwrite_entry);
        public static FontAtlasRectId ImFontAtlasPackAddRect(FontAtlas* atlas, int32 w, int32 h, FontAtlasRectEntry* overwrite_entry = null) => ImFontAtlasPackAddRectImpl(atlas, w, h, overwrite_entry);
        
        [LinkName("igImFontAtlasPackDiscardRect")]
        private static extern void ImFontAtlasPackDiscardRectImpl(FontAtlas* atlas, FontAtlasRectId id);
        public static void ImFontAtlasPackDiscardRect(FontAtlas* atlas, FontAtlasRectId id) => ImFontAtlasPackDiscardRectImpl(atlas, id);
        
        [LinkName("igImFontAtlasPackGetRect")]
        private static extern TextureRect* ImFontAtlasPackGetRectImpl(FontAtlas* atlas, FontAtlasRectId id);
        #if IMGUI_USE_REF
        public static ref TextureRect ImFontAtlasPackGetRect(FontAtlas* atlas, FontAtlasRectId id) { return ref *ImFontAtlasPackGetRectImpl(atlas, id); }
        #else
        public static TextureRect* ImFontAtlasPackGetRect(FontAtlas* atlas, FontAtlasRectId id) => ImFontAtlasPackGetRectImpl(atlas, id);
        #endif
        
        [LinkName("igImFontAtlasPackGetRectSafe")]
        private static extern TextureRect* ImFontAtlasPackGetRectSafeImpl(FontAtlas* atlas, FontAtlasRectId id);
        #if IMGUI_USE_REF
        public static ref TextureRect ImFontAtlasPackGetRectSafe(FontAtlas* atlas, FontAtlasRectId id) { return ref *ImFontAtlasPackGetRectSafeImpl(atlas, id); }
        #else
        public static TextureRect* ImFontAtlasPackGetRectSafe(FontAtlas* atlas, FontAtlasRectId id) => ImFontAtlasPackGetRectSafeImpl(atlas, id);
        #endif
        
        [LinkName("igImFontAtlasPackInit")]
        private static extern void ImFontAtlasPackInitImpl(FontAtlas* atlas);
        public static void ImFontAtlasPackInit(FontAtlas* atlas) => ImFontAtlasPackInitImpl(atlas);
        
        [LinkName("igImFontAtlasRectId_GetGeneration")]
        private static extern int32 ImFontAtlasRectIdGetGenerationImpl(FontAtlasRectId id);
        public static int32 ImFontAtlasRectIdGetGeneration(FontAtlasRectId id) => ImFontAtlasRectIdGetGenerationImpl(id);
        
        [LinkName("igImFontAtlasRectId_GetIndex")]
        private static extern int32 ImFontAtlasRectIdGetIndexImpl(FontAtlasRectId id);
        public static int32 ImFontAtlasRectIdGetIndex(FontAtlasRectId id) => ImFontAtlasRectIdGetIndexImpl(id);
        
        [LinkName("igImFontAtlasRectId_Make")]
        private static extern FontAtlasRectId ImFontAtlasRectIdMakeImpl(int32 index_idx, int32 gen_idx);
        public static FontAtlasRectId ImFontAtlasRectIdMake(int32 index_idx, int32 gen_idx) => ImFontAtlasRectIdMakeImpl(index_idx, gen_idx);
        
        [LinkName("igImFontAtlasRemoveDrawListSharedData")]
        private static extern void ImFontAtlasRemoveDrawListSharedDataImpl(FontAtlas* atlas, DrawListSharedData* data);
        public static void ImFontAtlasRemoveDrawListSharedData(FontAtlas* atlas, DrawListSharedData* data) => ImFontAtlasRemoveDrawListSharedDataImpl(atlas, data);
        
        [LinkName("igImFontAtlasTextureAdd")]
        private static extern TextureData* ImFontAtlasTextureAddImpl(FontAtlas* atlas, int32 w, int32 h);
        #if IMGUI_USE_REF
        public static ref TextureData ImFontAtlasTextureAdd(FontAtlas* atlas, int32 w, int32 h) { return ref *ImFontAtlasTextureAddImpl(atlas, w, h); }
        #else
        public static TextureData* ImFontAtlasTextureAdd(FontAtlas* atlas, int32 w, int32 h) => ImFontAtlasTextureAddImpl(atlas, w, h);
        #endif
        
        [LinkName("igImFontAtlasTextureBlockConvert")]
        private static extern void ImFontAtlasTextureBlockConvertImpl(uchar* src_pixels, TextureFormat src_fmt, int32 src_pitch, uchar* dst_pixels, TextureFormat dst_fmt, int32 dst_pitch, int32 w, int32 h);
        public static void ImFontAtlasTextureBlockConvert(uchar* src_pixels, TextureFormat src_fmt, int32 src_pitch, uchar* dst_pixels, TextureFormat dst_fmt, int32 dst_pitch, int32 w, int32 h) => ImFontAtlasTextureBlockConvertImpl(src_pixels, src_fmt, src_pitch, dst_pixels, dst_fmt, dst_pitch, w, h);
        
        [LinkName("igImFontAtlasTextureBlockCopy")]
        private static extern void ImFontAtlasTextureBlockCopyImpl(TextureData* src_tex, int32 src_x, int32 src_y, TextureData* dst_tex, int32 dst_x, int32 dst_y, int32 w, int32 h);
        public static void ImFontAtlasTextureBlockCopy(TextureData* src_tex, int32 src_x, int32 src_y, TextureData* dst_tex, int32 dst_x, int32 dst_y, int32 w, int32 h) => ImFontAtlasTextureBlockCopyImpl(src_tex, src_x, src_y, dst_tex, dst_x, dst_y, w, h);
        
        [LinkName("igImFontAtlasTextureBlockFill")]
        private static extern void ImFontAtlasTextureBlockFillImpl(TextureData* dst_tex, int32 dst_x, int32 dst_y, int32 w, int32 h, U32 col);
        public static void ImFontAtlasTextureBlockFill(TextureData* dst_tex, int32 dst_x, int32 dst_y, int32 w, int32 h, U32 col) => ImFontAtlasTextureBlockFillImpl(dst_tex, dst_x, dst_y, w, h, col);
        
        [LinkName("igImFontAtlasTextureBlockPostProcess")]
        private static extern void ImFontAtlasTextureBlockPostProcessImpl(FontAtlasPostProcessData* data);
        public static void ImFontAtlasTextureBlockPostProcess(FontAtlasPostProcessData* data) => ImFontAtlasTextureBlockPostProcessImpl(data);
        
        [LinkName("igImFontAtlasTextureBlockPostProcessMultiply")]
        private static extern void ImFontAtlasTextureBlockPostProcessMultiplyImpl(FontAtlasPostProcessData* data, float multiply_factor);
        public static void ImFontAtlasTextureBlockPostProcessMultiply(FontAtlasPostProcessData* data, float multiply_factor) => ImFontAtlasTextureBlockPostProcessMultiplyImpl(data, multiply_factor);
        
        [LinkName("igImFontAtlasTextureBlockQueueUpload")]
        private static extern void ImFontAtlasTextureBlockQueueUploadImpl(FontAtlas* atlas, TextureData* tex, int32 x, int32 y, int32 w, int32 h);
        public static void ImFontAtlasTextureBlockQueueUpload(FontAtlas* atlas, TextureData* tex, int32 x, int32 y, int32 w, int32 h) => ImFontAtlasTextureBlockQueueUploadImpl(atlas, tex, x, y, w, h);
        
        [LinkName("igImFontAtlasTextureCompact")]
        private static extern void ImFontAtlasTextureCompactImpl(FontAtlas* atlas);
        public static void ImFontAtlasTextureCompact(FontAtlas* atlas) => ImFontAtlasTextureCompactImpl(atlas);
        
        [LinkName("igImFontAtlasTextureGetSizeEstimate")]
        private static extern Vec2i ImFontAtlasTextureGetSizeEstimateImpl(Vec2i* pOut, FontAtlas* atlas);
        public static Vec2i ImFontAtlasTextureGetSizeEstimate(FontAtlas* atlas)
        {
            Vec2i pOut = default;
            ImFontAtlasTextureGetSizeEstimateImpl(&pOut, atlas);
            return pOut;
        }
        
        [LinkName("igImFontAtlasTextureGrow")]
        private static extern void ImFontAtlasTextureGrowImpl(FontAtlas* atlas, int32 old_w, int32 old_h);
        public static void ImFontAtlasTextureGrow(FontAtlas* atlas, int32 old_w = -1, int32 old_h = -1) => ImFontAtlasTextureGrowImpl(atlas, old_w, old_h);
        
        [LinkName("igImFontAtlasTextureMakeSpace")]
        private static extern void ImFontAtlasTextureMakeSpaceImpl(FontAtlas* atlas);
        public static void ImFontAtlasTextureMakeSpace(FontAtlas* atlas) => ImFontAtlasTextureMakeSpaceImpl(atlas);
        
        [LinkName("igImFontAtlasTextureRepack")]
        private static extern void ImFontAtlasTextureRepackImpl(FontAtlas* atlas, int32 w, int32 h);
        public static void ImFontAtlasTextureRepack(FontAtlas* atlas, int32 w, int32 h) => ImFontAtlasTextureRepackImpl(atlas, w, h);
        
        [LinkName("igImFontAtlasUpdateDrawListsSharedData")]
        private static extern void ImFontAtlasUpdateDrawListsSharedDataImpl(FontAtlas* atlas);
        public static void ImFontAtlasUpdateDrawListsSharedData(FontAtlas* atlas) => ImFontAtlasUpdateDrawListsSharedDataImpl(atlas);
        
        [LinkName("igImFontAtlasUpdateDrawListsTextures")]
        private static extern void ImFontAtlasUpdateDrawListsTexturesImpl(FontAtlas* atlas, TextureRef old_tex, TextureRef new_tex);
        public static void ImFontAtlasUpdateDrawListsTextures(FontAtlas* atlas, TextureRef old_tex, TextureRef new_tex) => ImFontAtlasUpdateDrawListsTexturesImpl(atlas, old_tex, new_tex);
        
        [LinkName("igImFontAtlasUpdateNewFrame")]
        private static extern void ImFontAtlasUpdateNewFrameImpl(FontAtlas* atlas, int32 frame_count, bool renderer_has_textures);
        public static void ImFontAtlasUpdateNewFrame(FontAtlas* atlas, int32 frame_count, bool renderer_has_textures) => ImFontAtlasUpdateNewFrameImpl(atlas, frame_count, renderer_has_textures);
        
        [LinkName("igImFormatString")]
        private static extern int32 ImFormatStringImpl(char* buf, size buf_size, char* fmt, ...);
        public static int32 ImFormatString(char* buf, size buf_size, char* fmt, params Object[] args) => ImFormatStringImpl(buf, buf_size, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igImFormatStringToTempBuffer")]
        private static extern void ImFormatStringToTempBufferImpl(char** out_buf, char** out_buf_end, char* fmt, ...);
        public static void ImFormatStringToTempBuffer(out char* out_buf, out char* out_buf_end, char* fmt, params Object[] args)
        {
            out_buf = ?;
            out_buf_end = ?;
        }
        
        [LinkName("igImHashData")]
        private static extern ID ImHashDataImpl(void* data, size data_size, ID seed);
        public static ID ImHashData(void* data, size data_size, ID seed = (ID) 0) => ImHashDataImpl(data, data_size, seed);
        
        [LinkName("igImHashStr")]
        private static extern ID ImHashStrImpl(char* data, size data_size, ID seed);
        public static ID ImHashStr(char* data, size data_size = (size) 0, ID seed = (ID) 0) => ImHashStrImpl(data, data_size, seed);
        
        [LinkName("igImInvLength")]
        private static extern float ImInvLengthImpl(Vec2 lhs, float fail_value);
        public static float ImInvLength(Vec2 lhs, float fail_value) => ImInvLengthImpl(lhs, fail_value);
        
        [LinkName("igImIsFloatAboveGuaranteedIntegerPrecision")]
        private static extern bool ImIsFloatAboveGuaranteedIntegerPrecisionImpl(float f);
        public static bool ImIsFloatAboveGuaranteedIntegerPrecision(float f) => ImIsFloatAboveGuaranteedIntegerPrecisionImpl(f);
        
        [LinkName("igImIsPowerOfTwo_Int")]
        private static extern bool ImIsPowerOfTwoImpl(int32 v);
        public static bool ImIsPowerOfTwo(int32 v) => ImIsPowerOfTwoImpl(v);
        
        [LinkName("igImIsPowerOfTwo_U64")]
        private static extern bool ImIsPowerOfTwoImpl(U64 v);
        public static bool ImIsPowerOfTwo(U64 v) => ImIsPowerOfTwoImpl(v);
        
        [LinkName("igImLengthSqr_Vec2")]
        private static extern float ImLengthSqrImpl(Vec2 lhs);
        public static float ImLengthSqr(Vec2 lhs) => ImLengthSqrImpl(lhs);
        
        [LinkName("igImLengthSqr_Vec4")]
        private static extern float ImLengthSqrImpl(Vec4 lhs);
        public static float ImLengthSqr(Vec4 lhs) => ImLengthSqrImpl(lhs);
        
        [LinkName("igImLerp_Vec2Float")]
        private static extern Vec2 ImLerpImpl(Vec2* pOut, Vec2 a, Vec2 b, float t);
        public static Vec2 ImLerp(Vec2 a, Vec2 b, float t)
        {
            Vec2 pOut = default;
            ImLerpImpl(&pOut, a, b, t);
            return pOut;
        }
        
        [LinkName("igImLerp_Vec2Vec2")]
        private static extern Vec2 ImLerpImpl(Vec2* pOut, Vec2 a, Vec2 b, Vec2 t);
        public static Vec2 ImLerp(Vec2 a, Vec2 b, Vec2 t)
        {
            Vec2 pOut = default;
            ImLerpImpl(&pOut, a, b, t);
            return pOut;
        }
        
        [LinkName("igImLerp_Vec4")]
        private static extern Vec4 ImLerpImpl(Vec4* pOut, Vec4 a, Vec4 b, float t);
        public static Vec4 ImLerp(Vec4 a, Vec4 b, float t)
        {
            Vec4 pOut = default;
            ImLerpImpl(&pOut, a, b, t);
            return pOut;
        }
        
        [LinkName("igImLineClosestPoint")]
        private static extern Vec2 ImLineClosestPointImpl(Vec2* pOut, Vec2 a, Vec2 b, Vec2 p);
        public static Vec2 ImLineClosestPoint(Vec2 a, Vec2 b, Vec2 p)
        {
            Vec2 pOut = default;
            ImLineClosestPointImpl(&pOut, a, b, p);
            return pOut;
        }
        
        [LinkName("igImLinearRemapClamp")]
        private static extern float ImLinearRemapClampImpl(float s0, float s1, float d0, float d1, float x);
        public static float ImLinearRemapClamp(float s0, float s1, float d0, float d1, float x) => ImLinearRemapClampImpl(s0, s1, d0, d1, x);
        
        [LinkName("igImLinearSweep")]
        private static extern float ImLinearSweepImpl(float current, float target, float speed);
        public static float ImLinearSweep(float current, float target, float speed) => ImLinearSweepImpl(current, target, speed);
        
        [LinkName("igImLog_Float")]
        private static extern float ImLogImpl(float x);
        public static float ImLog(float x) => ImLogImpl(x);
        
        [LinkName("igImLog_double")]
        private static extern double ImLogImpl(double x);
        public static double ImLog(double x) => ImLogImpl(x);
        
        [LinkName("igImLowerBound")]
        private static extern StoragePair* ImLowerBoundImpl(StoragePair* in_begin, StoragePair* in_end, ID key);
        #if IMGUI_USE_REF
        public static ref StoragePair ImLowerBound(StoragePair* in_begin, StoragePair* in_end, ID key) { return ref *ImLowerBoundImpl(in_begin, in_end, key); }
        #else
        public static StoragePair* ImLowerBound(StoragePair* in_begin, StoragePair* in_end, ID key) => ImLowerBoundImpl(in_begin, in_end, key);
        #endif
        
        [LinkName("igImMax")]
        private static extern Vec2 ImMaxImpl(Vec2* pOut, Vec2 lhs, Vec2 rhs);
        public static Vec2 ImMax(Vec2 lhs, Vec2 rhs)
        {
            Vec2 pOut = default;
            ImMaxImpl(&pOut, lhs, rhs);
            return pOut;
        }
        
        [LinkName("igImMemdup")]
        private static extern void* ImMemdupImpl(void* src, size size);
        #if IMGUI_USE_REF
        public static ref void ImMemdup(void* src, size size) { return ref *ImMemdupImpl(src, size); }
        #else
        public static void* ImMemdup(void* src, size size) => ImMemdupImpl(src, size);
        #endif
        
        [LinkName("igImMin")]
        private static extern Vec2 ImMinImpl(Vec2* pOut, Vec2 lhs, Vec2 rhs);
        public static Vec2 ImMin(Vec2 lhs, Vec2 rhs)
        {
            Vec2 pOut = default;
            ImMinImpl(&pOut, lhs, rhs);
            return pOut;
        }
        
        [LinkName("igImModPositive")]
        private static extern int32 ImModPositiveImpl(int32 a, int32 b);
        public static int32 ImModPositive(int32 a, int32 b) => ImModPositiveImpl(a, b);
        
        [LinkName("igImMul")]
        private static extern Vec2 ImMulImpl(Vec2* pOut, Vec2 lhs, Vec2 rhs);
        public static Vec2 ImMul(Vec2 lhs, Vec2 rhs)
        {
            Vec2 pOut = default;
            ImMulImpl(&pOut, lhs, rhs);
            return pOut;
        }
        
        [LinkName("igImParseFormatFindEnd")]
        private static extern char* ImParseFormatFindEndImpl(char* format);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatFindEnd(char* format) { return ref *ImParseFormatFindEndImpl(format); }
        #else
        public static char* ImParseFormatFindEnd(char* format) => ImParseFormatFindEndImpl(format);
        #endif
        
        [LinkName("igImParseFormatFindStart")]
        private static extern char* ImParseFormatFindStartImpl(char* format);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatFindStart(char* format) { return ref *ImParseFormatFindStartImpl(format); }
        #else
        public static char* ImParseFormatFindStart(char* format) => ImParseFormatFindStartImpl(format);
        #endif
        
        [LinkName("igImParseFormatPrecision")]
        private static extern int32 ImParseFormatPrecisionImpl(char* format, int32 default_value);
        public static int32 ImParseFormatPrecision(char* format, int32 default_value) => ImParseFormatPrecisionImpl(format, default_value);
        
        [LinkName("igImParseFormatSanitizeForPrinting")]
        private static extern void ImParseFormatSanitizeForPrintingImpl(char* fmt_in, char* fmt_out, size fmt_out_size);
        public static void ImParseFormatSanitizeForPrinting(char* fmt_in, char* fmt_out, size fmt_out_size) => ImParseFormatSanitizeForPrintingImpl(fmt_in, fmt_out, fmt_out_size);
        
        [LinkName("igImParseFormatSanitizeForScanning")]
        private static extern char* ImParseFormatSanitizeForScanningImpl(char* fmt_in, char* fmt_out, size fmt_out_size);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatSanitizeForScanning(char* fmt_in, char* fmt_out, size fmt_out_size) { return ref *ImParseFormatSanitizeForScanningImpl(fmt_in, fmt_out, fmt_out_size); }
        #else
        public static char* ImParseFormatSanitizeForScanning(char* fmt_in, char* fmt_out, size fmt_out_size) => ImParseFormatSanitizeForScanningImpl(fmt_in, fmt_out, fmt_out_size);
        #endif
        
        [LinkName("igImParseFormatTrimDecorations")]
        private static extern char* ImParseFormatTrimDecorationsImpl(char* format, char* buf, size buf_size);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatTrimDecorations(char* format, char* buf, size buf_size) { return ref *ImParseFormatTrimDecorationsImpl(format, buf, buf_size); }
        #else
        public static char* ImParseFormatTrimDecorations(char* format, char* buf, size buf_size) => ImParseFormatTrimDecorationsImpl(format, buf, buf_size);
        #endif
        
        [LinkName("igImPow_Float")]
        private static extern float ImPowImpl(float x, float y);
        public static float ImPow(float x, float y) => ImPowImpl(x, y);
        
        [LinkName("igImPow_double")]
        private static extern double ImPowImpl(double x, double y);
        public static double ImPow(double x, double y) => ImPowImpl(x, y);
        
        [LinkName("igImQsort")]
        private static extern void ImQsortImpl(void* base_, size count, size size_of_element, function int(void* , void* ) compare_func);
        public static void ImQsort(void* base_, size count, size size_of_element, function int(void* , void* ) compare_func) => ImQsortImpl(base_, count, size_of_element, compare_func);
        
        [LinkName("igImRotate")]
        private static extern Vec2 ImRotateImpl(Vec2* pOut, Vec2 v, float cos_a, float sin_a);
        public static Vec2 ImRotate(Vec2 v, float cos_a, float sin_a)
        {
            Vec2 pOut = default;
            ImRotateImpl(&pOut, v, cos_a, sin_a);
            return pOut;
        }
        
        [LinkName("igImRound64")]
        private static extern float ImRound64Impl(float f);
        public static float ImRound64(float f) => ImRound64Impl(f);
        
        [LinkName("igImRsqrt_Float")]
        private static extern float ImRsqrtImpl(float x);
        public static float ImRsqrt(float x) => ImRsqrtImpl(x);
        
        [LinkName("igImRsqrt_double")]
        private static extern double ImRsqrtImpl(double x);
        public static double ImRsqrt(double x) => ImRsqrtImpl(x);
        
        [LinkName("igImSaturate")]
        private static extern float ImSaturateImpl(float f);
        public static float ImSaturate(float f) => ImSaturateImpl(f);
        
        [LinkName("igImSign_Float")]
        private static extern float ImSignImpl(float x);
        public static float ImSign(float x) => ImSignImpl(x);
        
        [LinkName("igImSign_double")]
        private static extern double ImSignImpl(double x);
        public static double ImSign(double x) => ImSignImpl(x);
        
        [LinkName("igImStrSkipBlank")]
        private static extern char* ImStrSkipBlankImpl(char* str);
        #if IMGUI_USE_REF
        public static ref char ImStrSkipBlank(char* str) { return ref *ImStrSkipBlankImpl(str); }
        #else
        public static char* ImStrSkipBlank(char* str) => ImStrSkipBlankImpl(str);
        #endif
        
        [LinkName("igImStrTrimBlanks")]
        private static extern void ImStrTrimBlanksImpl(char* str);
        public static void ImStrTrimBlanks(char* str) => ImStrTrimBlanksImpl(str);
        
        [LinkName("igImStrbol")]
        private static extern char* ImStrbolImpl(char* buf_mid_line, char* buf_begin);
        #if IMGUI_USE_REF
        public static ref char ImStrbol(char* buf_mid_line, char* buf_begin) { return ref *ImStrbolImpl(buf_mid_line, buf_begin); }
        #else
        public static char* ImStrbol(char* buf_mid_line, char* buf_begin) => ImStrbolImpl(buf_mid_line, buf_begin);
        #endif
        
        [LinkName("igImStrchrRange")]
        private static extern char* ImStrchrRangeImpl(char* str_begin, char* str_end, char c);
        #if IMGUI_USE_REF
        public static ref char ImStrchrRange(char* str_begin, char* str_end, char c) { return ref *ImStrchrRangeImpl(str_begin, str_end, c); }
        #else
        public static char* ImStrchrRange(char* str_begin, char* str_end, char c) => ImStrchrRangeImpl(str_begin, str_end, c);
        #endif
        
        [LinkName("igImStrdup")]
        private static extern char* ImStrdupImpl(char* str);
        #if IMGUI_USE_REF
        public static ref char ImStrdup(char* str) { return ref *ImStrdupImpl(str); }
        #else
        public static char* ImStrdup(char* str) => ImStrdupImpl(str);
        #endif
        
        [LinkName("igImStrdupcpy")]
        private static extern char* ImStrdupcpyImpl(char* dst, size* p_dst_size, char* str);
        #if IMGUI_USE_REF
        public static ref char ImStrdupcpy(char* dst, size* p_dst_size, char* str) { return ref *ImStrdupcpyImpl(dst, p_dst_size, str); }
        #else
        public static char* ImStrdupcpy(char* dst, size* p_dst_size, char* str) => ImStrdupcpyImpl(dst, p_dst_size, str);
        #endif
        
        [LinkName("igImStreolRange")]
        private static extern char* ImStreolRangeImpl(char* str, char* str_end);
        #if IMGUI_USE_REF
        public static ref char ImStreolRange(char* str, char* str_end) { return ref *ImStreolRangeImpl(str, str_end); }
        #else
        public static char* ImStreolRange(char* str, char* str_end) => ImStreolRangeImpl(str, str_end);
        #endif
        
        [LinkName("igImStricmp")]
        private static extern int32 ImStricmpImpl(char* str1, char* str2);
        public static int32 ImStricmp(char* str1, char* str2) => ImStricmpImpl(str1, str2);
        
        [LinkName("igImStristr")]
        private static extern char* ImStristrImpl(char* haystack, char* haystack_end, char* needle, char* needle_end);
        #if IMGUI_USE_REF
        public static ref char ImStristr(char* haystack, char* haystack_end, char* needle, char* needle_end) { return ref *ImStristrImpl(haystack, haystack_end, needle, needle_end); }
        #else
        public static char* ImStristr(char* haystack, char* haystack_end, char* needle, char* needle_end) => ImStristrImpl(haystack, haystack_end, needle, needle_end);
        #endif
        
        [LinkName("igImStrlenW")]
        private static extern int32 ImStrlenWImpl(Wchar* str);
        public static int32 ImStrlenW(Wchar* str) => ImStrlenWImpl(str);
        
        [LinkName("igImStrncpy")]
        private static extern void ImStrncpyImpl(char* dst, char* src, size count);
        public static void ImStrncpy(char* dst, char* src, size count) => ImStrncpyImpl(dst, src, count);
        
        [LinkName("igImStrnicmp")]
        private static extern int32 ImStrnicmpImpl(char* str1, char* str2, size count);
        public static int32 ImStrnicmp(char* str1, char* str2, size count) => ImStrnicmpImpl(str1, str2, count);
        
        [LinkName("igImTextCharFromUtf8")]
        private static extern int32 ImTextCharFromUtf8Impl(uint32* out_char, char* in_text, char* in_text_end);
        public static int32 ImTextCharFromUtf8(out uint32 out_char, char* in_text, char* in_text_end)
        {
            out_char = ?;
            return ImTextCharFromUtf8Impl(&out_char, in_text, in_text_end);
        }
        
        [LinkName("igImTextCharToUtf8")]
        private static extern char* ImTextCharToUtf8Impl(char[5] out_buf, uint32 c);
        #if IMGUI_USE_REF
        public static ref char ImTextCharToUtf8(ref char[5] out_buf, uint32 c) { return ref *ImTextCharToUtf8Impl(out_buf, c); }
        #else
        public static char* ImTextCharToUtf8(ref char[5] out_buf, uint32 c) => ImTextCharToUtf8Impl(out_buf, c);
        #endif
        
        [LinkName("igImTextCountCharsFromUtf8")]
        private static extern int32 ImTextCountCharsFromUtf8Impl(char* in_text, char* in_text_end);
        public static int32 ImTextCountCharsFromUtf8(char* in_text, char* in_text_end) => ImTextCountCharsFromUtf8Impl(in_text, in_text_end);
        
        [LinkName("igImTextCountLines")]
        private static extern int32 ImTextCountLinesImpl(char* in_text, char* in_text_end);
        public static int32 ImTextCountLines(char* in_text, char* in_text_end) => ImTextCountLinesImpl(in_text, in_text_end);
        
        [LinkName("igImTextCountUtf8BytesFromChar")]
        private static extern int32 ImTextCountUtf8BytesFromCharImpl(char* in_text, char* in_text_end);
        public static int32 ImTextCountUtf8BytesFromChar(char* in_text, char* in_text_end) => ImTextCountUtf8BytesFromCharImpl(in_text, in_text_end);
        
        [LinkName("igImTextCountUtf8BytesFromStr")]
        private static extern int32 ImTextCountUtf8BytesFromStrImpl(Wchar* in_text, Wchar* in_text_end);
        public static int32 ImTextCountUtf8BytesFromStr(Wchar* in_text, Wchar* in_text_end) => ImTextCountUtf8BytesFromStrImpl(in_text, in_text_end);
        
        [LinkName("igImTextFindPreviousUtf8Codepoint")]
        private static extern char* ImTextFindPreviousUtf8CodepointImpl(char* in_text_start, char* in_text_curr);
        #if IMGUI_USE_REF
        public static ref char ImTextFindPreviousUtf8Codepoint(char* in_text_start, char* in_text_curr) { return ref *ImTextFindPreviousUtf8CodepointImpl(in_text_start, in_text_curr); }
        #else
        public static char* ImTextFindPreviousUtf8Codepoint(char* in_text_start, char* in_text_curr) => ImTextFindPreviousUtf8CodepointImpl(in_text_start, in_text_curr);
        #endif
        
        [LinkName("igImTextStrFromUtf8")]
        private static extern int32 ImTextStrFromUtf8Impl(Wchar* out_buf, int32 out_buf_size, char* in_text, char* in_text_end, char** in_remaining);
        public static int32 ImTextStrFromUtf8(out Wchar out_buf, int32 out_buf_size, char* in_text, char* in_text_end, char** in_remaining = null)
        {
            out_buf = ?;
            return ImTextStrFromUtf8Impl(&out_buf, out_buf_size, in_text, in_text_end, in_remaining);
        }
        
        [LinkName("igImTextStrToUtf8")]
        private static extern int32 ImTextStrToUtf8Impl(char* out_buf, int32 out_buf_size, Wchar* in_text, Wchar* in_text_end);
        public static int32 ImTextStrToUtf8(out char out_buf, int32 out_buf_size, Wchar* in_text, Wchar* in_text_end)
        {
            out_buf = ?;
            return ImTextStrToUtf8Impl(&out_buf, out_buf_size, in_text, in_text_end);
        }
        
        [LinkName("igImTextureDataGetFormatBytesPerPixel")]
        private static extern int32 ImTextureDataGetFormatBytesPerPixelImpl(TextureFormat format);
        public static int32 ImTextureDataGetFormatBytesPerPixel(TextureFormat format) => ImTextureDataGetFormatBytesPerPixelImpl(format);
        
        [LinkName("igImTextureDataGetFormatName")]
        private static extern char* ImTextureDataGetFormatNameImpl(TextureFormat format);
        #if IMGUI_USE_REF
        public static ref char ImTextureDataGetFormatName(TextureFormat format) { return ref *ImTextureDataGetFormatNameImpl(format); }
        #else
        public static char* ImTextureDataGetFormatName(TextureFormat format) => ImTextureDataGetFormatNameImpl(format);
        #endif
        
        [LinkName("igImTextureDataGetStatusName")]
        private static extern char* ImTextureDataGetStatusNameImpl(TextureStatus status);
        #if IMGUI_USE_REF
        public static ref char ImTextureDataGetStatusName(TextureStatus status) { return ref *ImTextureDataGetStatusNameImpl(status); }
        #else
        public static char* ImTextureDataGetStatusName(TextureStatus status) => ImTextureDataGetStatusNameImpl(status);
        #endif
        
        [LinkName("igImToUpper")]
        private static extern char ImToUpperImpl(char c);
        public static char ImToUpper(char c) => ImToUpperImpl(c);
        
        [LinkName("igImTriangleArea")]
        private static extern float ImTriangleAreaImpl(Vec2 a, Vec2 b, Vec2 c);
        public static float ImTriangleArea(Vec2 a, Vec2 b, Vec2 c) => ImTriangleAreaImpl(a, b, c);
        
        [LinkName("igImTriangleBarycentricCoords")]
        private static extern void ImTriangleBarycentricCoordsImpl(Vec2 a, Vec2 b, Vec2 c, Vec2 p, float* out_u, float* out_v, float* out_w);
        public static void ImTriangleBarycentricCoords(Vec2 a, Vec2 b, Vec2 c, Vec2 p, out float out_u, out float out_v, out float out_w)
        {
            out_u = ?;
            out_v = ?;
            out_w = ?;
        }
        
        [LinkName("igImTriangleClosestPoint")]
        private static extern Vec2 ImTriangleClosestPointImpl(Vec2* pOut, Vec2 a, Vec2 b, Vec2 c, Vec2 p);
        public static Vec2 ImTriangleClosestPoint(Vec2 a, Vec2 b, Vec2 c, Vec2 p)
        {
            Vec2 pOut = default;
            ImTriangleClosestPointImpl(&pOut, a, b, c, p);
            return pOut;
        }
        
        [LinkName("igImTriangleContainsPoint")]
        private static extern bool ImTriangleContainsPointImpl(Vec2 a, Vec2 b, Vec2 c, Vec2 p);
        public static bool ImTriangleContainsPoint(Vec2 a, Vec2 b, Vec2 c, Vec2 p) => ImTriangleContainsPointImpl(a, b, c, p);
        
        [LinkName("igImTriangleIsClockwise")]
        private static extern bool ImTriangleIsClockwiseImpl(Vec2 a, Vec2 b, Vec2 c);
        public static bool ImTriangleIsClockwise(Vec2 a, Vec2 b, Vec2 c) => ImTriangleIsClockwiseImpl(a, b, c);
        
        [LinkName("igImTrunc_Float")]
        private static extern float ImTruncImpl(float f);
        public static float ImTrunc(float f) => ImTruncImpl(f);
        
        [LinkName("igImTrunc_Vec2")]
        private static extern Vec2 ImTruncImpl(Vec2* pOut, Vec2 v);
        public static Vec2 ImTrunc(Vec2 v)
        {
            Vec2 pOut = default;
            ImTruncImpl(&pOut, v);
            return pOut;
        }
        
        [LinkName("igImTrunc64")]
        private static extern float ImTrunc64Impl(float f);
        public static float ImTrunc64(float f) => ImTrunc64Impl(f);
        
        [LinkName("igImUpperPowerOfTwo")]
        private static extern int32 ImUpperPowerOfTwoImpl(int32 v);
        public static int32 ImUpperPowerOfTwo(int32 v) => ImUpperPowerOfTwoImpl(v);
        
        [LinkName("igImage")]
        private static extern void ImageImpl(TextureRef tex_ref, Vec2 image_size, Vec2 uv0, Vec2 uv1);
        public static void Image(TextureRef tex_ref, Vec2 image_size, Vec2 uv0 = Vec2.Zero, Vec2 uv1 = Vec2.Ones) => ImageImpl(tex_ref, image_size, uv0, uv1);
        
        [LinkName("igImageButton")]
        private static extern bool ImageButtonImpl(char* str_id, TextureRef tex_ref, Vec2 image_size, Vec2 uv0, Vec2 uv1, Vec4 bg_col, Vec4 tint_col);
        public static bool ImageButton(char* str_id, TextureRef tex_ref, Vec2 image_size, Vec2 uv0 = Vec2.Zero, Vec2 uv1 = Vec2.Ones, Vec4 bg_col = Vec4.Zero, Vec4 tint_col = Vec4.Ones) => ImageButtonImpl(str_id, tex_ref, image_size, uv0, uv1, bg_col, tint_col);
        
        [LinkName("igImageButtonEx")]
        private static extern bool ImageButtonExImpl(ID id, TextureRef tex_ref, Vec2 image_size, Vec2 uv0, Vec2 uv1, Vec4 bg_col, Vec4 tint_col, ButtonFlags flags);
        public static bool ImageButtonEx(ID id, TextureRef tex_ref, Vec2 image_size, Vec2 uv0, Vec2 uv1, Vec4 bg_col, Vec4 tint_col, ButtonFlags flags = (ButtonFlags) 0) => ImageButtonExImpl(id, tex_ref, image_size, uv0, uv1, bg_col, tint_col, flags);
        
        [LinkName("igImageWithBg")]
        private static extern void ImageWithBgImpl(TextureRef tex_ref, Vec2 image_size, Vec2 uv0, Vec2 uv1, Vec4 bg_col, Vec4 tint_col);
        public static void ImageWithBg(TextureRef tex_ref, Vec2 image_size, Vec2 uv0 = Vec2.Zero, Vec2 uv1 = Vec2.Ones, Vec4 bg_col = Vec4.Zero, Vec4 tint_col = Vec4.Ones) => ImageWithBgImpl(tex_ref, image_size, uv0, uv1, bg_col, tint_col);
        
        [LinkName("igIndent")]
        private static extern void IndentImpl(float indent_w);
        public static void Indent(float indent_w = (float) 0.0f) => IndentImpl(indent_w);
        
        [LinkName("igInitialize")]
        private static extern void InitializeImpl();
        public static void Initialize() => InitializeImpl();
        
        [LinkName("igInputDouble")]
        private static extern bool InputDoubleImpl(char* label, double* v, double step, double step_fast, char* format, InputTextFlags flags);
        public static bool InputDouble(char* label, double* v, double step = (double) 0.0, double step_fast = (double) 0.0, char* format = "%.6f", InputTextFlags flags = (InputTextFlags) 0) => InputDoubleImpl(label, v, step, step_fast, format, flags);
        
        [LinkName("igInputFloat")]
        private static extern bool InputFloatImpl(char* label, float* v, float step, float step_fast, char* format, InputTextFlags flags);
        public static bool InputFloat(char* label, float* v, float step = (float) 0.0f, float step_fast = (float) 0.0f, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloatImpl(label, v, step, step_fast, format, flags);
        
        [LinkName("igInputFloat2")]
        private static extern bool InputFloat2Impl(char* label, float[2] v, char* format, InputTextFlags flags);
        public static bool InputFloat2(char* label, ref float[2] v, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloat2Impl(label, v, format, flags);
        
        [LinkName("igInputFloat3")]
        private static extern bool InputFloat3Impl(char* label, float[3] v, char* format, InputTextFlags flags);
        public static bool InputFloat3(char* label, ref float[3] v, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloat3Impl(label, v, format, flags);
        
        [LinkName("igInputFloat4")]
        private static extern bool InputFloat4Impl(char* label, float[4] v, char* format, InputTextFlags flags);
        public static bool InputFloat4(char* label, ref float[4] v, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloat4Impl(label, v, format, flags);
        
        [LinkName("igInputInt")]
        private static extern bool InputIntImpl(char* label, int32* v, int32 step, int32 step_fast, InputTextFlags flags);
        public static bool InputInt(char* label, int32* v, int32 step = (int32) 1, int32 step_fast = (int32) 100, InputTextFlags flags = (InputTextFlags) 0) => InputIntImpl(label, v, step, step_fast, flags);
        
        [LinkName("igInputInt2")]
        private static extern bool InputInt2Impl(char* label, int32[2] v, InputTextFlags flags);
        public static bool InputInt2(char* label, ref int32[2] v, InputTextFlags flags = (InputTextFlags) 0) => InputInt2Impl(label, v, flags);
        
        [LinkName("igInputInt3")]
        private static extern bool InputInt3Impl(char* label, int32[3] v, InputTextFlags flags);
        public static bool InputInt3(char* label, ref int32[3] v, InputTextFlags flags = (InputTextFlags) 0) => InputInt3Impl(label, v, flags);
        
        [LinkName("igInputInt4")]
        private static extern bool InputInt4Impl(char* label, int32[4] v, InputTextFlags flags);
        public static bool InputInt4(char* label, ref int32[4] v, InputTextFlags flags = (InputTextFlags) 0) => InputInt4Impl(label, v, flags);
        
        [LinkName("igInputScalar")]
        private static extern bool InputScalarImpl(char* label, DataType data_type, void* p_data, void* p_step, void* p_step_fast, char* format, InputTextFlags flags);
        public static bool InputScalar(char* label, DataType data_type, void* p_data, void* p_step = null, void* p_step_fast = null, char* format = null, InputTextFlags flags = (InputTextFlags) 0) => InputScalarImpl(label, data_type, p_data, p_step, p_step_fast, format, flags);
        
        [LinkName("igInputScalarN")]
        private static extern bool InputScalarNImpl(char* label, DataType data_type, void* p_data, int32 components, void* p_step, void* p_step_fast, char* format, InputTextFlags flags);
        public static bool InputScalarN(char* label, DataType data_type, void* p_data, int32 components, void* p_step = null, void* p_step_fast = null, char* format = null, InputTextFlags flags = (InputTextFlags) 0) => InputScalarNImpl(label, data_type, p_data, components, p_step, p_step_fast, format, flags);
        
        [LinkName("igInputText")]
        private static extern bool InputTextImpl(char* label, char* buf, size buf_size, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputText(char* label, char* buf, size buf_size, InputTextFlags flags = (InputTextFlags) 0, InputTextCallback callback = null, void* user_data = null) => InputTextImpl(label, buf, buf_size, flags, callback, user_data);
        
        [LinkName("igInputTextDeactivateHook")]
        private static extern void InputTextDeactivateHookImpl(ID id);
        public static void InputTextDeactivateHook(ID id) => InputTextDeactivateHookImpl(id);
        
        [LinkName("igInputTextEx")]
        private static extern bool InputTextExImpl(char* label, char* hint, char* buf, int32 buf_size, Vec2 size_arg, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputTextEx(char* label, char* hint, char* buf, int32 buf_size, Vec2 size_arg, InputTextFlags flags, InputTextCallback callback = null, void* user_data = null) => InputTextExImpl(label, hint, buf, buf_size, size_arg, flags, callback, user_data);
        
        [LinkName("igInputTextMultiline")]
        private static extern bool InputTextMultilineImpl(char* label, char* buf, size buf_size, Vec2 size, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputTextMultiline(char* label, char* buf, size buf_size, Vec2 size = Vec2.Zero, InputTextFlags flags = (InputTextFlags) 0, InputTextCallback callback = null, void* user_data = null) => InputTextMultilineImpl(label, buf, buf_size, size, flags, callback, user_data);
        
        [LinkName("igInputTextWithHint")]
        private static extern bool InputTextWithHintImpl(char* label, char* hint, char* buf, size buf_size, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputTextWithHint(char* label, char* hint, char* buf, size buf_size, InputTextFlags flags = (InputTextFlags) 0, InputTextCallback callback = null, void* user_data = null) => InputTextWithHintImpl(label, hint, buf, buf_size, flags, callback, user_data);
        
        [LinkName("igInvisibleButton")]
        private static extern bool InvisibleButtonImpl(char* str_id, Vec2 size, ButtonFlags flags);
        public static bool InvisibleButton(char* str_id, Vec2 size, ButtonFlags flags = (ButtonFlags) 0) => InvisibleButtonImpl(str_id, size, flags);
        
        [LinkName("igIsActiveIdUsingNavDir")]
        private static extern bool IsActiveIdUsingNavDirImpl(Dir dir);
        public static bool IsActiveIdUsingNavDir(Dir dir) => IsActiveIdUsingNavDirImpl(dir);
        
        [LinkName("igIsAliasKey")]
        private static extern bool IsAliasKeyImpl(Key key);
        public static bool IsAliasKey(Key key) => IsAliasKeyImpl(key);
        
        [LinkName("igIsAnyItemActive")]
        private static extern bool IsAnyItemActiveImpl();
        public static bool IsAnyItemActive() => IsAnyItemActiveImpl();
        
        [LinkName("igIsAnyItemFocused")]
        private static extern bool IsAnyItemFocusedImpl();
        public static bool IsAnyItemFocused() => IsAnyItemFocusedImpl();
        
        [LinkName("igIsAnyItemHovered")]
        private static extern bool IsAnyItemHoveredImpl();
        public static bool IsAnyItemHovered() => IsAnyItemHoveredImpl();
        
        [LinkName("igIsAnyMouseDown")]
        private static extern bool IsAnyMouseDownImpl();
        public static bool IsAnyMouseDown() => IsAnyMouseDownImpl();
        
        [LinkName("igIsClippedEx")]
        private static extern bool IsClippedExImpl(Rect bb, ID id);
        public static bool IsClippedEx(Rect bb, ID id) => IsClippedExImpl(bb, id);
        
        [LinkName("igIsDragDropActive")]
        private static extern bool IsDragDropActiveImpl();
        public static bool IsDragDropActive() => IsDragDropActiveImpl();
        
        [LinkName("igIsDragDropPayloadBeingAccepted")]
        private static extern bool IsDragDropPayloadBeingAcceptedImpl();
        public static bool IsDragDropPayloadBeingAccepted() => IsDragDropPayloadBeingAcceptedImpl();
        
        [LinkName("igIsGamepadKey")]
        private static extern bool IsGamepadKeyImpl(Key key);
        public static bool IsGamepadKey(Key key) => IsGamepadKeyImpl(key);
        
        [LinkName("igIsItemActivated")]
        private static extern bool IsItemActivatedImpl();
        public static bool IsItemActivated() => IsItemActivatedImpl();
        
        [LinkName("igIsItemActive")]
        private static extern bool IsItemActiveImpl();
        public static bool IsItemActive() => IsItemActiveImpl();
        
        [LinkName("igIsItemActiveAsInputText")]
        private static extern bool IsItemActiveAsInputTextImpl();
        public static bool IsItemActiveAsInputText() => IsItemActiveAsInputTextImpl();
        
        [LinkName("igIsItemClicked")]
        private static extern bool IsItemClickedImpl(MouseButton mouse_button);
        public static bool IsItemClicked(MouseButton mouse_button = (MouseButton) 0) => IsItemClickedImpl(mouse_button);
        
        [LinkName("igIsItemDeactivated")]
        private static extern bool IsItemDeactivatedImpl();
        public static bool IsItemDeactivated() => IsItemDeactivatedImpl();
        
        [LinkName("igIsItemDeactivatedAfterEdit")]
        private static extern bool IsItemDeactivatedAfterEditImpl();
        public static bool IsItemDeactivatedAfterEdit() => IsItemDeactivatedAfterEditImpl();
        
        [LinkName("igIsItemEdited")]
        private static extern bool IsItemEditedImpl();
        public static bool IsItemEdited() => IsItemEditedImpl();
        
        [LinkName("igIsItemFocused")]
        private static extern bool IsItemFocusedImpl();
        public static bool IsItemFocused() => IsItemFocusedImpl();
        
        [LinkName("igIsItemHovered")]
        private static extern bool IsItemHoveredImpl(HoveredFlags flags);
        public static bool IsItemHovered(HoveredFlags flags = (HoveredFlags) 0) => IsItemHoveredImpl(flags);
        
        [LinkName("igIsItemToggledOpen")]
        private static extern bool IsItemToggledOpenImpl();
        public static bool IsItemToggledOpen() => IsItemToggledOpenImpl();
        
        [LinkName("igIsItemToggledSelection")]
        private static extern bool IsItemToggledSelectionImpl();
        public static bool IsItemToggledSelection() => IsItemToggledSelectionImpl();
        
        [LinkName("igIsItemVisible")]
        private static extern bool IsItemVisibleImpl();
        public static bool IsItemVisible() => IsItemVisibleImpl();
        
        [LinkName("igIsKeyChordPressed_Nil")]
        private static extern bool IsKeyChordPressedImpl(KeyChord key_chord);
        public static bool IsKeyChordPressed(KeyChord key_chord) => IsKeyChordPressedImpl(key_chord);
        
        [LinkName("igIsKeyChordPressed_InputFlags")]
        private static extern bool IsKeyChordPressedImpl(KeyChord key_chord, InputFlags flags, ID owner_id);
        public static bool IsKeyChordPressed(KeyChord key_chord, InputFlags flags, ID owner_id = (ID) 0) => IsKeyChordPressedImpl(key_chord, flags, owner_id);
        
        [LinkName("igIsKeyDown_Nil")]
        private static extern bool IsKeyDownImpl(Key key);
        public static bool IsKeyDown(Key key) => IsKeyDownImpl(key);
        
        [LinkName("igIsKeyDown_ID")]
        private static extern bool IsKeyDownImpl(Key key, ID owner_id);
        public static bool IsKeyDown(Key key, ID owner_id) => IsKeyDownImpl(key, owner_id);
        
        [LinkName("igIsKeyPressed_Bool")]
        private static extern bool IsKeyPressedImpl(Key key, bool repeat_);
        public static bool IsKeyPressed(Key key, bool repeat_ = true) => IsKeyPressedImpl(key, repeat_);
        
        [LinkName("igIsKeyPressed_InputFlags")]
        private static extern bool IsKeyPressedImpl(Key key, InputFlags flags, ID owner_id);
        public static bool IsKeyPressed(Key key, InputFlags flags, ID owner_id = (ID) 0) => IsKeyPressedImpl(key, flags, owner_id);
        
        [LinkName("igIsKeyReleased_Nil")]
        private static extern bool IsKeyReleasedImpl(Key key);
        public static bool IsKeyReleased(Key key) => IsKeyReleasedImpl(key);
        
        [LinkName("igIsKeyReleased_ID")]
        private static extern bool IsKeyReleasedImpl(Key key, ID owner_id);
        public static bool IsKeyReleased(Key key, ID owner_id) => IsKeyReleasedImpl(key, owner_id);
        
        [LinkName("igIsKeyboardKey")]
        private static extern bool IsKeyboardKeyImpl(Key key);
        public static bool IsKeyboardKey(Key key) => IsKeyboardKeyImpl(key);
        
        [LinkName("igIsLRModKey")]
        private static extern bool IsLRModKeyImpl(Key key);
        public static bool IsLRModKey(Key key) => IsLRModKeyImpl(key);
        
        [LinkName("igIsLegacyKey")]
        private static extern bool IsLegacyKeyImpl(Key key);
        public static bool IsLegacyKey(Key key) => IsLegacyKeyImpl(key);
        
        [LinkName("igIsMouseClicked_Bool")]
        private static extern bool IsMouseClickedImpl(MouseButton button, bool repeat_);
        public static bool IsMouseClicked(MouseButton button, bool repeat_ = false) => IsMouseClickedImpl(button, repeat_);
        
        [LinkName("igIsMouseClicked_InputFlags")]
        private static extern bool IsMouseClickedImpl(MouseButton button, InputFlags flags, ID owner_id);
        public static bool IsMouseClicked(MouseButton button, InputFlags flags, ID owner_id = (ID) 0) => IsMouseClickedImpl(button, flags, owner_id);
        
        [LinkName("igIsMouseDoubleClicked_Nil")]
        private static extern bool IsMouseDoubleClickedImpl(MouseButton button);
        public static bool IsMouseDoubleClicked(MouseButton button) => IsMouseDoubleClickedImpl(button);
        
        [LinkName("igIsMouseDoubleClicked_ID")]
        private static extern bool IsMouseDoubleClickedImpl(MouseButton button, ID owner_id);
        public static bool IsMouseDoubleClicked(MouseButton button, ID owner_id) => IsMouseDoubleClickedImpl(button, owner_id);
        
        [LinkName("igIsMouseDown_Nil")]
        private static extern bool IsMouseDownImpl(MouseButton button);
        public static bool IsMouseDown(MouseButton button) => IsMouseDownImpl(button);
        
        [LinkName("igIsMouseDown_ID")]
        private static extern bool IsMouseDownImpl(MouseButton button, ID owner_id);
        public static bool IsMouseDown(MouseButton button, ID owner_id) => IsMouseDownImpl(button, owner_id);
        
        [LinkName("igIsMouseDragPastThreshold")]
        private static extern bool IsMouseDragPastThresholdImpl(MouseButton button, float lock_threshold);
        public static bool IsMouseDragPastThreshold(MouseButton button, float lock_threshold = -1.0f) => IsMouseDragPastThresholdImpl(button, lock_threshold);
        
        [LinkName("igIsMouseDragging")]
        private static extern bool IsMouseDraggingImpl(MouseButton button, float lock_threshold);
        public static bool IsMouseDragging(MouseButton button, float lock_threshold = -1.0f) => IsMouseDraggingImpl(button, lock_threshold);
        
        [LinkName("igIsMouseHoveringRect")]
        private static extern bool IsMouseHoveringRectImpl(Vec2 r_min, Vec2 r_max, bool clip);
        public static bool IsMouseHoveringRect(Vec2 r_min, Vec2 r_max, bool clip = true) => IsMouseHoveringRectImpl(r_min, r_max, clip);
        
        [LinkName("igIsMouseKey")]
        private static extern bool IsMouseKeyImpl(Key key);
        public static bool IsMouseKey(Key key) => IsMouseKeyImpl(key);
        
        [LinkName("igIsMousePosValid")]
        private static extern bool IsMousePosValidImpl(Vec2* mouse_pos);
        public static bool IsMousePosValid(Vec2* mouse_pos = null) => IsMousePosValidImpl(mouse_pos);
        
        [LinkName("igIsMouseReleased_Nil")]
        private static extern bool IsMouseReleasedImpl(MouseButton button);
        public static bool IsMouseReleased(MouseButton button) => IsMouseReleasedImpl(button);
        
        [LinkName("igIsMouseReleased_ID")]
        private static extern bool IsMouseReleasedImpl(MouseButton button, ID owner_id);
        public static bool IsMouseReleased(MouseButton button, ID owner_id) => IsMouseReleasedImpl(button, owner_id);
        
        [LinkName("igIsMouseReleasedWithDelay")]
        private static extern bool IsMouseReleasedWithDelayImpl(MouseButton button, float delay);
        public static bool IsMouseReleasedWithDelay(MouseButton button, float delay) => IsMouseReleasedWithDelayImpl(button, delay);
        
        [LinkName("igIsNamedKey")]
        private static extern bool IsNamedKeyImpl(Key key);
        public static bool IsNamedKey(Key key) => IsNamedKeyImpl(key);
        
        [LinkName("igIsNamedKeyOrMod")]
        private static extern bool IsNamedKeyOrModImpl(Key key);
        public static bool IsNamedKeyOrMod(Key key) => IsNamedKeyOrModImpl(key);
        
        [LinkName("igIsPopupOpen_Str")]
        private static extern bool IsPopupOpenImpl(char* str_id, PopupFlags flags);
        public static bool IsPopupOpen(char* str_id, PopupFlags flags = (PopupFlags) 0) => IsPopupOpenImpl(str_id, flags);
        
        [LinkName("igIsPopupOpen_ID")]
        private static extern bool IsPopupOpenImpl(ID id, PopupFlags popup_flags);
        public static bool IsPopupOpen(ID id, PopupFlags popup_flags) => IsPopupOpenImpl(id, popup_flags);
        
        [LinkName("igIsRectVisible_Nil")]
        private static extern bool IsRectVisibleImpl(Vec2 size);
        public static bool IsRectVisible(Vec2 size) => IsRectVisibleImpl(size);
        
        [LinkName("igIsRectVisible_Vec2")]
        private static extern bool IsRectVisibleImpl(Vec2 rect_min, Vec2 rect_max);
        public static bool IsRectVisible(Vec2 rect_min, Vec2 rect_max) => IsRectVisibleImpl(rect_min, rect_max);
        
        [LinkName("igIsWindowAbove")]
        private static extern bool IsWindowAboveImpl(Window* potential_above, Window* potential_below);
        public static bool IsWindowAbove(Window* potential_above, Window* potential_below) => IsWindowAboveImpl(potential_above, potential_below);
        
        [LinkName("igIsWindowAppearing")]
        private static extern bool IsWindowAppearingImpl();
        public static bool IsWindowAppearing() => IsWindowAppearingImpl();
        
        [LinkName("igIsWindowChildOf")]
        private static extern bool IsWindowChildOfImpl(Window* window, Window* potential_parent, bool popup_hierarchy, bool dock_hierarchy);
        public static bool IsWindowChildOf(Window* window, Window* potential_parent, bool popup_hierarchy, bool dock_hierarchy) => IsWindowChildOfImpl(window, potential_parent, popup_hierarchy, dock_hierarchy);
        
        [LinkName("igIsWindowCollapsed")]
        private static extern bool IsWindowCollapsedImpl();
        public static bool IsWindowCollapsed() => IsWindowCollapsedImpl();
        
        [LinkName("igIsWindowContentHoverable")]
        private static extern bool IsWindowContentHoverableImpl(Window* window, HoveredFlags flags);
        public static bool IsWindowContentHoverable(Window* window, HoveredFlags flags = (HoveredFlags) 0) => IsWindowContentHoverableImpl(window, flags);
        
        [LinkName("igIsWindowDocked")]
        private static extern bool IsWindowDockedImpl();
        public static bool IsWindowDocked() => IsWindowDockedImpl();
        
        [LinkName("igIsWindowFocused")]
        private static extern bool IsWindowFocusedImpl(FocusedFlags flags);
        public static bool IsWindowFocused(FocusedFlags flags = (FocusedFlags) 0) => IsWindowFocusedImpl(flags);
        
        [LinkName("igIsWindowHovered")]
        private static extern bool IsWindowHoveredImpl(HoveredFlags flags);
        public static bool IsWindowHovered(HoveredFlags flags = (HoveredFlags) 0) => IsWindowHoveredImpl(flags);
        
        [LinkName("igIsWindowNavFocusable")]
        private static extern bool IsWindowNavFocusableImpl(Window* window);
        public static bool IsWindowNavFocusable(Window* window) => IsWindowNavFocusableImpl(window);
        
        [LinkName("igIsWindowWithinBeginStackOf")]
        private static extern bool IsWindowWithinBeginStackOfImpl(Window* window, Window* potential_parent);
        public static bool IsWindowWithinBeginStackOf(Window* window, Window* potential_parent) => IsWindowWithinBeginStackOfImpl(window, potential_parent);
        
        [LinkName("igItemAdd")]
        private static extern bool ItemAddImpl(Rect bb, ID id, Rect* nav_bb, ItemFlags extra_flags);
        public static bool ItemAdd(Rect bb, ID id, Rect* nav_bb = null, ItemFlags extra_flags = (ItemFlags) 0) => ItemAddImpl(bb, id, nav_bb, extra_flags);
        
        [LinkName("igItemHoverable")]
        private static extern bool ItemHoverableImpl(Rect bb, ID id, ItemFlags item_flags);
        public static bool ItemHoverable(Rect bb, ID id, ItemFlags item_flags) => ItemHoverableImpl(bb, id, item_flags);
        
        [LinkName("igItemSize_Vec2")]
        private static extern void ItemSizeImpl(Vec2 size, float text_baseline_y);
        public static void ItemSize(Vec2 size, float text_baseline_y = -1.0f) => ItemSizeImpl(size, text_baseline_y);
        
        [LinkName("igItemSize_Rect")]
        private static extern void ItemSizeImpl(Rect bb, float text_baseline_y);
        public static void ItemSize(Rect bb, float text_baseline_y = -1.0f) => ItemSizeImpl(bb, text_baseline_y);
        
        [LinkName("igKeepAliveID")]
        private static extern void KeepAliveIDImpl(ID id);
        public static void KeepAliveID(ID id) => KeepAliveIDImpl(id);
        
        [LinkName("igLabelText")]
        private static extern void LabelTextImpl(char* label, char* fmt, ...);
        public static void LabelText(char* label, char* fmt, params Object[] args) => LabelTextImpl(label, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igListBox_Str_arr")]
        private static extern bool ListBoxImpl(char* label, int32* current_item, char** items, int32 items_count, int32 height_in_items);
        public static bool ListBox(char* label, int32* current_item, char** items, int32 items_count, int32 height_in_items = -1) => ListBoxImpl(label, current_item, items, items_count, height_in_items);
        
        [LinkName("igListBox_FnStrPtr")]
        private static extern bool ListBoxImpl(char* label, int32* current_item, function char*(void* user_data, int32 idx) getter, void* user_data, int32 items_count, int32 height_in_items);
        public static bool ListBox(char* label, int32* current_item, function char*(void* user_data, int32 idx) getter, void* user_data, int32 items_count, int32 height_in_items = -1) => ListBoxImpl(label, current_item, getter, user_data, items_count, height_in_items);
        
        [LinkName("igLoadIniSettingsFromDisk")]
        private static extern void LoadIniSettingsFromDiskImpl(char* ini_filename);
        public static void LoadIniSettingsFromDisk(char* ini_filename) => LoadIniSettingsFromDiskImpl(ini_filename);
        
        [LinkName("igLoadIniSettingsFromMemory")]
        private static extern void LoadIniSettingsFromMemoryImpl(char* ini_data, size ini_size);
        public static void LoadIniSettingsFromMemory(char* ini_data, size ini_size = (size) 0) => LoadIniSettingsFromMemoryImpl(ini_data, ini_size);
        
        [LinkName("igLocalizeGetMsg")]
        private static extern char* LocalizeGetMsgImpl(LocKey key);
        #if IMGUI_USE_REF
        public static ref char LocalizeGetMsg(LocKey key) { return ref *LocalizeGetMsgImpl(key); }
        #else
        public static char* LocalizeGetMsg(LocKey key) => LocalizeGetMsgImpl(key);
        #endif
        
        [LinkName("igLocalizeRegisterEntries")]
        private static extern void LocalizeRegisterEntriesImpl(LocEntry* entries, int32 count);
        public static void LocalizeRegisterEntries(LocEntry* entries, int32 count) => LocalizeRegisterEntriesImpl(entries, count);
        
        [LinkName("igLogBegin")]
        private static extern void LogBeginImpl(LogFlags flags, int32 auto_open_depth);
        public static void LogBegin(LogFlags flags, int32 auto_open_depth) => LogBeginImpl(flags, auto_open_depth);
        
        [LinkName("igLogButtons")]
        private static extern void LogButtonsImpl();
        public static void LogButtons() => LogButtonsImpl();
        
        [LinkName("igLogFinish")]
        private static extern void LogFinishImpl();
        public static void LogFinish() => LogFinishImpl();
        
        [LinkName("igLogRenderedText")]
        private static extern void LogRenderedTextImpl(Vec2* ref_pos, char* text, char* text_end);
        public static void LogRenderedText(Vec2* ref_pos, char* text, char* text_end = null) => LogRenderedTextImpl(ref_pos, text, text_end);
        
        [LinkName("igLogSetNextTextDecoration")]
        private static extern void LogSetNextTextDecorationImpl(char* prefix, char* suffix);
        public static void LogSetNextTextDecoration(char* prefix, char* suffix) => LogSetNextTextDecorationImpl(prefix, suffix);
        
        [LinkName("igLogText")]
        private static extern void LogTextImpl(char* fmt, ...);
        public static void LogText(char* fmt, params Object[] args) => LogTextImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igLogToBuffer")]
        private static extern void LogToBufferImpl(int32 auto_open_depth);
        public static void LogToBuffer(int32 auto_open_depth = -1) => LogToBufferImpl(auto_open_depth);
        
        [LinkName("igLogToClipboard")]
        private static extern void LogToClipboardImpl(int32 auto_open_depth);
        public static void LogToClipboard(int32 auto_open_depth = -1) => LogToClipboardImpl(auto_open_depth);
        
        [LinkName("igLogToFile")]
        private static extern void LogToFileImpl(int32 auto_open_depth, char* filename);
        public static void LogToFile(int32 auto_open_depth = -1, char* filename = null) => LogToFileImpl(auto_open_depth, filename);
        
        [LinkName("igLogToTTY")]
        private static extern void LogToTTYImpl(int32 auto_open_depth);
        public static void LogToTTY(int32 auto_open_depth = -1) => LogToTTYImpl(auto_open_depth);
        
        [LinkName("igMarkIniSettingsDirty_Nil")]
        private static extern void MarkIniSettingsDirtyImpl();
        public static void MarkIniSettingsDirty() => MarkIniSettingsDirtyImpl();
        
        [LinkName("igMarkIniSettingsDirty_WindowPtr")]
        private static extern void MarkIniSettingsDirtyImpl(Window* window);
        public static void MarkIniSettingsDirty(Window* window) => MarkIniSettingsDirtyImpl(window);
        
        [LinkName("igMarkItemEdited")]
        private static extern void MarkItemEditedImpl(ID id);
        public static void MarkItemEdited(ID id) => MarkItemEditedImpl(id);
        
        [LinkName("igMemAlloc")]
        private static extern void* MemAllocImpl(size size);
        #if IMGUI_USE_REF
        public static ref void MemAlloc(size size) { return ref *MemAllocImpl(size); }
        #else
        public static void* MemAlloc(size size) => MemAllocImpl(size);
        #endif
        
        [LinkName("igMemFree")]
        private static extern void MemFreeImpl(void* ptr);
        public static void MemFree(void* ptr) => MemFreeImpl(ptr);
        
        [LinkName("igMenuItem_Bool")]
        private static extern bool MenuItemImpl(char* label, char* shortcut, bool selected, bool enabled);
        public static bool MenuItem(char* label, char* shortcut = null, bool selected = false, bool enabled = true) => MenuItemImpl(label, shortcut, selected, enabled);
        
        [LinkName("igMenuItem_BoolPtr")]
        private static extern bool MenuItemImpl(char* label, char* shortcut, bool* p_selected, bool enabled);
        public static bool MenuItem(char* label, char* shortcut, bool* p_selected, bool enabled = true) => MenuItemImpl(label, shortcut, p_selected, enabled);
        
        [LinkName("igMenuItemEx")]
        private static extern bool MenuItemExImpl(char* label, char* icon, char* shortcut, bool selected, bool enabled);
        public static bool MenuItemEx(char* label, char* icon, char* shortcut = null, bool selected = false, bool enabled = true) => MenuItemExImpl(label, icon, shortcut, selected, enabled);
        
        [LinkName("igMouseButtonToKey")]
        private static extern Key MouseButtonToKeyImpl(MouseButton button);
        public static Key MouseButtonToKey(MouseButton button) => MouseButtonToKeyImpl(button);
        
        [LinkName("igMultiSelectAddSetAll")]
        private static extern void MultiSelectAddSetAllImpl(MultiSelectTempData* ms, bool selected);
        public static void MultiSelectAddSetAll(MultiSelectTempData* ms, bool selected) => MultiSelectAddSetAllImpl(ms, selected);
        
        [LinkName("igMultiSelectAddSetRange")]
        private static extern void MultiSelectAddSetRangeImpl(MultiSelectTempData* ms, bool selected, int32 range_dir, SelectionUserData first_item, SelectionUserData last_item);
        public static void MultiSelectAddSetRange(MultiSelectTempData* ms, bool selected, int32 range_dir, SelectionUserData first_item, SelectionUserData last_item) => MultiSelectAddSetRangeImpl(ms, selected, range_dir, first_item, last_item);
        
        [LinkName("igMultiSelectItemFooter")]
        private static extern void MultiSelectItemFooterImpl(ID id, bool* p_selected, bool* p_pressed);
        public static void MultiSelectItemFooter(ID id, bool* p_selected, bool* p_pressed) => MultiSelectItemFooterImpl(id, p_selected, p_pressed);
        
        [LinkName("igMultiSelectItemHeader")]
        private static extern void MultiSelectItemHeaderImpl(ID id, bool* p_selected, ButtonFlags* p_button_flags);
        public static void MultiSelectItemHeader(ID id, bool* p_selected, ButtonFlags* p_button_flags) => MultiSelectItemHeaderImpl(id, p_selected, p_button_flags);
        
        [LinkName("igNavClearPreferredPosForAxis")]
        private static extern void NavClearPreferredPosForAxisImpl(Axis axis);
        public static void NavClearPreferredPosForAxis(Axis axis) => NavClearPreferredPosForAxisImpl(axis);
        
        [LinkName("igNavHighlightActivated")]
        private static extern void NavHighlightActivatedImpl(ID id);
        public static void NavHighlightActivated(ID id) => NavHighlightActivatedImpl(id);
        
        [LinkName("igNavInitRequestApplyResult")]
        private static extern void NavInitRequestApplyResultImpl();
        public static void NavInitRequestApplyResult() => NavInitRequestApplyResultImpl();
        
        [LinkName("igNavInitWindow")]
        private static extern void NavInitWindowImpl(Window* window, bool force_reinit);
        public static void NavInitWindow(Window* window, bool force_reinit) => NavInitWindowImpl(window, force_reinit);
        
        [LinkName("igNavMoveRequestApplyResult")]
        private static extern void NavMoveRequestApplyResultImpl();
        public static void NavMoveRequestApplyResult() => NavMoveRequestApplyResultImpl();
        
        [LinkName("igNavMoveRequestButNoResultYet")]
        private static extern bool NavMoveRequestButNoResultYetImpl();
        public static bool NavMoveRequestButNoResultYet() => NavMoveRequestButNoResultYetImpl();
        
        [LinkName("igNavMoveRequestCancel")]
        private static extern void NavMoveRequestCancelImpl();
        public static void NavMoveRequestCancel() => NavMoveRequestCancelImpl();
        
        [LinkName("igNavMoveRequestForward")]
        private static extern void NavMoveRequestForwardImpl(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags);
        public static void NavMoveRequestForward(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags) => NavMoveRequestForwardImpl(move_dir, clip_dir, move_flags, scroll_flags);
        
        [LinkName("igNavMoveRequestResolveWithLastItem")]
        private static extern void NavMoveRequestResolveWithLastItemImpl(NavItemData* result);
        public static void NavMoveRequestResolveWithLastItem(NavItemData* result) => NavMoveRequestResolveWithLastItemImpl(result);
        
        [LinkName("igNavMoveRequestResolveWithPastTreeNode")]
        private static extern void NavMoveRequestResolveWithPastTreeNodeImpl(NavItemData* result, TreeNodeStackData* tree_node_data);
        public static void NavMoveRequestResolveWithPastTreeNode(NavItemData* result, TreeNodeStackData* tree_node_data) => NavMoveRequestResolveWithPastTreeNodeImpl(result, tree_node_data);
        
        [LinkName("igNavMoveRequestSubmit")]
        private static extern void NavMoveRequestSubmitImpl(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags);
        public static void NavMoveRequestSubmit(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags) => NavMoveRequestSubmitImpl(move_dir, clip_dir, move_flags, scroll_flags);
        
        [LinkName("igNavMoveRequestTryWrapping")]
        private static extern void NavMoveRequestTryWrappingImpl(Window* window, NavMoveFlags move_flags);
        public static void NavMoveRequestTryWrapping(Window* window, NavMoveFlags move_flags) => NavMoveRequestTryWrappingImpl(window, move_flags);
        
        [LinkName("igNavUpdateCurrentWindowIsScrollPushableX")]
        private static extern void NavUpdateCurrentWindowIsScrollPushableXImpl();
        public static void NavUpdateCurrentWindowIsScrollPushableX() => NavUpdateCurrentWindowIsScrollPushableXImpl();
        
        [LinkName("igNewFrame")]
        private static extern void NewFrameImpl();
        public static void NewFrame() => NewFrameImpl();
        
        [LinkName("igNewLine")]
        private static extern void NewLineImpl();
        public static void NewLine() => NewLineImpl();
        
        [LinkName("igNextColumn")]
        private static extern void NextColumnImpl();
        public static void NextColumn() => NextColumnImpl();
        
        [LinkName("igOpenPopup_Str")]
        private static extern void OpenPopupImpl(char* str_id, PopupFlags popup_flags);
        public static void OpenPopup(char* str_id, PopupFlags popup_flags = (PopupFlags) 0) => OpenPopupImpl(str_id, popup_flags);
        
        [LinkName("igOpenPopup_ID")]
        private static extern void OpenPopupImpl(ID id, PopupFlags popup_flags);
        public static void OpenPopup(ID id, PopupFlags popup_flags = (PopupFlags) 0) => OpenPopupImpl(id, popup_flags);
        
        [LinkName("igOpenPopupEx")]
        private static extern void OpenPopupExImpl(ID id, PopupFlags popup_flags);
        public static void OpenPopupEx(ID id, PopupFlags popup_flags = .None) => OpenPopupExImpl(id, popup_flags);
        
        [LinkName("igOpenPopupOnItemClick")]
        private static extern void OpenPopupOnItemClickImpl(char* str_id, PopupFlags popup_flags);
        public static void OpenPopupOnItemClick(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => OpenPopupOnItemClickImpl(str_id, popup_flags);
        
        [LinkName("igPlotEx")]
        private static extern int32 PlotExImpl(PlotType plot_type, char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 size_arg);
        public static int32 PlotEx(PlotType plot_type, char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 size_arg) => PlotExImpl(plot_type, label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, size_arg);
        
        [LinkName("igPlotHistogram_FloatPtr")]
        private static extern void PlotHistogramImpl(char* label, float* values, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size, int32 stride);
        public static void PlotHistogram(char* label, float* values, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero, int32 stride = sizeof(float)) => PlotHistogramImpl(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride);
        
        [LinkName("igPlotHistogram_FnFloatPtr")]
        private static extern void PlotHistogramImpl(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size);
        public static void PlotHistogram(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero) => PlotHistogramImpl(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size);
        
        [LinkName("igPlotLines_FloatPtr")]
        private static extern void PlotLinesImpl(char* label, float* values, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size, int32 stride);
        public static void PlotLines(char* label, float* values, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero, int32 stride = sizeof(float)) => PlotLinesImpl(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride);
        
        [LinkName("igPlotLines_FnFloatPtr")]
        private static extern void PlotLinesImpl(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size);
        public static void PlotLines(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero) => PlotLinesImpl(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size);
        
        [LinkName("igPopClipRect")]
        private static extern void PopClipRectImpl();
        public static void PopClipRect() => PopClipRectImpl();
        
        [LinkName("igPopColumnsBackground")]
        private static extern void PopColumnsBackgroundImpl();
        public static void PopColumnsBackground() => PopColumnsBackgroundImpl();
        
        [LinkName("igPopFocusScope")]
        private static extern void PopFocusScopeImpl();
        public static void PopFocusScope() => PopFocusScopeImpl();
        
        [LinkName("igPopFont")]
        private static extern void PopFontImpl();
        public static void PopFont() => PopFontImpl();
        
        [LinkName("igPopID")]
        private static extern void PopIDImpl();
        public static void PopID() => PopIDImpl();
        
        [LinkName("igPopItemFlag")]
        private static extern void PopItemFlagImpl();
        public static void PopItemFlag() => PopItemFlagImpl();
        
        [LinkName("igPopItemWidth")]
        private static extern void PopItemWidthImpl();
        public static void PopItemWidth() => PopItemWidthImpl();
        
        [LinkName("igPopPasswordFont")]
        private static extern void PopPasswordFontImpl();
        public static void PopPasswordFont() => PopPasswordFontImpl();
        
        [LinkName("igPopStyleColor")]
        private static extern void PopStyleColorImpl(int32 count);
        public static void PopStyleColor(int32 count = (int32) 1) => PopStyleColorImpl(count);
        
        [LinkName("igPopStyleVar")]
        private static extern void PopStyleVarImpl(int32 count);
        public static void PopStyleVar(int32 count = (int32) 1) => PopStyleVarImpl(count);
        
        [LinkName("igPopTextWrapPos")]
        private static extern void PopTextWrapPosImpl();
        public static void PopTextWrapPos() => PopTextWrapPosImpl();
        
        [LinkName("igProgressBar")]
        private static extern void ProgressBarImpl(float fraction, Vec2 size_arg, char* overlay);
        public static void ProgressBar(float fraction, Vec2 size_arg = .(-float.MinValue,0), char* overlay = null) => ProgressBarImpl(fraction, size_arg, overlay);
        
        [LinkName("igPushClipRect")]
        private static extern void PushClipRectImpl(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect);
        public static void PushClipRect(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect) => PushClipRectImpl(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);
        
        [LinkName("igPushColumnClipRect")]
        private static extern void PushColumnClipRectImpl(int32 column_index);
        public static void PushColumnClipRect(int32 column_index) => PushColumnClipRectImpl(column_index);
        
        [LinkName("igPushColumnsBackground")]
        private static extern void PushColumnsBackgroundImpl();
        public static void PushColumnsBackground() => PushColumnsBackgroundImpl();
        
        [LinkName("igPushFocusScope")]
        private static extern void PushFocusScopeImpl(ID id);
        public static void PushFocusScope(ID id) => PushFocusScopeImpl(id);
        
        [LinkName("igPushFont")]
        private static extern void PushFontImpl(Font* font, float font_size_base_unscaled);
        public static void PushFont(Font* font, float font_size_base_unscaled) => PushFontImpl(font, font_size_base_unscaled);
        
        [LinkName("igPushID_Str")]
        private static extern void PushIDImpl(char* str_id);
        public static void PushID(char* str_id) => PushIDImpl(str_id);
        
        [LinkName("igPushID_StrStr")]
        private static extern void PushIDImpl(char* str_id_begin, char* str_id_end);
        public static void PushID(char* str_id_begin, char* str_id_end) => PushIDImpl(str_id_begin, str_id_end);
        
        [LinkName("igPushID_Ptr")]
        private static extern void PushIDImpl(void* ptr_id);
        public static void PushID(void* ptr_id) => PushIDImpl(ptr_id);
        
        [LinkName("igPushID_Int")]
        private static extern void PushIDImpl(int32 int_id);
        public static void PushID(int32 int_id) => PushIDImpl(int_id);
        
        [LinkName("igPushItemFlag")]
        private static extern void PushItemFlagImpl(ItemFlags option, bool enabled);
        public static void PushItemFlag(ItemFlags option, bool enabled) => PushItemFlagImpl(option, enabled);
        
        [LinkName("igPushItemWidth")]
        private static extern void PushItemWidthImpl(float item_width);
        public static void PushItemWidth(float item_width) => PushItemWidthImpl(item_width);
        
        [LinkName("igPushMultiItemsWidths")]
        private static extern void PushMultiItemsWidthsImpl(int32 components, float width_full);
        public static void PushMultiItemsWidths(int32 components, float width_full) => PushMultiItemsWidthsImpl(components, width_full);
        
        [LinkName("igPushOverrideID")]
        private static extern void PushOverrideIDImpl(ID id);
        public static void PushOverrideID(ID id) => PushOverrideIDImpl(id);
        
        [LinkName("igPushPasswordFont")]
        private static extern void PushPasswordFontImpl();
        public static void PushPasswordFont() => PushPasswordFontImpl();
        
        [LinkName("igPushStyleColor_U32")]
        private static extern void PushStyleColorImpl(Col idx, U32 col);
        public static void PushStyleColor(Col idx, U32 col) => PushStyleColorImpl(idx, col);
        
        [LinkName("igPushStyleColor_Vec4")]
        private static extern void PushStyleColorImpl(Col idx, Vec4 col);
        public static void PushStyleColor(Col idx, Vec4 col) => PushStyleColorImpl(idx, col);
        
        [LinkName("igPushStyleVar_Float")]
        private static extern void PushStyleVarImpl(StyleVar idx, float val);
        public static void PushStyleVar(StyleVar idx, float val) => PushStyleVarImpl(idx, val);
        
        [LinkName("igPushStyleVar_Vec2")]
        private static extern void PushStyleVarImpl(StyleVar idx, Vec2 val);
        public static void PushStyleVar(StyleVar idx, Vec2 val) => PushStyleVarImpl(idx, val);
        
        [LinkName("igPushStyleVarX")]
        private static extern void PushStyleVarXImpl(StyleVar idx, float val_x);
        public static void PushStyleVarX(StyleVar idx, float val_x) => PushStyleVarXImpl(idx, val_x);
        
        [LinkName("igPushStyleVarY")]
        private static extern void PushStyleVarYImpl(StyleVar idx, float val_y);
        public static void PushStyleVarY(StyleVar idx, float val_y) => PushStyleVarYImpl(idx, val_y);
        
        [LinkName("igPushTextWrapPos")]
        private static extern void PushTextWrapPosImpl(float wrap_local_pos_x);
        public static void PushTextWrapPos(float wrap_local_pos_x = (float) 0.0f) => PushTextWrapPosImpl(wrap_local_pos_x);
        
        [LinkName("igRadioButton_Bool")]
        private static extern bool RadioButtonImpl(char* label, bool active);
        public static bool RadioButton(char* label, bool active) => RadioButtonImpl(label, active);
        
        [LinkName("igRadioButton_IntPtr")]
        private static extern bool RadioButtonImpl(char* label, int32* v, int32 v_button);
        public static bool RadioButton(char* label, int32* v, int32 v_button) => RadioButtonImpl(label, v, v_button);
        
        [LinkName("igRegisterFontAtlas")]
        private static extern void RegisterFontAtlasImpl(FontAtlas* atlas);
        public static void RegisterFontAtlas(FontAtlas* atlas) => RegisterFontAtlasImpl(atlas);
        
        [LinkName("igRegisterUserTexture")]
        private static extern void RegisterUserTextureImpl(TextureData* tex);
        public static void RegisterUserTexture(TextureData* tex) => RegisterUserTextureImpl(tex);
        
        [LinkName("igRemoveContextHook")]
        private static extern void RemoveContextHookImpl(Context* context, ID hook_to_remove);
        public static void RemoveContextHook(Context* context, ID hook_to_remove) => RemoveContextHookImpl(context, hook_to_remove);
        
        [LinkName("igRemoveSettingsHandler")]
        private static extern void RemoveSettingsHandlerImpl(char* type_name);
        public static void RemoveSettingsHandler(char* type_name) => RemoveSettingsHandlerImpl(type_name);
        
        [LinkName("igRender")]
        private static extern void RenderImpl();
        public static void Render() => RenderImpl();
        
        [LinkName("igRenderArrow")]
        private static extern void RenderArrowImpl(DrawList* draw_list, Vec2 pos, U32 col, Dir dir, float scale);
        public static void RenderArrow(DrawList* draw_list, Vec2 pos, U32 col, Dir dir, float scale = (float) 1.0f) => RenderArrowImpl(draw_list, pos, col, dir, scale);
        
        [LinkName("igRenderArrowDockMenu")]
        private static extern void RenderArrowDockMenuImpl(DrawList* draw_list, Vec2 p_min, float sz, U32 col);
        public static void RenderArrowDockMenu(DrawList* draw_list, Vec2 p_min, float sz, U32 col) => RenderArrowDockMenuImpl(draw_list, p_min, sz, col);
        
        [LinkName("igRenderArrowPointingAt")]
        private static extern void RenderArrowPointingAtImpl(DrawList* draw_list, Vec2 pos, Vec2 half_sz, Dir direction, U32 col);
        public static void RenderArrowPointingAt(DrawList* draw_list, Vec2 pos, Vec2 half_sz, Dir direction, U32 col) => RenderArrowPointingAtImpl(draw_list, pos, half_sz, direction, col);
        
        [LinkName("igRenderBullet")]
        private static extern void RenderBulletImpl(DrawList* draw_list, Vec2 pos, U32 col);
        public static void RenderBullet(DrawList* draw_list, Vec2 pos, U32 col) => RenderBulletImpl(draw_list, pos, col);
        
        [LinkName("igRenderCheckMark")]
        private static extern void RenderCheckMarkImpl(DrawList* draw_list, Vec2 pos, U32 col, float sz);
        public static void RenderCheckMark(DrawList* draw_list, Vec2 pos, U32 col, float sz) => RenderCheckMarkImpl(draw_list, pos, col, sz);
        
        [LinkName("igRenderColorRectWithAlphaCheckerboard")]
        private static extern void RenderColorRectWithAlphaCheckerboardImpl(DrawList* draw_list, Vec2 p_min, Vec2 p_max, U32 fill_col, float grid_step, Vec2 grid_off, float rounding, DrawFlags flags);
        public static void RenderColorRectWithAlphaCheckerboard(DrawList* draw_list, Vec2 p_min, Vec2 p_max, U32 fill_col, float grid_step, Vec2 grid_off, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0) => RenderColorRectWithAlphaCheckerboardImpl(draw_list, p_min, p_max, fill_col, grid_step, grid_off, rounding, flags);
        
        [LinkName("igRenderDragDropTargetRect")]
        private static extern void RenderDragDropTargetRectImpl(Rect bb, Rect item_clip_rect);
        public static void RenderDragDropTargetRect(Rect bb, Rect item_clip_rect) => RenderDragDropTargetRectImpl(bb, item_clip_rect);
        
        [LinkName("igRenderFrame")]
        private static extern void RenderFrameImpl(Vec2 p_min, Vec2 p_max, U32 fill_col, bool borders, float rounding);
        public static void RenderFrame(Vec2 p_min, Vec2 p_max, U32 fill_col, bool borders = true, float rounding = (float) 0.0f) => RenderFrameImpl(p_min, p_max, fill_col, borders, rounding);
        
        [LinkName("igRenderFrameBorder")]
        private static extern void RenderFrameBorderImpl(Vec2 p_min, Vec2 p_max, float rounding);
        public static void RenderFrameBorder(Vec2 p_min, Vec2 p_max, float rounding = (float) 0.0f) => RenderFrameBorderImpl(p_min, p_max, rounding);
        
        [LinkName("igRenderMouseCursor")]
        private static extern void RenderMouseCursorImpl(Vec2 pos, float scale, MouseCursor mouse_cursor, U32 col_fill, U32 col_border, U32 col_shadow);
        public static void RenderMouseCursor(Vec2 pos, float scale, MouseCursor mouse_cursor, U32 col_fill, U32 col_border, U32 col_shadow) => RenderMouseCursorImpl(pos, scale, mouse_cursor, col_fill, col_border, col_shadow);
        
        [LinkName("igRenderNavCursor")]
        private static extern void RenderNavCursorImpl(Rect bb, ID id, NavRenderCursorFlags flags);
        public static void RenderNavCursor(Rect bb, ID id, NavRenderCursorFlags flags = .None) => RenderNavCursorImpl(bb, id, flags);
        
        [LinkName("igRenderPlatformWindowsDefault")]
        private static extern void RenderPlatformWindowsDefaultImpl(void* platform_render_arg, void* renderer_render_arg);
        public static void RenderPlatformWindowsDefault(void* platform_render_arg = null, void* renderer_render_arg = null) => RenderPlatformWindowsDefaultImpl(platform_render_arg, renderer_render_arg);
        
        [LinkName("igRenderRectFilledRangeH")]
        private static extern void RenderRectFilledRangeHImpl(DrawList* draw_list, Rect rect, U32 col, float x_start_norm, float x_end_norm, float rounding);
        public static void RenderRectFilledRangeH(DrawList* draw_list, Rect rect, U32 col, float x_start_norm, float x_end_norm, float rounding) => RenderRectFilledRangeHImpl(draw_list, rect, col, x_start_norm, x_end_norm, rounding);
        
        [LinkName("igRenderRectFilledWithHole")]
        private static extern void RenderRectFilledWithHoleImpl(DrawList* draw_list, Rect outer, Rect inner, U32 col, float rounding);
        public static void RenderRectFilledWithHole(DrawList* draw_list, Rect outer, Rect inner, U32 col, float rounding) => RenderRectFilledWithHoleImpl(draw_list, outer, inner, col, rounding);
        
        [LinkName("igRenderText")]
        private static extern void RenderTextImpl(Vec2 pos, char* text, char* text_end, bool hide_text_after_hash);
        public static void RenderText(Vec2 pos, char* text, char* text_end = null, bool hide_text_after_hash = true) => RenderTextImpl(pos, text, text_end, hide_text_after_hash);
        
        [LinkName("igRenderTextClipped")]
        private static extern void RenderTextClippedImpl(Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align, Rect* clip_rect);
        public static void RenderTextClipped(Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align = Vec2.Zero, Rect* clip_rect = null) => RenderTextClippedImpl(pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect);
        
        [LinkName("igRenderTextClippedEx")]
        private static extern void RenderTextClippedExImpl(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align, Rect* clip_rect);
        public static void RenderTextClippedEx(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align = Vec2.Zero, Rect* clip_rect = null) => RenderTextClippedExImpl(draw_list, pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect);
        
        [LinkName("igRenderTextEllipsis")]
        private static extern void RenderTextEllipsisImpl(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, float ellipsis_max_x, char* text, char* text_end, Vec2* text_size_if_known);
        public static void RenderTextEllipsis(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, float ellipsis_max_x, char* text, char* text_end, Vec2* text_size_if_known) => RenderTextEllipsisImpl(draw_list, pos_min, pos_max, ellipsis_max_x, text, text_end, text_size_if_known);
        
        [LinkName("igRenderTextWrapped")]
        private static extern void RenderTextWrappedImpl(Vec2 pos, char* text, char* text_end, float wrap_width);
        public static void RenderTextWrapped(Vec2 pos, char* text, char* text_end, float wrap_width) => RenderTextWrappedImpl(pos, text, text_end, wrap_width);
        
        [LinkName("igResetMouseDragDelta")]
        private static extern void ResetMouseDragDeltaImpl(MouseButton button);
        public static void ResetMouseDragDelta(MouseButton button = (MouseButton) 0) => ResetMouseDragDeltaImpl(button);
        
        [LinkName("igSameLine")]
        private static extern void SameLineImpl(float offset_from_start_x, float spacing);
        public static void SameLine(float offset_from_start_x = (float) 0.0f, float spacing = -1.0f) => SameLineImpl(offset_from_start_x, spacing);
        
        [LinkName("igSaveIniSettingsToDisk")]
        private static extern void SaveIniSettingsToDiskImpl(char* ini_filename);
        public static void SaveIniSettingsToDisk(char* ini_filename) => SaveIniSettingsToDiskImpl(ini_filename);
        
        [LinkName("igSaveIniSettingsToMemory")]
        private static extern char* SaveIniSettingsToMemoryImpl(size* out_ini_size);
        #if IMGUI_USE_REF
        public static ref char SaveIniSettingsToMemory(size* out_ini_size = null) { return ref *SaveIniSettingsToMemoryImpl(out_ini_size); }
        #else
        public static char* SaveIniSettingsToMemory(size* out_ini_size = null) => SaveIniSettingsToMemoryImpl(out_ini_size);
        #endif
        
        [LinkName("igScaleWindowsInViewport")]
        private static extern void ScaleWindowsInViewportImpl(ViewportP* viewport, float scale);
        public static void ScaleWindowsInViewport(ViewportP* viewport, float scale) => ScaleWindowsInViewportImpl(viewport, scale);
        
        [LinkName("igScrollToBringRectIntoView")]
        private static extern void ScrollToBringRectIntoViewImpl(Window* window, Rect rect);
        public static void ScrollToBringRectIntoView(Window* window, Rect rect) => ScrollToBringRectIntoViewImpl(window, rect);
        
        [LinkName("igScrollToItem")]
        private static extern void ScrollToItemImpl(ScrollFlags flags);
        public static void ScrollToItem(ScrollFlags flags = (ScrollFlags) 0) => ScrollToItemImpl(flags);
        
        [LinkName("igScrollToRect")]
        private static extern void ScrollToRectImpl(Window* window, Rect rect, ScrollFlags flags);
        public static void ScrollToRect(Window* window, Rect rect, ScrollFlags flags = (ScrollFlags) 0) => ScrollToRectImpl(window, rect, flags);
        
        [LinkName("igScrollToRectEx")]
        private static extern Vec2 ScrollToRectExImpl(Vec2* pOut, Window* window, Rect rect, ScrollFlags flags);
        public static Vec2 ScrollToRectEx(Window* window, Rect rect, ScrollFlags flags = (ScrollFlags) 0)
        {
            Vec2 pOut = default;
            ScrollToRectExImpl(&pOut, window, rect, flags);
            return pOut;
        }
        
        [LinkName("igScrollbar")]
        private static extern void ScrollbarImpl(Axis axis);
        public static void Scrollbar(Axis axis) => ScrollbarImpl(axis);
        
        [LinkName("igScrollbarEx")]
        private static extern bool ScrollbarExImpl(Rect bb, ID id, Axis axis, S64* p_scroll_v, S64 avail_v, S64 contents_v, DrawFlags draw_rounding_flags);
        public static bool ScrollbarEx(Rect bb, ID id, Axis axis, S64* p_scroll_v, S64 avail_v, S64 contents_v, DrawFlags draw_rounding_flags = (DrawFlags) 0) => ScrollbarExImpl(bb, id, axis, p_scroll_v, avail_v, contents_v, draw_rounding_flags);
        
        [LinkName("igSelectable_Bool")]
        private static extern bool SelectableImpl(char* label, bool selected, SelectableFlags flags, Vec2 size);
        public static bool Selectable(char* label, bool selected = false, SelectableFlags flags = (SelectableFlags) 0, Vec2 size = Vec2.Zero) => SelectableImpl(label, selected, flags, size);
        
        [LinkName("igSelectable_BoolPtr")]
        private static extern bool SelectableImpl(char* label, bool* p_selected, SelectableFlags flags, Vec2 size);
        public static bool Selectable(char* label, bool* p_selected, SelectableFlags flags = (SelectableFlags) 0, Vec2 size = Vec2.Zero) => SelectableImpl(label, p_selected, flags, size);
        
        [LinkName("igSeparator")]
        private static extern void SeparatorImpl();
        public static void Separator() => SeparatorImpl();
        
        [LinkName("igSeparatorEx")]
        private static extern void SeparatorExImpl(SeparatorFlags flags, float thickness);
        public static void SeparatorEx(SeparatorFlags flags, float thickness = (float) 1.0f) => SeparatorExImpl(flags, thickness);
        
        [LinkName("igSeparatorText")]
        private static extern void SeparatorTextImpl(char* label);
        public static void SeparatorText(char* label) => SeparatorTextImpl(label);
        
        [LinkName("igSeparatorTextEx")]
        private static extern void SeparatorTextExImpl(ID id, char* label, char* label_end, float extra_width);
        public static void SeparatorTextEx(ID id, char* label, char* label_end, float extra_width) => SeparatorTextExImpl(id, label, label_end, extra_width);
        
        [LinkName("igSetActiveID")]
        private static extern void SetActiveIDImpl(ID id, Window* window);
        public static void SetActiveID(ID id, Window* window) => SetActiveIDImpl(id, window);
        
        [LinkName("igSetActiveIdUsingAllKeyboardKeys")]
        private static extern void SetActiveIdUsingAllKeyboardKeysImpl();
        public static void SetActiveIdUsingAllKeyboardKeys() => SetActiveIdUsingAllKeyboardKeysImpl();
        
        [LinkName("igSetAllocatorFunctions")]
        private static extern void SetAllocatorFunctionsImpl(MemAllocFunc alloc_func, MemFreeFunc free_func, void* user_data);
        public static void SetAllocatorFunctions(MemAllocFunc alloc_func, MemFreeFunc free_func, void* user_data = null) => SetAllocatorFunctionsImpl(alloc_func, free_func, user_data);
        
        [LinkName("igSetClipboardText")]
        private static extern void SetClipboardTextImpl(char* text);
        public static void SetClipboardText(char* text) => SetClipboardTextImpl(text);
        
        [LinkName("igSetColorEditOptions")]
        private static extern void SetColorEditOptionsImpl(ColorEditFlags flags);
        public static void SetColorEditOptions(ColorEditFlags flags) => SetColorEditOptionsImpl(flags);
        
        [LinkName("igSetColumnOffset")]
        private static extern void SetColumnOffsetImpl(int32 column_index, float offset_x);
        public static void SetColumnOffset(int32 column_index, float offset_x) => SetColumnOffsetImpl(column_index, offset_x);
        
        [LinkName("igSetColumnWidth")]
        private static extern void SetColumnWidthImpl(int32 column_index, float width);
        public static void SetColumnWidth(int32 column_index, float width) => SetColumnWidthImpl(column_index, width);
        
        [LinkName("igSetCurrentContext")]
        private static extern void SetCurrentContextImpl(Context* ctx);
        public static void SetCurrentContext(Context* ctx) => SetCurrentContextImpl(ctx);
        
        [LinkName("igSetCurrentFont")]
        private static extern void SetCurrentFontImpl(Font* font, float font_size_before_scaling, float font_size_after_scaling);
        public static void SetCurrentFont(Font* font, float font_size_before_scaling, float font_size_after_scaling) => SetCurrentFontImpl(font, font_size_before_scaling, font_size_after_scaling);
        
        [LinkName("igSetCurrentViewport")]
        private static extern void SetCurrentViewportImpl(Window* window, ViewportP* viewport);
        public static void SetCurrentViewport(Window* window, ViewportP* viewport) => SetCurrentViewportImpl(window, viewport);
        
        [LinkName("igSetCursorPos")]
        private static extern void SetCursorPosImpl(Vec2 local_pos);
        public static void SetCursorPos(Vec2 local_pos) => SetCursorPosImpl(local_pos);
        
        [LinkName("igSetCursorPosX")]
        private static extern void SetCursorPosXImpl(float local_x);
        public static void SetCursorPosX(float local_x) => SetCursorPosXImpl(local_x);
        
        [LinkName("igSetCursorPosY")]
        private static extern void SetCursorPosYImpl(float local_y);
        public static void SetCursorPosY(float local_y) => SetCursorPosYImpl(local_y);
        
        [LinkName("igSetCursorScreenPos")]
        private static extern void SetCursorScreenPosImpl(Vec2 pos);
        public static void SetCursorScreenPos(Vec2 pos) => SetCursorScreenPosImpl(pos);
        
        [LinkName("igSetDragDropPayload")]
        private static extern bool SetDragDropPayloadImpl(char* type, void* data, size sz, Cond cond);
        public static bool SetDragDropPayload(char* type, void* data, size sz, Cond cond = (Cond) 0) => SetDragDropPayloadImpl(type, data, sz, cond);
        
        [LinkName("igSetFocusID")]
        private static extern void SetFocusIDImpl(ID id, Window* window);
        public static void SetFocusID(ID id, Window* window) => SetFocusIDImpl(id, window);
        
        [LinkName("igSetFontRasterizerDensity")]
        private static extern void SetFontRasterizerDensityImpl(float rasterizer_density);
        public static void SetFontRasterizerDensity(float rasterizer_density) => SetFontRasterizerDensityImpl(rasterizer_density);
        
        [LinkName("igSetHoveredID")]
        private static extern void SetHoveredIDImpl(ID id);
        public static void SetHoveredID(ID id) => SetHoveredIDImpl(id);
        
        [LinkName("igSetItemDefaultFocus")]
        private static extern void SetItemDefaultFocusImpl();
        public static void SetItemDefaultFocus() => SetItemDefaultFocusImpl();
        
        [LinkName("igSetItemKeyOwner_Nil")]
        private static extern void SetItemKeyOwnerImpl(Key key);
        public static void SetItemKeyOwner(Key key) => SetItemKeyOwnerImpl(key);
        
        [LinkName("igSetItemKeyOwner_InputFlags")]
        private static extern void SetItemKeyOwnerImpl(Key key, InputFlags flags);
        public static void SetItemKeyOwner(Key key, InputFlags flags) => SetItemKeyOwnerImpl(key, flags);
        
        [LinkName("igSetItemTooltip")]
        private static extern void SetItemTooltipImpl(char* fmt, ...);
        public static void SetItemTooltip(char* fmt, params Object[] args) => SetItemTooltipImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igSetKeyOwner")]
        private static extern void SetKeyOwnerImpl(Key key, ID owner_id, InputFlags flags);
        public static void SetKeyOwner(Key key, ID owner_id, InputFlags flags = (InputFlags) 0) => SetKeyOwnerImpl(key, owner_id, flags);
        
        [LinkName("igSetKeyOwnersForKeyChord")]
        private static extern void SetKeyOwnersForKeyChordImpl(KeyChord key, ID owner_id, InputFlags flags);
        public static void SetKeyOwnersForKeyChord(KeyChord key, ID owner_id, InputFlags flags = (InputFlags) 0) => SetKeyOwnersForKeyChordImpl(key, owner_id, flags);
        
        [LinkName("igSetKeyboardFocusHere")]
        private static extern void SetKeyboardFocusHereImpl(int32 offset);
        public static void SetKeyboardFocusHere(int32 offset = (int32) 0) => SetKeyboardFocusHereImpl(offset);
        
        [LinkName("igSetLastItemData")]
        private static extern void SetLastItemDataImpl(ID item_id, ItemFlags item_flags, ItemStatusFlags status_flags, Rect item_rect);
        public static void SetLastItemData(ID item_id, ItemFlags item_flags, ItemStatusFlags status_flags, Rect item_rect) => SetLastItemDataImpl(item_id, item_flags, status_flags, item_rect);
        
        [LinkName("igSetMouseCursor")]
        private static extern void SetMouseCursorImpl(MouseCursor cursor_type);
        public static void SetMouseCursor(MouseCursor cursor_type) => SetMouseCursorImpl(cursor_type);
        
        [LinkName("igSetNavCursorVisible")]
        private static extern void SetNavCursorVisibleImpl(bool visible);
        public static void SetNavCursorVisible(bool visible) => SetNavCursorVisibleImpl(visible);
        
        [LinkName("igSetNavCursorVisibleAfterMove")]
        private static extern void SetNavCursorVisibleAfterMoveImpl();
        public static void SetNavCursorVisibleAfterMove() => SetNavCursorVisibleAfterMoveImpl();
        
        [LinkName("igSetNavFocusScope")]
        private static extern void SetNavFocusScopeImpl(ID focus_scope_id);
        public static void SetNavFocusScope(ID focus_scope_id) => SetNavFocusScopeImpl(focus_scope_id);
        
        [LinkName("igSetNavID")]
        private static extern void SetNavIDImpl(ID id, NavLayer nav_layer, ID focus_scope_id, Rect rect_rel);
        public static void SetNavID(ID id, NavLayer nav_layer, ID focus_scope_id, Rect rect_rel) => SetNavIDImpl(id, nav_layer, focus_scope_id, rect_rel);
        
        [LinkName("igSetNavWindow")]
        private static extern void SetNavWindowImpl(Window* window);
        public static void SetNavWindow(Window* window) => SetNavWindowImpl(window);
        
        [LinkName("igSetNextFrameWantCaptureKeyboard")]
        private static extern void SetNextFrameWantCaptureKeyboardImpl(bool want_capture_keyboard);
        public static void SetNextFrameWantCaptureKeyboard(bool want_capture_keyboard) => SetNextFrameWantCaptureKeyboardImpl(want_capture_keyboard);
        
        [LinkName("igSetNextFrameWantCaptureMouse")]
        private static extern void SetNextFrameWantCaptureMouseImpl(bool want_capture_mouse);
        public static void SetNextFrameWantCaptureMouse(bool want_capture_mouse) => SetNextFrameWantCaptureMouseImpl(want_capture_mouse);
        
        [LinkName("igSetNextItemAllowOverlap")]
        private static extern void SetNextItemAllowOverlapImpl();
        public static void SetNextItemAllowOverlap() => SetNextItemAllowOverlapImpl();
        
        [LinkName("igSetNextItemOpen")]
        private static extern void SetNextItemOpenImpl(bool is_open, Cond cond);
        public static void SetNextItemOpen(bool is_open, Cond cond = (Cond) 0) => SetNextItemOpenImpl(is_open, cond);
        
        [LinkName("igSetNextItemRefVal")]
        private static extern void SetNextItemRefValImpl(DataType data_type, void* p_data);
        public static void SetNextItemRefVal(DataType data_type, void* p_data) => SetNextItemRefValImpl(data_type, p_data);
        
        [LinkName("igSetNextItemSelectionUserData")]
        private static extern void SetNextItemSelectionUserDataImpl(SelectionUserData selection_user_data);
        public static void SetNextItemSelectionUserData(SelectionUserData selection_user_data) => SetNextItemSelectionUserDataImpl(selection_user_data);
        
        [LinkName("igSetNextItemShortcut")]
        private static extern void SetNextItemShortcutImpl(KeyChord key_chord, InputFlags flags);
        public static void SetNextItemShortcut(KeyChord key_chord, InputFlags flags = (InputFlags) 0) => SetNextItemShortcutImpl(key_chord, flags);
        
        [LinkName("igSetNextItemStorageID")]
        private static extern void SetNextItemStorageIDImpl(ID storage_id);
        public static void SetNextItemStorageID(ID storage_id) => SetNextItemStorageIDImpl(storage_id);
        
        [LinkName("igSetNextItemWidth")]
        private static extern void SetNextItemWidthImpl(float item_width);
        public static void SetNextItemWidth(float item_width) => SetNextItemWidthImpl(item_width);
        
        [LinkName("igSetNextWindowBgAlpha")]
        private static extern void SetNextWindowBgAlphaImpl(float alpha);
        public static void SetNextWindowBgAlpha(float alpha) => SetNextWindowBgAlphaImpl(alpha);
        
        [LinkName("igSetNextWindowClass")]
        private static extern void SetNextWindowClassImpl(WindowClass* window_class);
        public static void SetNextWindowClass(WindowClass* window_class) => SetNextWindowClassImpl(window_class);
        
        [LinkName("igSetNextWindowCollapsed")]
        private static extern void SetNextWindowCollapsedImpl(bool collapsed, Cond cond);
        public static void SetNextWindowCollapsed(bool collapsed, Cond cond = (Cond) 0) => SetNextWindowCollapsedImpl(collapsed, cond);
        
        [LinkName("igSetNextWindowContentSize")]
        private static extern void SetNextWindowContentSizeImpl(Vec2 size);
        public static void SetNextWindowContentSize(Vec2 size) => SetNextWindowContentSizeImpl(size);
        
        [LinkName("igSetNextWindowDockID")]
        private static extern void SetNextWindowDockIDImpl(ID dock_id, Cond cond);
        public static void SetNextWindowDockID(ID dock_id, Cond cond = (Cond) 0) => SetNextWindowDockIDImpl(dock_id, cond);
        
        [LinkName("igSetNextWindowFocus")]
        private static extern void SetNextWindowFocusImpl();
        public static void SetNextWindowFocus() => SetNextWindowFocusImpl();
        
        [LinkName("igSetNextWindowPos")]
        private static extern void SetNextWindowPosImpl(Vec2 pos, Cond cond, Vec2 pivot);
        public static void SetNextWindowPos(Vec2 pos, Cond cond = (Cond) 0, Vec2 pivot = Vec2.Zero) => SetNextWindowPosImpl(pos, cond, pivot);
        
        [LinkName("igSetNextWindowRefreshPolicy")]
        private static extern void SetNextWindowRefreshPolicyImpl(WindowRefreshFlags flags);
        public static void SetNextWindowRefreshPolicy(WindowRefreshFlags flags) => SetNextWindowRefreshPolicyImpl(flags);
        
        [LinkName("igSetNextWindowScroll")]
        private static extern void SetNextWindowScrollImpl(Vec2 scroll);
        public static void SetNextWindowScroll(Vec2 scroll) => SetNextWindowScrollImpl(scroll);
        
        [LinkName("igSetNextWindowSize")]
        private static extern void SetNextWindowSizeImpl(Vec2 size, Cond cond);
        public static void SetNextWindowSize(Vec2 size, Cond cond = (Cond) 0) => SetNextWindowSizeImpl(size, cond);
        
        [LinkName("igSetNextWindowSizeConstraints")]
        private static extern void SetNextWindowSizeConstraintsImpl(Vec2 size_min, Vec2 size_max, SizeCallback custom_callback, void* custom_callback_data);
        public static void SetNextWindowSizeConstraints(Vec2 size_min, Vec2 size_max, SizeCallback custom_callback = null, void* custom_callback_data = null) => SetNextWindowSizeConstraintsImpl(size_min, size_max, custom_callback, custom_callback_data);
        
        [LinkName("igSetNextWindowViewport")]
        private static extern void SetNextWindowViewportImpl(ID viewport_id);
        public static void SetNextWindowViewport(ID viewport_id) => SetNextWindowViewportImpl(viewport_id);
        
        [LinkName("igSetScrollFromPosX_Float")]
        private static extern void SetScrollFromPosXImpl(float local_x, float center_x_ratio);
        public static void SetScrollFromPosX(float local_x, float center_x_ratio = (float) 0.5f) => SetScrollFromPosXImpl(local_x, center_x_ratio);
        
        [LinkName("igSetScrollFromPosX_WindowPtr")]
        private static extern void SetScrollFromPosXImpl(Window* window, float local_x, float center_x_ratio);
        public static void SetScrollFromPosX(Window* window, float local_x, float center_x_ratio) => SetScrollFromPosXImpl(window, local_x, center_x_ratio);
        
        [LinkName("igSetScrollFromPosY_Float")]
        private static extern void SetScrollFromPosYImpl(float local_y, float center_y_ratio);
        public static void SetScrollFromPosY(float local_y, float center_y_ratio = (float) 0.5f) => SetScrollFromPosYImpl(local_y, center_y_ratio);
        
        [LinkName("igSetScrollFromPosY_WindowPtr")]
        private static extern void SetScrollFromPosYImpl(Window* window, float local_y, float center_y_ratio);
        public static void SetScrollFromPosY(Window* window, float local_y, float center_y_ratio) => SetScrollFromPosYImpl(window, local_y, center_y_ratio);
        
        [LinkName("igSetScrollHereX")]
        private static extern void SetScrollHereXImpl(float center_x_ratio);
        public static void SetScrollHereX(float center_x_ratio = (float) 0.5f) => SetScrollHereXImpl(center_x_ratio);
        
        [LinkName("igSetScrollHereY")]
        private static extern void SetScrollHereYImpl(float center_y_ratio);
        public static void SetScrollHereY(float center_y_ratio = (float) 0.5f) => SetScrollHereYImpl(center_y_ratio);
        
        [LinkName("igSetScrollX_Float")]
        private static extern void SetScrollXImpl(float scroll_x);
        public static void SetScrollX(float scroll_x) => SetScrollXImpl(scroll_x);
        
        [LinkName("igSetScrollX_WindowPtr")]
        private static extern void SetScrollXImpl(Window* window, float scroll_x);
        public static void SetScrollX(Window* window, float scroll_x) => SetScrollXImpl(window, scroll_x);
        
        [LinkName("igSetScrollY_Float")]
        private static extern void SetScrollYImpl(float scroll_y);
        public static void SetScrollY(float scroll_y) => SetScrollYImpl(scroll_y);
        
        [LinkName("igSetScrollY_WindowPtr")]
        private static extern void SetScrollYImpl(Window* window, float scroll_y);
        public static void SetScrollY(Window* window, float scroll_y) => SetScrollYImpl(window, scroll_y);
        
        [LinkName("igSetShortcutRouting")]
        private static extern bool SetShortcutRoutingImpl(KeyChord key_chord, InputFlags flags, ID owner_id);
        public static bool SetShortcutRouting(KeyChord key_chord, InputFlags flags, ID owner_id) => SetShortcutRoutingImpl(key_chord, flags, owner_id);
        
        [LinkName("igSetStateStorage")]
        private static extern void SetStateStorageImpl(Storage* storage);
        public static void SetStateStorage(Storage* storage) => SetStateStorageImpl(storage);
        
        [LinkName("igSetTabItemClosed")]
        private static extern void SetTabItemClosedImpl(char* tab_or_docked_window_label);
        public static void SetTabItemClosed(char* tab_or_docked_window_label) => SetTabItemClosedImpl(tab_or_docked_window_label);
        
        [LinkName("igSetTooltip")]
        private static extern void SetTooltipImpl(char* fmt, ...);
        public static void SetTooltip(char* fmt, params Object[] args) => SetTooltipImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igSetWindowClipRectBeforeSetChannel")]
        private static extern void SetWindowClipRectBeforeSetChannelImpl(Window* window, Rect clip_rect);
        public static void SetWindowClipRectBeforeSetChannel(Window* window, Rect clip_rect) => SetWindowClipRectBeforeSetChannelImpl(window, clip_rect);
        
        [LinkName("igSetWindowCollapsed_Bool")]
        private static extern void SetWindowCollapsedImpl(bool collapsed, Cond cond);
        public static void SetWindowCollapsed(bool collapsed, Cond cond = (Cond) 0) => SetWindowCollapsedImpl(collapsed, cond);
        
        [LinkName("igSetWindowCollapsed_Str")]
        private static extern void SetWindowCollapsedImpl(char* name, bool collapsed, Cond cond);
        public static void SetWindowCollapsed(char* name, bool collapsed, Cond cond = (Cond) 0) => SetWindowCollapsedImpl(name, collapsed, cond);
        
        [LinkName("igSetWindowCollapsed_WindowPtr")]
        private static extern void SetWindowCollapsedImpl(Window* window, bool collapsed, Cond cond);
        public static void SetWindowCollapsed(Window* window, bool collapsed, Cond cond = (Cond) 0) => SetWindowCollapsedImpl(window, collapsed, cond);
        
        [LinkName("igSetWindowDock")]
        private static extern void SetWindowDockImpl(Window* window, ID dock_id, Cond cond);
        public static void SetWindowDock(Window* window, ID dock_id, Cond cond) => SetWindowDockImpl(window, dock_id, cond);
        
        [LinkName("igSetWindowFocus_Nil")]
        private static extern void SetWindowFocusImpl();
        public static void SetWindowFocus() => SetWindowFocusImpl();
        
        [LinkName("igSetWindowFocus_Str")]
        private static extern void SetWindowFocusImpl(char* name);
        public static void SetWindowFocus(char* name) => SetWindowFocusImpl(name);
        
        [LinkName("igSetWindowHiddenAndSkipItemsForCurrentFrame")]
        private static extern void SetWindowHiddenAndSkipItemsForCurrentFrameImpl(Window* window);
        public static void SetWindowHiddenAndSkipItemsForCurrentFrame(Window* window) => SetWindowHiddenAndSkipItemsForCurrentFrameImpl(window);
        
        [LinkName("igSetWindowHitTestHole")]
        private static extern void SetWindowHitTestHoleImpl(Window* window, Vec2 pos, Vec2 size);
        public static void SetWindowHitTestHole(Window* window, Vec2 pos, Vec2 size) => SetWindowHitTestHoleImpl(window, pos, size);
        
        [LinkName("igSetWindowParentWindowForFocusRoute")]
        private static extern void SetWindowParentWindowForFocusRouteImpl(Window* window, Window* parent_window);
        public static void SetWindowParentWindowForFocusRoute(Window* window, Window* parent_window) => SetWindowParentWindowForFocusRouteImpl(window, parent_window);
        
        [LinkName("igSetWindowPos_Vec2")]
        private static extern void SetWindowPosImpl(Vec2 pos, Cond cond);
        public static void SetWindowPos(Vec2 pos, Cond cond = (Cond) 0) => SetWindowPosImpl(pos, cond);
        
        [LinkName("igSetWindowPos_Str")]
        private static extern void SetWindowPosImpl(char* name, Vec2 pos, Cond cond);
        public static void SetWindowPos(char* name, Vec2 pos, Cond cond = (Cond) 0) => SetWindowPosImpl(name, pos, cond);
        
        [LinkName("igSetWindowPos_WindowPtr")]
        private static extern void SetWindowPosImpl(Window* window, Vec2 pos, Cond cond);
        public static void SetWindowPos(Window* window, Vec2 pos, Cond cond = (Cond) 0) => SetWindowPosImpl(window, pos, cond);
        
        [LinkName("igSetWindowSize_Vec2")]
        private static extern void SetWindowSizeImpl(Vec2 size, Cond cond);
        public static void SetWindowSize(Vec2 size, Cond cond = (Cond) 0) => SetWindowSizeImpl(size, cond);
        
        [LinkName("igSetWindowSize_Str")]
        private static extern void SetWindowSizeImpl(char* name, Vec2 size, Cond cond);
        public static void SetWindowSize(char* name, Vec2 size, Cond cond = (Cond) 0) => SetWindowSizeImpl(name, size, cond);
        
        [LinkName("igSetWindowSize_WindowPtr")]
        private static extern void SetWindowSizeImpl(Window* window, Vec2 size, Cond cond);
        public static void SetWindowSize(Window* window, Vec2 size, Cond cond = (Cond) 0) => SetWindowSizeImpl(window, size, cond);
        
        [LinkName("igSetWindowViewport")]
        private static extern void SetWindowViewportImpl(Window* window, ViewportP* viewport);
        public static void SetWindowViewport(Window* window, ViewportP* viewport) => SetWindowViewportImpl(window, viewport);
        
        [LinkName("igShadeVertsLinearColorGradientKeepAlpha")]
        private static extern void ShadeVertsLinearColorGradientKeepAlphaImpl(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 gradient_p0, Vec2 gradient_p1, U32 col0, U32 col1);
        public static void ShadeVertsLinearColorGradientKeepAlpha(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 gradient_p0, Vec2 gradient_p1, U32 col0, U32 col1) => ShadeVertsLinearColorGradientKeepAlphaImpl(draw_list, vert_start_idx, vert_end_idx, gradient_p0, gradient_p1, col0, col1);
        
        [LinkName("igShadeVertsLinearUV")]
        private static extern void ShadeVertsLinearUVImpl(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, bool clamp);
        public static void ShadeVertsLinearUV(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, bool clamp) => ShadeVertsLinearUVImpl(draw_list, vert_start_idx, vert_end_idx, a, b, uv_a, uv_b, clamp);
        
        [LinkName("igShadeVertsTransformPos")]
        private static extern void ShadeVertsTransformPosImpl(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 pivot_in, float cos_a, float sin_a, Vec2 pivot_out);
        public static void ShadeVertsTransformPos(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 pivot_in, float cos_a, float sin_a, Vec2 pivot_out) => ShadeVertsTransformPosImpl(draw_list, vert_start_idx, vert_end_idx, pivot_in, cos_a, sin_a, pivot_out);
        
        [LinkName("igShortcut_Nil")]
        private static extern bool ShortcutImpl(KeyChord key_chord, InputFlags flags);
        public static bool Shortcut(KeyChord key_chord, InputFlags flags = (InputFlags) 0) => ShortcutImpl(key_chord, flags);
        
        [LinkName("igShortcut_ID")]
        private static extern bool ShortcutImpl(KeyChord key_chord, InputFlags flags, ID owner_id);
        public static bool Shortcut(KeyChord key_chord, InputFlags flags, ID owner_id) => ShortcutImpl(key_chord, flags, owner_id);
        
        [LinkName("igShowAboutWindow")]
        private static extern void ShowAboutWindowImpl(bool* p_open);
        public static void ShowAboutWindow(bool* p_open = null) => ShowAboutWindowImpl(p_open);
        
        [LinkName("igShowDebugLogWindow")]
        private static extern void ShowDebugLogWindowImpl(bool* p_open);
        public static void ShowDebugLogWindow(bool* p_open = null) => ShowDebugLogWindowImpl(p_open);
        
        [LinkName("igShowDemoWindow")]
        private static extern void ShowDemoWindowImpl(bool* p_open);
        public static void ShowDemoWindow(bool* p_open = null) => ShowDemoWindowImpl(p_open);
        
        [LinkName("igShowFontAtlas")]
        private static extern void ShowFontAtlasImpl(FontAtlas* atlas);
        public static void ShowFontAtlas(FontAtlas* atlas) => ShowFontAtlasImpl(atlas);
        
        [LinkName("igShowFontSelector")]
        private static extern void ShowFontSelectorImpl(char* label);
        public static void ShowFontSelector(char* label) => ShowFontSelectorImpl(label);
        
        [LinkName("igShowIDStackToolWindow")]
        private static extern void ShowIDStackToolWindowImpl(bool* p_open);
        public static void ShowIDStackToolWindow(bool* p_open = null) => ShowIDStackToolWindowImpl(p_open);
        
        [LinkName("igShowMetricsWindow")]
        private static extern void ShowMetricsWindowImpl(bool* p_open);
        public static void ShowMetricsWindow(bool* p_open = null) => ShowMetricsWindowImpl(p_open);
        
        [LinkName("igShowStyleEditor")]
        private static extern void ShowStyleEditorImpl(Style* ref_);
        public static void ShowStyleEditor(Style* ref_ = null) => ShowStyleEditorImpl(ref_);
        
        [LinkName("igShowStyleSelector")]
        private static extern bool ShowStyleSelectorImpl(char* label);
        public static bool ShowStyleSelector(char* label) => ShowStyleSelectorImpl(label);
        
        [LinkName("igShowUserGuide")]
        private static extern void ShowUserGuideImpl();
        public static void ShowUserGuide() => ShowUserGuideImpl();
        
        [LinkName("igShrinkWidths")]
        private static extern void ShrinkWidthsImpl(ShrinkWidthItem* items, int32 count, float width_excess);
        public static void ShrinkWidths(ShrinkWidthItem* items, int32 count, float width_excess) => ShrinkWidthsImpl(items, count, width_excess);
        
        [LinkName("igShutdown")]
        private static extern void ShutdownImpl();
        public static void Shutdown() => ShutdownImpl();
        
        [LinkName("igSliderAngle")]
        private static extern bool SliderAngleImpl(char* label, float* v_rad, float v_degrees_min, float v_degrees_max, char* format, SliderFlags flags);
        public static bool SliderAngle(char* label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f, char* format = "%.0f deg", SliderFlags flags = (SliderFlags) 0) => SliderAngleImpl(label, v_rad, v_degrees_min, v_degrees_max, format, flags);
        
        [LinkName("igSliderBehavior")]
        private static extern bool SliderBehaviorImpl(Rect bb, ID id, DataType data_type, void* p_v, void* p_min, void* p_max, char* format, SliderFlags flags, Rect* out_grab_bb);
        public static bool SliderBehavior(Rect bb, ID id, DataType data_type, void* p_v, void* p_min, void* p_max, char* format, SliderFlags flags, out Rect out_grab_bb)
        {
            out_grab_bb = ?;
            return SliderBehaviorImpl(bb, id, data_type, p_v, p_min, p_max, format, flags, &out_grab_bb);
        }
        
        [LinkName("igSliderFloat")]
        private static extern bool SliderFloatImpl(char* label, float* v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat(char* label, float* v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloatImpl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderFloat2")]
        private static extern bool SliderFloat2Impl(char* label, float[2] v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat2(char* label, ref float[2] v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloat2Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderFloat3")]
        private static extern bool SliderFloat3Impl(char* label, float[3] v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat3(char* label, ref float[3] v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloat3Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderFloat4")]
        private static extern bool SliderFloat4Impl(char* label, float[4] v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat4(char* label, ref float[4] v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloat4Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt")]
        private static extern bool SliderIntImpl(char* label, int32* v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt(char* label, int32* v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderIntImpl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt2")]
        private static extern bool SliderInt2Impl(char* label, int32[2] v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt2(char* label, ref int32[2] v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderInt2Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt3")]
        private static extern bool SliderInt3Impl(char* label, int32[3] v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt3(char* label, ref int32[3] v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderInt3Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt4")]
        private static extern bool SliderInt4Impl(char* label, int32[4] v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt4(char* label, ref int32[4] v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderInt4Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderScalar")]
        private static extern bool SliderScalarImpl(char* label, DataType data_type, void* p_data, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool SliderScalar(char* label, DataType data_type, void* p_data, void* p_min, void* p_max, char* format = null, SliderFlags flags = (SliderFlags) 0) => SliderScalarImpl(label, data_type, p_data, p_min, p_max, format, flags);
        
        [LinkName("igSliderScalarN")]
        private static extern bool SliderScalarNImpl(char* label, DataType data_type, void* p_data, int32 components, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool SliderScalarN(char* label, DataType data_type, void* p_data, int32 components, void* p_min, void* p_max, char* format = null, SliderFlags flags = (SliderFlags) 0) => SliderScalarNImpl(label, data_type, p_data, components, p_min, p_max, format, flags);
        
        [LinkName("igSmallButton")]
        private static extern bool SmallButtonImpl(char* label);
        public static bool SmallButton(char* label) => SmallButtonImpl(label);
        
        [LinkName("igSpacing")]
        private static extern void SpacingImpl();
        public static void Spacing() => SpacingImpl();
        
        [LinkName("igSplitterBehavior")]
        private static extern bool SplitterBehaviorImpl(Rect bb, ID id, Axis axis, float* size1, float* size2, float min_size1, float min_size2, float hover_extend, float hover_visibility_delay, U32 bg_col);
        public static bool SplitterBehavior(Rect bb, ID id, Axis axis, float* size1, float* size2, float min_size1, float min_size2, float hover_extend = (float) 0.0f, float hover_visibility_delay = (float) 0.0f, U32 bg_col = (U32) 0) => SplitterBehaviorImpl(bb, id, axis, size1, size2, min_size1, min_size2, hover_extend, hover_visibility_delay, bg_col);
        
        [LinkName("igStartMouseMovingWindow")]
        private static extern void StartMouseMovingWindowImpl(Window* window);
        public static void StartMouseMovingWindow(Window* window) => StartMouseMovingWindowImpl(window);
        
        [LinkName("igStartMouseMovingWindowOrNode")]
        private static extern void StartMouseMovingWindowOrNodeImpl(Window* window, DockNode* node, bool undock);
        public static void StartMouseMovingWindowOrNode(Window* window, DockNode* node, bool undock) => StartMouseMovingWindowOrNodeImpl(window, node, undock);
        
        [LinkName("igStyleColorsClassic")]
        private static extern void StyleColorsClassicImpl(Style* dst);
        public static void StyleColorsClassic(Style* dst = null) => StyleColorsClassicImpl(dst);
        
        [LinkName("igStyleColorsDark")]
        private static extern void StyleColorsDarkImpl(Style* dst);
        public static void StyleColorsDark(Style* dst = null) => StyleColorsDarkImpl(dst);
        
        [LinkName("igStyleColorsLight")]
        private static extern void StyleColorsLightImpl(Style* dst);
        public static void StyleColorsLight(Style* dst = null) => StyleColorsLightImpl(dst);
        
        [LinkName("igTabBarAddTab")]
        private static extern void TabBarAddTabImpl(TabBar* tab_bar, TabItemFlags tab_flags, Window* window);
        public static void TabBarAddTab(TabBar* tab_bar, TabItemFlags tab_flags, Window* window) => TabBarAddTabImpl(tab_bar, tab_flags, window);
        
        [LinkName("igTabBarCloseTab")]
        private static extern void TabBarCloseTabImpl(TabBar* tab_bar, TabItem* tab);
        public static void TabBarCloseTab(TabBar* tab_bar, TabItem* tab) => TabBarCloseTabImpl(tab_bar, tab);
        
        [LinkName("igTabBarFindMostRecentlySelectedTabForActiveWindow")]
        private static extern TabItem* TabBarFindMostRecentlySelectedTabForActiveWindowImpl(TabBar* tab_bar);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarFindMostRecentlySelectedTabForActiveWindow(TabBar* tab_bar) { return ref *TabBarFindMostRecentlySelectedTabForActiveWindowImpl(tab_bar); }
        #else
        public static TabItem* TabBarFindMostRecentlySelectedTabForActiveWindow(TabBar* tab_bar) => TabBarFindMostRecentlySelectedTabForActiveWindowImpl(tab_bar);
        #endif
        
        [LinkName("igTabBarFindTabByID")]
        private static extern TabItem* TabBarFindTabByIDImpl(TabBar* tab_bar, ID tab_id);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarFindTabByID(TabBar* tab_bar, ID tab_id) { return ref *TabBarFindTabByIDImpl(tab_bar, tab_id); }
        #else
        public static TabItem* TabBarFindTabByID(TabBar* tab_bar, ID tab_id) => TabBarFindTabByIDImpl(tab_bar, tab_id);
        #endif
        
        [LinkName("igTabBarFindTabByOrder")]
        private static extern TabItem* TabBarFindTabByOrderImpl(TabBar* tab_bar, int32 order);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarFindTabByOrder(TabBar* tab_bar, int32 order) { return ref *TabBarFindTabByOrderImpl(tab_bar, order); }
        #else
        public static TabItem* TabBarFindTabByOrder(TabBar* tab_bar, int32 order) => TabBarFindTabByOrderImpl(tab_bar, order);
        #endif
        
        [LinkName("igTabBarGetCurrentTab")]
        private static extern TabItem* TabBarGetCurrentTabImpl(TabBar* tab_bar);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarGetCurrentTab(TabBar* tab_bar) { return ref *TabBarGetCurrentTabImpl(tab_bar); }
        #else
        public static TabItem* TabBarGetCurrentTab(TabBar* tab_bar) => TabBarGetCurrentTabImpl(tab_bar);
        #endif
        
        [LinkName("igTabBarGetTabName")]
        private static extern char* TabBarGetTabNameImpl(TabBar* tab_bar, TabItem* tab);
        #if IMGUI_USE_REF
        public static ref char TabBarGetTabName(TabBar* tab_bar, TabItem* tab) { return ref *TabBarGetTabNameImpl(tab_bar, tab); }
        #else
        public static char* TabBarGetTabName(TabBar* tab_bar, TabItem* tab) => TabBarGetTabNameImpl(tab_bar, tab);
        #endif
        
        [LinkName("igTabBarGetTabOrder")]
        private static extern int32 TabBarGetTabOrderImpl(TabBar* tab_bar, TabItem* tab);
        public static int32 TabBarGetTabOrder(TabBar* tab_bar, TabItem* tab) => TabBarGetTabOrderImpl(tab_bar, tab);
        
        [LinkName("igTabBarProcessReorder")]
        private static extern bool TabBarProcessReorderImpl(TabBar* tab_bar);
        public static bool TabBarProcessReorder(TabBar* tab_bar) => TabBarProcessReorderImpl(tab_bar);
        
        [LinkName("igTabBarQueueFocus_TabItemPtr")]
        private static extern void TabBarQueueFocusImpl(TabBar* tab_bar, TabItem* tab);
        public static void TabBarQueueFocus(TabBar* tab_bar, TabItem* tab) => TabBarQueueFocusImpl(tab_bar, tab);
        
        [LinkName("igTabBarQueueFocus_Str")]
        private static extern void TabBarQueueFocusImpl(TabBar* tab_bar, char* tab_name);
        public static void TabBarQueueFocus(TabBar* tab_bar, char* tab_name) => TabBarQueueFocusImpl(tab_bar, tab_name);
        
        [LinkName("igTabBarQueueReorder")]
        private static extern void TabBarQueueReorderImpl(TabBar* tab_bar, TabItem* tab, int32 offset);
        public static void TabBarQueueReorder(TabBar* tab_bar, TabItem* tab, int32 offset) => TabBarQueueReorderImpl(tab_bar, tab, offset);
        
        [LinkName("igTabBarQueueReorderFromMousePos")]
        private static extern void TabBarQueueReorderFromMousePosImpl(TabBar* tab_bar, TabItem* tab, Vec2 mouse_pos);
        public static void TabBarQueueReorderFromMousePos(TabBar* tab_bar, TabItem* tab, Vec2 mouse_pos) => TabBarQueueReorderFromMousePosImpl(tab_bar, tab, mouse_pos);
        
        [LinkName("igTabBarRemoveTab")]
        private static extern void TabBarRemoveTabImpl(TabBar* tab_bar, ID tab_id);
        public static void TabBarRemoveTab(TabBar* tab_bar, ID tab_id) => TabBarRemoveTabImpl(tab_bar, tab_id);
        
        [LinkName("igTabItemBackground")]
        private static extern void TabItemBackgroundImpl(DrawList* draw_list, Rect bb, TabItemFlags flags, U32 col);
        public static void TabItemBackground(DrawList* draw_list, Rect bb, TabItemFlags flags, U32 col) => TabItemBackgroundImpl(draw_list, bb, flags, col);
        
        [LinkName("igTabItemButton")]
        private static extern bool TabItemButtonImpl(char* label, TabItemFlags flags);
        public static bool TabItemButton(char* label, TabItemFlags flags = (TabItemFlags) 0) => TabItemButtonImpl(label, flags);
        
        [LinkName("igTabItemCalcSize_Str")]
        private static extern Vec2 TabItemCalcSizeImpl(Vec2* pOut, char* label, bool has_close_button_or_unsaved_marker);
        public static Vec2 TabItemCalcSize(char* label, bool has_close_button_or_unsaved_marker)
        {
            Vec2 pOut = default;
            TabItemCalcSizeImpl(&pOut, label, has_close_button_or_unsaved_marker);
            return pOut;
        }
        
        [LinkName("igTabItemCalcSize_WindowPtr")]
        private static extern Vec2 TabItemCalcSizeImpl(Vec2* pOut, Window* window);
        public static Vec2 TabItemCalcSize(Window* window)
        {
            Vec2 pOut = default;
            TabItemCalcSizeImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igTabItemEx")]
        private static extern bool TabItemExImpl(TabBar* tab_bar, char* label, bool* p_open, TabItemFlags flags, Window* docked_window);
        public static bool TabItemEx(TabBar* tab_bar, char* label, bool* p_open, TabItemFlags flags, Window* docked_window) => TabItemExImpl(tab_bar, label, p_open, flags, docked_window);
        
        [LinkName("igTabItemLabelAndCloseButton")]
        private static extern void TabItemLabelAndCloseButtonImpl(DrawList* draw_list, Rect bb, TabItemFlags flags, Vec2 frame_padding, char* label, ID tab_id, ID close_button_id, bool is_contents_visible, bool* out_just_closed, bool* out_text_clipped);
        public static void TabItemLabelAndCloseButton(DrawList* draw_list, Rect bb, TabItemFlags flags, Vec2 frame_padding, char* label, ID tab_id, ID close_button_id, bool is_contents_visible, out bool out_just_closed, out bool out_text_clipped)
        {
            out_just_closed = ?;
            out_text_clipped = ?;
        }
        
        [LinkName("igTabItemSpacing")]
        private static extern void TabItemSpacingImpl(char* str_id, TabItemFlags flags, float width);
        public static void TabItemSpacing(char* str_id, TabItemFlags flags, float width) => TabItemSpacingImpl(str_id, flags, width);
        
        [LinkName("igTableAngledHeadersRow")]
        private static extern void TableAngledHeadersRowImpl();
        public static void TableAngledHeadersRow() => TableAngledHeadersRowImpl();
        
        [LinkName("igTableAngledHeadersRowEx")]
        private static extern void TableAngledHeadersRowExImpl(ID row_id, float angle, float max_label_width, TableHeaderData* data, int32 data_count);
        public static void TableAngledHeadersRowEx(ID row_id, float angle, float max_label_width, TableHeaderData* data, int32 data_count) => TableAngledHeadersRowExImpl(row_id, angle, max_label_width, data, data_count);
        
        [LinkName("igTableBeginApplyRequests")]
        private static extern void TableBeginApplyRequestsImpl(Table* table);
        public static void TableBeginApplyRequests(Table* table) => TableBeginApplyRequestsImpl(table);
        
        [LinkName("igTableBeginCell")]
        private static extern void TableBeginCellImpl(Table* table, int32 column_n);
        public static void TableBeginCell(Table* table, int32 column_n) => TableBeginCellImpl(table, column_n);
        
        [LinkName("igTableBeginContextMenuPopup")]
        private static extern bool TableBeginContextMenuPopupImpl(Table* table);
        public static bool TableBeginContextMenuPopup(Table* table) => TableBeginContextMenuPopupImpl(table);
        
        [LinkName("igTableBeginInitMemory")]
        private static extern void TableBeginInitMemoryImpl(Table* table, int32 columns_count);
        public static void TableBeginInitMemory(Table* table, int32 columns_count) => TableBeginInitMemoryImpl(table, columns_count);
        
        [LinkName("igTableBeginRow")]
        private static extern void TableBeginRowImpl(Table* table);
        public static void TableBeginRow(Table* table) => TableBeginRowImpl(table);
        
        [LinkName("igTableCalcMaxColumnWidth")]
        private static extern float TableCalcMaxColumnWidthImpl(Table* table, int32 column_n);
        public static float TableCalcMaxColumnWidth(Table* table, int32 column_n) => TableCalcMaxColumnWidthImpl(table, column_n);
        
        [LinkName("igTableDrawBorders")]
        private static extern void TableDrawBordersImpl(Table* table);
        public static void TableDrawBorders(Table* table) => TableDrawBordersImpl(table);
        
        [LinkName("igTableDrawDefaultContextMenu")]
        private static extern void TableDrawDefaultContextMenuImpl(Table* table, TableFlags flags_for_section_to_display);
        public static void TableDrawDefaultContextMenu(Table* table, TableFlags flags_for_section_to_display) => TableDrawDefaultContextMenuImpl(table, flags_for_section_to_display);
        
        [LinkName("igTableEndCell")]
        private static extern void TableEndCellImpl(Table* table);
        public static void TableEndCell(Table* table) => TableEndCellImpl(table);
        
        [LinkName("igTableEndRow")]
        private static extern void TableEndRowImpl(Table* table);
        public static void TableEndRow(Table* table) => TableEndRowImpl(table);
        
        [LinkName("igTableFindByID")]
        private static extern Table* TableFindByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref Table TableFindByID(ID id) { return ref *TableFindByIDImpl(id); }
        #else
        public static Table* TableFindByID(ID id) => TableFindByIDImpl(id);
        #endif
        
        [LinkName("igTableFixColumnSortDirection")]
        private static extern void TableFixColumnSortDirectionImpl(Table* table, TableColumn* column);
        public static void TableFixColumnSortDirection(Table* table, TableColumn* column) => TableFixColumnSortDirectionImpl(table, column);
        
        [LinkName("igTableGcCompactSettings")]
        private static extern void TableGcCompactSettingsImpl();
        public static void TableGcCompactSettings() => TableGcCompactSettingsImpl();
        
        [LinkName("igTableGcCompactTransientBuffers_TablePtr")]
        private static extern void TableGcCompactTransientBuffersImpl(Table* table);
        public static void TableGcCompactTransientBuffers(Table* table) => TableGcCompactTransientBuffersImpl(table);
        
        [LinkName("igTableGcCompactTransientBuffers_TableTempDataPtr")]
        private static extern void TableGcCompactTransientBuffersImpl(TableTempData* table);
        public static void TableGcCompactTransientBuffers(TableTempData* table) => TableGcCompactTransientBuffersImpl(table);
        
        [LinkName("igTableGetBoundSettings")]
        private static extern TableSettings* TableGetBoundSettingsImpl(Table* table);
        #if IMGUI_USE_REF
        public static ref TableSettings TableGetBoundSettings(Table* table) { return ref *TableGetBoundSettingsImpl(table); }
        #else
        public static TableSettings* TableGetBoundSettings(Table* table) => TableGetBoundSettingsImpl(table);
        #endif
        
        [LinkName("igTableGetCellBgRect")]
        private static extern Rect TableGetCellBgRectImpl(Rect* pOut, Table* table, int32 column_n);
        public static Rect TableGetCellBgRect(Table* table, int32 column_n)
        {
            Rect pOut = default;
            TableGetCellBgRectImpl(&pOut, table, column_n);
            return pOut;
        }
        
        [LinkName("igTableGetColumnCount")]
        private static extern int32 TableGetColumnCountImpl();
        public static int32 TableGetColumnCount() => TableGetColumnCountImpl();
        
        [LinkName("igTableGetColumnFlags")]
        private static extern TableColumnFlags TableGetColumnFlagsImpl(int32 column_n);
        public static TableColumnFlags TableGetColumnFlags(int32 column_n = -1) => TableGetColumnFlagsImpl(column_n);
        
        [LinkName("igTableGetColumnIndex")]
        private static extern int32 TableGetColumnIndexImpl();
        public static int32 TableGetColumnIndex() => TableGetColumnIndexImpl();
        
        [LinkName("igTableGetColumnName_Int")]
        private static extern char* TableGetColumnNameImpl(int32 column_n);
        #if IMGUI_USE_REF
        public static ref char TableGetColumnName(int32 column_n = -1) { return ref *TableGetColumnNameImpl(column_n); }
        #else
        public static char* TableGetColumnName(int32 column_n = -1) => TableGetColumnNameImpl(column_n);
        #endif
        
        [LinkName("igTableGetColumnName_TablePtr")]
        private static extern char* TableGetColumnNameImpl(Table* table, int32 column_n);
        #if IMGUI_USE_REF
        public static ref char TableGetColumnName(Table* table, int32 column_n) { return ref *TableGetColumnNameImpl(table, column_n); }
        #else
        public static char* TableGetColumnName(Table* table, int32 column_n) => TableGetColumnNameImpl(table, column_n);
        #endif
        
        [LinkName("igTableGetColumnNextSortDirection")]
        private static extern SortDirection TableGetColumnNextSortDirectionImpl(TableColumn* column);
        public static SortDirection TableGetColumnNextSortDirection(TableColumn* column) => TableGetColumnNextSortDirectionImpl(column);
        
        [LinkName("igTableGetColumnResizeID")]
        private static extern ID TableGetColumnResizeIDImpl(Table* table, int32 column_n, int32 instance_no);
        public static ID TableGetColumnResizeID(Table* table, int32 column_n, int32 instance_no = (int32) 0) => TableGetColumnResizeIDImpl(table, column_n, instance_no);
        
        [LinkName("igTableGetColumnWidthAuto")]
        private static extern float TableGetColumnWidthAutoImpl(Table* table, TableColumn* column);
        public static float TableGetColumnWidthAuto(Table* table, TableColumn* column) => TableGetColumnWidthAutoImpl(table, column);
        
        [LinkName("igTableGetHeaderAngledMaxLabelWidth")]
        private static extern float TableGetHeaderAngledMaxLabelWidthImpl();
        public static float TableGetHeaderAngledMaxLabelWidth() => TableGetHeaderAngledMaxLabelWidthImpl();
        
        [LinkName("igTableGetHeaderRowHeight")]
        private static extern float TableGetHeaderRowHeightImpl();
        public static float TableGetHeaderRowHeight() => TableGetHeaderRowHeightImpl();
        
        [LinkName("igTableGetHoveredColumn")]
        private static extern int32 TableGetHoveredColumnImpl();
        public static int32 TableGetHoveredColumn() => TableGetHoveredColumnImpl();
        
        [LinkName("igTableGetHoveredRow")]
        private static extern int32 TableGetHoveredRowImpl();
        public static int32 TableGetHoveredRow() => TableGetHoveredRowImpl();
        
        [LinkName("igTableGetInstanceData")]
        private static extern TableInstanceData* TableGetInstanceDataImpl(Table* table, int32 instance_no);
        #if IMGUI_USE_REF
        public static ref TableInstanceData TableGetInstanceData(Table* table, int32 instance_no) { return ref *TableGetInstanceDataImpl(table, instance_no); }
        #else
        public static TableInstanceData* TableGetInstanceData(Table* table, int32 instance_no) => TableGetInstanceDataImpl(table, instance_no);
        #endif
        
        [LinkName("igTableGetInstanceID")]
        private static extern ID TableGetInstanceIDImpl(Table* table, int32 instance_no);
        public static ID TableGetInstanceID(Table* table, int32 instance_no) => TableGetInstanceIDImpl(table, instance_no);
        
        [LinkName("igTableGetRowIndex")]
        private static extern int32 TableGetRowIndexImpl();
        public static int32 TableGetRowIndex() => TableGetRowIndexImpl();
        
        [LinkName("igTableGetSortSpecs")]
        private static extern TableSortSpecs* TableGetSortSpecsImpl();
        #if IMGUI_USE_REF
        public static ref TableSortSpecs TableGetSortSpecs() { return ref *TableGetSortSpecsImpl(); }
        #else
        public static TableSortSpecs* TableGetSortSpecs() => TableGetSortSpecsImpl();
        #endif
        
        [LinkName("igTableHeader")]
        private static extern void TableHeaderImpl(char* label);
        public static void TableHeader(char* label) => TableHeaderImpl(label);
        
        [LinkName("igTableHeadersRow")]
        private static extern void TableHeadersRowImpl();
        public static void TableHeadersRow() => TableHeadersRowImpl();
        
        [LinkName("igTableLoadSettings")]
        private static extern void TableLoadSettingsImpl(Table* table);
        public static void TableLoadSettings(Table* table) => TableLoadSettingsImpl(table);
        
        [LinkName("igTableMergeDrawChannels")]
        private static extern void TableMergeDrawChannelsImpl(Table* table);
        public static void TableMergeDrawChannels(Table* table) => TableMergeDrawChannelsImpl(table);
        
        [LinkName("igTableNextColumn")]
        private static extern bool TableNextColumnImpl();
        public static bool TableNextColumn() => TableNextColumnImpl();
        
        [LinkName("igTableNextRow")]
        private static extern void TableNextRowImpl(TableRowFlags row_flags, float min_row_height);
        public static void TableNextRow(TableRowFlags row_flags = (TableRowFlags) 0, float min_row_height = (float) 0.0f) => TableNextRowImpl(row_flags, min_row_height);
        
        [LinkName("igTableOpenContextMenu")]
        private static extern void TableOpenContextMenuImpl(int32 column_n);
        public static void TableOpenContextMenu(int32 column_n = -1) => TableOpenContextMenuImpl(column_n);
        
        [LinkName("igTablePopBackgroundChannel")]
        private static extern void TablePopBackgroundChannelImpl();
        public static void TablePopBackgroundChannel() => TablePopBackgroundChannelImpl();
        
        [LinkName("igTablePopColumnChannel")]
        private static extern void TablePopColumnChannelImpl();
        public static void TablePopColumnChannel() => TablePopColumnChannelImpl();
        
        [LinkName("igTablePushBackgroundChannel")]
        private static extern void TablePushBackgroundChannelImpl();
        public static void TablePushBackgroundChannel() => TablePushBackgroundChannelImpl();
        
        [LinkName("igTablePushColumnChannel")]
        private static extern void TablePushColumnChannelImpl(int32 column_n);
        public static void TablePushColumnChannel(int32 column_n) => TablePushColumnChannelImpl(column_n);
        
        [LinkName("igTableRemove")]
        private static extern void TableRemoveImpl(Table* table);
        public static void TableRemove(Table* table) => TableRemoveImpl(table);
        
        [LinkName("igTableResetSettings")]
        private static extern void TableResetSettingsImpl(Table* table);
        public static void TableResetSettings(Table* table) => TableResetSettingsImpl(table);
        
        [LinkName("igTableSaveSettings")]
        private static extern void TableSaveSettingsImpl(Table* table);
        public static void TableSaveSettings(Table* table) => TableSaveSettingsImpl(table);
        
        [LinkName("igTableSetBgColor")]
        private static extern void TableSetBgColorImpl(TableBgTarget target, U32 color, int32 column_n);
        public static void TableSetBgColor(TableBgTarget target, U32 color, int32 column_n = -1) => TableSetBgColorImpl(target, color, column_n);
        
        [LinkName("igTableSetColumnEnabled")]
        private static extern void TableSetColumnEnabledImpl(int32 column_n, bool v);
        public static void TableSetColumnEnabled(int32 column_n, bool v) => TableSetColumnEnabledImpl(column_n, v);
        
        [LinkName("igTableSetColumnIndex")]
        private static extern bool TableSetColumnIndexImpl(int32 column_n);
        public static bool TableSetColumnIndex(int32 column_n) => TableSetColumnIndexImpl(column_n);
        
        [LinkName("igTableSetColumnSortDirection")]
        private static extern void TableSetColumnSortDirectionImpl(int32 column_n, SortDirection sort_direction, bool append_to_sort_specs);
        public static void TableSetColumnSortDirection(int32 column_n, SortDirection sort_direction, bool append_to_sort_specs) => TableSetColumnSortDirectionImpl(column_n, sort_direction, append_to_sort_specs);
        
        [LinkName("igTableSetColumnWidth")]
        private static extern void TableSetColumnWidthImpl(int32 column_n, float width);
        public static void TableSetColumnWidth(int32 column_n, float width) => TableSetColumnWidthImpl(column_n, width);
        
        [LinkName("igTableSetColumnWidthAutoAll")]
        private static extern void TableSetColumnWidthAutoAllImpl(Table* table);
        public static void TableSetColumnWidthAutoAll(Table* table) => TableSetColumnWidthAutoAllImpl(table);
        
        [LinkName("igTableSetColumnWidthAutoSingle")]
        private static extern void TableSetColumnWidthAutoSingleImpl(Table* table, int32 column_n);
        public static void TableSetColumnWidthAutoSingle(Table* table, int32 column_n) => TableSetColumnWidthAutoSingleImpl(table, column_n);
        
        [LinkName("igTableSettingsAddSettingsHandler")]
        private static extern void TableSettingsAddSettingsHandlerImpl();
        public static void TableSettingsAddSettingsHandler() => TableSettingsAddSettingsHandlerImpl();
        
        [LinkName("igTableSettingsCreate")]
        private static extern TableSettings* TableSettingsCreateImpl(ID id, int32 columns_count);
        #if IMGUI_USE_REF
        public static ref TableSettings TableSettingsCreate(ID id, int32 columns_count) { return ref *TableSettingsCreateImpl(id, columns_count); }
        #else
        public static TableSettings* TableSettingsCreate(ID id, int32 columns_count) => TableSettingsCreateImpl(id, columns_count);
        #endif
        
        [LinkName("igTableSettingsFindByID")]
        private static extern TableSettings* TableSettingsFindByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref TableSettings TableSettingsFindByID(ID id) { return ref *TableSettingsFindByIDImpl(id); }
        #else
        public static TableSettings* TableSettingsFindByID(ID id) => TableSettingsFindByIDImpl(id);
        #endif
        
        [LinkName("igTableSetupColumn")]
        private static extern void TableSetupColumnImpl(char* label, TableColumnFlags flags, float init_width_or_weight, ID user_id);
        public static void TableSetupColumn(char* label, TableColumnFlags flags = (TableColumnFlags) 0, float init_width_or_weight = (float) 0.0f, ID user_id = (ID) 0) => TableSetupColumnImpl(label, flags, init_width_or_weight, user_id);
        
        [LinkName("igTableSetupDrawChannels")]
        private static extern void TableSetupDrawChannelsImpl(Table* table);
        public static void TableSetupDrawChannels(Table* table) => TableSetupDrawChannelsImpl(table);
        
        [LinkName("igTableSetupScrollFreeze")]
        private static extern void TableSetupScrollFreezeImpl(int32 cols, int32 rows);
        public static void TableSetupScrollFreeze(int32 cols, int32 rows) => TableSetupScrollFreezeImpl(cols, rows);
        
        [LinkName("igTableSortSpecsBuild")]
        private static extern void TableSortSpecsBuildImpl(Table* table);
        public static void TableSortSpecsBuild(Table* table) => TableSortSpecsBuildImpl(table);
        
        [LinkName("igTableSortSpecsSanitize")]
        private static extern void TableSortSpecsSanitizeImpl(Table* table);
        public static void TableSortSpecsSanitize(Table* table) => TableSortSpecsSanitizeImpl(table);
        
        [LinkName("igTableUpdateBorders")]
        private static extern void TableUpdateBordersImpl(Table* table);
        public static void TableUpdateBorders(Table* table) => TableUpdateBordersImpl(table);
        
        [LinkName("igTableUpdateColumnsWeightFromWidth")]
        private static extern void TableUpdateColumnsWeightFromWidthImpl(Table* table);
        public static void TableUpdateColumnsWeightFromWidth(Table* table) => TableUpdateColumnsWeightFromWidthImpl(table);
        
        [LinkName("igTableUpdateLayout")]
        private static extern void TableUpdateLayoutImpl(Table* table);
        public static void TableUpdateLayout(Table* table) => TableUpdateLayoutImpl(table);
        
        [LinkName("igTeleportMousePos")]
        private static extern void TeleportMousePosImpl(Vec2 pos);
        public static void TeleportMousePos(Vec2 pos) => TeleportMousePosImpl(pos);
        
        [LinkName("igTempInputIsActive")]
        private static extern bool TempInputIsActiveImpl(ID id);
        public static bool TempInputIsActive(ID id) => TempInputIsActiveImpl(id);
        
        [LinkName("igTempInputScalar")]
        private static extern bool TempInputScalarImpl(Rect bb, ID id, char* label, DataType data_type, void* p_data, char* format, void* p_clamp_min, void* p_clamp_max);
        public static bool TempInputScalar(Rect bb, ID id, char* label, DataType data_type, void* p_data, char* format, void* p_clamp_min = null, void* p_clamp_max = null) => TempInputScalarImpl(bb, id, label, data_type, p_data, format, p_clamp_min, p_clamp_max);
        
        [LinkName("igTempInputText")]
        private static extern bool TempInputTextImpl(Rect bb, ID id, char* label, char* buf, int32 buf_size, InputTextFlags flags);
        public static bool TempInputText(Rect bb, ID id, char* label, char* buf, int32 buf_size, InputTextFlags flags) => TempInputTextImpl(bb, id, label, buf, buf_size, flags);
        
        [LinkName("igTestKeyOwner")]
        private static extern bool TestKeyOwnerImpl(Key key, ID owner_id);
        public static bool TestKeyOwner(Key key, ID owner_id) => TestKeyOwnerImpl(key, owner_id);
        
        [LinkName("igTestShortcutRouting")]
        private static extern bool TestShortcutRoutingImpl(KeyChord key_chord, ID owner_id);
        public static bool TestShortcutRouting(KeyChord key_chord, ID owner_id) => TestShortcutRoutingImpl(key_chord, owner_id);
        
        [LinkName("igText")]
        private static extern void TextImpl(char* fmt, ...);
        public static void Text(char* fmt, params Object[] args) => TextImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTextAligned")]
        private static extern void TextAlignedImpl(float align_x, float size_x, char* fmt, ...);
        public static void TextAligned(float align_x, float size_x, char* fmt, params Object[] args) => TextAlignedImpl(align_x, size_x, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTextColored")]
        private static extern void TextColoredImpl(Vec4 col, char* fmt, ...);
        public static void TextColored(Vec4 col, char* fmt, params Object[] args) => TextColoredImpl(col, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTextDisabled")]
        private static extern void TextDisabledImpl(char* fmt, ...);
        public static void TextDisabled(char* fmt, params Object[] args) => TextDisabledImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTextEx")]
        private static extern void TextExImpl(char* text, char* text_end, TextFlags flags);
        public static void TextEx(char* text, char* text_end = null, TextFlags flags = (TextFlags) 0) => TextExImpl(text, text_end, flags);
        
        [LinkName("igTextLink")]
        private static extern bool TextLinkImpl(char* label);
        public static bool TextLink(char* label) => TextLinkImpl(label);
        
        [LinkName("igTextLinkOpenURL")]
        private static extern bool TextLinkOpenURLImpl(char* label, char* url);
        public static bool TextLinkOpenURL(char* label, char* url = null) => TextLinkOpenURLImpl(label, url);
        
        [LinkName("igTextUnformatted")]
        private static extern void TextUnformattedImpl(char* text, char* text_end);
        public static void TextUnformatted(char* text, char* text_end = null) => TextUnformattedImpl(text, text_end);
        
        [LinkName("igTextWrapped")]
        private static extern void TextWrappedImpl(char* fmt, ...);
        public static void TextWrapped(char* fmt, params Object[] args) => TextWrappedImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTranslateWindowsInViewport")]
        private static extern void TranslateWindowsInViewportImpl(ViewportP* viewport, Vec2 old_pos, Vec2 new_pos, Vec2 old_size, Vec2 new_size);
        public static void TranslateWindowsInViewport(ViewportP* viewport, Vec2 old_pos, Vec2 new_pos, Vec2 old_size, Vec2 new_size) => TranslateWindowsInViewportImpl(viewport, old_pos, new_pos, old_size, new_size);
        
        [LinkName("igTreeNode_Str")]
        private static extern bool TreeNodeImpl(char* label);
        public static bool TreeNode(char* label) => TreeNodeImpl(label);
        
        [LinkName("igTreeNode_StrStr")]
        private static extern bool TreeNodeImpl(char* str_id, char* fmt, ...);
        public static bool TreeNode(char* str_id, char* fmt, params Object[] args) => TreeNodeImpl(str_id, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNode_Ptr")]
        private static extern bool TreeNodeImpl(void* ptr_id, char* fmt, ...);
        public static bool TreeNode(void* ptr_id, char* fmt, params Object[] args) => TreeNodeImpl(ptr_id, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNodeBehavior")]
        private static extern bool TreeNodeBehaviorImpl(ID id, TreeNodeFlags flags, char* label, char* label_end);
        public static bool TreeNodeBehavior(ID id, TreeNodeFlags flags, char* label, char* label_end = null) => TreeNodeBehaviorImpl(id, flags, label, label_end);
        
        [LinkName("igTreeNodeDrawLineToChildNode")]
        private static extern void TreeNodeDrawLineToChildNodeImpl(Vec2 target_pos);
        public static void TreeNodeDrawLineToChildNode(Vec2 target_pos) => TreeNodeDrawLineToChildNodeImpl(target_pos);
        
        [LinkName("igTreeNodeDrawLineToTreePop")]
        private static extern void TreeNodeDrawLineToTreePopImpl(TreeNodeStackData* data);
        public static void TreeNodeDrawLineToTreePop(TreeNodeStackData* data) => TreeNodeDrawLineToTreePopImpl(data);
        
        [LinkName("igTreeNodeEx_Str")]
        private static extern bool TreeNodeExImpl(char* label, TreeNodeFlags flags);
        public static bool TreeNodeEx(char* label, TreeNodeFlags flags = (TreeNodeFlags) 0) => TreeNodeExImpl(label, flags);
        
        [LinkName("igTreeNodeEx_StrStr")]
        private static extern bool TreeNodeExImpl(char* str_id, TreeNodeFlags flags, char* fmt, ...);
        public static bool TreeNodeEx(char* str_id, TreeNodeFlags flags, char* fmt, params Object[] args) => TreeNodeExImpl(str_id, flags, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNodeEx_Ptr")]
        private static extern bool TreeNodeExImpl(void* ptr_id, TreeNodeFlags flags, char* fmt, ...);
        public static bool TreeNodeEx(void* ptr_id, TreeNodeFlags flags, char* fmt, params Object[] args) => TreeNodeExImpl(ptr_id, flags, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNodeGetOpen")]
        private static extern bool TreeNodeGetOpenImpl(ID storage_id);
        public static bool TreeNodeGetOpen(ID storage_id) => TreeNodeGetOpenImpl(storage_id);
        
        [LinkName("igTreeNodeSetOpen")]
        private static extern void TreeNodeSetOpenImpl(ID storage_id, bool open);
        public static void TreeNodeSetOpen(ID storage_id, bool open) => TreeNodeSetOpenImpl(storage_id, open);
        
        [LinkName("igTreeNodeUpdateNextOpen")]
        private static extern bool TreeNodeUpdateNextOpenImpl(ID storage_id, TreeNodeFlags flags);
        public static bool TreeNodeUpdateNextOpen(ID storage_id, TreeNodeFlags flags) => TreeNodeUpdateNextOpenImpl(storage_id, flags);
        
        [LinkName("igTreePop")]
        private static extern void TreePopImpl();
        public static void TreePop() => TreePopImpl();
        
        [LinkName("igTreePush_Str")]
        private static extern void TreePushImpl(char* str_id);
        public static void TreePush(char* str_id) => TreePushImpl(str_id);
        
        [LinkName("igTreePush_Ptr")]
        private static extern void TreePushImpl(void* ptr_id);
        public static void TreePush(void* ptr_id) => TreePushImpl(ptr_id);
        
        [LinkName("igTreePushOverrideID")]
        private static extern void TreePushOverrideIDImpl(ID id);
        public static void TreePushOverrideID(ID id) => TreePushOverrideIDImpl(id);
        
        [LinkName("igTypingSelectFindBestLeadingMatch")]
        private static extern int32 TypingSelectFindBestLeadingMatchImpl(TypingSelectRequest* req, int32 items_count, function char*(void* ) get_item_name_func, void* user_data);
        public static int32 TypingSelectFindBestLeadingMatch(TypingSelectRequest* req, int32 items_count, function char*(void* ) get_item_name_func, void* user_data) => TypingSelectFindBestLeadingMatchImpl(req, items_count, get_item_name_func, user_data);
        
        [LinkName("igTypingSelectFindMatch")]
        private static extern int32 TypingSelectFindMatchImpl(TypingSelectRequest* req, int32 items_count, function char*(void* ) get_item_name_func, void* user_data, int32 nav_item_idx);
        public static int32 TypingSelectFindMatch(TypingSelectRequest* req, int32 items_count, function char*(void* ) get_item_name_func, void* user_data, int32 nav_item_idx) => TypingSelectFindMatchImpl(req, items_count, get_item_name_func, user_data, nav_item_idx);
        
        [LinkName("igTypingSelectFindNextSingleCharMatch")]
        private static extern int32 TypingSelectFindNextSingleCharMatchImpl(TypingSelectRequest* req, int32 items_count, function char*(void* ) get_item_name_func, void* user_data, int32 nav_item_idx);
        public static int32 TypingSelectFindNextSingleCharMatch(TypingSelectRequest* req, int32 items_count, function char*(void* ) get_item_name_func, void* user_data, int32 nav_item_idx) => TypingSelectFindNextSingleCharMatchImpl(req, items_count, get_item_name_func, user_data, nav_item_idx);
        
        [LinkName("igUnindent")]
        private static extern void UnindentImpl(float indent_w);
        public static void Unindent(float indent_w = (float) 0.0f) => UnindentImpl(indent_w);
        
        [LinkName("igUnregisterFontAtlas")]
        private static extern void UnregisterFontAtlasImpl(FontAtlas* atlas);
        public static void UnregisterFontAtlas(FontAtlas* atlas) => UnregisterFontAtlasImpl(atlas);
        
        [LinkName("igUnregisterUserTexture")]
        private static extern void UnregisterUserTextureImpl(TextureData* tex);
        public static void UnregisterUserTexture(TextureData* tex) => UnregisterUserTextureImpl(tex);
        
        [LinkName("igUpdateCurrentFontSize")]
        private static extern void UpdateCurrentFontSizeImpl(float restore_font_size_after_scaling);
        public static void UpdateCurrentFontSize(float restore_font_size_after_scaling) => UpdateCurrentFontSizeImpl(restore_font_size_after_scaling);
        
        [LinkName("igUpdateHoveredWindowAndCaptureFlags")]
        private static extern void UpdateHoveredWindowAndCaptureFlagsImpl(Vec2 mouse_pos);
        public static void UpdateHoveredWindowAndCaptureFlags(Vec2 mouse_pos) => UpdateHoveredWindowAndCaptureFlagsImpl(mouse_pos);
        
        [LinkName("igUpdateInputEvents")]
        private static extern void UpdateInputEventsImpl(bool trickle_fast_inputs);
        public static void UpdateInputEvents(bool trickle_fast_inputs) => UpdateInputEventsImpl(trickle_fast_inputs);
        
        [LinkName("igUpdateMouseMovingWindowEndFrame")]
        private static extern void UpdateMouseMovingWindowEndFrameImpl();
        public static void UpdateMouseMovingWindowEndFrame() => UpdateMouseMovingWindowEndFrameImpl();
        
        [LinkName("igUpdateMouseMovingWindowNewFrame")]
        private static extern void UpdateMouseMovingWindowNewFrameImpl();
        public static void UpdateMouseMovingWindowNewFrame() => UpdateMouseMovingWindowNewFrameImpl();
        
        [LinkName("igUpdatePlatformWindows")]
        private static extern void UpdatePlatformWindowsImpl();
        public static void UpdatePlatformWindows() => UpdatePlatformWindowsImpl();
        
        [LinkName("igUpdateWindowParentAndRootLinks")]
        private static extern void UpdateWindowParentAndRootLinksImpl(Window* window, WindowFlags flags, Window* parent_window);
        public static void UpdateWindowParentAndRootLinks(Window* window, WindowFlags flags, Window* parent_window) => UpdateWindowParentAndRootLinksImpl(window, flags, parent_window);
        
        [LinkName("igUpdateWindowSkipRefresh")]
        private static extern void UpdateWindowSkipRefreshImpl(Window* window);
        public static void UpdateWindowSkipRefresh(Window* window) => UpdateWindowSkipRefreshImpl(window);
        
        [LinkName("igVSliderFloat")]
        private static extern bool VSliderFloatImpl(char* label, Vec2 size, float* v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool VSliderFloat(char* label, Vec2 size, float* v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => VSliderFloatImpl(label, size, v, v_min, v_max, format, flags);
        
        [LinkName("igVSliderInt")]
        private static extern bool VSliderIntImpl(char* label, Vec2 size, int32* v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool VSliderInt(char* label, Vec2 size, int32* v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => VSliderIntImpl(label, size, v, v_min, v_max, format, flags);
        
        [LinkName("igVSliderScalar")]
        private static extern bool VSliderScalarImpl(char* label, Vec2 size, DataType data_type, void* p_data, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool VSliderScalar(char* label, Vec2 size, DataType data_type, void* p_data, void* p_min, void* p_max, char* format = null, SliderFlags flags = (SliderFlags) 0) => VSliderScalarImpl(label, size, data_type, p_data, p_min, p_max, format, flags);
        
        [LinkName("igValue_Bool")]
        private static extern void ValueImpl(char* prefix, bool b);
        public static void Value(char* prefix, bool b) => ValueImpl(prefix, b);
        
        [LinkName("igValue_Int")]
        private static extern void ValueImpl(char* prefix, int32 v);
        public static void Value(char* prefix, int32 v) => ValueImpl(prefix, v);
        
        [LinkName("igValue_Uint")]
        private static extern void ValueImpl(char* prefix, uint32 v);
        public static void Value(char* prefix, uint32 v) => ValueImpl(prefix, v);
        
        [LinkName("igValue_Float")]
        private static extern void ValueImpl(char* prefix, float v, char* float_format);
        public static void Value(char* prefix, float v, char* float_format = null) => ValueImpl(prefix, v, float_format);
        
        [LinkName("igWindowPosAbsToRel")]
        private static extern Vec2 WindowPosAbsToRelImpl(Vec2* pOut, Window* window, Vec2 p);
        public static Vec2 WindowPosAbsToRel(Window* window, Vec2 p)
        {
            Vec2 pOut = default;
            WindowPosAbsToRelImpl(&pOut, window, p);
            return pOut;
        }
        
        [LinkName("igWindowPosRelToAbs")]
        private static extern Vec2 WindowPosRelToAbsImpl(Vec2* pOut, Window* window, Vec2 p);
        public static Vec2 WindowPosRelToAbs(Window* window, Vec2 p)
        {
            Vec2 pOut = default;
            WindowPosRelToAbsImpl(&pOut, window, p);
            return pOut;
        }
        
        [LinkName("igWindowRectAbsToRel")]
        private static extern Rect WindowRectAbsToRelImpl(Rect* pOut, Window* window, Rect r);
        public static Rect WindowRectAbsToRel(Window* window, Rect r)
        {
            Rect pOut = default;
            WindowRectAbsToRelImpl(&pOut, window, r);
            return pOut;
        }
        
        [LinkName("igWindowRectRelToAbs")]
        private static extern Rect WindowRectRelToAbsImpl(Rect* pOut, Window* window, Rect r);
        public static Rect WindowRectRelToAbs(Window* window, Rect r)
        {
            Rect pOut = default;
            WindowRectRelToAbsImpl(&pOut, window, r);
            return pOut;
        }
    }
}