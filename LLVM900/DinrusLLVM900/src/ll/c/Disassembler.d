
module ll.c.Disassembler;
import ll.c.DisassemblerTypes, ll.c.Types;

/**
 * @defgroup LLVMCDisassembler Дизассемблер
 * @ingroup LLVMC
 *
 * @{
 */


extern (C){


/**
 * Создаёт дизассемблер для имяТриады.  Символьное дизассемблирование поддерживается
 * передачей блока инфы в парметр инфоДиз и указанием
 * типТэга и функциями обрвызова, как описано выше. Все они могут передаваться
 * как NULL.  При успехе возвращается контекст дизассемблирования.  При провале
 * возвращается NULL. Эта функция равноценна вызову
 * LLVMCreateDisasmCPUFeatures() с пустым именем ЦПБ и набором фич.
 */
ЛЛКонтекстДизасма ЛЛСоздайДизасм(ткст0 имяТриады, ук инфоДиз, цел типТэга, ЛЛОбрвызОпИнфо дайОпИнфо, ЛЛОбрвызПоискСимвола поискСим);

/**
 * Создаёт дизассемблер для имяТриады и a specific ЦПБ.  Symbolic
 * disassembly is supported by passing a блок of information in the инфоДиз
 * параметр и specifying the типТэга и callback functions as described
 * above.  These can все be passed * as NULL.  If successful, this returns a
 * disassembler контекст.  If не, it returns NULL. Сам function is equivalent
 * to calling LLVMCreateDisasmCPUFeatures() with an пуст feature set.
 */
ЛЛКонтекстДизасма ЛЛСоздайДизасмЦПБ(ткст0 триада, ткст0 ЦПБ, ук инфоДиз, цел типТэга,
     ЛЛОбрвызОпИнфо дайОпИнфо, ЛЛОбрвызПоискСимвола поискСим);

/**
 * Создаёт дизассемблер для  имяТриады, a specific ЦПБ и specific feature
 * ткст.  Symbolic disassembly is supported by passing a блок of information
 * in the инфоДиз параметр и specifying the типТэга и callback functions as
 * described above.  These can все be passed * as NULL.  If successful, this
 * returns a disassembler контекст.  If не, it returns NULL.
 */
ЛЛКонтекстДизасма
ЛЛСоздайДизасмЦПБФичи(ткст0 триада, ткст0 цпу,
                            ткст0 фичи, ук инфоДиз, цел типТэга,
                            ЛЛОбрвызОпИнфо дайОпИнфо,
                            ЛЛОбрвызПоискСимвола поискСим);

/**
 * Установить опции дизассемблера.  Возвращает 1, если может установить Опции или 0,
 * в противном случае.
 */
цел ЛЛУстОпцииДизасм(ЛЛКонтекстДизасма DC, бдол опции);

/* The опция to produce marked up assembly. */
const LLVMDisassembler_Option_UseMarkup = 1;
/* The опция to принт immediates as hex. */
const LLVMDisassembler_Option_PrintImmHex = 2;
/* The опция use the другой assembler printer variant */
const LLVMDisassembler_Option_AsmPrinterVariant = 4;
/* The опция to set коммент on instructions */
const LLVMDisassembler_Option_SetInstrComments = 8;
  /* The опция to принт latency information alongside instructions */
const LLVMDisassembler_Option_PrintLatency = 16;



/**
 * Выместить контекст дизассемблера.
 */
проц ЛЛВыместиДизасм(ЛЛКонтекстДизасма DC);

/**
 * Disassemble a single instruction import the disassembler контекст specified in
 * the параметр DC.  The байты of the instruction are specified in the
 * параметр байты, и содержит эт least BytesSize number of байты.  The
 * instruction is эт the адрес specified by the PC параметр.  If a valid
 * instruction can be disassembled, its ткст is returned indirectly in
 * OutString whose размер is specified in the параметр OutStringSize.  Сам
 * function returns the number of байты in the instruction или нуль if there was
 * Нет valid instruction.
 */
т_мера ЛЛИнструкцияДмзасм(ЛЛКонтекстДизасма DC, ббайт *байты,
бдол разБайт, бдол пк, ткст0 выхТкст, т_мера размВыхТкст);

}

