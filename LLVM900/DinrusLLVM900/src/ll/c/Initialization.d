/*===-- llvm-c/Initialization.h - Initialization к Interface ------*- к -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Идентификатор2: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* Сам header declares the к interface to LLVM инициализация routines,      *|
|* which must be called before you can use the functionality provided by      *|
|* the corresponding LLVM library.                                            *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module ll.c.Initialization;
import ll.c.Types;

extern (C){


/**
 * @defgroup LLVMCInitialization Initialization Routines
 * @ingroup LLVMC
 *
 * Сам module содержит routines используется to иниц the LLVM система.
 *
 * @{
 */

проц ЛЛИницЯдро(ЛЛРеестрПроходок R);
проц ЛЛИницТрансформУтил(ЛЛРеестрПроходок R);
проц ЛЛИницСкалярОпц(ЛЛРеестрПроходок R);
проц ЛЛИницОпцОбджСиАРЦ(ЛЛРеестрПроходок R);
проц ЛЛИницВекторизацию(ЛЛРеестрПроходок R);
проц ЛЛИНицИнстКомбин(ЛЛРеестрПроходок R);
проц ЛЛИницАгрессивнИнстКомбайнер(ЛЛРеестрПроходок R);
проц ЛЛИницМПО(ЛЛРеестрПроходок R);
проц ЛЛИницИнструментацию(ЛЛРеестрПроходок R);
проц ЛЛИницАнализ(ЛЛРеестрПроходок R);
проц ЛЛИницМПА(ЛЛРеестрПроходок R);
проц ЛЛИницКодГен(ЛЛРеестрПроходок R);
проц ЛЛИницЦель(ЛЛРеестрПроходок R);


}

