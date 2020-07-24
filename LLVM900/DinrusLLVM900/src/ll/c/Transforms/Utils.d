/*===-- Utils.h - Transformation Utils Library к Interface ------*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the к interface to libLLVMTransformUtils.a, which     *|
|* implements various transformation utilities of the LLVM IR.                *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module ll.c.Transforms.Utils;
import ll.c.Types;

extern (C){

/**
 * @defgroup LLVMCTransformsUtils Transformation Utilities
 * @ingroup LLVMCTransforms
 *
 * @{
 */

/** See llvm::createLowerSwitchPass function. */
проц ЛЛДобавьПроходкуЛоверСвитч(ЛЛМенеджерПроходок пм);

/** See llvm::createPromoteMemoryToRegisterPass function. */
проц ЛЛДобавьПроходкуПамятьВРегистр(ЛЛМенеджерПроходок пм);

/** See llvm::createAddDiscriminatorsPass function. */
проц ЛЛДобавьПроходкуДобавкиДискриminаторов(ЛЛМенеджерПроходок пм);

}
