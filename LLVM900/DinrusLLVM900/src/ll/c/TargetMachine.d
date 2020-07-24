/*===-- llvm-c/TargetMachine.h - Target Machine Библиотека к Interface - C++ -*-=*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Идентификатор2: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* Сам header declares the к interface to the Target и TargetMachine       *|
|* классы, which can be используется to generate assembly или объект файлы.           *|
\*===----------------------------------------------------------------------===*/

module ll.c.TargetMachine;
import ll.c.Target, ll.c.Types;


extern (C){

struct LLVMOpaqueTargetMachine;
struct LLVMTarget;
alias LLVMOpaqueTargetMachine *ЛЛЦелеваяМашина;
alias LLVMTarget *ЛЛЦель;

enum LLVMCodeGenOptLevel{
    None,
    Less,
    Default,
    Aggressive
} ;

enum LLVMRelocMode{
    Default,
    Static,
    ПНК,
    DynamicNoPic,
    ROPI,
    RWPI,
    ROPI_RWPI
} ;

enum LLVMCodeModel{
    Default,
    JITDefault,
    Tiny,
    Small,
    Kernel,
    Medium,
    Large
} ;

enum LLVMCodeGenFileType {
    LLVMAssemblyFile,
    LLVMObjectFile
} ;

/** Возвращает the first llvm::Target in the registered targets список. */
ЛЛЦель ЛЛДайПервЦель();
/** Возвращает the следщ llvm::Target given a previous один (или пусто if there's отсутствует) */
ЛЛЦель ЛЛДайСледщЦель(ЛЛЦель Т);

/*===-- Target ------------------------------------------------------------===*/
/** Finds the цель corresponding to the given имя и stores it in \п Т.
  Возвращает 0 on успех. */
ЛЛЦель ЛЛДайЦельИзИмени(ткст0 Name);

/** Finds the цель corresponding to the given triple и stores it in \п Т.
  Возвращает 0 on успех. Optionally returns any ошибка in ошСооб.
  Use LLVMDisposeMessage to dispose the message. */
ЛЛБул ЛЛДайЦельИзТриады(ткст0 Triple, ЛЛЦель *Т,
                                 ткст0 *ошСооб);

/** Возвращает the имя of a цель. See llvm::Target::getName */
ткст0 ЛЛДайИмяЦели(ЛЛЦель Т);

/** Возвращает the описание  of a цель. See llvm::Target::getDescription */
ткст0 ЛЛДайОписаниеЦели(ЛЛЦель Т);

/** Возвращает if the цель has a JIT */
ЛЛБул ЛЛЦель_ЕстьДжИТ_ли(ЛЛЦель Т);

/** Возвращает if the цель has a TargetMachine associated */
ЛЛБул ЛЛЦель_ЕстьЦелМаш_ли(ЛЛЦель Т);

/** Возвращает if the цель as an ASM backend (required for emitting output) */
ЛЛБул ЛЛЦель_ЕстьАсмБэкэнд_ли(ЛЛЦель Т);

/*===-- Target Machine ----------------------------------------------------===*/
/** Creates a new llvm::TargetMachine. See llvm::Target::createTargetMachine */
ЛЛЦелеваяМашина ЛЛСоздайЦелМаш(ЛЛЦель Т,
  ткст0 Triple, ткст0 ЦПБ, ткст0 Features,
  LLVMCodeGenOptLevel Level, LLVMRelocMode Reloc, LLVMCodeModel CodeModel);

/** Dispose the ЛЛЦелеваяМашина instance generated by
  LLVMCreateTargetMachine. */
проц ЛЛВыместиЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the Target используется in a TargetMachine */
ЛЛЦель ЛЛДайЦельЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the triple используется creating this цель machine. See
  llvm::TargetMachine::getTriple. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайТриадуЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the cpu используется creating this цель machine. See
  llvm::TargetMachine::getCPU. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайЦПБЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the feature ткст используется creating this цель machine. See
  llvm::TargetMachine::getFeatureString. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайТкстФичЦелМаш(ЛЛЦелеваяМашина Т);

/** Create a DataLayout based on the targetMachine. */
ЛЛДанныеОЦели ЛЛСоздайРаскладкуДанЦели(ЛЛЦелеваяМашина Т);

/** Set the цель machine's ASM verbosity. */
проц ЛЛУстЦелМашАсмВербозность(ЛЛЦелеваяМашина Т,
                                      ЛЛБул VerboseAsm);

/** Emits an asm или объект файл for the given module to the имяФайла. Сам
  wraps several конст++ only классы (among them a файл stream). Возвращает any
  ошибка in ошСооб. Use LLVMDisposeMessage to dispose the message. */
ЛЛБул ЛЛЦелМашГенерируйВФайл(ЛЛЦелеваяМашина Т, ЛЛМодуль M,
  ткст0 имяФ, LLVMCodeGenFileType codegen, ткст0 *ошСооб);

/** Compile the LLVM IR stored in \п M и store the результат in \п выхБуфПам. */
ЛЛБул ЛЛЦелМашГенерируйВБуфПам(ЛЛЦелеваяМашина Т, ЛЛМодуль M,
  LLVMCodeGenFileType codegen, ткст0* ошСооб, ЛЛБуферПамяти *выхБуфПам);

/*===-- Triple ------------------------------------------------------------===*/
/** Get a triple for the host machine as a ткст. The результат needs to be
  disposed with LLVMDisposeMessage. */
ткст0 ЛЛДайДефТриадуЦели();

/** Normalize a цель triple. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛНормализуйТриадуЦели(ткст0 triple);

/** Get the host ЦПБ as a ткст. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайИмяЦПБХоста();

/** Get the host ЦПБ's фичи as a ткст. The результат needs to be disposed
  with LLVMDisposeMessage. */
ткст0 ЛЛДайФичиЦПБХоста();

/** Adds the цель-specific analysis passes to the pass manager. */
проц ЛЛДобавьПроходкуАнализа(ЛЛЦелеваяМашина Т, ЛЛМенеджерПроходок пм);


}

