
module ll.c.OrcBindings;
import ll.c.Error, ll.c.Object, ll.c.TargetMachine;
import ll.c.Types;

extern (C){

struct LLVMOrcOpaqueJITStack;
alias LLVMOrcOpaqueJITStack *LLVMOrcJITStackRef;
alias дол LLVMOrcModuleHandle;
alias дол LLVMOrcTargetAddress;

alias дол function(ткст0 имя, ук LookupCtx)
	LLVMOrcSymbolResolverFn;

alias дол function(LLVMOrcJITStackRef JITStack,  ук CallbackCtx)
	LLVMOrcLazyCompileCallbackFn;

/**
 * создай an ORC JIT stack.
 *
 * The client owns the результирующий stack, и must вызов OrcDisposeInstance(...)
 * to разрушь it и освободи its memory. The JIT stack will take ownership of the
 * TargetMachine, which will be destroyed when the stack is destroyed. The
 * client should не attempt to dispose of the Target Machine, или it will результат
 * in a дво-освободи.
 */
LLVMOrcJITStackRef ЛЛОрк_СоздайЭкземпляр(ЛЛЦелеваяМашина TM);

/**
 * дай the ошибка message for the most recent ошибка (if any).
 *
 * Сам message is owned by the ORC JIT Stack и will be freed when the stack
 * is disposed of by LLVMOrcDisposeInstance.
 */
ткст0 ЛЛОрк_ДайОшСооб(LLVMOrcJITStackRef JITStack);

/**
 * Mangle the given symbol.
 * Memory will be allocated for MangledSymbol to hold the результат. The client
 */
проц ЛЛОрк_ДайДекорирСимвол(LLVMOrcJITStackRef JITStack, ткст0 *MangledSymbol,
                             ткст0 Символ2);

/**
 * Dispose of a mangled symbol.
 */
проц ЛЛОрк_ВыместиДекорирСимвол(ткст0 MangledSymbol);

/**
 * создай a lazy компилируй callback.
 */
ЛЛОшибка ЛЛОрк_ОбрВызЛенивКомпиляции(
    LLVMOrcJITStackRef JITStack, LLVMOrcTargetAddress *RetAddr,
    LLVMOrcLazyCompileCallbackFn обрвыз, ук CallbackCtx);

/**
 * создай a named indirect вызов stub.
 */
ЛЛОшибка ЛЛОрк_СоздайНепрямСтаб(LLVMOrcJITStackRef JITStack,
                                       ткст0 StubName,
                                       LLVMOrcTargetAddress InitAddr);

/**
 * Set the pointer for the given indirect stub.
 */
ЛЛОшибка ЛЛОрк_УстУкзНаНепрямСтаб(LLVMOrcJITStackRef JITStack,
                                           ткст0 StubName,
                                           LLVMOrcTargetAddress NewAddr);

/**
 * Сложи module to be eagerly compiled.
 */
ЛЛОшибка ЛЛОрк_ДобавьАктивноКомпилирПП(LLVMOrcJITStackRef JITStack,
                                         LLVMOrcModuleHandle *RetHandle,
                                         ЛЛМодуль мод,
                                         LLVMOrcSymbolResolverFn SymbolResolver,
                                         ук SymbolResolverCtx);

/**
 * Сложи module to be lazily compiled один function эт a time.
 */
ЛЛОшибка ЛЛОрк_ДобавьЛенивоКомпилирПП(LLVMOrcJITStackRef JITStack,
                                        LLVMOrcModuleHandle *RetHandle,
                                        ЛЛМодуль мод,
                                        LLVMOrcSymbolResolverFn SymbolResolver,
                                        ук SymbolResolverCtx);

/**
 * Сложи an объект файл.
 *
 * Сам method takes ownership of the given memory буфер и attempts to прибавь
 * it to the JIT as an объект файл.
 * Clients should *не* dispose of the 'Obj' argument: the JIT will manage it
 * from this вызов onwards.
 */
ЛЛОшибка ЛЛОрк_ДобавьФайлОбъекта(LLVMOrcJITStackRef JITStack,
                                  LLVMOrcModuleHandle *RetHandle,
                                  ЛЛБуферПамяти Obj,
                                  LLVMOrcSymbolResolverFn SymbolResolver,
                                  ук SymbolResolverCtx);

/**
 * Remove a module set from the JIT.
 *
 * Сам works for все модули that can be added via OrcAdd*, including объект
 * файлы.
 */
ЛЛОшибка ЛЛОрк_УдалиМодуль(LLVMOrcJITStackRef JITStack,
                                 LLVMOrcModuleHandle H);

/**
 * дай symbol адрес from JIT экзэмпл.
 */
ЛЛОшибка ЛЛОрк_ДайАдресСимвола(LLVMOrcJITStackRef JITStack,
                                     LLVMOrcTargetAddress *RetAddr,
                                     ткст0 SymbolName);

/**
 * дай symbol адрес from JIT экзэмпл, searching only the specified
 * handle.
 */
ЛЛОшибка ЛЛОрк_ДайАдресСимволаЭкз(LLVMOrcJITStackRef JITStack,
                                       LLVMOrcTargetAddress *RetAddr,
                                       LLVMOrcModuleHandle H,
                                       ткст0 SymbolName);

/**
 * Dispose of an ORC JIT stack.
 */
ЛЛОшибка ЛЛОрк_ВыместиЭкземпляр(LLVMOrcJITStackRef JITStack);

/**
 * Register a JIT Event Listener.
 *
 * атр NULL listener is ignored.
 */
проц ЛЛОрк_ЗарегистрируйДатчикСобытийДжИТ(LLVMOrcJITStackRef JITStack, ЛЛДатчикСобытийДжит L);

/**
 * Unegister a JIT Event Listener.
 *
 * атр NULL listener is ignored.
 */
проц ЛЛОрк_ОтрегистрируйДатчикСобытийДжИТ(LLVMOrcJITStackRef JITStack, ЛЛДатчикСобытийДжит L);


}