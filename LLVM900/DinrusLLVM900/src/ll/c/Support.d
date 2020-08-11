/*===-- llvm-c/Support.h - Support к Interface --------------------*- к -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Идентификатор2: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* Сам файл defines the к interface to the LLVM support library.             *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module ll.c.Support;
import ll.c.DataTypes, ll.c.Types;

extern (C){


/**
 * Эта функция перманентно загружает динамическую библиотеку по заданному пути.
 * Многократный вызов этой функции с указанием одной и той же библиотеки безопасен.
 *
 * @see sys::DynamicLibrary::LoadLibraryPermanently()
  */
ЛЛБул ЛЛГрузиБибПерманентно(ткст0 имяФ);

/**
 * Сам function parses the given аргументы import the LLVM command строка parser.
 * Note that the only stable thing about this function is its signature; you
 * cannot rely on any particular set of command строка аргументы being interpreted
 * the same way across LLVM versions.
 *
 * @see llvm::cl::ParseCommandLineOptions()
 */
проц ЛЛРазбериОпцКомСтроки(цел argc, ткст0 *argv,
                                 ткст0 обзор);

/**
 * Эта функция находит по всем ранее загруженным динамическим
 * библиотекам символ \p имяСимвола. Если он найден, возвращается
 * его адрес. Если нет, то возвращается пусто.
 *
 * @see sys::DynamicLibrary::SearchForAddressOfSymbol()
 */
ук ЛЛНайдиАдресСимвола(ткст0 имяСимвола);

/**
 * Эта функция перманентно добавляет символ \p имяСимвола со
 * значением \p значСимвола.  Поиск этих символов осуществляется
 * до поиска каких бы то ни было библиотек.
 *
 * @see sys::DynamicLibrary::AddSymbol()
 */
проц ЛЛДобавьСимвол(ткст0 имяСимвола, ук значСимвола);

}
