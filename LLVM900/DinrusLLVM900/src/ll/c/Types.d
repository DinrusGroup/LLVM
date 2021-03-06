/*===-- llvm-c/Support.h - Декларации типов Си интерфейса ---------*- к -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Идентификатор2: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* В этом файле определены типы, используемые Си интерфейсом LLVM.            *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module ll.c.Types;
public import ll.c.DataTypes;


extern (C)
{


/**
 * @defgroup LLVMCSupportTypes Типы и Перечни
 *
 * @{
 */

alias бул ЛЛБул;

/* Opaque типы. */

/**
 * LLVM использует полиморфную иерархию типов, которую нельзя представить в Си,
 * поэтому параметры следует передавать как базовые типы. Несмотря на объявленные
 * типы, большинство представленных функций оперирует только над ветвями 
 * иерархии типов. Декларированные имена параметров описательны (дескриптивны)
 * и определяют требуемый тип. В дополнение каждая иерархия типов документирована
 * вместе с функциями, оперирующими над ней. Для большей ясности обращайтесь к
 * Си++ коду LLVM. В случае сомнений, обращайтесь к Core.cpp, который выполняет
 * даункаст параметров в форме unwrap<ТребуемыйТип)(Парам).
 */

/**
 * Используется для передачи регионов памяти через интерфейсы LLVM.
 *
 * @see llvm::MemoryBuffer
 */
struct LLVMOpaqueMemoryBuffer{}
alias LLVMOpaqueMemoryBuffer *ЛЛБуферПамяти, LLVMOpaqueMemoryBufferRef;

/**
 * Верхнеуровневый контейнер для всех глобальных данных LLVM. См. класс LLVMContext.
 */
struct LLVMOpaqueContext{}
alias LLVMOpaqueContext *ЛЛКонтекст, LLVMOpaqueContextRef;

/**
 * Верхнеуровневый контейнер для всех иных объектов LLVM Intermediate Representation (IR).
 *
 * @see llvm::Модуль2
 */
struct LLVMOpaqueModule{}
alias LLVMOpaqueModule *ЛЛМодуль, LLVMOpaqueModuleRef;

/**
 * Каждое значение в LLVM IR имеет тип, некий ЛЛТип.
 *
 * @see llvm::Тип
 */
struct LLVMOpaqueType{}
alias LLVMOpaqueType *ЛЛТип, LLVMOpaqueTypeRef;

/**
 * Представляет индивидуальное значение в LLVM IR.
 *
 * Моделирует llvm::знач.
 */
struct LLVMOpaqueValue{}
alias LLVMOpaqueValue *ЛЛЗначение, LLVMOpaqueValueRef;

/**
 * Педставляет базовый блок инструкций в LLVM IR.
 *
 * Моделирует llvm::BasicBlock.
 */
struct LLVMOpaqueBasicBlock{}
alias LLVMOpaqueBasicBlock *ЛЛБазовыйБлок, LLVMOpaqueBasicBlockRef;

/**
 * Представляет Метаданные LLVM.
 *
 * Моделирует llvm::Metadata.
 */
struct LLVMOpaqueMetadata{}
alias LLVMOpaqueMetadata *ЛЛМетаданные, LLVMOpaqueMetadataRef;

/**
 * Представляет Именованный Узел Метаданных LLVM.
 *
 * Моделирует llvm::имУзелМД.
 */
struct LLVMOpaqueNamedMDNode{}
alias LLVMOpaqueNamedMDNode *ЛЛИменованыйУзелМД, LLVMOpaqueNamedMDNodeRef;

/**
 * Представляет запись в приложениях метаданных Глобального Объекта.
 *
 * Моделирует std::pair<бцел, MDNode *>
 */
struct LLVMOpaqueValueMetadataEntry{}
alias LLVMOpaqueValueMetadataEntry ЛЛЗаписьМетаданныхЗначения;

/**
 * Представляет базовый построитель блоков LLVM.
 *
 * Моделирует llvm::IRBuilder.
 */
struct LLVMOpaqueBuilder{}
alias LLVMOpaqueBuilder *ЛЛПостроитель, LLVMOpaqueBuilderRef;

/**
 * Представляет построитель отладочной информации LLVM.
 *
 * Моделирует llvm::DIBuilder.
 */
struct LLVMOpaqueDIBuilder{}
alias LLVMOpaqueDIBuilder *ЛЛПостроительОИ, LLVMOpaqueDIBuilderRef;

/**
 * Интерфейс, используемый для предоставления модуля интерпретатору или JIT-отладчику.
 * Сейчас это просто синоним llvm::Модуль2, но нам придётся использовать разные типы,
 * чтобы сохранить бинарную совместимость.
 */
struct LLVMOpaqueModuleProvider{}
alias LLVMOpaqueModuleProvider *ЛЛМодульПровайдер, LLVMOpaqueModuleProviderRef;

/** @see llvm::PassManagerBase */
struct LLVMOpaquePassManager{}
alias LLVMOpaquePassManager *ЛЛМенеджерПроходок, LLVMOpaquePassManagerRef;


struct LLVMOpaquePassRegistry{}
alias LLVMOpaquePassRegistry *ЛЛРеестрПроходок, LLVMOpaquePassRegistryRef;

/**
 * Применяется для получения пользователей и пользуемых Значения.
 *
 * @see llvm::Use */
struct LLVMOpaqueUse{}
alias LLVMOpaqueUse *ЛЛИспользование, LLVMOpaqueUseRef;

/**
 * Используется для представления атрибутов.
 *
 * @see llvm::Attribute
 */
struct LLVMOpaqueAttribute{}
alias LLVMOpaqueAttribute *ЛЛАтрибут, LLVMOpaqueAttributeRef;

/**
 * @see llvm::DiagnosticInfo
 */
struct LLVMOpaqueDiagnosticInfo{}
alias LLVMOpaqueDiagnosticInfo *ЛЛИнфоДиагностики, LLVMOpaqueDiagnosticInfoRef;

/**
 * @see llvm::Comdat
 */
struct LLVMComdat{}
alias LLVMComdat *ЛЛКомдат, LLVMComdatRef;

/**
 * @see llvm::Модуль2::ModuleFlagEntry
 */
struct LLVMOpaqueModuleFlagEntry{}
alias LLVMOpaqueModuleFlagEntry ЛЛЗаписьФлагаМодуля;

/**
 * @see llvm::JITEventListener
 */
struct LLVMOpaqueJITEventListener{}
alias LLVMOpaqueJITEventListener *ЛЛДатчикСобытийДжит, LLVMOpaqueJITEventListenerRef;

/**
 * @see llvm::объект::Binary
 */
struct LLVMOpaqueBinary{}
alias LLVMOpaqueBinary *ЛЛБинарник, LLVMOpaqueBinaryRef;

}