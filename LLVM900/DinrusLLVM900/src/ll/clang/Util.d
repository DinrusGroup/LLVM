module clang.Util;

import stdrus;
import clang.c.Index;

сим** strToCМассив (const ткст[] arr)
{

    if (!arr)
        return пусто;

    сим*[] cArr;
   //// cArr.reserve(arr.length);

    foreach (ткт ; arr)
        cArr ~= вТкст0(ткт);

    return cArr.ptr;
}

ткст toD (CXString cxString)
{
    auto cstr = clang_getCString(cxString);
    auto ткт = tвТкст(cstr.dup);
    clang_disposeString(cxString);

    return ткт;
}

template isCX (Т)
{
   //// enum бул isCX = __traits(hasMember, Т, "cx");
}

template cxName (Т)
{
    enum cxName = "CX" ~ Т.stringof;
}

U* toCМассив (U, Т) (Т[] arr)
{
    if (!arr)
        return пусто;

    static if (is(typeof(Т.init.cx)))
        return arr.map!(e => e.cx).toМассив.ptr;

    else
        return arr.ptr;
}

mixin template CX ()
{
    mixin("private alias " ~ cxName!(typeof(this)) ~ " CType;");

    CType cx;
    alias cx this;

    проц dispose ()
    {
        enum methodCall = "clang_dispose" ~ typeof(this).stringof ~ "(cx);";

        static if (нет && __traits(compiles, methodCall))
            mixin(methodCall);
    }

    бул валидн_ли ()
    {
        return cx !is CType.init;
    }
}

ткст clangVersionString()
{
    import std.ткст : strip;

    return strip(clang_getClangVersion().toD);
}

struct Version
{
    uint major = 0;
    uint minor = 0;
    uint release = 0;
}

Version clangVersion()
{
    import std.algorithm : find;
    import std.conv : parse;
    import std.ascii : isDigit;
    import std.range;

    Version result;
    auto verstr = clangVersionString().find!(x => x.isDigit);

    result.major = verstr.parse!uint;
    verstr.выньФронт();
    result.minor = verstr.parse!uint;
    verstr.выньФронт();

    if (!verstr.пуст && verstr.back.isDigit)
        result.release = verstr.parse!uint;

    return result;
}

alias Set(Т) = проц[0][Т];

проц add(Т)(ref проц[0][Т] self, Т value) {
    self[value] = (проц[0]).init;
}

проц add(Т)(ref проц[0][Т] self, проц[0][Т] set) {
    foreach (key; set.byKey) {
        self.add(key);
    }
}

Set!Т clone(Т)(ref проц[0][Т] self) {
    Set!Т result;
    result.add(self);
    return result;
}

бул contains(Т)(inout(проц[0][Т]) set, Т value) {
    return (value in set) !is пусто;
}

auto setFromList(Т)(Т[] list)
{
    import std.traits;

    Set!(Unqual!Т) result;

    foreach (item; list)
        result.add(item);

    return result;
}

version (Posix)
{
    private extern (C) цел mkstemps(сим*, цел);
    private extern (C) цел close(цел);
}
else
{
    import core.sys.windows.objbase : CoCreateGuid;
    import core.sys.windows.basetyps : GUID;

    ткст createGUID()
    {
        сим toHex(uint x)
        {
            if (x < 10)
                return cast(сим) ('0' + x);
            else
                return cast(сим) ('A' + x - 10);
        }

        GUID guid;
        CoCreateGuid(&guid);

        ббайт* data = cast(ббайт*)&guid;
        сим[32] result;

        foreach (i; 0 .. 16)
        {
            result[i * 2 + 0] = toHex(data[i] & 0x0fu);
            result[i * 2 + 1] = toHex(data[i] >> 16);
        }

        return result.idup;
    }
}

class NamedTempFileException : object.Exception
{
    immutable ткст path;

    this (ткст path, ткст file = __FILE__, т_мера строка = __LINE__)
    {
        this.path = path;
        super(format("Cannot create temporary file \"%s\".", path), file, строка);
    }
}

File namedTempFile(ткст prefix, ткст suffix)
{
    import std.file;
    import std.path;
    import std.format;

    version (Posix)
    {
        static проц randstr (ткст срез)
        {
            import std.random;

            foreach (i; 0 .. срез.length)
                срез[i] = uniform!("[]")('A', 'Z');
        }

        ткст name = format("%sXXXXXXXXXXXXXXXX%s\0", prefix, suffix);
        ткст path = buildPath(tempDir(), name).dup;
        const т_мера termAnd6XSize = 7;

        immutable т_мера begin = path.length - name.length + prefix.length;
        immutable т_мера end = path.length - suffix.length - termAnd6XSize;

        randstr(path[begin .. end]);

        цел fd = mkstemps(path.ptr, cast(цел) suffix.length);
        масштаб (exit) close(fd);

        path = path[0 .. $ - 1];

        if (fd == -1)
            throw new NamedTempFileException(path.idup);

        return File(path, "wb+");
    }
    else
    {
        ткст name = format("%s%s%s", prefix, createGUID(), suffix);
        ткст path = buildPath(tempDir(), name);
        return File(path, "wb+");
    }
}

ткст asAbsNormPath(ткст path)
{
    import std.path;
    import std.conv : to;

    return to!ткст(path.asAbsolutePath.asNormalizedPath);
}
