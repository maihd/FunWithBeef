using System;

namespace OpenGL
{
    public class GL
	{
        public function void* GetProcAddressFunc(StringView procname);

        public const uint DEPTH_BUFFER_BIT = 0x00000100;
        public const uint STENCIL_BUFFER_BIT = 0x00000400;
        public const uint COLOR_BUFFER_BIT = 0x00004000;
        public const uint FALSE = 0;
        public const uint TRUE = 1;
        public const uint POINTS = 0x0000;
        public const uint LINES = 0x0001;
        public const uint LINE_LOOP = 0x0002;
        public const uint LINE_STRIP = 0x0003;
        public const uint TRIANGLES = 0x0004;
        public const uint TRIANGLE_STRIP = 0x0005;
        public const uint TRIANGLE_FAN = 0x0006;
        public const uint NEVER = 0x0200;
        public const uint LESS = 0x0201;
        public const uint EQUAL = 0x0202;
        public const uint LEQUAL = 0x0203;
        public const uint GREATER = 0x0204;
        public const uint NOTEQUAL = 0x0205;
        public const uint GEQUAL = 0x0206;
        public const uint ALWAYS = 0x0207;
        public const uint ZERO = 0;
        public const uint ONE = 1;
        public const uint SRC_COLOR = 0x0300;
        public const uint ONE_MINUS_SRC_COLOR = 0x0301;
        public const uint SRC_ALPHA = 0x0302;
        public const uint ONE_MINUS_SRC_ALPHA = 0x0303;
        public const uint DST_ALPHA = 0x0304;
        public const uint ONE_MINUS_DST_ALPHA = 0x0305;
        public const uint DST_COLOR = 0x0306;
        public const uint ONE_MINUS_DST_COLOR = 0x0307;
        public const uint SRC_ALPHA_SATURATE = 0x0308;
        public const uint NONE = 0;
        public const uint FRONT_LEFT = 0x0400;
        public const uint FRONT_RIGHT = 0x0401;
        public const uint BACK_LEFT = 0x0402;
        public const uint BACK_RIGHT = 0x0403;
        public const uint FRONT = 0x0404;
        public const uint BACK = 0x0405;
        public const uint LEFT = 0x0406;
        public const uint RIGHT = 0x0407;
        public const uint FRONT_AND_BACK = 0x0408;
        public const uint NO_ERROR = 0;
        public const uint INVALID_ENUM = 0x0500;
        public const uint INVALID_VALUE = 0x0501;
        public const uint INVALID_OPERATION = 0x0502;
        public const uint OUT_OF_MEMORY = 0x0505;
        public const uint CW = 0x0900;
        public const uint CCW = 0x0901;
        public const uint POINT_SIZE = 0x0B11;
        public const uint POINT_SIZE_RANGE = 0x0B12;
        public const uint POINT_SIZE_GRANULARITY = 0x0B13;
        public const uint LINE_SMOOTH = 0x0B20;
        public const uint LINE_WIDTH = 0x0B21;
        public const uint LINE_WIDTH_RANGE = 0x0B22;
        public const uint LINE_WIDTH_GRANULARITY = 0x0B23;
        public const uint POLYGON_MODE = 0x0B40;
        public const uint POLYGON_SMOOTH = 0x0B41;
        public const uint CULL_FACE = 0x0B44;
        public const uint CULL_FACE_MODE = 0x0B45;
        public const uint FRONT_FACE = 0x0B46;
        public const uint DEPTH_RANGE = 0x0B70;
        public const uint DEPTH_TEST = 0x0B71;
        public const uint DEPTH_WRITEMASK = 0x0B72;
        public const uint DEPTH_CLEAR_VALUE = 0x0B73;
        public const uint DEPTH_FUNC = 0x0B74;
        public const uint STENCIL_TEST = 0x0B90;
        public const uint STENCIL_CLEAR_VALUE = 0x0B91;
        public const uint STENCIL_FUNC = 0x0B92;
        public const uint STENCIL_VALUE_MASK = 0x0B93;
        public const uint STENCIL_FAIL = 0x0B94;
        public const uint STENCIL_PASS_DEPTH_FAIL = 0x0B95;
        public const uint STENCIL_PASS_DEPTH_PASS = 0x0B96;
        public const uint STENCIL_REF = 0x0B97;
        public const uint STENCIL_WRITEMASK = 0x0B98;
        public const uint VIEWPORT = 0x0BA2;
        public const uint DITHER = 0x0BD0;
        public const uint BLEND_DST = 0x0BE0;
        public const uint BLEND_SRC = 0x0BE1;
        public const uint BLEND = 0x0BE2;
        public const uint LOGIC_OP_MODE = 0x0BF0;
        public const uint DRAW_BUFFER = 0x0C01;
        public const uint READ_BUFFER = 0x0C02;
        public const uint SCISSOR_BOX = 0x0C10;
        public const uint SCISSOR_TEST = 0x0C11;
        public const uint COLOR_CLEAR_VALUE = 0x0C22;
        public const uint COLOR_WRITEMASK = 0x0C23;
        public const uint DOUBLEBUFFER = 0x0C32;
        public const uint STEREO = 0x0C33;
        public const uint LINE_SMOOTH_HINT = 0x0C52;
        public const uint POLYGON_SMOOTH_HINT = 0x0C53;
        public const uint UNPACK_SWAP_BYTES = 0x0CF0;
        public const uint UNPACK_LSB_FIRST = 0x0CF1;
        public const uint UNPACK_ROW_LENGTH = 0x0CF2;
        public const uint UNPACK_SKIP_ROWS = 0x0CF3;
        public const uint UNPACK_SKIP_PIXELS = 0x0CF4;
        public const uint UNPACK_ALIGNMENT = 0x0CF5;
        public const uint PACK_SWAP_BYTES = 0x0D00;
        public const uint PACK_LSB_FIRST = 0x0D01;
        public const uint PACK_ROW_LENGTH = 0x0D02;
        public const uint PACK_SKIP_ROWS = 0x0D03;
        public const uint PACK_SKIP_PIXELS = 0x0D04;
        public const uint PACK_ALIGNMENT = 0x0D05;
        public const uint MAX_TEXTURE_SIZE = 0x0D33;
        public const uint MAX_VIEWPORT_DIMS = 0x0D3A;
        public const uint SUBPIXEL_BITS = 0x0D50;
        public const uint TEXTURE_1D = 0x0DE0;
        public const uint TEXTURE_2D = 0x0DE1;
        public const uint TEXTURE_WIDTH = 0x1000;
        public const uint TEXTURE_HEIGHT = 0x1001;
        public const uint TEXTURE_BORDER_COLOR = 0x1004;
        public const uint DONT_CARE = 0x1100;
        public const uint FASTEST = 0x1101;
        public const uint NICEST = 0x1102;
        public const uint BYTE = 0x1400;
        public const uint UNSIGNED_BYTE = 0x1401;
        public const uint SHORT = 0x1402;
        public const uint UNSIGNED_SHORT = 0x1403;
        public const uint INT = 0x1404;
        public const uint UNSIGNED_INT = 0x1405;
        public const uint FLOAT = 0x1406;
        public const uint CLEAR = 0x1500;
        public const uint AND = 0x1501;
        public const uint AND_REVERSE = 0x1502;
        public const uint COPY = 0x1503;
        public const uint AND_INVERTED = 0x1504;
        public const uint NOOP = 0x1505;
        public const uint XOR = 0x1506;
        public const uint OR = 0x1507;
        public const uint NOR = 0x1508;
        public const uint EQUIV = 0x1509;
        public const uint INVERT = 0x150A;
        public const uint OR_REVERSE = 0x150B;
        public const uint COPY_INVERTED = 0x150C;
        public const uint OR_INVERTED = 0x150D;
        public const uint NAND = 0x150E;
        public const uint SET = 0x150F;
        public const uint TEXTURE = 0x1702;
        public const uint COLOR = 0x1800;
        public const uint DEPTH = 0x1801;
        public const uint STENCIL = 0x1802;
        public const uint STENCIL_INDEX = 0x1901;
        public const uint DEPTH_COMPONENT = 0x1902;
        public const uint RED = 0x1903;
        public const uint GREEN = 0x1904;
        public const uint BLUE = 0x1905;
        public const uint ALPHA = 0x1906;
        public const uint RGB = 0x1907;
        public const uint RGBA = 0x1908;
        public const uint POINT = 0x1B00;
        public const uint LINE = 0x1B01;
        public const uint FILL = 0x1B02;
        public const uint KEEP = 0x1E00;
        public const uint REPLACE = 0x1E01;
        public const uint INCR = 0x1E02;
        public const uint DECR = 0x1E03;
        public const uint VENDOR = 0x1F00;
        public const uint RENDERER = 0x1F01;
        public const uint VERSION = 0x1F02;
        public const uint EXTENSIONS = 0x1F03;
        public const uint NEAREST = 0x2600;
        public const uint LINEAR = 0x2601;
        public const uint NEAREST_MIPMAP_NEAREST = 0x2700;
        public const uint LINEAR_MIPMAP_NEAREST = 0x2701;
        public const uint NEAREST_MIPMAP_LINEAR = 0x2702;
        public const uint LINEAR_MIPMAP_LINEAR = 0x2703;
        public const uint TEXTURE_MAG_FILTER = 0x2800;
        public const uint TEXTURE_MIN_FILTER = 0x2801;
        public const uint TEXTURE_WRAP_S = 0x2802;
        public const uint TEXTURE_WRAP_T = 0x2803;
        public const uint REPEAT = 0x2901;
        public const uint COLOR_LOGIC_OP = 0x0BF2;
        public const uint POLYGON_OFFSET_UNITS = 0x2A00;
        public const uint POLYGON_OFFSET_POINT = 0x2A01;
        public const uint POLYGON_OFFSET_LINE = 0x2A02;
        public const uint POLYGON_OFFSET_FILL = 0x8037;
        public const uint POLYGON_OFFSET_FACTOR = 0x8038;
        public const uint TEXTURE_BINDING_1D = 0x8068;
        public const uint TEXTURE_BINDING_2D = 0x8069;
        public const uint TEXTURE_INTERNAL_FORMAT = 0x1003;
        public const uint TEXTURE_RED_SIZE = 0x805C;
        public const uint TEXTURE_GREEN_SIZE = 0x805D;
        public const uint TEXTURE_BLUE_SIZE = 0x805E;
        public const uint TEXTURE_ALPHA_SIZE = 0x805F;
        public const uint DOUBLE = 0x140A;
        public const uint PROXY_TEXTURE_1D = 0x8063;
        public const uint PROXY_TEXTURE_2D = 0x8064;
        public const uint R3_G3_B2 = 0x2A10;
        public const uint RGB4 = 0x804F;
        public const uint RGB5 = 0x8050;
        public const uint RGB8 = 0x8051;
        public const uint RGB10 = 0x8052;
        public const uint RGB12 = 0x8053;
        public const uint RGB16 = 0x8054;
        public const uint RGBA2 = 0x8055;
        public const uint RGBA4 = 0x8056;
        public const uint RGB5_A1 = 0x8057;
        public const uint RGBA8 = 0x8058;
        public const uint RGB10_A2 = 0x8059;
        public const uint RGBA12 = 0x805A;
        public const uint RGBA16 = 0x805B;
        public const uint UNSIGNED_BYTE_3_3_2 = 0x8032;
        public const uint UNSIGNED_SHORT_4_4_4_4 = 0x8033;
        public const uint UNSIGNED_SHORT_5_5_5_1 = 0x8034;
        public const uint UNSIGNED_INT_8_8_8_8 = 0x8035;
        public const uint UNSIGNED_INT_10_10_10_2 = 0x8036;
        public const uint TEXTURE_BINDING_3D = 0x806A;
        public const uint PACK_SKIP_IMAGES = 0x806B;
        public const uint PACK_IMAGE_HEIGHT = 0x806C;
        public const uint UNPACK_SKIP_IMAGES = 0x806D;
        public const uint UNPACK_IMAGE_HEIGHT = 0x806E;
        public const uint TEXTURE_3D = 0x806F;
        public const uint PROXY_TEXTURE_3D = 0x8070;
        public const uint TEXTURE_DEPTH = 0x8071;
        public const uint TEXTURE_WRAP_R = 0x8072;
        public const uint MAX_3D_TEXTURE_SIZE = 0x8073;
        public const uint UNSIGNED_BYTE_2_3_3_REV = 0x8362;
        public const uint UNSIGNED_SHORT_5_6_5 = 0x8363;
        public const uint UNSIGNED_SHORT_5_6_5_REV = 0x8364;
        public const uint UNSIGNED_SHORT_4_4_4_4_REV = 0x8365;
        public const uint UNSIGNED_SHORT_1_5_5_5_REV = 0x8366;
        public const uint UNSIGNED_INT_8_8_8_8_REV = 0x8367;
        public const uint UNSIGNED_INT_2_10_10_10_REV = 0x8368;
        public const uint BGR = 0x80E0;
        public const uint BGRA = 0x80E1;
        public const uint MAX_ELEMENTS_VERTICES = 0x80E8;
        public const uint MAX_ELEMENTS_INDICES = 0x80E9;
        public const uint CLAMP_TO_EDGE = 0x812F;
        public const uint TEXTURE_MIN_LOD = 0x813A;
        public const uint TEXTURE_MAX_LOD = 0x813B;
        public const uint TEXTURE_BASE_LEVEL = 0x813C;
        public const uint TEXTURE_MAX_LEVEL = 0x813D;
        public const uint SMOOTH_POINT_SIZE_RANGE = 0x0B12;
        public const uint SMOOTH_POINT_SIZE_GRANULARITY = 0x0B13;
        public const uint SMOOTH_LINE_WIDTH_RANGE = 0x0B22;
        public const uint SMOOTH_LINE_WIDTH_GRANULARITY = 0x0B23;
        public const uint ALIASED_LINE_WIDTH_RANGE = 0x846E;
        public const uint TEXTURE0 = 0x84C0;
        public const uint TEXTURE1 = 0x84C1;
        public const uint TEXTURE2 = 0x84C2;
        public const uint TEXTURE3 = 0x84C3;
        public const uint TEXTURE4 = 0x84C4;
        public const uint TEXTURE5 = 0x84C5;
        public const uint TEXTURE6 = 0x84C6;
        public const uint TEXTURE7 = 0x84C7;
        public const uint TEXTURE8 = 0x84C8;
        public const uint TEXTURE9 = 0x84C9;
        public const uint TEXTURE10 = 0x84CA;
        public const uint TEXTURE11 = 0x84CB;
        public const uint TEXTURE12 = 0x84CC;
        public const uint TEXTURE13 = 0x84CD;
        public const uint TEXTURE14 = 0x84CE;
        public const uint TEXTURE15 = 0x84CF;
        public const uint TEXTURE16 = 0x84D0;
        public const uint TEXTURE17 = 0x84D1;
        public const uint TEXTURE18 = 0x84D2;
        public const uint TEXTURE19 = 0x84D3;
        public const uint TEXTURE20 = 0x84D4;
        public const uint TEXTURE21 = 0x84D5;
        public const uint TEXTURE22 = 0x84D6;
        public const uint TEXTURE23 = 0x84D7;
        public const uint TEXTURE24 = 0x84D8;
        public const uint TEXTURE25 = 0x84D9;
        public const uint TEXTURE26 = 0x84DA;
        public const uint TEXTURE27 = 0x84DB;
        public const uint TEXTURE28 = 0x84DC;
        public const uint TEXTURE29 = 0x84DD;
        public const uint TEXTURE30 = 0x84DE;
        public const uint TEXTURE31 = 0x84DF;
        public const uint ACTIVE_TEXTURE = 0x84E0;
        public const uint MULTISAMPLE = 0x809D;
        public const uint SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
        public const uint SAMPLE_ALPHA_TO_ONE = 0x809F;
        public const uint SAMPLE_COVERAGE = 0x80A0;
        public const uint SAMPLE_BUFFERS = 0x80A8;
        public const uint SAMPLES = 0x80A9;
        public const uint SAMPLE_COVERAGE_VALUE = 0x80AA;
        public const uint SAMPLE_COVERAGE_INVERT = 0x80AB;
        public const uint TEXTURE_CUBE_MAP = 0x8513;
        public const uint TEXTURE_BINDING_CUBE_MAP = 0x8514;
        public const uint TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
        public const uint TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
        public const uint TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
        public const uint TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
        public const uint TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
        public const uint TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
        public const uint PROXY_TEXTURE_CUBE_MAP = 0x851B;
        public const uint MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
        public const uint COMPRESSED_RGB = 0x84ED;
        public const uint COMPRESSED_RGBA = 0x84EE;
        public const uint TEXTURE_COMPRESSION_HINT = 0x84EF;
        public const uint TEXTURE_COMPRESSED_IMAGE_SIZE = 0x86A0;
        public const uint TEXTURE_COMPRESSED = 0x86A1;
        public const uint NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
        public const uint COMPRESSED_TEXTURE_FORMATS = 0x86A3;
        public const uint CLAMP_TO_BORDER = 0x812D;
        public const uint BLEND_DST_RGB = 0x80C8;
        public const uint BLEND_SRC_RGB = 0x80C9;
        public const uint BLEND_DST_ALPHA = 0x80CA;
        public const uint BLEND_SRC_ALPHA = 0x80CB;
        public const uint POINT_FADE_THRESHOLD_SIZE = 0x8128;
        public const uint DEPTH_COMPONENT16 = 0x81A5;
        public const uint DEPTH_COMPONENT24 = 0x81A6;
        public const uint DEPTH_COMPONENT32 = 0x81A7;
        public const uint MIRRORED_REPEAT = 0x8370;
        public const uint MAX_TEXTURE_LOD_BIAS = 0x84FD;
        public const uint TEXTURE_LOD_BIAS = 0x8501;
        public const uint INCR_WRAP = 0x8507;
        public const uint DECR_WRAP = 0x8508;
        public const uint TEXTURE_DEPTH_SIZE = 0x884A;
        public const uint TEXTURE_COMPARE_MODE = 0x884C;
        public const uint TEXTURE_COMPARE_FUNC = 0x884D;
        public const uint BLEND_COLOR = 0x8005;
        public const uint BLEND_EQUATION = 0x8009;
        public const uint CONSTANT_COLOR = 0x8001;
        public const uint ONE_MINUS_CONSTANT_COLOR = 0x8002;
        public const uint CONSTANT_ALPHA = 0x8003;
        public const uint ONE_MINUS_CONSTANT_ALPHA = 0x8004;
        public const uint FUNC_ADD = 0x8006;
        public const uint FUNC_REVERSE_SUBTRACT = 0x800B;
        public const uint FUNC_SUBTRACT = 0x800A;
        public const uint MIN = 0x8007;
        public const uint MAX = 0x8008;
        public const uint BUFFER_SIZE = 0x8764;
        public const uint BUFFER_USAGE = 0x8765;
        public const uint QUERY_COUNTER_BITS = 0x8864;
        public const uint CURRENT_QUERY = 0x8865;
        public const uint QUERY_RESULT = 0x8866;
        public const uint QUERY_RESULT_AVAILABLE = 0x8867;
        public const uint ARRAY_BUFFER = 0x8892;
        public const uint ELEMENT_ARRAY_BUFFER = 0x8893;
        public const uint ARRAY_BUFFER_BINDING = 0x8894;
        public const uint ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
        public const uint VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
        public const uint READ_ONLY = 0x88B8;
        public const uint WRITE_ONLY = 0x88B9;
        public const uint READ_WRITE = 0x88BA;
        public const uint BUFFER_ACCESS = 0x88BB;
        public const uint BUFFER_MAPPED = 0x88BC;
        public const uint BUFFER_MAP_POINTER = 0x88BD;
        public const uint STREAM_DRAW = 0x88E0;
        public const uint STREAM_READ = 0x88E1;
        public const uint STREAM_COPY = 0x88E2;
        public const uint STATIC_DRAW = 0x88E4;
        public const uint STATIC_READ = 0x88E5;
        public const uint STATIC_COPY = 0x88E6;
        public const uint DYNAMIC_DRAW = 0x88E8;
        public const uint DYNAMIC_READ = 0x88E9;
        public const uint DYNAMIC_COPY = 0x88EA;
        public const uint SAMPLES_PASSED = 0x8914;
        public const uint SRC1_ALPHA = 0x8589;
        public const uint BLEND_EQUATION_RGB = 0x8009;
        public const uint VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
        public const uint VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
        public const uint VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
        public const uint VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
        public const uint CURRENT_VERTEX_ATTRIB = 0x8626;
        public const uint VERTEX_PROGRAM_POINT_SIZE = 0x8642;
        public const uint VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
        public const uint STENCIL_BACK_FUNC = 0x8800;
        public const uint STENCIL_BACK_FAIL = 0x8801;
        public const uint STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
        public const uint STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
        public const uint MAX_DRAW_BUFFERS = 0x8824;
        public const uint DRAW_BUFFER0 = 0x8825;
        public const uint DRAW_BUFFER1 = 0x8826;
        public const uint DRAW_BUFFER2 = 0x8827;
        public const uint DRAW_BUFFER3 = 0x8828;
        public const uint DRAW_BUFFER4 = 0x8829;
        public const uint DRAW_BUFFER5 = 0x882A;
        public const uint DRAW_BUFFER6 = 0x882B;
        public const uint DRAW_BUFFER7 = 0x882C;
        public const uint DRAW_BUFFER8 = 0x882D;
        public const uint DRAW_BUFFER9 = 0x882E;
        public const uint DRAW_BUFFER10 = 0x882F;
        public const uint DRAW_BUFFER11 = 0x8830;
        public const uint DRAW_BUFFER12 = 0x8831;
        public const uint DRAW_BUFFER13 = 0x8832;
        public const uint DRAW_BUFFER14 = 0x8833;
        public const uint DRAW_BUFFER15 = 0x8834;
        public const uint BLEND_EQUATION_ALPHA = 0x883D;
        public const uint MAX_VERTEX_ATTRIBS = 0x8869;
        public const uint VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
        public const uint MAX_TEXTURE_IMAGE_UNITS = 0x8872;
        public const uint FRAGMENT_SHADER = 0x8B30;
        public const uint VERTEX_SHADER = 0x8B31;
        public const uint MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
        public const uint MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A;
        public const uint MAX_VARYING_FLOATS = 0x8B4B;
        public const uint MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
        public const uint MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
        public const uint SHADER_TYPE = 0x8B4F;
        public const uint FLOAT_VEC2 = 0x8B50;
        public const uint FLOAT_VEC3 = 0x8B51;
        public const uint FLOAT_VEC4 = 0x8B52;
        public const uint INT_VEC2 = 0x8B53;
        public const uint INT_VEC3 = 0x8B54;
        public const uint INT_VEC4 = 0x8B55;
        public const uint BOOL = 0x8B56;
        public const uint BOOL_VEC2 = 0x8B57;
        public const uint BOOL_VEC3 = 0x8B58;
        public const uint BOOL_VEC4 = 0x8B59;
        public const uint FLOAT_MAT2 = 0x8B5A;
        public const uint FLOAT_MAT3 = 0x8B5B;
        public const uint FLOAT_MAT4 = 0x8B5C;
        public const uint SAMPLER_1D = 0x8B5D;
        public const uint SAMPLER_2D = 0x8B5E;
        public const uint SAMPLER_3D = 0x8B5F;
        public const uint SAMPLER_CUBE = 0x8B60;
        public const uint SAMPLER_1D_SHADOW = 0x8B61;
        public const uint SAMPLER_2D_SHADOW = 0x8B62;
        public const uint DELETE_STATUS = 0x8B80;
        public const uint COMPILE_STATUS = 0x8B81;
        public const uint LINK_STATUS = 0x8B82;
        public const uint VALIDATE_STATUS = 0x8B83;
        public const uint INFO_LOG_LENGTH = 0x8B84;
        public const uint ATTACHED_SHADERS = 0x8B85;
        public const uint ACTIVE_UNIFORMS = 0x8B86;
        public const uint ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87;
        public const uint SHADER_SOURCE_LENGTH = 0x8B88;
        public const uint ACTIVE_ATTRIBUTES = 0x8B89;
        public const uint ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A;
        public const uint FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
        public const uint SHADING_LANGUAGE_VERSION = 0x8B8C;
        public const uint CURRENT_PROGRAM = 0x8B8D;
        public const uint POINT_SPRITE_COORD_ORIGIN = 0x8CA0;
        public const uint LOWER_LEFT = 0x8CA1;
        public const uint UPPER_LEFT = 0x8CA2;
        public const uint STENCIL_BACK_REF = 0x8CA3;
        public const uint STENCIL_BACK_VALUE_MASK = 0x8CA4;
        public const uint STENCIL_BACK_WRITEMASK = 0x8CA5;
        public const uint PIXEL_PACK_BUFFER = 0x88EB;
        public const uint PIXEL_UNPACK_BUFFER = 0x88EC;
        public const uint PIXEL_PACK_BUFFER_BINDING = 0x88ED;
        public const uint PIXEL_UNPACK_BUFFER_BINDING = 0x88EF;
        public const uint FLOAT_MAT2x3 = 0x8B65;
        public const uint FLOAT_MAT2x4 = 0x8B66;
        public const uint FLOAT_MAT3x2 = 0x8B67;
        public const uint FLOAT_MAT3x4 = 0x8B68;
        public const uint FLOAT_MAT4x2 = 0x8B69;
        public const uint FLOAT_MAT4x3 = 0x8B6A;
        public const uint SRGB = 0x8C40;
        public const uint SRGB8 = 0x8C41;
        public const uint SRGB_ALPHA = 0x8C42;
        public const uint SRGB8_ALPHA8 = 0x8C43;
        public const uint COMPRESSED_SRGB = 0x8C48;
        public const uint COMPRESSED_SRGB_ALPHA = 0x8C49;
        public const uint COMPARE_REF_TO_TEXTURE = 0x884E;
        public const uint CLIP_DISTANCE0 = 0x3000;
        public const uint CLIP_DISTANCE1 = 0x3001;
        public const uint CLIP_DISTANCE2 = 0x3002;
        public const uint CLIP_DISTANCE3 = 0x3003;
        public const uint CLIP_DISTANCE4 = 0x3004;
        public const uint CLIP_DISTANCE5 = 0x3005;
        public const uint CLIP_DISTANCE6 = 0x3006;
        public const uint CLIP_DISTANCE7 = 0x3007;
        public const uint MAX_CLIP_DISTANCES = 0x0D32;
        public const uint MAJOR_VERSION = 0x821B;
        public const uint MINOR_VERSION = 0x821C;
        public const uint NUM_EXTENSIONS = 0x821D;
        public const uint CONTEXT_FLAGS = 0x821E;
        public const uint COMPRESSED_RED = 0x8225;
        public const uint COMPRESSED_RG = 0x8226;
        public const uint CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 0x00000001;
        public const uint RGBA32F = 0x8814;
        public const uint RGB32F = 0x8815;
        public const uint RGBA16F = 0x881A;
        public const uint RGB16F = 0x881B;
        public const uint VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD;
        public const uint MAX_ARRAY_TEXTURE_LAYERS = 0x88FF;
        public const uint MIN_PROGRAM_TEXEL_OFFSET = 0x8904;
        public const uint MAX_PROGRAM_TEXEL_OFFSET = 0x8905;
        public const uint CLAMP_READ_COLOR = 0x891C;
        public const uint FIXED_ONLY = 0x891D;
        public const uint MAX_VARYING_COMPONENTS = 0x8B4B;
        public const uint TEXTURE_1D_ARRAY = 0x8C18;
        public const uint PROXY_TEXTURE_1D_ARRAY = 0x8C19;
        public const uint TEXTURE_2D_ARRAY = 0x8C1A;
        public const uint PROXY_TEXTURE_2D_ARRAY = 0x8C1B;
        public const uint TEXTURE_BINDING_1D_ARRAY = 0x8C1C;
        public const uint TEXTURE_BINDING_2D_ARRAY = 0x8C1D;
        public const uint R11F_G11F_B10F = 0x8C3A;
        public const uint UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B;
        public const uint RGB9_E5 = 0x8C3D;
        public const uint UNSIGNED_INT_5_9_9_9_REV = 0x8C3E;
        public const uint TEXTURE_SHARED_SIZE = 0x8C3F;
        public const uint TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76;
        public const uint TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
        public const uint MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
        public const uint TRANSFORM_FEEDBACK_VARYINGS = 0x8C83;
        public const uint TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
        public const uint TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
        public const uint PRIMITIVES_GENERATED = 0x8C87;
        public const uint TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
        public const uint RASTERIZER_DISCARD = 0x8C89;
        public const uint MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
        public const uint MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
        public const uint INTERLEAVED_ATTRIBS = 0x8C8C;
        public const uint SEPARATE_ATTRIBS = 0x8C8D;
        public const uint TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
        public const uint TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
        public const uint RGBA32UI = 0x8D70;
        public const uint RGB32UI = 0x8D71;
        public const uint RGBA16UI = 0x8D76;
        public const uint RGB16UI = 0x8D77;
        public const uint RGBA8UI = 0x8D7C;
        public const uint RGB8UI = 0x8D7D;
        public const uint RGBA32I = 0x8D82;
        public const uint RGB32I = 0x8D83;
        public const uint RGBA16I = 0x8D88;
        public const uint RGB16I = 0x8D89;
        public const uint RGBA8I = 0x8D8E;
        public const uint RGB8I = 0x8D8F;
        public const uint RED_INTEGER = 0x8D94;
        public const uint GREEN_INTEGER = 0x8D95;
        public const uint BLUE_INTEGER = 0x8D96;
        public const uint RGB_INTEGER = 0x8D98;
        public const uint RGBA_INTEGER = 0x8D99;
        public const uint BGR_INTEGER = 0x8D9A;
        public const uint BGRA_INTEGER = 0x8D9B;
        public const uint SAMPLER_1D_ARRAY = 0x8DC0;
        public const uint SAMPLER_2D_ARRAY = 0x8DC1;
        public const uint SAMPLER_1D_ARRAY_SHADOW = 0x8DC3;
        public const uint SAMPLER_2D_ARRAY_SHADOW = 0x8DC4;
        public const uint SAMPLER_CUBE_SHADOW = 0x8DC5;
        public const uint UNSIGNED_INT_VEC2 = 0x8DC6;
        public const uint UNSIGNED_INT_VEC3 = 0x8DC7;
        public const uint UNSIGNED_INT_VEC4 = 0x8DC8;
        public const uint INT_SAMPLER_1D = 0x8DC9;
        public const uint INT_SAMPLER_2D = 0x8DCA;
        public const uint INT_SAMPLER_3D = 0x8DCB;
        public const uint INT_SAMPLER_CUBE = 0x8DCC;
        public const uint INT_SAMPLER_1D_ARRAY = 0x8DCE;
        public const uint INT_SAMPLER_2D_ARRAY = 0x8DCF;
        public const uint UNSIGNED_INT_SAMPLER_1D = 0x8DD1;
        public const uint UNSIGNED_INT_SAMPLER_2D = 0x8DD2;
        public const uint UNSIGNED_INT_SAMPLER_3D = 0x8DD3;
        public const uint UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4;
        public const uint UNSIGNED_INT_SAMPLER_1D_ARRAY = 0x8DD6;
        public const uint UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7;
        public const uint QUERY_WAIT = 0x8E13;
        public const uint QUERY_NO_WAIT = 0x8E14;
        public const uint QUERY_BY_REGION_WAIT = 0x8E15;
        public const uint QUERY_BY_REGION_NO_WAIT = 0x8E16;
        public const uint BUFFER_ACCESS_FLAGS = 0x911F;
        public const uint BUFFER_MAP_LENGTH = 0x9120;
        public const uint BUFFER_MAP_OFFSET = 0x9121;
        public const uint DEPTH_COMPONENT32F = 0x8CAC;
        public const uint DEPTH32F_STENCIL8 = 0x8CAD;
        public const uint FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD;
        public const uint INVALID_FRAMEBUFFER_OPERATION = 0x0506;
        public const uint FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
        public const uint FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
        public const uint FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
        public const uint FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
        public const uint FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
        public const uint FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
        public const uint FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
        public const uint FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
        public const uint FRAMEBUFFER_DEFAULT = 0x8218;
        public const uint FRAMEBUFFER_UNDEFINED = 0x8219;
        public const uint DEPTH_STENCIL_ATTACHMENT = 0x821A;
        public const uint MAX_RENDERBUFFER_SIZE = 0x84E8;
        public const uint DEPTH_STENCIL = 0x84F9;
        public const uint UNSIGNED_INT_24_8 = 0x84FA;
        public const uint DEPTH24_STENCIL8 = 0x88F0;
        public const uint TEXTURE_STENCIL_SIZE = 0x88F1;
        public const uint TEXTURE_RED_TYPE = 0x8C10;
        public const uint TEXTURE_GREEN_TYPE = 0x8C11;
        public const uint TEXTURE_BLUE_TYPE = 0x8C12;
        public const uint TEXTURE_ALPHA_TYPE = 0x8C13;
        public const uint TEXTURE_DEPTH_TYPE = 0x8C16;
        public const uint UNSIGNED_NORMALIZED = 0x8C17;
        public const uint FRAMEBUFFER_BINDING = 0x8CA6;
        public const uint DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
        public const uint RENDERBUFFER_BINDING = 0x8CA7;
        public const uint READ_FRAMEBUFFER = 0x8CA8;
        public const uint DRAW_FRAMEBUFFER = 0x8CA9;
        public const uint READ_FRAMEBUFFER_BINDING = 0x8CAA;
        public const uint RENDERBUFFER_SAMPLES = 0x8CAB;
        public const uint FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
        public const uint FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
        public const uint FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
        public const uint FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
        public const uint FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
        public const uint FRAMEBUFFER_COMPLETE = 0x8CD5;
        public const uint FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
        public const uint FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
        public const uint FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB;
        public const uint FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC;
        public const uint FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
        public const uint MAX_COLOR_ATTACHMENTS = 0x8CDF;
        public const uint COLOR_ATTACHMENT0 = 0x8CE0;
        public const uint COLOR_ATTACHMENT1 = 0x8CE1;
        public const uint COLOR_ATTACHMENT2 = 0x8CE2;
        public const uint COLOR_ATTACHMENT3 = 0x8CE3;
        public const uint COLOR_ATTACHMENT4 = 0x8CE4;
        public const uint COLOR_ATTACHMENT5 = 0x8CE5;
        public const uint COLOR_ATTACHMENT6 = 0x8CE6;
        public const uint COLOR_ATTACHMENT7 = 0x8CE7;
        public const uint COLOR_ATTACHMENT8 = 0x8CE8;
        public const uint COLOR_ATTACHMENT9 = 0x8CE9;
        public const uint COLOR_ATTACHMENT10 = 0x8CEA;
        public const uint COLOR_ATTACHMENT11 = 0x8CEB;
        public const uint COLOR_ATTACHMENT12 = 0x8CEC;
        public const uint COLOR_ATTACHMENT13 = 0x8CED;
        public const uint COLOR_ATTACHMENT14 = 0x8CEE;
        public const uint COLOR_ATTACHMENT15 = 0x8CEF;
        public const uint COLOR_ATTACHMENT16 = 0x8CF0;
        public const uint COLOR_ATTACHMENT17 = 0x8CF1;
        public const uint COLOR_ATTACHMENT18 = 0x8CF2;
        public const uint COLOR_ATTACHMENT19 = 0x8CF3;
        public const uint COLOR_ATTACHMENT20 = 0x8CF4;
        public const uint COLOR_ATTACHMENT21 = 0x8CF5;
        public const uint COLOR_ATTACHMENT22 = 0x8CF6;
        public const uint COLOR_ATTACHMENT23 = 0x8CF7;
        public const uint COLOR_ATTACHMENT24 = 0x8CF8;
        public const uint COLOR_ATTACHMENT25 = 0x8CF9;
        public const uint COLOR_ATTACHMENT26 = 0x8CFA;
        public const uint COLOR_ATTACHMENT27 = 0x8CFB;
        public const uint COLOR_ATTACHMENT28 = 0x8CFC;
        public const uint COLOR_ATTACHMENT29 = 0x8CFD;
        public const uint COLOR_ATTACHMENT30 = 0x8CFE;
        public const uint COLOR_ATTACHMENT31 = 0x8CFF;
        public const uint DEPTH_ATTACHMENT = 0x8D00;
        public const uint STENCIL_ATTACHMENT = 0x8D20;
        public const uint FRAMEBUFFER = 0x8D40;
        public const uint RENDERBUFFER = 0x8D41;
        public const uint RENDERBUFFER_WIDTH = 0x8D42;
        public const uint RENDERBUFFER_HEIGHT = 0x8D43;
        public const uint RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
        public const uint STENCIL_INDEX1 = 0x8D46;
        public const uint STENCIL_INDEX4 = 0x8D47;
        public const uint STENCIL_INDEX8 = 0x8D48;
        public const uint STENCIL_INDEX16 = 0x8D49;
        public const uint RENDERBUFFER_RED_SIZE = 0x8D50;
        public const uint RENDERBUFFER_GREEN_SIZE = 0x8D51;
        public const uint RENDERBUFFER_BLUE_SIZE = 0x8D52;
        public const uint RENDERBUFFER_ALPHA_SIZE = 0x8D53;
        public const uint RENDERBUFFER_DEPTH_SIZE = 0x8D54;
        public const uint RENDERBUFFER_STENCIL_SIZE = 0x8D55;
        public const uint FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
        public const uint MAX_SAMPLES = 0x8D57;
        public const uint FRAMEBUFFER_SRGB = 0x8DB9;
        public const uint HALF_FLOAT = 0x140B;
        public const uint MAP_READ_BIT = 0x0001;
        public const uint MAP_WRITE_BIT = 0x0002;
        public const uint MAP_INVALIDATE_RANGE_BIT = 0x0004;
        public const uint MAP_INVALIDATE_BUFFER_BIT = 0x0008;
        public const uint MAP_FLUSH_EXPLICIT_BIT = 0x0010;
        public const uint MAP_UNSYNCHRONIZED_BIT = 0x0020;
        public const uint COMPRESSED_RED_RGTC1 = 0x8DBB;
        public const uint COMPRESSED_SIGNED_RED_RGTC1 = 0x8DBC;
        public const uint COMPRESSED_RG_RGTC2 = 0x8DBD;
        public const uint COMPRESSED_SIGNED_RG_RGTC2 = 0x8DBE;
        public const uint RG = 0x8227;
        public const uint RG_INTEGER = 0x8228;
        public const uint R8 = 0x8229;
        public const uint R16 = 0x822A;
        public const uint RG8 = 0x822B;
        public const uint RG16 = 0x822C;
        public const uint R16F = 0x822D;
        public const uint R32F = 0x822E;
        public const uint RG16F = 0x822F;
        public const uint RG32F = 0x8230;
        public const uint R8I = 0x8231;
        public const uint R8UI = 0x8232;
        public const uint R16I = 0x8233;
        public const uint R16UI = 0x8234;
        public const uint R32I = 0x8235;
        public const uint R32UI = 0x8236;
        public const uint RG8I = 0x8237;
        public const uint RG8UI = 0x8238;
        public const uint RG16I = 0x8239;
        public const uint RG16UI = 0x823A;
        public const uint RG32I = 0x823B;
        public const uint RG32UI = 0x823C;
        public const uint VERTEX_ARRAY_BINDING = 0x85B5;
        public const uint SAMPLER_2D_RECT = 0x8B63;
        public const uint SAMPLER_2D_RECT_SHADOW = 0x8B64;
        public const uint SAMPLER_BUFFER = 0x8DC2;
        public const uint INT_SAMPLER_2D_RECT = 0x8DCD;
        public const uint INT_SAMPLER_BUFFER = 0x8DD0;
        public const uint UNSIGNED_INT_SAMPLER_2D_RECT = 0x8DD5;
        public const uint UNSIGNED_INT_SAMPLER_BUFFER = 0x8DD8;
        public const uint TEXTURE_BUFFER = 0x8C2A;
        public const uint MAX_TEXTURE_BUFFER_SIZE = 0x8C2B;
        public const uint TEXTURE_BINDING_BUFFER = 0x8C2C;
        public const uint TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D;
        public const uint TEXTURE_RECTANGLE = 0x84F5;
        public const uint TEXTURE_BINDING_RECTANGLE = 0x84F6;
        public const uint PROXY_TEXTURE_RECTANGLE = 0x84F7;
        public const uint MAX_RECTANGLE_TEXTURE_SIZE = 0x84F8;
        public const uint R8_SNORM = 0x8F94;
        public const uint RG8_SNORM = 0x8F95;
        public const uint RGB8_SNORM = 0x8F96;
        public const uint RGBA8_SNORM = 0x8F97;
        public const uint R16_SNORM = 0x8F98;
        public const uint RG16_SNORM = 0x8F99;
        public const uint RGB16_SNORM = 0x8F9A;
        public const uint RGBA16_SNORM = 0x8F9B;
        public const uint SIGNED_NORMALIZED = 0x8F9C;
        public const uint PRIMITIVE_RESTART = 0x8F9D;
        public const uint PRIMITIVE_RESTART_INDEX = 0x8F9E;
        public const uint COPY_READ_BUFFER = 0x8F36;
        public const uint COPY_WRITE_BUFFER = 0x8F37;
        public const uint UNIFORM_BUFFER = 0x8A11;
        public const uint UNIFORM_BUFFER_BINDING = 0x8A28;
        public const uint UNIFORM_BUFFER_START = 0x8A29;
        public const uint UNIFORM_BUFFER_SIZE = 0x8A2A;
        public const uint MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
        public const uint MAX_GEOMETRY_UNIFORM_BLOCKS = 0x8A2C;
        public const uint MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
        public const uint MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
        public const uint MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
        public const uint MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
        public const uint MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
        public const uint MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32;
        public const uint MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
        public const uint UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
        public const uint ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35;
        public const uint ACTIVE_UNIFORM_BLOCKS = 0x8A36;
        public const uint UNIFORM_TYPE = 0x8A37;
        public const uint UNIFORM_SIZE = 0x8A38;
        public const uint UNIFORM_NAME_LENGTH = 0x8A39;
        public const uint UNIFORM_BLOCK_INDEX = 0x8A3A;
        public const uint UNIFORM_OFFSET = 0x8A3B;
        public const uint UNIFORM_ARRAY_STRIDE = 0x8A3C;
        public const uint UNIFORM_MATRIX_STRIDE = 0x8A3D;
        public const uint UNIFORM_IS_ROW_MAJOR = 0x8A3E;
        public const uint UNIFORM_BLOCK_BINDING = 0x8A3F;
        public const uint UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
        public const uint UNIFORM_BLOCK_NAME_LENGTH = 0x8A41;
        public const uint UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
        public const uint UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
        public const uint UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
        public const uint UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 0x8A45;
        public const uint UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
        public const uint INVALID_INDEX = 0xFFFFFFFF;
        public const uint CONTEXT_CORE_PROFILE_BIT = 0x00000001;
        public const uint CONTEXT_COMPATIBILITY_PROFILE_BIT = 0x00000002;
        public const uint LINES_ADJACENCY = 0x000A;
        public const uint LINE_STRIP_ADJACENCY = 0x000B;
        public const uint TRIANGLES_ADJACENCY = 0x000C;
        public const uint TRIANGLE_STRIP_ADJACENCY = 0x000D;
        public const uint PROGRAM_POINT_SIZE = 0x8642;
        public const uint MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29;
        public const uint FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7;
        public const uint FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8;
        public const uint GEOMETRY_SHADER = 0x8DD9;
        public const uint GEOMETRY_VERTICES_OUT = 0x8916;
        public const uint GEOMETRY_INPUT_TYPE = 0x8917;
        public const uint GEOMETRY_OUTPUT_TYPE = 0x8918;
        public const uint MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF;
        public const uint MAX_GEOMETRY_OUTPUT_VERTICES = 0x8DE0;
        public const uint MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1;
        public const uint MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122;
        public const uint MAX_GEOMETRY_INPUT_COMPONENTS = 0x9123;
        public const uint MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124;
        public const uint MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125;
        public const uint CONTEXT_PROFILE_MASK = 0x9126;
        public const uint DEPTH_CLAMP = 0x864F;
        public const uint QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C;
        public const uint FIRST_VERTEX_CONVENTION = 0x8E4D;
        public const uint LAST_VERTEX_CONVENTION = 0x8E4E;
        public const uint PROVOKING_VERTEX = 0x8E4F;
        public const uint TEXTURE_CUBE_MAP_SEAMLESS = 0x884F;
        public const uint MAX_SERVER_WAIT_TIMEOUT = 0x9111;
        public const uint OBJECT_TYPE = 0x9112;
        public const uint SYNC_CONDITION = 0x9113;
        public const uint SYNC_STATUS = 0x9114;
        public const uint SYNC_FLAGS = 0x9115;
        public const uint SYNC_FENCE = 0x9116;
        public const uint SYNC_GPU_COMMANDS_COMPLETE = 0x9117;
        public const uint UNSIGNALED = 0x9118;
        public const uint SIGNALED = 0x9119;
        public const uint ALREADY_SIGNALED = 0x911A;
        public const uint TIMEOUT_EXPIRED = 0x911B;
        public const uint CONDITION_SATISFIED = 0x911C;
        public const uint WAIT_FAILED = 0x911D;
        public const uint TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFF;
        public const uint SYNC_FLUSH_COMMANDS_BIT = 0x00000001;
        public const uint SAMPLE_POSITION = 0x8E50;
        public const uint SAMPLE_MASK = 0x8E51;
        public const uint SAMPLE_MASK_VALUE = 0x8E52;
        public const uint MAX_SAMPLE_MASK_WORDS = 0x8E59;
        public const uint TEXTURE_2D_MULTISAMPLE = 0x9100;
        public const uint PROXY_TEXTURE_2D_MULTISAMPLE = 0x9101;
        public const uint TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9102;
        public const uint PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103;
        public const uint TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104;
        public const uint TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105;
        public const uint TEXTURE_SAMPLES = 0x9106;
        public const uint TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107;
        public const uint SAMPLER_2D_MULTISAMPLE = 0x9108;
        public const uint INT_SAMPLER_2D_MULTISAMPLE = 0x9109;
        public const uint UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A;
        public const uint SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910B;
        public const uint INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C;
        public const uint UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D;
        public const uint MAX_COLOR_TEXTURE_SAMPLES = 0x910E;
        public const uint MAX_DEPTH_TEXTURE_SAMPLES = 0x910F;
        public const uint MAX_INTEGER_SAMPLES = 0x9110;
        public const uint VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE;
        public const uint SRC1_COLOR = 0x88F9;
        public const uint ONE_MINUS_SRC1_COLOR = 0x88FA;
        public const uint ONE_MINUS_SRC1_ALPHA = 0x88FB;
        public const uint MAX_DUAL_SOURCE_DRAW_BUFFERS = 0x88FC;
        public const uint ANY_SAMPLES_PASSED = 0x8C2F;
        public const uint SAMPLER_BINDING = 0x8919;
        public const uint RGB10_A2UI = 0x906F;
        public const uint TEXTURE_SWIZZLE_R = 0x8E42;
        public const uint TEXTURE_SWIZZLE_G = 0x8E43;
        public const uint TEXTURE_SWIZZLE_B = 0x8E44;
        public const uint TEXTURE_SWIZZLE_A = 0x8E45;
        public const uint TEXTURE_SWIZZLE_RGBA = 0x8E46;
        public const uint TIME_ELAPSED = 0x88BF;
        public const uint TIMESTAMP = 0x8E28;
        public const uint INT_2_10_10_10_REV = 0x8D9F;

        public function void CullFaceFn(uint mode);
        public static CullFaceFn CullFace;

        public function void FrontFaceFn(uint mode);
        public static FrontFaceFn FrontFace;

        public function void HintFn(uint target, uint mode);
        public static HintFn Hint;

        public function void LineWidthFn(float width);
        public static LineWidthFn LineWidth;

        public function void PointSizeFn(float size);
        public static PointSizeFn PointSize;

        public function void PolygonModeFn(uint face, uint mode);
        public static PolygonModeFn PolygonMode;

        public function void ScissorFn(int x, int y, int width, int height);
        public static ScissorFn Scissor;

        public function void TexParameterfFn(uint target, uint pname, float param);
        public static TexParameterfFn TexParameterf;

        public function void TexParameterfvFn(uint target, uint pname, float* paramss);
        public static TexParameterfvFn TexParameterfv;

        public function void TexParameteriFn(uint target, uint pname, int param);
        public static TexParameteriFn TexParameteri;

        public function void TexParameterivFn(uint target, uint pname, int32* paramss);
        public static TexParameterivFn TexParameteriv;

        public function void TexImage1DFn(uint target, int level, uint internalformat, int width, int border, uint format, uint type, void* pixels);
        public static TexImage1DFn TexImage1D;

        public function void TexImage2DFn(uint target, int level, uint internalformat, int width, int height, int border, uint format, uint type, void* pixels);
        public static TexImage2DFn TexImage2D;

        public function void DrawBufferFn(uint buf);
        public static DrawBufferFn DrawBuffer;

        public function void ClearFn(uint mask);
        public static ClearFn Clear;

        public function void ClearColorFn(float red, float green, float blue, float alpha);
        public static ClearColorFn ClearColor;

        public function void ClearStencilFn(int s);
        public static ClearStencilFn ClearStencil;

        public function void ClearDepthFn(double depth);
        public static ClearDepthFn ClearDepth;

        public function void StencilMaskFn(uint mask);
        public static StencilMaskFn StencilMask;

        public function void ColorMaskFn(uint8 red, uint8 green, uint8 blue, uint8 alpha);
        public static ColorMaskFn ColorMask;

        public function void DepthMaskFn(uint8 flag);
        public static DepthMaskFn DepthMask;

        public function void DisableFn(uint cap);
        public static DisableFn Disable;

        public function void EnableFn(uint cap);
        public static EnableFn Enable;

        public function void FinishFn();
        public static FinishFn Finish;

        public function void FlushFn();
        public static FlushFn Flush;

        public function void BlendFuncFn(uint sfactor, uint dfactor);
        public static BlendFuncFn BlendFunc;

        public function void LogicOpFn(uint opcode);
        public static LogicOpFn LogicOp;

        public function void StencilFuncFn(uint func, int reff, uint mask);
        public static StencilFuncFn StencilFunc;

        public function void StencilOpFn(uint fail, uint zfail, uint zpass);
        public static StencilOpFn StencilOp;

        public function void DepthFuncFn(uint func);
        public static DepthFuncFn DepthFunc;

        public function void PixelStorefFn(uint pname, float param);
        public static PixelStorefFn PixelStoref;

        public function void PixelStoreiFn(uint pname, int param);
        public static PixelStoreiFn PixelStorei;

        public function void ReadBufferFn(uint src);
        public static ReadBufferFn ReadBuffer;

        public function void ReadPixelsFn(int x, int y, int width, int height, uint format, uint type, void* pixels);
        public static ReadPixelsFn ReadPixels;

        public function void GetBooleanvFn(uint pname, uint8* data);
        public static GetBooleanvFn GetBooleanv;

        public function void GetDoublevFn(uint pname, double* data);
        public static GetDoublevFn GetDoublev;

        public function uint GetErrorFn();
        public static GetErrorFn GetError;

        public function void GetFloatvFn(uint pname, float* data);
        public static GetFloatvFn GetFloatv;

        public function void GetIntegervFn(uint pname, out int32 data);
        public static GetIntegervFn GetIntegerv;

        public function uint8 GetStringFn(uint name);
        public static GetStringFn GetString;

        public function void GetTexImageFn(uint target, int level, uint format, uint type, void* pixels);
        public static GetTexImageFn GetTexImage;

        public function void GetTexParameterfvFn(uint target, uint pname, float* paramss);
        public static GetTexParameterfvFn GetTexParameterfv;

        public function void GetTexParameterivFn(uint target, uint pname, int32* paramss);
        public static GetTexParameterivFn GetTexParameteriv;

        public function void GetTexLevelParameterfvFn(uint target, int level, uint pname, float* paramss);
        public static GetTexLevelParameterfvFn GetTexLevelParameterfv;

        public function void GetTexLevelParameterivFn(uint target, int level, uint pname, int32* paramss);
        public static GetTexLevelParameterivFn GetTexLevelParameteriv;

        public function uint8 IsEnabledFn(uint cap);
        public static IsEnabledFn IsEnabled;

        public function void DepthRangeFn(double n, double f);
        public static DepthRangeFn DepthRange;

        public function void ViewportFn(int x, int y, int width, int height);
        public static ViewportFn Viewport;

        public function void DrawArraysFn(uint mode, int first, int count);
        public static DrawArraysFn DrawArrays;

        public function void DrawElementsFn(uint mode, int count, uint type, void* indices);
        public static DrawElementsFn DrawElements;

        public function void PolygonOffsetFn(float factor, float units);
        public static PolygonOffsetFn PolygonOffset;

        public function void CopyTexImage1DFn(uint target, int level, uint internalformat, int x, int y, int width, int border);
        public static CopyTexImage1DFn CopyTexImage1D;

        public function void CopyTexImage2DFn(uint target, int level, uint internalformat, int x, int y, int width, int height, int border);
        public static CopyTexImage2DFn CopyTexImage2D;

        public function void CopyTexSubImage1DFn(uint target, int level, int xoffset, int x, int y, int width);
        public static CopyTexSubImage1DFn CopyTexSubImage1D;

        public function void CopyTexSubImage2DFn(uint target, int level, int xoffset, int yoffset, int x, int y, int width, int height);
        public static CopyTexSubImage2DFn CopyTexSubImage2D;

        public function void TexSubImage1DFn(uint target, int level, int xoffset, int width, uint format, uint type, void* pixels);
        public static TexSubImage1DFn TexSubImage1D;

        public function void TexSubImage2DFn(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, void* pixels);
        public static TexSubImage2DFn TexSubImage2D;

        public function void BindTextureFn(uint target, uint texture);
        public static BindTextureFn BindTexture;

        public function void DeleteTexturesFn(int n, uint32* textures);
        public static DeleteTexturesFn DeleteTextures;

        public function void GenTexturesFn(int n, uint32* textures);
        public static GenTexturesFn GenTextures;

        public function uint8 IsTextureFn(uint texture);
        public static IsTextureFn IsTexture;

        public function void DrawRangeElementsFn(uint mode, uint start, uint end, int count, uint type, void* indices);
        public static DrawRangeElementsFn DrawRangeElements;

        public function void TexImage3DFn(uint target, int level, int internalformat, int width, int height, int depth, int border, uint format, uint type, void* pixels);
        public static TexImage3DFn TexImage3D;

        public function void TexSubImage3DFn(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, uint type, void* pixels);
        public static TexSubImage3DFn TexSubImage3D;

        public function void CopyTexSubImage3DFn(uint target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height);
        public static CopyTexSubImage3DFn CopyTexSubImage3D;

        public function void ActiveTextureFn(uint texture);
        public static ActiveTextureFn ActiveTexture;

        public function void SampleCoverageFn(float value, uint8 invert);
        public static SampleCoverageFn SampleCoverage;

        public function void CompressedTexImage3DFn(uint target, int level, uint internalformat, int width, int height, int depth, int border, int imageSize, void* data);
        public static CompressedTexImage3DFn CompressedTexImage3D;

        public function void CompressedTexImage2DFn(uint target, int level, uint internalformat, int width, int height, int border, int imageSize, void* data);
        public static CompressedTexImage2DFn CompressedTexImage2D;

        public function void CompressedTexImage1DFn(uint target, int level, uint internalformat, int width, int border, int imageSize, void* data);
        public static CompressedTexImage1DFn CompressedTexImage1D;

        public function void CompressedTexSubImage3DFn(uint target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, uint format, int imageSize, void* data);
        public static CompressedTexSubImage3DFn CompressedTexSubImage3D;

        public function void CompressedTexSubImage2DFn(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, int imageSize, void* data);
        public static CompressedTexSubImage2DFn CompressedTexSubImage2D;

        public function void CompressedTexSubImage1DFn(uint target, int level, int xoffset, int width, uint format, int imageSize, void* data);
        public static CompressedTexSubImage1DFn CompressedTexSubImage1D;

        public function void GetCompressedTexImageFn(uint target, int level, void* img);
        public static GetCompressedTexImageFn GetCompressedTexImage;

        public function void BlendFuncSeparateFn(uint sfactorRGB, uint dfactorRGB, uint sfactorAlpha, uint dfactorAlpha);
        public static BlendFuncSeparateFn BlendFuncSeparate;

        public function void MultiDrawArraysFn(uint mode, int32* first, int32* count, int drawcount);
        public static MultiDrawArraysFn MultiDrawArrays;

        public function void MultiDrawElementsFn(uint mode, int32* count, uint type, void *** indices, int drawcount);
        public static MultiDrawElementsFn MultiDrawElements;

        public function void PointParameterfFn(uint pname, float param);
        public static PointParameterfFn PointParameterf;

        public function void PointParameterfvFn(uint pname, float* paramss);
        public static PointParameterfvFn PointParameterfv;

        public function void PointParameteriFn(uint pname, int param);
        public static PointParameteriFn PointParameteri;

        public function void PointParameterivFn(uint pname, int32* paramss);
        public static PointParameterivFn PointParameteriv;

        public function void BlendColorFn(float red, float green, float blue, float alpha);
        public static BlendColorFn BlendColor;

        public function void BlendEquationFn(uint mode);
        public static BlendEquationFn BlendEquation;

        public function void GenQueriesFn(int n, uint32* ids);
        public static GenQueriesFn GenQueries;

        public function void DeleteQueriesFn(int n, uint32* ids);
        public static DeleteQueriesFn DeleteQueries;

        public function uint8 IsQueryFn(uint id);
        public static IsQueryFn IsQuery;

        public function void BeginQueryFn(uint target, uint id);
        public static BeginQueryFn BeginQuery;

        public function void EndQueryFn(uint target);
        public static EndQueryFn EndQuery;

        public function void GetQueryivFn(uint target, uint pname, int32* paramss);
        public static GetQueryivFn GetQueryiv;

        public function void GetQueryObjectivFn(uint id, uint pname, int32* paramss);
        public static GetQueryObjectivFn GetQueryObjectiv;

        public function void GetQueryObjectuivFn(uint id, uint pname, uint32* paramss);
        public static GetQueryObjectuivFn GetQueryObjectuiv;

        public function void BindBufferFn(uint target, uint buffer);
        public static BindBufferFn BindBuffer;

        public function void DeleteBuffersFn(int n, uint32* buffers);
        public static DeleteBuffersFn DeleteBuffers;

        public function void GenBuffersFn(int n, uint32* buffers);
        public static GenBuffersFn GenBuffers;

        public function uint8 IsBufferFn(uint buffer);
        public static IsBufferFn IsBuffer;

        public function void BufferDataFn(uint target, int size, void* data, uint usage);
        public static BufferDataFn BufferData;

        public function void BufferSubDataFn(uint target, int offset, int size, void* data);
        public static BufferSubDataFn BufferSubData;

        public function void GetBufferSubDataFn(uint target, int offset, int size, void* data);
        public static GetBufferSubDataFn GetBufferSubData;

        public function void MapBufferFn(uint target, uint access);
        public static MapBufferFn MapBuffer;

        public function uint8 UnmapBufferFn(uint target);
        public static UnmapBufferFn UnmapBuffer;

        public function void GetBufferParameterivFn(uint target, uint pname, int32* paramss);
        public static GetBufferParameterivFn GetBufferParameteriv;

        public function void GetBufferPointervFn(uint target, uint pname, void *** paramss);
        public static GetBufferPointervFn GetBufferPointerv;

        public function void BlendEquationSeparateFn(uint modeRGB, uint modeAlpha);
        public static BlendEquationSeparateFn BlendEquationSeparate;

        public function void DrawBuffersFn(int n, uint32* bufs);
        public static DrawBuffersFn DrawBuffers;

        public function void StencilOpSeparateFn(uint face, uint sfail, uint dpfail, uint dppass);
        public static StencilOpSeparateFn StencilOpSeparate;

        public function void StencilFuncSeparateFn(uint face, uint func, int reff, uint mask);
        public static StencilFuncSeparateFn StencilFuncSeparate;

        public function void StencilMaskSeparateFn(uint face, uint mask);
        public static StencilMaskSeparateFn StencilMaskSeparate;

        public function void AttachShaderFn(uint program, uint shader);
        public static AttachShaderFn AttachShader;

        public function void BindAttribLocationFn(uint program, uint index, char8* name);
        public static BindAttribLocationFn BindAttribLocation;

        public function void CompileShaderFn(uint shader);
        public static CompileShaderFn CompileShader;

        public function uint CreateProgramFn();
        public static CreateProgramFn CreateProgram;

        public function uint CreateShaderFn(uint type);
        public static CreateShaderFn CreateShader;

        public function void DeleteProgramFn(uint program);
        public static DeleteProgramFn DeleteProgram;

        public function void DeleteShaderFn(uint shader);
        public static DeleteShaderFn DeleteShader;

        public function void DetachShaderFn(uint program, uint shader);
        public static DetachShaderFn DetachShader;

        public function void DisableVertexAttribArrayFn(uint index);
        public static DisableVertexAttribArrayFn DisableVertexAttribArray;

        public function void EnableVertexAttribArrayFn(uint index);
        public static EnableVertexAttribArrayFn EnableVertexAttribArray;

        public function void GetActiveAttribFn(uint program, uint index, int bufSize, int32* length, int32* size, uint32* type, char8* name);
        public static GetActiveAttribFn GetActiveAttrib;

        public function void GetActiveUniformFn(uint program, uint index, int bufSize, int32* length, int32* size, uint32* type, char8* name);
        public static GetActiveUniformFn GetActiveUniform;

        public function void GetAttachedShadersFn(uint program, int maxCount, int32* count, uint32* shaders);
        public static GetAttachedShadersFn GetAttachedShaders;

        public function int GetAttribLocationFn(uint program, char8* name);
        public static GetAttribLocationFn GetAttribLocation;

        public function void GetProgramivFn(uint program, uint pname, out int32 paramss);
        public static GetProgramivFn GetProgramiv;

        public function void GetProgramInfoLogFn(uint program, int bufSize, int32* length, char8* infoLog);
        public static GetProgramInfoLogFn GetProgramInfoLog;

        public function void GetShaderivFn(uint shader, uint pname, out int32 paramss);
        public static GetShaderivFn GetShaderiv;

        public function void GetShaderInfoLogFn(uint shader, int bufSize, int32* length, char8* infoLog);
        public static GetShaderInfoLogFn GetShaderInfoLog;

        public function void GetShaderSourceFn(uint shader, int bufSize, int32* length, char8* source);
        public static GetShaderSourceFn GetShaderSource;

        public function int GetUniformLocationFn(uint program, char8* name);
        public static GetUniformLocationFn GetUniformLocation;

        public function void GetUniformfvFn(uint program, int location, float* paramss);
        public static GetUniformfvFn GetUniformfv;

        public function void GetUniformivFn(uint program, int location, int32* paramss);
        public static GetUniformivFn GetUniformiv;

        public function void GetVertexAttribdvFn(uint index, uint pname, double* paramss);
        public static GetVertexAttribdvFn GetVertexAttribdv;

        public function void GetVertexAttribfvFn(uint index, uint pname, float* paramss);
        public static GetVertexAttribfvFn GetVertexAttribfv;

        public function void GetVertexAttribivFn(uint index, uint pname, int32* paramss);
        public static GetVertexAttribivFn GetVertexAttribiv;

        public function void GetVertexAttribPointervFn(uint index, uint pname, void *** pointer);
        public static GetVertexAttribPointervFn GetVertexAttribPointerv;

        public function uint8 IsProgramFn(uint program);
        public static IsProgramFn IsProgram;

        public function uint8 IsShaderFn(uint shader);
        public static IsShaderFn IsShader;

        public function void LinkProgramFn(uint program);
        public static LinkProgramFn LinkProgram;

        public function void ShaderSourceFn(uint shader, int count, char8** string, int32* length);
        public static ShaderSourceFn ShaderSource;

        public function void UseProgramFn(uint program);
        public static UseProgramFn UseProgram;

        public function void Uniform1fFn(int location, float v0);
        public static Uniform1fFn Uniform1f;

        public function void Uniform2fFn(int location, float v0, float v1);
        public static Uniform2fFn Uniform2f;

        public function void Uniform3fFn(int location, float v0, float v1, float v2);
        public static Uniform3fFn Uniform3f;

        public function void Uniform4fFn(int location, float v0, float v1, float v2, float v3);
        public static Uniform4fFn Uniform4f;

        public function void Uniform1iFn(int location, int v0);
        public static Uniform1iFn Uniform1i;

        public function void Uniform2iFn(int location, int v0, int v1);
        public static Uniform2iFn Uniform2i;

        public function void Uniform3iFn(int location, int v0, int v1, int v2);
        public static Uniform3iFn Uniform3i;

        public function void Uniform4iFn(int location, int v0, int v1, int v2, int v3);
        public static Uniform4iFn Uniform4i;

        public function void Uniform1fvFn(int location, int count, float* value);
        public static Uniform1fvFn Uniform1fv;

        public function void Uniform2fvFn(int location, int count, float* value);
        public static Uniform2fvFn Uniform2fv;

        public function void Uniform3fvFn(int location, int count, float* value);
        public static Uniform3fvFn Uniform3fv;

        public function void Uniform4fvFn(int location, int count, float* value);
        public static Uniform4fvFn Uniform4fv;

        public function void Uniform1ivFn(int location, int count, int32* value);
        public static Uniform1ivFn Uniform1iv;

        public function void Uniform2ivFn(int location, int count, int32* value);
        public static Uniform2ivFn Uniform2iv;

        public function void Uniform3ivFn(int location, int count, int32* value);
        public static Uniform3ivFn Uniform3iv;

        public function void Uniform4ivFn(int location, int count, int32* value);
        public static Uniform4ivFn Uniform4iv;

        public function void UniformMatrix2fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix2fvFn UniformMatrix2fv;

        public function void UniformMatrix3fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix3fvFn UniformMatrix3fv;

        public function void UniformMatrix4fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix4fvFn UniformMatrix4fv;

        public function void ValidateProgramFn(uint program);
        public static ValidateProgramFn ValidateProgram;

        public function void VertexAttrib1dFn(uint index, double x);
        public static VertexAttrib1dFn VertexAttrib1d;

        public function void VertexAttrib1dvFn(uint index, double* v);
        public static VertexAttrib1dvFn VertexAttrib1dv;

        public function void VertexAttrib1fFn(uint index, float x);
        public static VertexAttrib1fFn VertexAttrib1f;

        public function void VertexAttrib1fvFn(uint index, float* v);
        public static VertexAttrib1fvFn VertexAttrib1fv;

        public function void VertexAttrib1sFn(uint index, int16 x);
        public static VertexAttrib1sFn VertexAttrib1s;

        public function void VertexAttrib1svFn(uint index, int16* v);
        public static VertexAttrib1svFn VertexAttrib1sv;

        public function void VertexAttrib2dFn(uint index, double x, double y);
        public static VertexAttrib2dFn VertexAttrib2d;

        public function void VertexAttrib2dvFn(uint index, double* v);
        public static VertexAttrib2dvFn VertexAttrib2dv;

        public function void VertexAttrib2fFn(uint index, float x, float y);
        public static VertexAttrib2fFn VertexAttrib2f;

        public function void VertexAttrib2fvFn(uint index, float* v);
        public static VertexAttrib2fvFn VertexAttrib2fv;

        public function void VertexAttrib2sFn(uint index, int16 x, int16 y);
        public static VertexAttrib2sFn VertexAttrib2s;

        public function void VertexAttrib2svFn(uint index, int16* v);
        public static VertexAttrib2svFn VertexAttrib2sv;

        public function void VertexAttrib3dFn(uint index, double x, double y, double z);
        public static VertexAttrib3dFn VertexAttrib3d;

        public function void VertexAttrib3dvFn(uint index, double* v);
        public static VertexAttrib3dvFn VertexAttrib3dv;

        public function void VertexAttrib3fFn(uint index, float x, float y, float z);
        public static VertexAttrib3fFn VertexAttrib3f;

        public function void VertexAttrib3fvFn(uint index, float* v);
        public static VertexAttrib3fvFn VertexAttrib3fv;

        public function void VertexAttrib3sFn(uint index, int16 x, int16 y, int16 z);
        public static VertexAttrib3sFn VertexAttrib3s;

        public function void VertexAttrib3svFn(uint index, int16* v);
        public static VertexAttrib3svFn VertexAttrib3sv;

        public function void VertexAttrib4NbvFn(uint index, int8* v);
        public static VertexAttrib4NbvFn VertexAttrib4Nbv;

        public function void VertexAttrib4NivFn(uint index, int32* v);
        public static VertexAttrib4NivFn VertexAttrib4Niv;

        public function void VertexAttrib4NsvFn(uint index, int16* v);
        public static VertexAttrib4NsvFn VertexAttrib4Nsv;

        public function void VertexAttrib4NubFn(uint index, uint8 x, uint8 y, uint8 z, uint8 w);
        public static VertexAttrib4NubFn VertexAttrib4Nub;

        public function void VertexAttrib4NubvFn(uint index, uint8* v);
        public static VertexAttrib4NubvFn VertexAttrib4Nubv;

        public function void VertexAttrib4NuivFn(uint index, uint32* v);
        public static VertexAttrib4NuivFn VertexAttrib4Nuiv;

        public function void VertexAttrib4NusvFn(uint index, uint16* v);
        public static VertexAttrib4NusvFn VertexAttrib4Nusv;

        public function void VertexAttrib4bvFn(uint index, int8* v);
        public static VertexAttrib4bvFn VertexAttrib4bv;

        public function void VertexAttrib4dFn(uint index, double x, double y, double z, double w);
        public static VertexAttrib4dFn VertexAttrib4d;

        public function void VertexAttrib4dvFn(uint index, double* v);
        public static VertexAttrib4dvFn VertexAttrib4dv;

        public function void VertexAttrib4fFn(uint index, float x, float y, float z, float w);
        public static VertexAttrib4fFn VertexAttrib4f;

        public function void VertexAttrib4fvFn(uint index, float* v);
        public static VertexAttrib4fvFn VertexAttrib4fv;

        public function void VertexAttrib4ivFn(uint index, int32* v);
        public static VertexAttrib4ivFn VertexAttrib4iv;

        public function void VertexAttrib4sFn(uint index, int16 x, int16 y, int16 z, int16 w);
        public static VertexAttrib4sFn VertexAttrib4s;

        public function void VertexAttrib4svFn(uint index, int16* v);
        public static VertexAttrib4svFn VertexAttrib4sv;

        public function void VertexAttrib4ubvFn(uint index, uint8* v);
        public static VertexAttrib4ubvFn VertexAttrib4ubv;

        public function void VertexAttrib4uivFn(uint index, uint32* v);
        public static VertexAttrib4uivFn VertexAttrib4uiv;

        public function void VertexAttrib4usvFn(uint index, uint16* v);
        public static VertexAttrib4usvFn VertexAttrib4usv;

        public function void VertexAttribPointerFn(uint index, int size, uint type, uint8 normalized, int stride, void* pointer);
        public static VertexAttribPointerFn VertexAttribPointer;

        public function void UniformMatrix2x3fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix2x3fvFn UniformMatrix2x3fv;

        public function void UniformMatrix3x2fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix3x2fvFn UniformMatrix3x2fv;

        public function void UniformMatrix2x4fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix2x4fvFn UniformMatrix2x4fv;

        public function void UniformMatrix4x2fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix4x2fvFn UniformMatrix4x2fv;

        public function void UniformMatrix3x4fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix3x4fvFn UniformMatrix3x4fv;

        public function void UniformMatrix4x3fvFn(int location, int count, uint8 transpose, float* value);
        public static UniformMatrix4x3fvFn UniformMatrix4x3fv;

        public function void ColorMaskiFn(uint index, uint8 r, uint8 g, uint8 b, uint8 a);
        public static ColorMaskiFn ColorMaski;

        public function void GlGetBooleani_v(uint target, uint index, uint8* data);
        public static GlGetBooleani_v GetBooleani_v;

        public function void GlGetIntegeri_v(uint target, uint index, int32* data);
        public static GlGetIntegeri_v GetIntegeri_v;

        public function void EnableiFn(uint target, uint index);
        public static EnableiFn Enablei;

        public function void DisableiFn(uint target, uint index);
        public static DisableiFn Disablei;

        public function uint8 IsEnablediFn(uint target, uint index);
        public static IsEnablediFn IsEnabledi;

        public function void BeginTransformFeedbackFn(uint primitiveMode);
        public static BeginTransformFeedbackFn BeginTransformFeedback;

        public function void EndTransformFeedbackFn();
        public static EndTransformFeedbackFn EndTransformFeedback;

        public function void BindBufferRangeFn(uint target, uint index, uint buffer, int offset, int size);
        public static BindBufferRangeFn BindBufferRange;

        public function void BindBufferBaseFn(uint target, uint index, uint buffer);
        public static BindBufferBaseFn BindBufferBase;

        public function void TransformFeedbackVaryingsFn(uint program, int count, char8** varyings, uint bufferMode);
        public static TransformFeedbackVaryingsFn TransformFeedbackVaryings;

        public function void GetTransformFeedbackVaryingFn(uint program, uint index, int bufSize, int32* length, int32* size, uint32* type, char8* name);
        public static GetTransformFeedbackVaryingFn GetTransformFeedbackVarying;

        public function void ClampColorFn(uint target, uint clamp);
        public static ClampColorFn ClampColor;

        public function void BeginConditionalRenderFn(uint id, uint mode);
        public static BeginConditionalRenderFn BeginConditionalRender;

        public function void EndConditionalRenderFn();
        public static EndConditionalRenderFn EndConditionalRender;

        public function void GlVertexAttribIPointer(uint index, int size, uint type, int stride, void* pointer);
        public static GlVertexAttribIPointer VertexAttribIPointer;

        public function void GetVertexAttribIivFn(uint index, uint pname, int32* paramss);
        public static GetVertexAttribIivFn GetVertexAttribIiv;

        public function void GetVertexAttribIuivFn(uint index, uint pname, uint32* paramss);
        public static GetVertexAttribIuivFn GetVertexAttribIuiv;

        public function void VertexAttribI1iFn(uint index, int x);
        public static VertexAttribI1iFn VertexAttribI1i;

        public function void VertexAttribI2iFn(uint index, int x, int y);
        public static VertexAttribI2iFn VertexAttribI2i;

        public function void VertexAttribI3iFn(uint index, int x, int y, int z);
        public static VertexAttribI3iFn VertexAttribI3i;

        public function void VertexAttribI4iFn(uint index, int x, int y, int z, int w);
        public static VertexAttribI4iFn VertexAttribI4i;

        public function void VertexAttribI1uiFn(uint index, uint x);
        public static VertexAttribI1uiFn VertexAttribI1ui;

        public function void VertexAttribI2uiFn(uint index, uint x, uint y);
        public static VertexAttribI2uiFn VertexAttribI2ui;

        public function void VertexAttribI3uiFn(uint index, uint x, uint y, uint z);
        public static VertexAttribI3uiFn VertexAttribI3ui;

        public function void VertexAttribI4uiFn(uint index, uint x, uint y, uint z, uint w);
        public static VertexAttribI4uiFn VertexAttribI4ui;

        public function void VertexAttribI1ivFn(uint index, int32* v);
        public static VertexAttribI1ivFn VertexAttribI1iv;

        public function void VertexAttribI2ivFn(uint index, int32* v);
        public static VertexAttribI2ivFn VertexAttribI2iv;

        public function void VertexAttribI3ivFn(uint index, int32* v);
        public static VertexAttribI3ivFn VertexAttribI3iv;

        public function void VertexAttribI4ivFn(uint index, int32* v);
        public static VertexAttribI4ivFn VertexAttribI4iv;

        public function void VertexAttribI1uivFn(uint index, uint32* v);
        public static VertexAttribI1uivFn VertexAttribI1uiv;

        public function void VertexAttribI2uivFn(uint index, uint32* v);
        public static VertexAttribI2uivFn VertexAttribI2uiv;

        public function void VertexAttribI3uivFn(uint index, uint32* v);
        public static VertexAttribI3uivFn VertexAttribI3uiv;

        public function void VertexAttribI4uivFn(uint index, uint32* v);
        public static VertexAttribI4uivFn VertexAttribI4uiv;

        public function void VertexAttribI4bvFn(uint index, int8* v);
        public static VertexAttribI4bvFn VertexAttribI4bv;

        public function void VertexAttribI4svFn(uint index, int16* v);
        public static VertexAttribI4svFn VertexAttribI4sv;

        public function void VertexAttribI4ubvFn(uint index, uint8* v);
        public static VertexAttribI4ubvFn VertexAttribI4ubv;

        public function void VertexAttribI4usvFn(uint index, uint16* v);
        public static VertexAttribI4usvFn VertexAttribI4usv;

        public function void GetUniformuivFn(uint program, int location, uint32* paramss);
        public static GetUniformuivFn GetUniformuiv;

        public function void BindFragDataLocationFn(uint program, uint color, char8* name);
        public static BindFragDataLocationFn BindFragDataLocation;

        public function int GetFragDataLocationFn(uint program, char8* name);
        public static GetFragDataLocationFn GetFragDataLocation;

        public function void Uniform1uiFn(int location, uint v0);
        public static Uniform1uiFn Uniform1ui;

        public function void Uniform2uiFn(int location, uint v0, uint v1);
        public static Uniform2uiFn Uniform2ui;

        public function void Uniform3uiFn(int location, uint v0, uint v1, uint v2);
        public static Uniform3uiFn Uniform3ui;

        public function void Uniform4uiFn(int location, uint v0, uint v1, uint v2, uint v3);
        public static Uniform4uiFn Uniform4ui;

        public function void Uniform1uivFn(int location, int count, uint32* value);
        public static Uniform1uivFn Uniform1uiv;

        public function void Uniform2uivFn(int location, int count, uint32* value);
        public static Uniform2uivFn Uniform2uiv;

        public function void Uniform3uivFn(int location, int count, uint32* value);
        public static Uniform3uivFn Uniform3uiv;

        public function void Uniform4uivFn(int location, int count, uint32* value);
        public static Uniform4uivFn Uniform4uiv;

        public function void TexParameterIivFn(uint target, uint pname, int32* paramss);
        public static TexParameterIivFn TexParameterIiv;

        public function void TexParameterIuivFn(uint target, uint pname, uint32* paramss);
        public static TexParameterIuivFn TexParameterIuiv;

        public function void GetTexParameterIivFn(uint target, uint pname, int32* paramss);
        public static GetTexParameterIivFn GetTexParameterIiv;

        public function void GetTexParameterIuivFn(uint target, uint pname, uint32* paramss);
        public static GetTexParameterIuivFn GetTexParameterIuiv;

        public function void ClearBufferivFn(uint buffer, int drawbuffer, int32* value);
        public static ClearBufferivFn ClearBufferiv;

        public function void ClearBufferuivFn(uint buffer, int drawbuffer, uint32* value);
        public static ClearBufferuivFn ClearBufferuiv;

        public function void ClearBufferfvFn(uint buffer, int drawbuffer, float* value);
        public static ClearBufferfvFn ClearBufferfv;

        public function void ClearBufferfiFn(uint buffer, int drawbuffer, float depth, int stencil);
        public static ClearBufferfiFn ClearBufferfi;

        public function uint8 GetStringiFn(uint name, uint index);
        public static GetStringiFn GetStringi;

        public function uint8 IsRenderbufferFn(uint renderbuffer);
        public static IsRenderbufferFn IsRenderbuffer;

        public function void BindRenderbufferFn(uint target, uint renderbuffer);
        public static BindRenderbufferFn BindRenderbuffer;

        public function void DeleteRenderbuffersFn(int n, uint32* renderbuffers);
        public static DeleteRenderbuffersFn DeleteRenderbuffers;

        public function void GenRenderbuffersFn(int n, uint32* renderbuffers);
        public static GenRenderbuffersFn GenRenderbuffers;

        public function void RenderbufferStorageFn(uint target, uint internalformat, int width, int height);
        public static RenderbufferStorageFn RenderbufferStorage;

        public function void GetRenderbufferParameterivFn(uint target, uint pname, int32* paramss);
        public static GetRenderbufferParameterivFn GetRenderbufferParameteriv;

        public function uint8 IsFramebufferFn(uint framebuffer);
        public static IsFramebufferFn IsFramebuffer;

        public function void BindFramebufferFn(uint target, uint framebuffer);
        public static BindFramebufferFn BindFramebuffer;

        public function void DeleteFramebuffersFn(int n, uint32* framebuffers);
        public static DeleteFramebuffersFn DeleteFramebuffers;

        public function void GenFramebuffersFn(int n, uint32* framebuffers);
        public static GenFramebuffersFn GenFramebuffers;

        public function uint CheckFramebufferStatusFn(uint target);
        public static CheckFramebufferStatusFn CheckFramebufferStatus;

        public function void FramebufferTexture1DFn(uint target, uint attachment, uint textarget, uint texture, int level);
        public static FramebufferTexture1DFn FramebufferTexture1D;

        public function void FramebufferTexture2DFn(uint target, uint attachment, uint textarget, uint texture, int level);
        public static FramebufferTexture2DFn FramebufferTexture2D;

        public function void FramebufferTexture3DFn(uint target, uint attachment, uint textarget, uint texture, int level, int zoffset);
        public static FramebufferTexture3DFn FramebufferTexture3D;

        public function void FramebufferRenderbufferFn(uint target, uint attachment, uint renderbuffertarget, uint renderbuffer);
        public static FramebufferRenderbufferFn FramebufferRenderbuffer;

        public function void GetFramebufferAttachmentParameterivFn(uint target, uint attachment, uint pname, int32* paramss);
        public static GetFramebufferAttachmentParameterivFn GetFramebufferAttachmentParameteriv;

        public function void GenerateMipmapFn(uint target);
        public static GenerateMipmapFn GenerateMipmap;

        public function void BlitFramebufferFn(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, uint mask, uint filter);
        public static BlitFramebufferFn BlitFramebuffer;

        public function void RenderbufferStorageMultisampleFn(uint target, int samples, uint internalformat, int width, int height);
        public static RenderbufferStorageMultisampleFn RenderbufferStorageMultisample;

        public function void FramebufferTextureLayerFn(uint target, uint attachment, uint texture, int level, int layer);
        public static FramebufferTextureLayerFn FramebufferTextureLayer;

        public function void MapBufferRangeFn(uint target, int offset, int length, uint access);
        public static MapBufferRangeFn MapBufferRange;

        public function void FlushMappedBufferRangeFn(uint target, int offset, int length);
        public static FlushMappedBufferRangeFn FlushMappedBufferRange;

        public function void BindVertexArrayFn(uint array);
        public static BindVertexArrayFn BindVertexArray;

        public function void DeleteVertexArraysFn(int n, uint32* arrays);
        public static DeleteVertexArraysFn DeleteVertexArrays;

        public function void GenVertexArraysFn(int n, uint32* arrays);
        public static GenVertexArraysFn GenVertexArrays;

        public function uint8 IsVertexArrayFn(uint array);
        public static IsVertexArrayFn IsVertexArray;

        public function void DrawArraysInstancedFn(uint mode, int first, int count, int instancecount);
        public static DrawArraysInstancedFn DrawArraysInstanced;

        public function void DrawElementsInstancedFn(uint mode, int count, uint type, void* indices, int instancecount);
        public static DrawElementsInstancedFn DrawElementsInstanced;

        public function void TexBufferFn(uint target, uint internalformat, uint buffer);
        public static TexBufferFn TexBuffer;

        public function void PrimitiveRestartIndexFn(uint index);
        public static PrimitiveRestartIndexFn PrimitiveRestartIndex;

        public function void CopyBufferSubDataFn(uint readTarget, uint writeTarget, int readOffset, int writeOffset, int size);
        public static CopyBufferSubDataFn CopyBufferSubData;

        public function void GetUniformIndicesFn(uint program, int uniformCount, char8** uniformNames, uint32* uniformIndices);
        public static GetUniformIndicesFn GetUniformIndices;

        public function void GetActiveUniformsivFn(uint program, int uniformCount, uint32* uniformIndices, uint pname, int32* paramss);
        public static GetActiveUniformsivFn GetActiveUniformsiv;

        public function void GetActiveUniformNameFn(uint program, uint uniformIndex, int bufSize, int32* length, char8* uniformName);
        public static GetActiveUniformNameFn GetActiveUniformName;

        public function uint GetUniformBlockIndexFn(uint program, char8* uniformBlockName);
        public static GetUniformBlockIndexFn GetUniformBlockIndex;

        public function void GetActiveUniformBlockivFn(uint program, uint uniformBlockIndex, uint pname, int32* paramss);
        public static GetActiveUniformBlockivFn GetActiveUniformBlockiv;

        public function void GetActiveUniformBlockNameFn(uint program, uint uniformBlockIndex, int bufSize, int32* length, char8* uniformBlockName);
        public static GetActiveUniformBlockNameFn GetActiveUniformBlockName;

        public function void UniformBlockBindingFn(uint program, uint uniformBlockIndex, uint uniformBlockBinding);
        public static UniformBlockBindingFn UniformBlockBinding;

        public function void DrawElementsBaseVertexFn(uint mode, int count, uint type, void* indices, int basevertex);
        public static DrawElementsBaseVertexFn DrawElementsBaseVertex;

        public function void DrawRangeElementsBaseVertexFn(uint mode, uint start, uint end, int count, uint type, void* indices, int basevertex);
        public static DrawRangeElementsBaseVertexFn DrawRangeElementsBaseVertex;

        public function void DrawElementsInstancedBaseVertexFn(uint mode, int count, uint type, void* indices, int instancecount, int basevertex);
        public static DrawElementsInstancedBaseVertexFn DrawElementsInstancedBaseVertex;

        public function void MultiDrawElementsBaseVertexFn(uint mode, int32* count, uint type, void *** indices, int drawcount, int32* basevertex);
        public static MultiDrawElementsBaseVertexFn MultiDrawElementsBaseVertex;

        public function void ProvokingVertexFn(uint mode);
        public static ProvokingVertexFn ProvokingVertex;

        public function void* FenceSyncFn(uint condition, uint flags);
        public static FenceSyncFn FenceSync;

        public function uint8 IsSyncFn(void* sync);
        public static IsSyncFn IsSync;

        public function void DeleteSyncFn(void* sync);
        public static DeleteSyncFn DeleteSync;

        public function uint ClientWaitSyncFn(void* sync, uint flags, uint64 timeout);
        public static ClientWaitSyncFn ClientWaitSync;

        public function void WaitSyncFn(void* sync, uint flags, uint64 timeout);
        public static WaitSyncFn WaitSync;

        public function void GetInteger64vFn(uint pname, int64* data);
        public static GetInteger64vFn GetInteger64v;

        public function void GetSyncivFn(void* sync, uint pname, int count, int32* length, int32* values);
        public static GetSyncivFn GetSynciv;

        public function void GlGetInteger64i_v(uint target, uint index, int64* data);
        public static GlGetInteger64i_v GetInteger64i_v;

        public function void GetBufferParameteri64vFn(uint target, uint pname, int64* paramss);
        public static GetBufferParameteri64vFn GetBufferParameteri64v;

        public function void FramebufferTextureFn(uint target, uint attachment, uint texture, int level);
        public static FramebufferTextureFn FramebufferTexture;

        public function void GlTexImage2DMultisample(uint target, int samples, uint internalformat, int width, int height, uint8 fixedsamplelocations);
        public static GlTexImage2DMultisample TexImage2DMultisample;

        public function void GlTexImage3DMultisample(uint target, int samples, uint internalformat, int width, int height, int depth, uint8 fixedsamplelocations);
        public static GlTexImage3DMultisample TexImage3DMultisample;

        public function void GetMultisamplefvFn(uint pname, uint index, float* val);
        public static GetMultisamplefvFn GetMultisamplefv;

        public function void SampleMaskiFn(uint maskNumber, uint mask);
        public static SampleMaskiFn SampleMaski;

        public function void BindFragDataLocationIndexedFn(uint program, uint colorNumber, uint index, char8* name);
        public static BindFragDataLocationIndexedFn BindFragDataLocationIndexed;

        public function int GetFragDataIndexFn(uint program, char8* name);
        public static GetFragDataIndexFn GetFragDataIndex;

        public function void GenSamplersFn(int count, uint32* samplers);
        public static GenSamplersFn GenSamplers;

        public function void DeleteSamplersFn(int count, uint32* samplers);
        public static DeleteSamplersFn DeleteSamplers;

        public function uint8 IsSamplerFn(uint sampler);
        public static IsSamplerFn IsSampler;

        public function void BindSamplerFn(uint unit, uint sampler);
        public static BindSamplerFn BindSampler;

        public function void SamplerParameteriFn(uint sampler, uint pname, int param);
        public static SamplerParameteriFn SamplerParameteri;

        public function void SamplerParameterivFn(uint sampler, uint pname, int32* param);
        public static SamplerParameterivFn SamplerParameteriv;

        public function void SamplerParameterfFn(uint sampler, uint pname, float param);
        public static SamplerParameterfFn SamplerParameterf;

        public function void SamplerParameterfvFn(uint sampler, uint pname, float* param);
        public static SamplerParameterfvFn SamplerParameterfv;

        public function void SamplerParameterIivFn(uint sampler, uint pname, int32* param);
        public static SamplerParameterIivFn SamplerParameterIiv;

        public function void SamplerParameterIuivFn(uint sampler, uint pname, uint32* param);
        public static SamplerParameterIuivFn SamplerParameterIuiv;

        public function void GetSamplerParameterivFn(uint sampler, uint pname, int32* paramss);
        public static GetSamplerParameterivFn GetSamplerParameteriv;

        public function void GetSamplerParameterIivFn(uint sampler, uint pname, int32* paramss);
        public static GetSamplerParameterIivFn GetSamplerParameterIiv;

        public function void GetSamplerParameterfvFn(uint sampler, uint pname, float* paramss);
        public static GetSamplerParameterfvFn GetSamplerParameterfv;

        public function void GetSamplerParameterIuivFn(uint sampler, uint pname, uint32* paramss);
        public static GetSamplerParameterIuivFn GetSamplerParameterIuiv;

        public function void QueryCounterFn(uint id, uint target);
        public static QueryCounterFn QueryCounter;

        public function void GetQueryObjecti64vFn(uint id, uint pname, int64* paramss);
        public static GetQueryObjecti64vFn GetQueryObjecti64v;

        public function void GetQueryObjectui64vFn(uint id, uint pname, uint64* paramss);
        public static GetQueryObjectui64vFn GetQueryObjectui64v;

        public function void VertexAttribDivisorFn(uint index, uint divisor);
        public static VertexAttribDivisorFn VertexAttribDivisor;

        public function void VertexAttribP1uiFn(uint index, uint type, uint8 normalized, uint value);
        public static VertexAttribP1uiFn VertexAttribP1ui;

        public function void VertexAttribP1uivFn(uint index, uint type, uint8 normalized, uint32* value);
        public static VertexAttribP1uivFn VertexAttribP1uiv;

        public function void VertexAttribP2uiFn(uint index, uint type, uint8 normalized, uint value);
        public static VertexAttribP2uiFn VertexAttribP2ui;

        public function void VertexAttribP2uivFn(uint index, uint type, uint8 normalized, uint32* value);
        public static VertexAttribP2uivFn VertexAttribP2uiv;

        public function void VertexAttribP3uiFn(uint index, uint type, uint8 normalized, uint value);
        public static VertexAttribP3uiFn VertexAttribP3ui;

        public function void VertexAttribP3uivFn(uint index, uint type, uint8 normalized, uint32* value);
        public static VertexAttribP3uivFn VertexAttribP3uiv;

        public function void VertexAttribP4uiFn(uint index, uint type, uint8 normalized, uint value);
        public static VertexAttribP4uiFn VertexAttribP4ui;

        public function void VertexAttribP4uivFn(uint index, uint type, uint8 normalized, uint32* value);
        public static VertexAttribP4uivFn VertexAttribP4uiv;

        public static Result<void> LoadProcs(GetProcAddressFunc getProcAddress)
		{
			if (getProcAddress == null)
			{
				return .Err;
			}

            CullFace = (CullFaceFn) getProcAddress("glCullFace");
            FrontFace = (FrontFaceFn) getProcAddress("glFrontFace");
            Hint = (HintFn) getProcAddress("glHint");
            LineWidth = (LineWidthFn) getProcAddress("glLineWidth");
            PointSize = (PointSizeFn) getProcAddress("glPointSize");
            PolygonMode = (PolygonModeFn) getProcAddress("glPolygonMode");
            Scissor = (ScissorFn) getProcAddress("glScissor");
            TexParameterf = (TexParameterfFn) getProcAddress("glTexParameterf");
            TexParameterfv = (TexParameterfvFn) getProcAddress("glTexParameterfv");
            TexParameteri = (TexParameteriFn) getProcAddress("glTexParameteri");
            TexParameteriv = (TexParameterivFn) getProcAddress("glTexParameteriv");
            TexImage1D = (TexImage1DFn) getProcAddress("glTexImage1D");
            TexImage2D = (TexImage2DFn) getProcAddress("glTexImage2D");
            DrawBuffer = (DrawBufferFn) getProcAddress("glDrawBuffer");
            Clear = (ClearFn) getProcAddress("glClear");
            ClearColor = (ClearColorFn) getProcAddress("glClearColor");
            ClearStencil = (ClearStencilFn) getProcAddress("glClearStencil");
            ClearDepth = (ClearDepthFn) getProcAddress("glClearDepth");
            StencilMask = (StencilMaskFn) getProcAddress("glStencilMask");
            ColorMask = (ColorMaskFn) getProcAddress("glColorMask");
            DepthMask = (DepthMaskFn) getProcAddress("glDepthMask");
            Disable = (DisableFn) getProcAddress("glDisable");
            Enable = (EnableFn) getProcAddress("glEnable");
            Finish = (FinishFn) getProcAddress("glFinish");
            Flush = (FlushFn) getProcAddress("glFlush");
            BlendFunc = (BlendFuncFn) getProcAddress("glBlendFunc");
            LogicOp = (LogicOpFn) getProcAddress("glLogicOp");
            StencilFunc = (StencilFuncFn) getProcAddress("glStencilFunc");
            StencilOp = (StencilOpFn) getProcAddress("glStencilOp");
            DepthFunc = (DepthFuncFn) getProcAddress("glDepthFunc");
            PixelStoref = (PixelStorefFn) getProcAddress("glPixelStoref");
            PixelStorei = (PixelStoreiFn) getProcAddress("glPixelStorei");
            ReadBuffer = (ReadBufferFn) getProcAddress("glReadBuffer");
            ReadPixels = (ReadPixelsFn) getProcAddress("glReadPixels");
            GetBooleanv = (GetBooleanvFn) getProcAddress("glGetBooleanv");
            GetDoublev = (GetDoublevFn) getProcAddress("glGetDoublev");
            GetError = (GetErrorFn) getProcAddress("glGetError");
            GetFloatv = (GetFloatvFn) getProcAddress("glGetFloatv");
            GetIntegerv = (GetIntegervFn) getProcAddress("glGetIntegerv");
            GetString = (GetStringFn) getProcAddress("glGetString");
            GetTexImage = (GetTexImageFn) getProcAddress("glGetTexImage");
            GetTexParameterfv = (GetTexParameterfvFn) getProcAddress("glGetTexParameterfv");
            GetTexParameteriv = (GetTexParameterivFn) getProcAddress("glGetTexParameteriv");
            GetTexLevelParameterfv = (GetTexLevelParameterfvFn) getProcAddress("glGetTexLevelParameterfv");
            GetTexLevelParameteriv = (GetTexLevelParameterivFn) getProcAddress("glGetTexLevelParameteriv");
            IsEnabled = (IsEnabledFn) getProcAddress("glIsEnabled");
            DepthRange = (DepthRangeFn) getProcAddress("glDepthRange");
            Viewport = (ViewportFn) getProcAddress("glViewport");
            DrawArrays = (DrawArraysFn) getProcAddress("glDrawArrays");
            DrawElements = (DrawElementsFn) getProcAddress("glDrawElements");
            PolygonOffset = (PolygonOffsetFn) getProcAddress("glPolygonOffset");
            CopyTexImage1D = (CopyTexImage1DFn) getProcAddress("glCopyTexImage1D");
            CopyTexImage2D = (CopyTexImage2DFn) getProcAddress("glCopyTexImage2D");
            CopyTexSubImage1D = (CopyTexSubImage1DFn) getProcAddress("glCopyTexSubImage1D");
            CopyTexSubImage2D = (CopyTexSubImage2DFn) getProcAddress("glCopyTexSubImage2D");
            TexSubImage1D = (TexSubImage1DFn) getProcAddress("glTexSubImage1D");
            TexSubImage2D = (TexSubImage2DFn) getProcAddress("glTexSubImage2D");
            BindTexture = (BindTextureFn) getProcAddress("glBindTexture");
            DeleteTextures = (DeleteTexturesFn) getProcAddress("glDeleteTextures");
            GenTextures = (GenTexturesFn) getProcAddress("glGenTextures");
            IsTexture = (IsTextureFn) getProcAddress("glIsTexture");
            DrawRangeElements = (DrawRangeElementsFn) getProcAddress("glDrawRangeElements");
            TexImage3D = (TexImage3DFn) getProcAddress("glTexImage3D");
            TexSubImage3D = (TexSubImage3DFn) getProcAddress("glTexSubImage3D");
            CopyTexSubImage3D = (CopyTexSubImage3DFn) getProcAddress("glCopyTexSubImage3D");
            ActiveTexture = (ActiveTextureFn) getProcAddress("glActiveTexture");
            SampleCoverage = (SampleCoverageFn) getProcAddress("glSampleCoverage");
            CompressedTexImage3D = (CompressedTexImage3DFn) getProcAddress("glCompressedTexImage3D");
            CompressedTexImage2D = (CompressedTexImage2DFn) getProcAddress("glCompressedTexImage2D");
            CompressedTexImage1D = (CompressedTexImage1DFn) getProcAddress("glCompressedTexImage1D");
            CompressedTexSubImage3D = (CompressedTexSubImage3DFn) getProcAddress("glCompressedTexSubImage3D");
            CompressedTexSubImage2D = (CompressedTexSubImage2DFn) getProcAddress("glCompressedTexSubImage2D");
            CompressedTexSubImage1D = (CompressedTexSubImage1DFn) getProcAddress("glCompressedTexSubImage1D");
            GetCompressedTexImage = (GetCompressedTexImageFn) getProcAddress("glGetCompressedTexImage");
            BlendFuncSeparate = (BlendFuncSeparateFn) getProcAddress("glBlendFuncSeparate");
            MultiDrawArrays = (MultiDrawArraysFn) getProcAddress("glMultiDrawArrays");
            MultiDrawElements = (MultiDrawElementsFn) getProcAddress("glMultiDrawElements");
            PointParameterf = (PointParameterfFn) getProcAddress("glPointParameterf");
            PointParameterfv = (PointParameterfvFn) getProcAddress("glPointParameterfv");
            PointParameteri = (PointParameteriFn) getProcAddress("glPointParameteri");
            PointParameteriv = (PointParameterivFn) getProcAddress("glPointParameteriv");
            BlendColor = (BlendColorFn) getProcAddress("glBlendColor");
            BlendEquation = (BlendEquationFn) getProcAddress("glBlendEquation");
            GenQueries = (GenQueriesFn) getProcAddress("glGenQueries");
            DeleteQueries = (DeleteQueriesFn) getProcAddress("glDeleteQueries");
            IsQuery = (IsQueryFn) getProcAddress("glIsQuery");
            BeginQuery = (BeginQueryFn) getProcAddress("glBeginQuery");
            EndQuery = (EndQueryFn) getProcAddress("glEndQuery");
            GetQueryiv = (GetQueryivFn) getProcAddress("glGetQueryiv");
            GetQueryObjectiv = (GetQueryObjectivFn) getProcAddress("glGetQueryObjectiv");
            GetQueryObjectuiv = (GetQueryObjectuivFn) getProcAddress("glGetQueryObjectuiv");
            BindBuffer = (BindBufferFn) getProcAddress("glBindBuffer");
            DeleteBuffers = (DeleteBuffersFn) getProcAddress("glDeleteBuffers");
            GenBuffers = (GenBuffersFn) getProcAddress("glGenBuffers");
            IsBuffer = (IsBufferFn) getProcAddress("glIsBuffer");
            BufferData = (BufferDataFn) getProcAddress("glBufferData");
            BufferSubData = (BufferSubDataFn) getProcAddress("glBufferSubData");
            GetBufferSubData = (GetBufferSubDataFn) getProcAddress("glGetBufferSubData");
            MapBuffer = (MapBufferFn) getProcAddress("glMapBuffer");
            UnmapBuffer = (UnmapBufferFn) getProcAddress("glUnmapBuffer");
            GetBufferParameteriv = (GetBufferParameterivFn) getProcAddress("glGetBufferParameteriv");
            GetBufferPointerv = (GetBufferPointervFn) getProcAddress("glGetBufferPointerv");
            BlendEquationSeparate = (BlendEquationSeparateFn) getProcAddress("glBlendEquationSeparate");
            DrawBuffers = (DrawBuffersFn) getProcAddress("glDrawBuffers");
            StencilOpSeparate = (StencilOpSeparateFn) getProcAddress("glStencilOpSeparate");
            StencilFuncSeparate = (StencilFuncSeparateFn) getProcAddress("glStencilFuncSeparate");
            StencilMaskSeparate = (StencilMaskSeparateFn) getProcAddress("glStencilMaskSeparate");
            AttachShader = (AttachShaderFn) getProcAddress("glAttachShader");
            BindAttribLocation = (BindAttribLocationFn) getProcAddress("glBindAttribLocation");
            CompileShader = (CompileShaderFn) getProcAddress("glCompileShader");
            CreateProgram = (CreateProgramFn) getProcAddress("glCreateProgram");
            CreateShader = (CreateShaderFn) getProcAddress("glCreateShader");
            DeleteProgram = (DeleteProgramFn) getProcAddress("glDeleteProgram");
            DeleteShader = (DeleteShaderFn) getProcAddress("glDeleteShader");
            DetachShader = (DetachShaderFn) getProcAddress("glDetachShader");
            DisableVertexAttribArray = (DisableVertexAttribArrayFn) getProcAddress("glDisableVertexAttribArray");
            EnableVertexAttribArray = (EnableVertexAttribArrayFn) getProcAddress("glEnableVertexAttribArray");
            GetActiveAttrib = (GetActiveAttribFn) getProcAddress("glGetActiveAttrib");
            GetActiveUniform = (GetActiveUniformFn) getProcAddress("glGetActiveUniform");
            GetAttachedShaders = (GetAttachedShadersFn) getProcAddress("glGetAttachedShaders");
            GetAttribLocation = (GetAttribLocationFn) getProcAddress("glGetAttribLocation");
            GetProgramiv = (GetProgramivFn) getProcAddress("glGetProgramiv");
            GetProgramInfoLog = (GetProgramInfoLogFn) getProcAddress("glGetProgramInfoLog");
            GetShaderiv = (GetShaderivFn) getProcAddress("glGetShaderiv");
            GetShaderInfoLog = (GetShaderInfoLogFn) getProcAddress("glGetShaderInfoLog");
            GetShaderSource = (GetShaderSourceFn) getProcAddress("glGetShaderSource");
            GetUniformLocation = (GetUniformLocationFn) getProcAddress("glGetUniformLocation");
            GetUniformfv = (GetUniformfvFn) getProcAddress("glGetUniformfv");
            GetUniformiv = (GetUniformivFn) getProcAddress("glGetUniformiv");
            GetVertexAttribdv = (GetVertexAttribdvFn) getProcAddress("glGetVertexAttribdv");
            GetVertexAttribfv = (GetVertexAttribfvFn) getProcAddress("glGetVertexAttribfv");
            GetVertexAttribiv = (GetVertexAttribivFn) getProcAddress("glGetVertexAttribiv");
            GetVertexAttribPointerv = (GetVertexAttribPointervFn) getProcAddress("glGetVertexAttribPointerv");
            IsProgram = (IsProgramFn) getProcAddress("glIsProgram");
            IsShader = (IsShaderFn) getProcAddress("glIsShader");
            LinkProgram = (LinkProgramFn) getProcAddress("glLinkProgram");
            ShaderSource = (ShaderSourceFn) getProcAddress("glShaderSource");
            UseProgram = (UseProgramFn) getProcAddress("glUseProgram");
            Uniform1f = (Uniform1fFn) getProcAddress("glUniform1f");
            Uniform2f = (Uniform2fFn) getProcAddress("glUniform2f");
            Uniform3f = (Uniform3fFn) getProcAddress("glUniform3f");
            Uniform4f = (Uniform4fFn) getProcAddress("glUniform4f");
            Uniform1i = (Uniform1iFn) getProcAddress("glUniform1i");
            Uniform2i = (Uniform2iFn) getProcAddress("glUniform2i");
            Uniform3i = (Uniform3iFn) getProcAddress("glUniform3i");
            Uniform4i = (Uniform4iFn) getProcAddress("glUniform4i");
            Uniform1fv = (Uniform1fvFn) getProcAddress("glUniform1fv");
            Uniform2fv = (Uniform2fvFn) getProcAddress("glUniform2fv");
            Uniform3fv = (Uniform3fvFn) getProcAddress("glUniform3fv");
            Uniform4fv = (Uniform4fvFn) getProcAddress("glUniform4fv");
            Uniform1iv = (Uniform1ivFn) getProcAddress("glUniform1iv");
            Uniform2iv = (Uniform2ivFn) getProcAddress("glUniform2iv");
            Uniform3iv = (Uniform3ivFn) getProcAddress("glUniform3iv");
            Uniform4iv = (Uniform4ivFn) getProcAddress("glUniform4iv");
            UniformMatrix2fv = (UniformMatrix2fvFn) getProcAddress("glUniformMatrix2fv");
            UniformMatrix3fv = (UniformMatrix3fvFn) getProcAddress("glUniformMatrix3fv");
            UniformMatrix4fv = (UniformMatrix4fvFn) getProcAddress("glUniformMatrix4fv");
            ValidateProgram = (ValidateProgramFn) getProcAddress("glValidateProgram");
            VertexAttrib1d = (VertexAttrib1dFn) getProcAddress("glVertexAttrib1d");
            VertexAttrib1dv = (VertexAttrib1dvFn) getProcAddress("glVertexAttrib1dv");
            VertexAttrib1f = (VertexAttrib1fFn) getProcAddress("glVertexAttrib1f");
            VertexAttrib1fv = (VertexAttrib1fvFn) getProcAddress("glVertexAttrib1fv");
            VertexAttrib1s = (VertexAttrib1sFn) getProcAddress("glVertexAttrib1s");
            VertexAttrib1sv = (VertexAttrib1svFn) getProcAddress("glVertexAttrib1sv");
            VertexAttrib2d = (VertexAttrib2dFn) getProcAddress("glVertexAttrib2d");
            VertexAttrib2dv = (VertexAttrib2dvFn) getProcAddress("glVertexAttrib2dv");
            VertexAttrib2f = (VertexAttrib2fFn) getProcAddress("glVertexAttrib2f");
            VertexAttrib2fv = (VertexAttrib2fvFn) getProcAddress("glVertexAttrib2fv");
            VertexAttrib2s = (VertexAttrib2sFn) getProcAddress("glVertexAttrib2s");
            VertexAttrib2sv = (VertexAttrib2svFn) getProcAddress("glVertexAttrib2sv");
            VertexAttrib3d = (VertexAttrib3dFn) getProcAddress("glVertexAttrib3d");
            VertexAttrib3dv = (VertexAttrib3dvFn) getProcAddress("glVertexAttrib3dv");
            VertexAttrib3f = (VertexAttrib3fFn) getProcAddress("glVertexAttrib3f");
            VertexAttrib3fv = (VertexAttrib3fvFn) getProcAddress("glVertexAttrib3fv");
            VertexAttrib3s = (VertexAttrib3sFn) getProcAddress("glVertexAttrib3s");
            VertexAttrib3sv = (VertexAttrib3svFn) getProcAddress("glVertexAttrib3sv");
            VertexAttrib4Nbv = (VertexAttrib4NbvFn) getProcAddress("glVertexAttrib4Nbv");
            VertexAttrib4Niv = (VertexAttrib4NivFn) getProcAddress("glVertexAttrib4Niv");
            VertexAttrib4Nsv = (VertexAttrib4NsvFn) getProcAddress("glVertexAttrib4Nsv");
            VertexAttrib4Nub = (VertexAttrib4NubFn) getProcAddress("glVertexAttrib4Nub");
            VertexAttrib4Nubv = (VertexAttrib4NubvFn) getProcAddress("glVertexAttrib4Nubv");
            VertexAttrib4Nuiv = (VertexAttrib4NuivFn) getProcAddress("glVertexAttrib4Nuiv");
            VertexAttrib4Nusv = (VertexAttrib4NusvFn) getProcAddress("glVertexAttrib4Nusv");
            VertexAttrib4bv = (VertexAttrib4bvFn) getProcAddress("glVertexAttrib4bv");
            VertexAttrib4d = (VertexAttrib4dFn) getProcAddress("glVertexAttrib4d");
            VertexAttrib4dv = (VertexAttrib4dvFn) getProcAddress("glVertexAttrib4dv");
            VertexAttrib4f = (VertexAttrib4fFn) getProcAddress("glVertexAttrib4f");
            VertexAttrib4fv = (VertexAttrib4fvFn) getProcAddress("glVertexAttrib4fv");
            VertexAttrib4iv = (VertexAttrib4ivFn) getProcAddress("glVertexAttrib4iv");
            VertexAttrib4s = (VertexAttrib4sFn) getProcAddress("glVertexAttrib4s");
            VertexAttrib4sv = (VertexAttrib4svFn) getProcAddress("glVertexAttrib4sv");
            VertexAttrib4ubv = (VertexAttrib4ubvFn) getProcAddress("glVertexAttrib4ubv");
            VertexAttrib4uiv = (VertexAttrib4uivFn) getProcAddress("glVertexAttrib4uiv");
            VertexAttrib4usv = (VertexAttrib4usvFn) getProcAddress("glVertexAttrib4usv");
            VertexAttribPointer = (VertexAttribPointerFn) getProcAddress("glVertexAttribPointer");
            UniformMatrix2x3fv = (UniformMatrix2x3fvFn) getProcAddress("glUniformMatrix2x3fv");
            UniformMatrix3x2fv = (UniformMatrix3x2fvFn) getProcAddress("glUniformMatrix3x2fv");
            UniformMatrix2x4fv = (UniformMatrix2x4fvFn) getProcAddress("glUniformMatrix2x4fv");
            UniformMatrix4x2fv = (UniformMatrix4x2fvFn) getProcAddress("glUniformMatrix4x2fv");
            UniformMatrix3x4fv = (UniformMatrix3x4fvFn) getProcAddress("glUniformMatrix3x4fv");
            UniformMatrix4x3fv = (UniformMatrix4x3fvFn) getProcAddress("glUniformMatrix4x3fv");
            ColorMaski = (ColorMaskiFn) getProcAddress("glColorMaski");
            GetBooleani_v = (GlGetBooleani_v) getProcAddress("GetBooleani_v");
            GetIntegeri_v = (GlGetIntegeri_v) getProcAddress("GetIntegeri_v");
            Enablei = (EnableiFn) getProcAddress("glEnablei");
            Disablei = (DisableiFn) getProcAddress("glDisablei");
            IsEnabledi = (IsEnablediFn) getProcAddress("glIsEnabledi");
            BeginTransformFeedback = (BeginTransformFeedbackFn) getProcAddress("glBeginTransformFeedback");
            EndTransformFeedback = (EndTransformFeedbackFn) getProcAddress("glEndTransformFeedback");
            BindBufferRange = (BindBufferRangeFn) getProcAddress("glBindBufferRange");
            BindBufferBase = (BindBufferBaseFn) getProcAddress("glBindBufferBase");
            TransformFeedbackVaryings = (TransformFeedbackVaryingsFn) getProcAddress("glTransformFeedbackVaryings");
            GetTransformFeedbackVarying = (GetTransformFeedbackVaryingFn) getProcAddress("glGetTransformFeedbackVarying");
            ClampColor = (ClampColorFn) getProcAddress("glClampColor");
            BeginConditionalRender = (BeginConditionalRenderFn) getProcAddress("glBeginConditionalRender");
            EndConditionalRender = (EndConditionalRenderFn) getProcAddress("glEndConditionalRender");
            VertexAttribIPointer = (GlVertexAttribIPointer) getProcAddress("VertexAttribIPointer");
            GetVertexAttribIiv = (GetVertexAttribIivFn) getProcAddress("glGetVertexAttribIiv");
            GetVertexAttribIuiv = (GetVertexAttribIuivFn) getProcAddress("glGetVertexAttribIuiv");
            VertexAttribI1i = (VertexAttribI1iFn) getProcAddress("glVertexAttribI1i");
            VertexAttribI2i = (VertexAttribI2iFn) getProcAddress("glVertexAttribI2i");
            VertexAttribI3i = (VertexAttribI3iFn) getProcAddress("glVertexAttribI3i");
            VertexAttribI4i = (VertexAttribI4iFn) getProcAddress("glVertexAttribI4i");
            VertexAttribI1ui = (VertexAttribI1uiFn) getProcAddress("glVertexAttribI1ui");
            VertexAttribI2ui = (VertexAttribI2uiFn) getProcAddress("glVertexAttribI2ui");
            VertexAttribI3ui = (VertexAttribI3uiFn) getProcAddress("glVertexAttribI3ui");
            VertexAttribI4ui = (VertexAttribI4uiFn) getProcAddress("glVertexAttribI4ui");
            VertexAttribI1iv = (VertexAttribI1ivFn) getProcAddress("glVertexAttribI1iv");
            VertexAttribI2iv = (VertexAttribI2ivFn) getProcAddress("glVertexAttribI2iv");
            VertexAttribI3iv = (VertexAttribI3ivFn) getProcAddress("glVertexAttribI3iv");
            VertexAttribI4iv = (VertexAttribI4ivFn) getProcAddress("glVertexAttribI4iv");
            VertexAttribI1uiv = (VertexAttribI1uivFn) getProcAddress("glVertexAttribI1uiv");
            VertexAttribI2uiv = (VertexAttribI2uivFn) getProcAddress("glVertexAttribI2uiv");
            VertexAttribI3uiv = (VertexAttribI3uivFn) getProcAddress("glVertexAttribI3uiv");
            VertexAttribI4uiv = (VertexAttribI4uivFn) getProcAddress("glVertexAttribI4uiv");
            VertexAttribI4bv = (VertexAttribI4bvFn) getProcAddress("glVertexAttribI4bv");
            VertexAttribI4sv = (VertexAttribI4svFn) getProcAddress("glVertexAttribI4sv");
            VertexAttribI4ubv = (VertexAttribI4ubvFn) getProcAddress("glVertexAttribI4ubv");
            VertexAttribI4usv = (VertexAttribI4usvFn) getProcAddress("glVertexAttribI4usv");
            GetUniformuiv = (GetUniformuivFn) getProcAddress("glGetUniformuiv");
            BindFragDataLocation = (BindFragDataLocationFn) getProcAddress("glBindFragDataLocation");
            GetFragDataLocation = (GetFragDataLocationFn) getProcAddress("glGetFragDataLocation");
            Uniform1ui = (Uniform1uiFn) getProcAddress("glUniform1ui");
            Uniform2ui = (Uniform2uiFn) getProcAddress("glUniform2ui");
            Uniform3ui = (Uniform3uiFn) getProcAddress("glUniform3ui");
            Uniform4ui = (Uniform4uiFn) getProcAddress("glUniform4ui");
            Uniform1uiv = (Uniform1uivFn) getProcAddress("glUniform1uiv");
            Uniform2uiv = (Uniform2uivFn) getProcAddress("glUniform2uiv");
            Uniform3uiv = (Uniform3uivFn) getProcAddress("glUniform3uiv");
            Uniform4uiv = (Uniform4uivFn) getProcAddress("glUniform4uiv");
            TexParameterIiv = (TexParameterIivFn) getProcAddress("glTexParameterIiv");
            TexParameterIuiv = (TexParameterIuivFn) getProcAddress("glTexParameterIuiv");
            GetTexParameterIiv = (GetTexParameterIivFn) getProcAddress("glGetTexParameterIiv");
            GetTexParameterIuiv = (GetTexParameterIuivFn) getProcAddress("glGetTexParameterIuiv");
            ClearBufferiv = (ClearBufferivFn) getProcAddress("glClearBufferiv");
            ClearBufferuiv = (ClearBufferuivFn) getProcAddress("glClearBufferuiv");
            ClearBufferfv = (ClearBufferfvFn) getProcAddress("glClearBufferfv");
            ClearBufferfi = (ClearBufferfiFn) getProcAddress("glClearBufferfi");
            GetStringi = (GetStringiFn) getProcAddress("glGetStringi");
            IsRenderbuffer = (IsRenderbufferFn) getProcAddress("glIsRenderbuffer");
            BindRenderbuffer = (BindRenderbufferFn) getProcAddress("glBindRenderbuffer");
            DeleteRenderbuffers = (DeleteRenderbuffersFn) getProcAddress("glDeleteRenderbuffers");
            GenRenderbuffers = (GenRenderbuffersFn) getProcAddress("glGenRenderbuffers");
            RenderbufferStorage = (RenderbufferStorageFn) getProcAddress("glRenderbufferStorage");
            GetRenderbufferParameteriv = (GetRenderbufferParameterivFn) getProcAddress("glGetRenderbufferParameteriv");
            IsFramebuffer = (IsFramebufferFn) getProcAddress("glIsFramebuffer");
            BindFramebuffer = (BindFramebufferFn) getProcAddress("glBindFramebuffer");
            DeleteFramebuffers = (DeleteFramebuffersFn) getProcAddress("glDeleteFramebuffers");
            GenFramebuffers = (GenFramebuffersFn) getProcAddress("glGenFramebuffers");
            CheckFramebufferStatus = (CheckFramebufferStatusFn) getProcAddress("glCheckFramebufferStatus");
            FramebufferTexture1D = (FramebufferTexture1DFn) getProcAddress("glFramebufferTexture1D");
            FramebufferTexture2D = (FramebufferTexture2DFn) getProcAddress("glFramebufferTexture2D");
            FramebufferTexture3D = (FramebufferTexture3DFn) getProcAddress("glFramebufferTexture3D");
            FramebufferRenderbuffer = (FramebufferRenderbufferFn) getProcAddress("glFramebufferRenderbuffer");
            GetFramebufferAttachmentParameteriv = (GetFramebufferAttachmentParameterivFn) getProcAddress("glGetFramebufferAttachmentParameteriv");
            GenerateMipmap = (GenerateMipmapFn) getProcAddress("glGenerateMipmap");
            BlitFramebuffer = (BlitFramebufferFn) getProcAddress("glBlitFramebuffer");
            RenderbufferStorageMultisample = (RenderbufferStorageMultisampleFn) getProcAddress("glRenderbufferStorageMultisample");
            FramebufferTextureLayer = (FramebufferTextureLayerFn) getProcAddress("glFramebufferTextureLayer");
            MapBufferRange = (MapBufferRangeFn) getProcAddress("glMapBufferRange");
            FlushMappedBufferRange = (FlushMappedBufferRangeFn) getProcAddress("glFlushMappedBufferRange");
            BindVertexArray = (BindVertexArrayFn) getProcAddress("glBindVertexArray");
            DeleteVertexArrays = (DeleteVertexArraysFn) getProcAddress("glDeleteVertexArrays");
            GenVertexArrays = (GenVertexArraysFn) getProcAddress("glGenVertexArrays");
            IsVertexArray = (IsVertexArrayFn) getProcAddress("glIsVertexArray");
            DrawArraysInstanced = (DrawArraysInstancedFn) getProcAddress("glDrawArraysInstanced");
            DrawElementsInstanced = (DrawElementsInstancedFn) getProcAddress("glDrawElementsInstanced");
            TexBuffer = (TexBufferFn) getProcAddress("glTexBuffer");
            PrimitiveRestartIndex = (PrimitiveRestartIndexFn) getProcAddress("glPrimitiveRestartIndex");
            CopyBufferSubData = (CopyBufferSubDataFn) getProcAddress("glCopyBufferSubData");
            GetUniformIndices = (GetUniformIndicesFn) getProcAddress("glGetUniformIndices");
            GetActiveUniformsiv = (GetActiveUniformsivFn) getProcAddress("glGetActiveUniformsiv");
            GetActiveUniformName = (GetActiveUniformNameFn) getProcAddress("glGetActiveUniformName");
            GetUniformBlockIndex = (GetUniformBlockIndexFn) getProcAddress("glGetUniformBlockIndex");
            GetActiveUniformBlockiv = (GetActiveUniformBlockivFn) getProcAddress("glGetActiveUniformBlockiv");
            GetActiveUniformBlockName = (GetActiveUniformBlockNameFn) getProcAddress("glGetActiveUniformBlockName");
            UniformBlockBinding = (UniformBlockBindingFn) getProcAddress("glUniformBlockBinding");
            DrawElementsBaseVertex = (DrawElementsBaseVertexFn) getProcAddress("glDrawElementsBaseVertex");
            DrawRangeElementsBaseVertex = (DrawRangeElementsBaseVertexFn) getProcAddress("glDrawRangeElementsBaseVertex");
            DrawElementsInstancedBaseVertex = (DrawElementsInstancedBaseVertexFn) getProcAddress("glDrawElementsInstancedBaseVertex");
            MultiDrawElementsBaseVertex = (MultiDrawElementsBaseVertexFn) getProcAddress("glMultiDrawElementsBaseVertex");
            ProvokingVertex = (ProvokingVertexFn) getProcAddress("glProvokingVertex");
            FenceSync = (FenceSyncFn) getProcAddress("glFenceSync");
            IsSync = (IsSyncFn) getProcAddress("glIsSync");
            DeleteSync = (DeleteSyncFn) getProcAddress("glDeleteSync");
            ClientWaitSync = (ClientWaitSyncFn) getProcAddress("glClientWaitSync");
            WaitSync = (WaitSyncFn) getProcAddress("glWaitSync");
            GetInteger64v = (GetInteger64vFn) getProcAddress("glGetInteger64v");
            GetSynciv = (GetSyncivFn) getProcAddress("glGetSynciv");
            GetInteger64i_v = (GlGetInteger64i_v) getProcAddress("GetInteger64i_v");
            GetBufferParameteri64v = (GetBufferParameteri64vFn) getProcAddress("glGetBufferParameteri64v");
            FramebufferTexture = (FramebufferTextureFn) getProcAddress("glFramebufferTexture");
            TexImage2DMultisample = (GlTexImage2DMultisample) getProcAddress("TexImage2DMultisample");
            TexImage3DMultisample = (GlTexImage3DMultisample) getProcAddress("TexImage3DMultisample");
            GetMultisamplefv = (GetMultisamplefvFn) getProcAddress("glGetMultisamplefv");
            SampleMaski = (SampleMaskiFn) getProcAddress("glSampleMaski");
            BindFragDataLocationIndexed = (BindFragDataLocationIndexedFn) getProcAddress("glBindFragDataLocationIndexed");
            GetFragDataIndex = (GetFragDataIndexFn) getProcAddress("glGetFragDataIndex");
            GenSamplers = (GenSamplersFn) getProcAddress("glGenSamplers");
            DeleteSamplers = (DeleteSamplersFn) getProcAddress("glDeleteSamplers");
            IsSampler = (IsSamplerFn) getProcAddress("glIsSampler");
            BindSampler = (BindSamplerFn) getProcAddress("glBindSampler");
            SamplerParameteri = (SamplerParameteriFn) getProcAddress("glSamplerParameteri");
            SamplerParameteriv = (SamplerParameterivFn) getProcAddress("glSamplerParameteriv");
            SamplerParameterf = (SamplerParameterfFn) getProcAddress("glSamplerParameterf");
            SamplerParameterfv = (SamplerParameterfvFn) getProcAddress("glSamplerParameterfv");
            SamplerParameterIiv = (SamplerParameterIivFn) getProcAddress("glSamplerParameterIiv");
            SamplerParameterIuiv = (SamplerParameterIuivFn) getProcAddress("glSamplerParameterIuiv");
            GetSamplerParameteriv = (GetSamplerParameterivFn) getProcAddress("glGetSamplerParameteriv");
            GetSamplerParameterIiv = (GetSamplerParameterIivFn) getProcAddress("glGetSamplerParameterIiv");
            GetSamplerParameterfv = (GetSamplerParameterfvFn) getProcAddress("glGetSamplerParameterfv");
            GetSamplerParameterIuiv = (GetSamplerParameterIuivFn) getProcAddress("glGetSamplerParameterIuiv");
            QueryCounter = (QueryCounterFn) getProcAddress("glQueryCounter");
            GetQueryObjecti64v = (GetQueryObjecti64vFn) getProcAddress("glGetQueryObjecti64v");
            GetQueryObjectui64v = (GetQueryObjectui64vFn) getProcAddress("glGetQueryObjectui64v");
            VertexAttribDivisor = (VertexAttribDivisorFn) getProcAddress("glVertexAttribDivisor");
            VertexAttribP1ui = (VertexAttribP1uiFn) getProcAddress("glVertexAttribP1ui");
            VertexAttribP1uiv = (VertexAttribP1uivFn) getProcAddress("glVertexAttribP1uiv");
            VertexAttribP2ui = (VertexAttribP2uiFn) getProcAddress("glVertexAttribP2ui");
            VertexAttribP2uiv = (VertexAttribP2uivFn) getProcAddress("glVertexAttribP2uiv");
            VertexAttribP3ui = (VertexAttribP3uiFn) getProcAddress("glVertexAttribP3ui");
            VertexAttribP3uiv = (VertexAttribP3uivFn) getProcAddress("glVertexAttribP3uiv");
            VertexAttribP4ui = (VertexAttribP4uiFn) getProcAddress("glVertexAttribP4ui");
            VertexAttribP4uiv = (VertexAttribP4uivFn) getProcAddress("glVertexAttribP4uiv");

			return .Ok;
        }
    }
}
