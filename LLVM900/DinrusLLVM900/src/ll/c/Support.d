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
 * Сам function permanently loads the dynamic library эт the given путь.
 * It is сейф to вызов this function multiple times for the same library.
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
                                 ткст0 Overview);

/**
 * Сам function will ищи through все previously loaded dynamic
 * libraries for the symbol \п symbolName. If it is found, the адрес of
 * that symbol is returned. If не, пусто is returned.
 *
 * @see sys::DynamicLibrary::SearchForAddressOfSymbol()
 */
ук ЛЛНайдиАдресСимвола(ткст0 symbolName);

/**
 * Сам functions permanently adds the symbol \п symbolName with the
 * знач \п symbolValue.  These symbols are searched before any
 * libraries.
 *
 * @see sys::DynamicLibrary::AddSymbol()
 */
проц ЛЛДобавьСимвол(ткст0 symbolName, ук symbolValue);

}
