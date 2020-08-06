
module ll.c.Target;
import ll.c.Types;
//#вклодь "llvm/Config/llvm-config.h"


extern (C){


/**
 * @defgroup LLVMCTarget Информация о Цели
 * @ingroup LLVMC
 *
 * @{
 */

enum ЛЛППорядокБайт { LLVMBigEndian, LLVMLittleEndian };

struct LLVMOpaqueTargetData;
struct LLVMOpaqueTargetLibraryInfotData;
alias LLVMOpaqueTargetData *ЛЛДанныеОЦели;
alias LLVMOpaqueTargetLibraryInfotData *ЛЛИнфоЦелевойБиблиотеки;


 void LLInitializeAArch64Target() ;
 void LLInitializeAArch64TargetInfo() ;
 void LLInitializeAArch64TargetMC() ;
 void LLInitializeAArch64AsmPrinter() ;
 void LLInitializeAArch64AsmParser();
 void LLInitializeAArch64Disassembler();

 void LLInitializeARMTarget();
 void LLInitializeARMTargetInfo();
 void LLInitializeARMTargetMC() ;
 void LLInitializeARMAsmPrinter();
 void LLInitializeARMAsmParser() ;
 void LLInitializeARMDisassembler() ;

 void LLInitializeHexagonTarget() ;
 void LLInitializeHexagonTargetInfo() ;
 void LLInitializeHexagonTargetMC() ;
 void LLInitializeHexagonAsmPrinter();

 void LLInitializeMipsTarget() ;
 void LLInitializeMipsTargetInfo() ;
 void LLInitializeMipsTargetMC() ;
 void LLInitializeMipsAsmPrinter();
 void LLInitializeMipsAsmParser() ;
 void LLInitializeMipsDisassembler() ;

 void LLInitializeMSP430Target() ;
 void LLInitializeMSP430TargetInfo();
 void LLInitializeMSP430TargetMC() ;
 void LLInitializeMSP430AsmPrinter() ;

 void LLInitializeNVPTXTarget();
 void LLInitializeNVPTXTargetInfo() ;
 void LLInitializeNVPTXTargetMC() ;
 void LLInitializeNVPTXAsmPrinter();

 void LLInitializePowerPCTarget() ;
 void LLInitializePowerPCTargetInfo() ;
 void LLInitializePowerPCTargetMC() ;
 void LLInitializePowerPCAsmPrinter() ;
 void LLInitializePowerPCAsmParser() ;
 void LLInitializePowerPCDisassembler() ;

 void LLInitializeSparcTarget() ;
 void LLInitializeSparcTargetInfo();
 void LLInitializeSparcTargetMC() ;
 void LLInitializeSparcAsmPrinter() ;
 void LLInitializeSparcAsmParser();
 void LLInitializeSparcDisassembler() ;

 void LLInitializeSystemZTarget() ;
 void LLInitializeSystemZTargetInfo() ;
 void LLInitializeSystemZTargetMC() ;
 void LLInitializeSystemZAsmPrinter();
 void LLInitializeSystemZAsmParser() ;
 void LLInitializeSystemZDisassembler();

 void LLInitializeX86Target();
 void LLInitializeX86TargetInfo() ;
 void LLInitializeX86TargetMC() ;
 void LLInitializeX86AsmPrinter() ;
 void LLInitializeX86AsmParser() ;
 void LLInitializeX86Disassembler() ;

 void LLInitializeXCoreTarget() ;
 void LLInitializeXCoreTargetInfo();
 void LLInitializeXCoreTargetMC();
 void LLInitializeXCoreAsmPrinter() ;
 void LLInitializeXCoreDisassembler();

/** LLVMInitializeAllTargetInfos - The main program should вызов this function if
    it wants access to все доступно targets that LLVM is configured to
    support. */
проц ЛЛНициализуйВсеИнфОЦели();

/** LLVMInitializeAllTargets - The main program should вызов this function if it
    wants to link in все доступно targets that LLVM is configured to
    support. */
проц ЛЛНициализуйВсеЦели();

/** LLVMInitializeAllTargetMCs - The main program should вызов this function if
    it wants access to все доступно цель MC that LLVM is configured to
    support. */
проц ЛЛНициализуйВсеЦелевыеМК();

/** LLVMInitializeAllAsmPrinters - The main program should вызов this function if
    it wants все asm printers that LLVM is configured to support, to make them
    доступно via the TargetRegistry. */
проц ЛЛНициализуйВсеАсмПринтеры() ;

/** LLVMInitializeAllAsmParsers - The main program should вызов this function if
    it wants все asm parsers that LLVM is configured to support, to make them
    доступно via the TargetRegistry. */
проц ЛЛНициализуйВсеАсмПарсеры() ;

/** LLVMInitializeAllDisassemblers - The main program should вызов this function
    if it wants все disassemblers that LLVM is configured to support, to make
    them доступно via the TargetRegistry. */
проц ЛЛНициализуйВсеДизассемблеры() ;

/** LLVMInitializeNativeTarget - The main program should вызов this function to
    иниц the native цель corresponding to the host.  Сам is useful
    for JIT applications to ensure that the цель gets linked in correctly. */
ЛЛБул ЛЛИнициализуйНативныйТаргет();

/** LLVMInitializeNativeTargetAsmParser - The main program should вызов this
    function to иниц the parser for the native цель corresponding to the
    host. */
ЛЛБул ЛЛИнициализуйНативныйАсмПарсер();


/** LLVMInitializeNativeTargetAsmPrinter - The main program should вызов this
    function to иниц the printer for the native цель corresponding to
    the host. */
ЛЛБул ЛЛИнициализуйНативныйАсмПринтер() ;

/** LLVMInitializeNativeTargetDisassembler - The main program should вызов this
    function to иниц the disassembler for the native цель corresponding
    to the host. */
ЛЛБул ЛЛИнициализуйНативныйДизассемблер();


/*===-- Данные о Цели -------------------------------------------------------===*/

/**
 * Получить раскладку данных для модуля.
 *
 * @see Модуль2::getDataLayout()
 */
ЛЛДанныеОЦели ЛЛДайРаскладкуДанныхМодуля(ЛЛМодуль M);

/**
 * Установить раскладку данных для модуля.
 *
 * @see Модуль2::setDataLayout()
 */
проц ЛЛУстРаскладкуДанныхМодуля(ЛЛМодуль M, ЛЛДанныеОЦели DL);

/** Создаёт данные о цели из строки раскладки цели.
    Смотри конструктор llvm::DataLayout::DataLayout. */
ЛЛДанныеОЦели ЛЛСоздайДанОЦели(ткст0 стрРеп);

/** Вымещает TargetData.
    Смотри деструктор llvm::DataLayout::~DataLayout. */
проц ЛЛВыместиДанОЦели(ЛЛДанныеОЦели доц);

/** Добавляет инфу о целевой библиотеке в менеджер проходок. Владение инфой о целевой библиотеке не принимает.
    Смотри метод llvm::PassManagerBase::прибавь. */
проц ЛЛДобавьИнфОЦБиб(ЛЛИнфоЦелевойБиблиотеки TLI,
                              ЛЛМенеджерПроходок пм);

/** Преобразует целевые данные в строку выкладки цели. Эту строку затем вымещает LLVMDisposeMessage.
    Смотри конструктор llvm::DataLayout::DataLayout. */
ткст0 ЛЛКопируйТкстПредстДанОЦели(ЛЛДанныеОЦели доц);

/** Возвращает целевой порядок байтов, либо LLVMBigEndian или
    LLVMLittleEndian.
    Смотри метод llvm::DataLayout::isLittleEndian. */
ЛЛППорядокБайт ЛЛПорядокБайт(ЛЛДанныеОЦели доц);

/** Возвращает размер указателя в байтах для цели.
    Смотри метод llvm::DataLayout::getPointerSize. */
бцел ЛЛРазмУкз(ЛЛДанныеОЦели доц);

/** Возвращает размер указателя в байтах для цели для заданного апресного пространства (АП).
    Смотри метод llvm::DataLayout::getPointerSize. */
бцел ЛЛРазмУкзДляАП(ЛЛДанныеОЦели доц, бцел AS);

/** Возвращает целочисленный тип того же размера, что и указатель у цели.
    Смотри метод llvm::DataLayout::getIntPtrType. */
ЛЛТип ЛЛТипЦелУкз(ЛЛДанныеОЦели доц);

/** Возвращает целочисленный тип того же размера, что и указатель у цели.
    Эта версия позволяет задать адресное пространство.
    Смотри метод llvm::DataLayout::getIntPtrType. */
ЛЛТип ЛЛТипЦелУкзДляАП(ЛЛДанныеОЦели доц, бцел AS);

/** Возвращает целочисленный тип того же размера, что и указатель у цели.
    Смотри метод llvm::DataLayout::getIntPtrType. */
ЛЛТип ЛЛТипЦелУкзВКонтексте(ЛЛКонтекст к, ЛЛДанныеОЦели доц);

/** Возвращает целочисленный тип того же размера, что и указатель у цели.
    Эта версия позволяет задать адресное пространство.
    Смотри метод llvm::DataLayout::getIntPtrType. */
ЛЛТип ЛЛТипЦелУкзДляАПВКонтексте(ЛЛКонтекст к, ЛЛДанныеОЦели доц,
                                         бцел AS);

/** Вычисляет размер типа в байтах для цели.
    Смотри метод llvm::DataLayout::getTypeSizeInBits. */
бдол ЛЛРазмТипаВБитах(ЛЛДанныеОЦели доц, ЛЛТип тип);

/** Вычисляет размер хранения типа в байтах для цели.
    Смотри метод llvm::DataLayout::getTypeStoreSize. */
бдол ЛЛРазмХранТипа(ЛЛДанныеОЦели доц, ЛЛТип тип);

/** Вычисляет размер ABI (ДИП) типа в байтах для цели.
    Смотри метод llvm::DataLayout::getTypeAllocSize. */
бдол ЛЛДИПРазмТипа(ЛЛДанныеОЦели доц, ЛЛТип тип);

/** Вычисляет ABI раскладку (раскладка) типа в байтах для цели.
    Смотри метод llvm::DataLayout::getTypeABISize. */
бцел ЛЛДИПРаскладкаТипа(ЛЛДанныеОЦели доц, ЛЛТип тип);

/** Computes the вызов frame раскладка of a тип in байты for a цель.
    Смотри метод llvm::DataLayout::getTypeABISize. */
бцел ЛЛРаскладкаФреймаВызДляТипа(ЛЛДанныеОЦели доц, ЛЛТип тип);

/** Computes the preferred раскладка of a тип in байты for a цель.
    Смотри метод llvm::DataLayout::getTypeABISize. */
бцел ЛЛПредпочтРаскладкаТипа(ЛЛДанныеОЦели доц, ЛЛТип тип);

/** Computes the preferred раскладка of a глоб2 переменная in байты for a цель.
    Смотри метод llvm::DataLayout::getPreferredAlignment. */
бцел ЛЛПредпочтРаскладкаГлоба(ЛЛДанныеОЦели доц,
                                        ЛЛЗначение глобПеремн);

/** Computes the structure element that содержит the byte смещение for a цель.
    Смотри метод llvm::StructLayout::getElementContainingOffset. */
бцел ЛЛЭлтПоСмещ(ЛЛДанныеОЦели доц, ЛЛТип типСтрукт,
                             бдол смещ);

/** Computes the byte смещение of the indexed struct element for a цель.
    Смотри метод llvm::StructLayout::getElementContainingOffset. */
бдол ЛЛСМещЭлта(ЛЛДанныеОЦели доц,
                                       ЛЛТип типСтрукт, бцел элт);
}