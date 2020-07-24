﻿module ll.api.CallingConvention;

     enum CallingConv : uint
    {
        C = 0,
        Fast = 8,
        Cold = 9,
        GHC = 10,
        HiPE = 11,
        WebKitJS = 12,
        AnyReg = 13,
        PreserveMost = 14,
        PreserveAll = 15,
        Swift = 16,
        CXXFastTLS = 17,
        FirstTargetCC = 64,
        X86Stdcall = 64,
        X86Fastcall = 65,
        ARMAPCS = 66,
        ARMAAPCS = 67,
        ARMAAPCSVFP = 68,
        MSP430INTR = 69,
        X86ThisCall = 70,
        PTXKernel = 71,
        PTXDevice = 72,
        SPIRFUNC = 75,
        SPIRKERNEL = 76,
        IntelOCLBI = 77,
        X8664SysV = 78,
        Win64 = 79,
        X86VectorCall = 80,
        HHMV = 81,
        HHMVC = 82,
        X86INSTR = 83,
        AVRINSTR = 84,
        AVRSIGNAL = 85,
        AVRBUILTIN = 86,
        AMDGPUVS = 87,
        AMDGPUGS = 88,
        AMDGPUPS = 89,
        AMDGPUCS = 90,
        AMDGPUKERNEL = 91,
        X86RegCall = 92,
        AMDGPUHS = 93,
        MSP430BUILTIN = 94,
        AMDGPULS = 95,
        AMDGPUES = 96,
        MaxID = 1023,
    }

