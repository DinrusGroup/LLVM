
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
/+

/* Declare все of the цель-инициализация functions that are доступно. */
#определи LLVM_TARGET(TargetName) \
  проц LLVMInitialize##TargetName##TargetInfo();
#вклодь "llvm/Config/Targets.def"
#undef LLVM_TARGET  /* Explicit undef to make SWIG happier */

#определи LLVM_TARGET(TargetName) проц LLVMInitialize##TargetName##Target();
#вклодь "llvm/Config/Targets.def"
#undef LLVM_TARGET  /* Explicit undef to make SWIG happier */

#определи LLVM_TARGET(TargetName) \
  проц LLVMInitialize##TargetName##TargetMC();
#вклодь "llvm/Config/Targets.def"
#undef LLVM_TARGET  /* Explicit undef to make SWIG happier */

/* Declare все of the доступно assembly printer инициализация functions. */
#определи LLVM_ASM_PRINTER(TargetName) \
  проц LLVMInitialize##TargetName##AsmPrinter();
#вклодь "llvm/Config/AsmPrinters.def"
#undef LLVM_ASM_PRINTER  /* Explicit undef to make SWIG happier */

/* Declare все of the доступно assembly parser инициализация functions. */
#определи LLVM_ASM_PARSER(TargetName) \
  проц LLVMInitialize##TargetName##AsmParser();
#вклодь "llvm/Config/AsmParsers.def"
#undef LLVM_ASM_PARSER  /* Explicit undef to make SWIG happier */

/* Declare все of the доступно disassembler инициализация functions. */
#определи LLVM_DISASSEMBLER(TargetName) \
  проц LLVMInitialize##TargetName##Disassembler();
#вклодь "llvm/Config/Disassemblers.def"
#undef LLVM_DISASSEMBLER  /* Explicit undef to make SWIG happier */
+/
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