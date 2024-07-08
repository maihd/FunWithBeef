Beef in the view of Modern C
============================

By [design](https://www.beeflang.org/docs/foreward/), Beef values simplicity, code readability, fast development iteration, and good debuggability. Which are much like C in common. And also support low-friction interop with C.


First of all, Beef easily interop C code
----------------------------------------
Usable system language can be completed without C interop, because of its stable ABI (maybe claim as standard), and many existing libraries and frameworks written on it. So from the beginning, Beef chose this path, make sure it have good [C interop support](https://www.beeflang.org/docs/language-guide/interop/). And now that a main features to make program with Beef. You can call C function without the need of PInvoke, can pass struct by value or pointer without any conversion, C-like array, calling convention, and so on. Sections below will talking about how to use Modern C coding style apply to Beef, without the need of OOP features.


Struct are pass-by-values, plain old datas
------------------------------------------
[Struct in Beef](https://www.beeflang.org/docs/language-guide/datatypes/#structs) are similar to C, the main difference is have difference layout, but can mark [CRepr] to make full C compatible. The goods is struct can have methods, properties, operators overloading helping work with struct easier (but should limit to what are really needed to contains in struct). Please not Struct in Beef members is not public accessible by default.

```Beef
[CRepr]
struct Vector3
{
    public float x;
    public float y;
    public float z;
}
```


Fixed-sized primitives in language level
----------------------------------------
In Modern C program, we were encouraged to use fixed-size primitives, but will to include headers, and no one will use the same name of fixed-size primitives, sometime `uint32_t`, sometime `u32`. But Beef so this problem by simply provide fixed-size primitives in language level. The tables below compare name-to-name from Beef to C.

| Beef   | Beef C Interop | C                  | C stdint.h |
|--------|----------------|--------------------|------------|
| int8   | c_char         | char               | int8_t     |
| uint8  | c_uchar        | unsigned char      | uint8_t    |
| int16  | c_short        | short              | int16_t    |
| uint16 | c_ushort       | unsigned short     | uint16_t   |
| int32  | c_int          | int                | int32_t    |
| uint32 | c_uchar        | unsigned int       | uint32_t   |
| int64  | c_longlong     | long long          | int64_t    |
| uint64 | c_ulonglong    | unsigned long long | uint64_t   |
| float  | float          | float              | float      |
| double | double         | double             | double     |


