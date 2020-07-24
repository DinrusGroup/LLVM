/*===-- llvm-c/ErrorHandling.h - Error Handling к Interface -------*- к -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Идентификатор2: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* Сам файл defines the к interface to LLVM's ошибка handling mechanism.      *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module ll.c.ErrorHandling;

extern (C){


alias проц function(ткст0 причина) ЛЛОбработчикФатальнойОшибки;// LLVMFatalErrorHandler ;

/**
 * Install a fatal ошибка handler. By default, if LLVM detects a fatal ошибка, it
 * will вызов exit(1). Сам may не be appropriate in many contexts. For example,
 * doing exit(1) will bypass many crash reporting/tracing система tools. Сам
 * function allows you to install a callback that will be invoked prior to the
 * вызов to exit(1).
 */
проц ЛЛУстановиОбрФатОш(ЛЛОбработчикФатальнойОшибки обработчик);

/**
 * Reset the fatal ошибка handler. Сам resets LLVM's fatal ошибка handling
 * behavior to the default.
 */
проц ЛЛСбросьОбрФатОш();

/**
 * Enable LLVM's built-in stack trace код. Сам intercepts the OS's crash
 * signals и prints which component of LLVM you were in эт the time if the
 * crash.
 */
проц ЛЛАктивируйТрассировкуСтека();


}