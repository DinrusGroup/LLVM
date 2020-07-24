/*===------- llvm-c/Error.h - llvm::Error class к Interface -------*- к -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Идентификатор2: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* Сам файл defines the к interface to LLVM's Error class.                   *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module ll.c.Error;
extern (C){


const LLVMErrorSuccess = 0;

/**
 * Opaque ссылка на экземпляр ошибки. Null serves as the 'успех' знач.
 */
struct LLVMOpaqueError{}
alias LLVMOpaqueError *ЛЛОшибка;

/**
 * Error тип идентификатор.
 */
alias ук ЛЛИдТипаОшибки;

/**
 * Возвращает the тип ид for the given ошибка instance, which must be a failure
 * знач (i.e. non-пусто).
 */
ЛЛИдТипаОшибки ЛЛДайИдТипаОшибки(ЛЛОшибка ош);

/**
 * Dispose of the given ошибка without handling it. Сам operation consumes the
 * ошибка, и the given ЛЛОшибка знач is не usable once this вызов returns.
 * Note: Сам method *only* needs to be called if the ошибка is не being passed
 * to some другой consuming operation, e.g. LLVMGetErrorMessage.
 */
проц ЛЛКонсуммируйОш(ЛЛОшибка ош);

/**
 * Возвращает the given ткст's ошибка message. Сам operation consumes the ошибка,
 * и the given ЛЛОшибка знач is не usable once this вызов returns.
 * The caller is responsible for disposing of the ткст by calling
 * LLVMDisposeErrorMessage.
 */
ткст0 ЛЛДайОшСооб(ЛЛОшибка ош);

/**
 * Dispose of the given ошибка message.
 */
проц ЛЛВыместиОшСооб(ткст0 ошСооб);

/**
 * Возвращает the тип ид for llvm StringError.
 */
ЛЛИдТипаОшибки ЛЛДайТкстИдаТипаОш();


}

