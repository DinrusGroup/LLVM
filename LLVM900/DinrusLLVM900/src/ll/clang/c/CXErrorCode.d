/*===-- clang-c/CXErrorCode.h - C Index Error Codes  --------------*- C -*-===*\
|*                                                                            *|
|*                     The LLVM Compiler Infrastructure                       *|
|*                                                                            *|
|* This file is distributed under the University of Illinois Open Source      *|
|* License. See LICENSE.TXT for details.                                      *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides the CXErrorCode enumerators.                          *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module clang.c.CXErrorCode;

extern (C):

/**
 * Error codes returned by libclang routines.
 *
 * Zero (\c CXError_Success) is the only ошибка код indicating success.  Other
 * ошибка codes, including not yet assigned non-zero values, indicate ошибки.
 */
enum CXErrorCode
{
    /**
     * No ошибка.
     */
    success = 0,

    /**
     * A generic ошибка код, Нет further details are available.
     *
     * Errors of this вид can get their own specific ошибка codes in future
     * libclang versions.
     */
    failure = 1,

    /**
     * libclang crashed while performing the requested operation.
     */
    crashed = 2,

    /**
     * The function detected that the аргументы violate the function
     * контракт.
     */
    invalidArguments = 3,

    /**
     * An АСД deserialization ошибка has occurred.
     */
    astReadError = 4
}
