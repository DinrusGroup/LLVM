﻿
extern "C" {
#include "Header.h"

    /**
     * Create a disassembler for the TripleName.  Symbolic disassembly is supported
     * by passing a block of information in the DisInfo parameter and specifying the
     * TagType and callback functions as described above.  These can all be passed
     * as NULL.  If successful, this returns a disassembler context.  If not, it
     * returns NULL. This function is equivalent to calling
     * LLVMCreateDisasmCPUFeatures() with an empty CPU name and feature set.
     */
LLEXPORT  ЛЛКонтекстДизасма ЛЛСоздайДизасм(const char* TripleName, void* DisInfo,
        цел TagType, ЛЛОбрвызОпИнфо GetOpInfo,
        ЛЛОбрвызПоискСимвола SymbolLookUp) {
        return LLVMCreateDisasm(TripleName, DisInfo, TagType, GetOpInfo, SymbolLookUp);
    }

    /**
     * Create a disassembler for the TripleName and a specific CPU.  Symbolic
     * disassembly is supported by passing a block of information in the DisInfo
     * parameter and specifying the TagType and callback functions as described
     * above.  These can all be passed * as NULL.  If successful, this returns a
     * disassembler context.  If not, it returns NULL. This function is equivalent
     * to calling LLVMCreateDisasmCPUFeatures() with an empty feature set.
     */
LLEXPORT  ЛЛКонтекстДизасма ЛЛСоздайДизасмЦПБ(const char* Triple, const char* CPU,
        void* DisInfo, цел TagType,
        ЛЛОбрвызОпИнфо GetOpInfo,
        ЛЛОбрвызПоискСимвола SymbolLookUp) {
        return LLVMCreateDisasmCPU(Triple, CPU, DisInfo, TagType, GetOpInfo, SymbolLookUp);
    }

    /**
     * Create a disassembler for the TripleName, a specific CPU and specific feature
     * string.  Symbolic disassembly is supported by passing a block of information
     * in the DisInfo parameter and specifying the TagType and callback functions as
     * described above.  These can all be passed * as NULL.  If successful, this
     * returns a disassembler context.  If not, it returns NULL.
     */
 LLEXPORT  ЛЛКонтекстДизасма
        ЛЛСоздайДизасмЦПБФичи(const char* Triple, const char* CPU,
            const char* Features, void* DisInfo, цел TagType,
            ЛЛОбрвызОпИнфо GetOpInfo,
            ЛЛОбрвызПоискСимвола SymbolLookUp) {
        return LLVMCreateDisasmCPUFeatures(Triple, CPU, Features, DisInfo, TagType,
            GetOpInfo, SymbolLookUp);
    }

    /**
     * Set the disassembler's options.  Returns 1 if it can set the Options and 0
     * otherwise.
     */
 LLEXPORT    цел ЛЛУстОпцииДизасм(ЛЛКонтекстДизасма DC, uint64_t Options) {
        return LLVMSetDisasmOptions(DC, Options);
    }

/**
 * Dispose of a disassembler context.
 */
LLEXPORT     void ЛЛВыместиДизасм(ЛЛКонтекстДизасма DC) {
         LLVMDisasmDispose(DC);
    }

    /**
     * Disassemble a single instruction using the disassembler context specified in
     * the parameter DC.  The bytes of the instruction are specified in the
     * parameter Bytes, and contains at least BytesSize number of bytes.  The
     * instruction is at the address specified by the PC parameter.  If a valid
     * instruction can be disassembled, its string is returned indirectly in
     * OutString whose size is specified in the parameter OutStringSize.  This
     * function returns the number of bytes in the instruction or zero if there was
     * no valid instruction.
     */
 LLEXPORT    size_t ЛЛИнструкцияДмзасм(ЛЛКонтекстДизасма DC, uint8_t* Bytes,
        uint64_t BytesSize, uint64_t PC,
        char* OutString, size_t OutStringSize) {
        return LLVMDisasmInstruction(DC, Bytes, BytesSize, PC, OutString, OutStringSize);
    }

    /**
     * @}
     */

}

