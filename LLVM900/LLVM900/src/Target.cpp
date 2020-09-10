

extern "C" {
#include "Header.h"

/** LLVMInitializeAllTargetInfos - The main program should call this function if
    it wants access to all available targets that LLVM is configured to
    support. */
LLEXPORT void ЛЛНициализуйВсеИнфОЦели(void) {
LLVMInitializeAllTargetInfos();
}

/** LLVMInitializeAllTargets - The main program should call this function if it
    wants to link in all available targets that LLVM is configured to
    support. */
LLEXPORT void ЛЛНициализуйВсеЦели(void) {
LLVMInitializeAllTargets();
}

/** LLVMInitializeAllTargetMCs - The main program should call this function if
    it wants access to all available target MC that LLVM is configured to
    support. */
LLEXPORT void ЛЛНициализуйВсеЦелевыеМК(void) {
LLVMInitializeAllTargetMCs();
}

/** LLVMInitializeAllAsmPrinters - The main program should call this function if
    it wants all asm printers that LLVM is configured to support, to make them
    available via the TargetRegistry. */
LLEXPORT void ЛЛНициализуйВсеАсмПринтеры(void) {
LLVMInitializeAllAsmPrinters();
}

/** LLVMInitializeAllAsmParsers - The main program should call this function if
    it wants all asm parsers that LLVM is configured to support, to make them
    available via the TargetRegistry. */
LLEXPORT void ЛЛНициализуйВсеАсмПарсеры(void) {
LLVMInitializeAllAsmParsers();
}

/** LLVMInitializeAllDisassemblers - The main program should call this function
    if it wants all disassemblers that LLVM is configured to support, to make
    them available via the TargetRegistry. */
LLEXPORT void ЛЛНициализуйВсеДизассемблеры(void) {
LLVMInitializeAllDisassemblers();
}

/** LLVMInitializeNativeTarget - The main program should call this function to
    initialize the native target corresponding to the host.  This is useful
    for JIT applications to ensure that the target gets linked in correctly. */
LLEXPORT LLVMBool ЛЛИнициализуйНативныйТаргет(void) {
return LLVMInitializeNativeTarget();
}

/** LLVMInitializeNativeTargetAsmParser - The main program should call this
    function to initialize the parser for the native target corresponding to the
    host. */
LLEXPORT LLVMBool ЛЛИнициализуйНативныйАсмПарсер(void) {
return LLVMInitializeNativeAsmParser();
}

/** LLVMInitializeNativeTargetAsmPrinter - The main program should call this
    function to initialize the printer for the native target corresponding to
    the host. */
LLEXPORT LLVMBool ЛЛИнициализуйНативныйАсмПринтер(void) {
return LLVMInitializeNativeAsmPrinter();
}

/** LLVMInitializeNativeTargetDisassembler - The main program should call this
    function to initialize the disassembler for the native target corresponding
    to the host. */
LLEXPORT LLVMBool ЛЛИнициализуйНативныйДизассемблер(void) {
return LLVMInitializeNativeDisassembler();
}

/*===-- Target Data -------------------------------------------------------===*/

/**
 * Obtain the data layout for a module.
 *
 * @see Module::getDataLayout()
 */
LLEXPORT ЛЛДанныеОЦели ЛЛДайРаскладкуДанныхМодуля(ЛЛМодуль M) {
    return LLVMGetModuleDataLayout(M);
}

/**
 * Set the data layout for a module.
 *
 * @see Module::setDataLayout()
 */
LLEXPORT void ЛЛУстРаскладкуДанныхМодуля(ЛЛМодуль M, ЛЛДанныеОЦели DL) {
     LLVMSetModuleDataLayout(M, DL);
}

/** Creates target data from a target layout string.
    See the constructor llvm::DataLayout::DataLayout. */
LLEXPORT ЛЛДанныеОЦели ЛЛСоздайДанОЦели(ткст0 StringRep) {
    return LLVMCreateTargetData(StringRep);
}

/** Deallocates a TargetData.
    See the destructor llvm::DataLayout::~DataLayout. */
LLEXPORT void ЛЛВыместиДанОЦели(ЛЛДанныеОЦели TD) {
    LLVMDisposeTargetData(TD);
}

/** Adds target library information to a pass manager. This does not take
    ownership of the target library info.
    See the method llvm::PassManagerBase::add. */
LLEXPORT void ЛЛДобавьИнфОЦБиб(ЛЛИнфоЦелевойБиблиотеки TLI,
                              ЛЛМенеджерПроходок PM) {
    LLVMAddTargetLibraryInfo( (LLVMTargetLibraryInfoRef) TLI, PM);
}
/** Converts target data to a target layout string. The string must be disposed
    with LLVMDisposeMessage.
    See the constructor llvm::DataLayout::DataLayout. */
LLEXPORT char *ЛЛКопируйТкстПредстДанОЦели(ЛЛДанныеОЦели TD) {
    return LLVMCopyStringRepOfTargetData(TD);
}

/** Returns the byte order of a target, either LLVMBigEndian or
    LLVMLittleEndian.
    See the method llvm::DataLayout::isLittleEndian. */
LLEXPORT enum LLVMByteOrdering ЛЛПорядокБайт(ЛЛДанныеОЦели TD) {
    return LLVMByteOrder(TD);
}

/** Returns the pointer size in bytes for a target.
    See the method llvm::DataLayout::getPointerSize. */
LLEXPORT unsigned ЛЛРазмУкз(ЛЛДанныеОЦели TD) {
    return LLVMPointerSize(TD);
}

/** Returns the pointer size in bytes for a target for a specified
    address space.
    See the method llvm::DataLayout::getPointerSize. */
LLEXPORT unsigned ЛЛРазмУкзДляАП(ЛЛДанныеОЦели TD, unsigned AS) {
    return LLVMPointerSizeForAS( TD,  AS);
}
/** Returns the integer type that is the same size as a pointer on a target.
    See the method llvm::DataLayout::getIntPtrType. */
LLEXPORT ЛЛТип ЛЛТипЦелУкз(ЛЛДанныеОЦели  TD) {
    return LLVMIntPtrType(TD);
}
/** Returns the integer type that is the same size as a pointer on a target.
    This version allows the address space to be specified.
    See the method llvm::DataLayout::getIntPtrType. */
LLEXPORT ЛЛТип ЛЛТипЦелУкзДляАП(ЛЛДанныеОЦели  TD, unsigned AS) {
    return LLVMIntPtrTypeForAS( TD, AS);
}
/** Returns the integer type that is the same size as a pointer on a target.
    See the method llvm::DataLayout::getIntPtrType. */
LLEXPORT ЛЛТип ЛЛТипЦелУкзВКонтексте(ЛЛКонтекст C, ЛЛДанныеОЦели TD) {
    return LLVMIntPtrTypeInContext(C, TD);
}
/** Returns the integer type that is the same size as a pointer on a target.
    This version allows the address space to be specified.
    See the method llvm::DataLayout::getIntPtrType. */
ЛЛТип ЛЛТипЦелУкзДляАПВКонтексте(ЛЛКонтекст C, ЛЛДанныеОЦели TD,
                                         unsigned AS) {
    return LLVMIntPtrTypeForASInContext(C,  TD, AS);
}

/** Вычисляет размер типа в битах для цели.
    See the method llvm::DataLayout::getTypeSizeInBits. */
LLEXPORT unsigned long long ЛЛРазмТипаВБитах(ЛЛДанныеОЦели  TD,ЛЛТип Ty) {
    return LLVMSizeOfTypeInBits(TD, Ty);
}
/** Вычисляет размер хранения типа в битах для цели.
    See the method llvm::DataLayout::getTypeStoreSize. */
LLEXPORT unsigned long long ЛЛРазмХранТипа(ЛЛДанныеОЦели TD, ЛЛТип Ty) {
    return LLVMStoreSizeOfType( TD, Ty) ;
}

/** Вычисляет размер ABI типа в байтах для цели.
    See the method llvm::DataLayout::getTypeAllocSize. */
LLEXPORT unsigned long long ЛЛДИПРазмТипа(ЛЛДанныеОЦели TD, ЛЛТип Ty) {
    return LLVMABISizeOfType(TD, Ty);
}
/** Вычисляет раскладку ABI типа в байтах для цели.
    See the method llvm::DataLayout::getTypeABISize. */
LLEXPORT unsigned ЛЛДИПРаскладкаТипа(ЛЛДанныеОЦели TD, ЛЛТип Ty) {
    return LLVMABIAlignmentOfType( TD, Ty);
}

/** Вычисляет раскладку фрейма вызова типа в байтах для цели.
    See the method llvm::DataLayout::getTypeABISize. */
LLEXPORT unsigned ЛЛРаскладкаФреймаВызДляТипа(ЛЛДанныеОЦели TD, ЛЛТип Ty) {
    return LLVMCallFrameAlignmentOfType( TD,  Ty);
}
/** Вычисляет предпочитаемую раскладку типа в байтах для цели.
    See the method llvm::DataLayout::getTypeABISize. */
LLEXPORT unsigned ЛЛПредпочтРаскладкаТипа(ЛЛДанныеОЦели TD,ЛЛТип Ty) {
    return LLVMPreferredAlignmentOfType( TD,  Ty);
}

/** Computes the preferred alignment of a global variable in bytes for a target.
    See the method llvm::DataLayout::getPreferredAlignment. */
LLEXPORT unsigned ЛЛПредпочтРаскладкаГлоба(ЛЛДанныеОЦели  TD,
                                        ЛЛЗначение GlobalVar) {
    return LLVMPreferredAlignmentOfGlobal( TD, GlobalVar);
}

/** Computes the structure element that contains the byte offset for a target.
    See the method llvm::StructLayout::getElementContainingOffset. */
LLEXPORT unsigned ЛЛЭлтПоСмещ(ЛЛДанныеОЦели TD, ЛЛТип StructTy,
                             unsigned long long Offset) {
    return LLVMElementAtOffset(TD,  StructTy, Offset);
}
/** Computes the byte offset of the indexed struct element for a target.
    See the method llvm::StructLayout::getElementContainingOffset. */
LLEXPORT unsigned long long ЛЛСмещЭлта(ЛЛДанныеОЦели TD,
                                       ЛЛТип StructTy, unsigned Element) {
    return LLVMOffsetOfElement(TD, StructTy,  Element);
}

/**
 * @}
 */
LLEXPORT void LLInitializeAArch64Target() { LLVMInitializeAArch64Target(); }
LLEXPORT void LLInitializeAArch64TargetInfo() { LLVMInitializeAArch64TargetInfo(); }
LLEXPORT void LLInitializeAArch64TargetMC() { LLVMInitializeAArch64TargetMC(); }
LLEXPORT void LLInitializeAArch64AsmPrinter() { LLVMInitializeAArch64AsmPrinter(); }
LLEXPORT void LLInitializeAArch64AsmParser() { LLVMInitializeAArch64AsmParser(); }
LLEXPORT void LLInitializeAArch64Disassembler() { LLVMInitializeAArch64Disassembler(); }

LLEXPORT void LLInitializeARMTarget() { LLVMInitializeARMTarget(); }
LLEXPORT void LLInitializeARMTargetInfo() { LLVMInitializeARMTargetInfo(); }
LLEXPORT void LLInitializeARMTargetMC() { LLVMInitializeARMTargetMC(); }
LLEXPORT void LLInitializeARMAsmPrinter() { LLVMInitializeARMAsmPrinter(); }
LLEXPORT void LLInitializeARMAsmParser() { LLVMInitializeARMAsmParser(); }
LLEXPORT void LLInitializeARMDisassembler() { LLVMInitializeARMDisassembler(); }

LLEXPORT void LLInitializeHexagonTarget() { LLVMInitializeHexagonTarget(); }
LLEXPORT void LLInitializeHexagonTargetInfo() { LLVMInitializeHexagonTargetInfo(); }
LLEXPORT void LLInitializeHexagonTargetMC() { LLVMInitializeHexagonTargetMC(); }
LLEXPORT void LLInitializeHexagonAsmPrinter() { LLVMInitializeHexagonAsmPrinter(); }

LLEXPORT void LLInitializeMipsTarget() { LLVMInitializeMipsTarget(); }
LLEXPORT void LLInitializeMipsTargetInfo() { LLVMInitializeMipsTargetInfo(); }
LLEXPORT void LLInitializeMipsTargetMC() { LLVMInitializeMipsTargetMC(); }
LLEXPORT void LLInitializeMipsAsmPrinter() { LLVMInitializeMipsAsmPrinter(); }
LLEXPORT void LLInitializeMipsAsmParser() { LLVMInitializeMipsAsmParser(); }
LLEXPORT void LLInitializeMipsDisassembler() { LLVMInitializeMipsDisassembler(); }

LLEXPORT void LLInitializeMSP430Target() { LLVMInitializeMSP430Target(); }
LLEXPORT void LLInitializeMSP430TargetInfo() { LLVMInitializeMSP430TargetInfo(); }
LLEXPORT void LLInitializeMSP430TargetMC() { LLVMInitializeMSP430TargetMC(); }
LLEXPORT void LLInitializeMSP430AsmPrinter() { LLVMInitializeMSP430AsmPrinter(); }

LLEXPORT void LLInitializeNVPTXTarget() { LLVMInitializeNVPTXTarget(); }
LLEXPORT void LLInitializeNVPTXTargetInfo() { LLVMInitializeNVPTXTargetInfo(); }
LLEXPORT void LLInitializeNVPTXTargetMC() { LLVMInitializeNVPTXTargetMC(); }
LLEXPORT void LLInitializeNVPTXAsmPrinter() { LLVMInitializeNVPTXAsmPrinter(); }

LLEXPORT void LLInitializePowerPCTarget() { LLVMInitializePowerPCTarget(); }
LLEXPORT void LLInitializePowerPCTargetInfo() { LLVMInitializePowerPCTargetInfo(); }
LLEXPORT void LLInitializePowerPCTargetMC() { LLVMInitializePowerPCTargetMC(); }
LLEXPORT void LLInitializePowerPCAsmPrinter() { LLVMInitializePowerPCAsmPrinter(); }
LLEXPORT void LLInitializePowerPCAsmParser() { LLVMInitializePowerPCAsmParser(); }
LLEXPORT void LLInitializePowerPCDisassembler() { LLVMInitializePowerPCDisassembler(); }

LLEXPORT void LLInitializeSparcTarget() { LLVMInitializeSparcTarget(); }
LLEXPORT void LLInitializeSparcTargetInfo() { LLVMInitializeSparcTargetInfo(); }
LLEXPORT void LLInitializeSparcTargetMC() { LLVMInitializeSparcTargetMC(); }
LLEXPORT void LLInitializeSparcAsmPrinter() { LLVMInitializeSparcAsmPrinter(); }
LLEXPORT void LLInitializeSparcAsmParser() { LLVMInitializeSparcAsmParser(); }
LLEXPORT void LLInitializeSparcDisassembler() { LLVMInitializeSparcDisassembler(); }

LLEXPORT void LLInitializeSystemZTarget() { LLVMInitializeSystemZTarget(); }
LLEXPORT void LLInitializeSystemZTargetInfo() { LLVMInitializeSystemZTargetInfo(); }
LLEXPORT void LLInitializeSystemZTargetMC() { LLVMInitializeSystemZTargetMC(); }
LLEXPORT void LLInitializeSystemZAsmPrinter() { LLVMInitializeSystemZAsmPrinter(); }
LLEXPORT void LLInitializeSystemZAsmParser() { LLVMInitializeSystemZAsmParser(); }
LLEXPORT void LLInitializeSystemZDisassembler() { LLVMInitializeSystemZDisassembler(); }

LLEXPORT void LLInitializeX86Target() { LLVMInitializeX86Target(); }
LLEXPORT void LLInitializeX86TargetInfo() { LLVMInitializeX86TargetInfo(); }
LLEXPORT void LLInitializeX86TargetMC() { LLVMInitializeX86TargetMC(); }
LLEXPORT void LLInitializeX86AsmPrinter() {    LLVMInitializeX86AsmPrinter();}
LLEXPORT void LLInitializeX86AsmParser() {    LLVMInitializeX86AsmParser();}
LLEXPORT void LLInitializeX86Disassembler() {    LLVMInitializeX86Disassembler();}

LLEXPORT void LLInitializeXCoreTarget() { LLVMInitializeXCoreTarget(); }
LLEXPORT void LLInitializeXCoreTargetInfo() { LLVMInitializeXCoreTargetInfo(); }
LLEXPORT void LLInitializeXCoreTargetMC() { LLVMInitializeXCoreTargetMC(); }
LLEXPORT void LLInitializeXCoreAsmPrinter() { LLVMInitializeXCoreAsmPrinter(); }
LLEXPORT void LLInitializeXCoreDisassembler() { LLVMInitializeXCoreDisassembler(); }

}

