/*===-- llvm-c/TargetMachine.h - Target Machine Библиотека к Interface - C++ -*-=*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* Смотрите https://llvm.org/LICENSE.txt for license information.                  *|
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

struct LLVMOpaqueTargetMachine{}
struct LLVMTarget{}
alias LLVMOpaqueTargetMachine *ЛЛЦелеваяМашина;
alias LLVMTarget *ЛЛЦель;

enum ЛЛУровеньОптКодгена{
    Никакой,
    Наименьший,
    Дефолт,
    Агрессивный
} ;

enum ЛЛРелокРежим{
    Дефолт,
    Статический,
    ПНК,
    ДинБезПНК,
    ROPI,
    RWPI,
    ROPI_RWPI
} ;

enum ЛЛМодельКода{
    Дефолт,
    ДжИТДефолт,
    Тини,
    Смолл,
    Кернел,
    Медиум,
    Лардж
} ;

enum ЛЛТипФайлаКодгена {
    Сборка,
    Объект
} ;

/** Возвращает первый llvm::Target в списке зарегистрированных целей. */
ЛЛЦель ЛЛДайПервЦель();
/** Возвращает следщ llvm::Target, если задана предыдущая цель (или пусто) */
ЛЛЦель ЛЛДайСледщЦель(ЛЛЦель Т);

/*===-- Цель ------------------------------------------------------------===*/
/** Находит цель, соответствующую указанному имени и сохраняет её в \p Т.
  Возвращает 0 при успехе. */
ЛЛЦель ЛЛДайЦельИзИмени(ткст0 имя);

/** Находит цель, соответствующую указанной триаде и сохраняет её в \p Т.
  Возвращает 0 при успехе. Дополнительно возвращает любую ошибку в ошСооб.
  Используйте ЛЛВыместиСообщение, чтобы выместить это сообщение. */
ЛЛБул ЛЛДайЦельИзТриады(ткст0 триада, ЛЛЦель *Т,
                                 ткст0 *ошСооб);

/** Возвращает имя цели. Смотрите llvm::Target::getName */
ткст0 ЛЛДайИмяЦели(ЛЛЦель Т);

/** Возвращает описание  цели. Смотрите llvm::Target::getDescription */
ткст0 ЛЛДайОписаниеЦели(ЛЛЦель Т);

/** Возвращает, есть ли у цели JIT */
ЛЛБул ЛЛЦель_ЕстьДжИТ_ли(ЛЛЦель Т);

/** Возвращает, связана ли с целью МашинаЦели */
ЛЛБул ЛЛЦель_ЕстьЦелМаш_ли(ЛЛЦель Т);

/** Возвращает, есть ли у цели ASM юэкэнд (необходим для генерации вывода) */
ЛЛБул ЛЛЦель_ЕстьАсмБэкэнд_ли(ЛЛЦель Т);

/*===-- Target Machine ----------------------------------------------------===*/
/** Создаёт новую llvm::TargetMachine. Смотрите llvm::Target::createTargetMachine */
ЛЛЦелеваяМашина ЛЛСоздайЦелМаш(ЛЛЦель Т,
  ткст0 триада, ткст0 ЦПБ, ткст0 фичи,
  ЛЛУровеньОптКодгена уровень, ЛЛРелокРежим релок, ЛЛМодельКода модельКода);

/** Вымещает экземпляр ЛЛЦелеваяМашина, генерированный
  LLVMCreateTargetMachine. */
проц ЛЛВыместиЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the Target используется in a TargetMachine */
ЛЛЦель ЛЛДайЦельЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the triple используется creating this цель machine. Смотрите
  llvm::TargetMachine::getTriple. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайТриадуЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the cpu используется creating this цель machine. Смотрите
  llvm::TargetMachine::getCPU. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайЦПБЦелМаш(ЛЛЦелеваяМашина Т);

/** Возвращает the feature ткст используется creating this цель machine. Смотрите
  llvm::TargetMachine::getFeatureString. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайТкстФичЦелМаш(ЛЛЦелеваяМашина Т);

/** создай a DataLayout based on the targetMachine. */
ЛЛДанныеОЦели ЛЛСоздайРаскладкуДанЦели(ЛЛЦелеваяМашина Т);

/** Set the цель machine's ASM verbosity. */
проц ЛЛУстЦелМашАсмВербозность(ЛЛЦелеваяМашина Т,
                                      ЛЛБул вербАсм);

/** Emits an asm или объект файл for the given module to the имяФайла. Сам
  wraps several конст++ only классы (among them a файл stream). Возвращает any
  ошибка in ошСооб. Используйте ЛЛВыместиСообщение, чтобы выместить это сообщение. */
ЛЛБул ЛЛЦелМашГенерируйВФайл(ЛЛЦелеваяМашина Т, ЛЛМодуль M,
  ткст0 имяФ, ЛЛТипФайлаКодгена codegen, ткст0 *ошСооб);

/** Compile the LLVM IR stored in \п M и store the результат in \п выхБуфПам. */
ЛЛБул ЛЛЦелМашГенерируйВБуфПам(ЛЛЦелеваяМашина Т, ЛЛМодуль M,
  ЛЛТипФайлаКодгена codegen, ткст0* ошСооб, ЛЛБуферПамяти *выхБуфПам);

/*===-- триада ------------------------------------------------------------===*/
/** дай a triple for the host machine as a ткст. The результат needs to be
  disposed with LLVMDisposeMessage. */
ткст0 ЛЛДайДефТриадуЦели();

/** Normalize a цель triple. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛНормализуйТриадуЦели(ткст0 триада);

/** дай the host ЦПБ as a ткст. The результат needs to be disposed with
  LLVMDisposeMessage. */
ткст0 ЛЛДайИмяЦПБХоста();

/** дай the host ЦПБ's фичи as a ткст. The результат needs to be disposed
  with LLVMDisposeMessage. */
ткст0 ЛЛДайФичиЦПБХоста();

/** Adds the цель-specific analysis passes to the pass manager. */
проц ЛЛДобавьПроходкуАнализа(ЛЛЦелеваяМашина Т, ЛЛМенеджерПроходок пм);


}

