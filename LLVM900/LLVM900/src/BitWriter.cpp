

extern "C" {

#include "Header.h"

    /*===-- Operations on modules ---------------------------------------------===*/

    LLEXPORT цел ЛЛПишиБиткодВФайл(ЛЛМодуль M, const char* Path) {
        return LLVMWriteBitcodeToFile(M, Path);
    }

    LLEXPORT цел ЛЛПишиБиткодВФД(ЛЛМодуль M, цел FD, цел ShouldClose,
        цел Unbuffered) {

        return LLVMWriteBitcodeToFD(M, FD, ShouldClose, Unbuffered);
    }

    LLEXPORT цел ЛЛПишиБиткодВФайлУк(ЛЛМодуль M, цел FileHandle) {
        return LLVMWriteBitcodeToFD(M, FileHandle, true, false);
    }

    LLEXPORT ЛЛБуферПамяти ЛЛПишиБиткодВБуфПамяти(ЛЛМодуль M) {
        return LLVMWriteBitcodeToMemoryBuffer(M);
    }
}