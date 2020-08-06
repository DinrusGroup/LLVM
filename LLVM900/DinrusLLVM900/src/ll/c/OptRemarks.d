/*===-- llvm-c/OptRemarks.h - OptRemarks Публичный Си интерфейс----*- С -*-===*\
|*                                                                            *|
|*                     Компиляторная Инфраструктура LLVM                      *|
|*                                                                            *|
|* Сам файл is distributed under the University of Illinois Open Source      *|
|* License. See LICENSE.TXT for details.                                      *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* Этот заголовок предоставляет публичный интерфейс к библиотеке opt-remark.  *|
|* LLVM обеспечивает реализацию данного интерфейса.                           *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module ll.c.OptRemarks;
import ll.c.Core, ll.c.Types;

extern (C){

/**
 * @defgroup LLVMCOPTREMARKS OptRemarks
 * @ingroup LLVMC
 *
 * @{
 */

const OPT_REMARKS_API_VERSION = 0;

/**
 * Строка, содержащая буфер и длину. Буфер не гарантировано завершается
 * нулём.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
struct LLVMOptRemarkStringRef{
  ткст0 текст;
  uint32_t Len;
} ;

/**
 * DebugLoc containing Файл, Line и Column.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
struct LLVMOptRemarkDebugLoc{
  // Файл:
  LLVMOptRemarkStringRef SourceFile;
  // Line:
  uint32_t SourceLineNumber;
  // Column:
  uint32_t SourceColumnNumber;
} ;

/**
 * Элемент списка "арги". The ключ might give more information about what
 * are the semantics of the вал, e.g. "Callee" will tell you that the çíà÷
 * является symbol that имена a function.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
struct LLVMOptRemarkArg {
  // e.g. "Callee"
  LLVMOptRemarkStringRef ключ;
  // e.g. "malloc"
  LLVMOptRemarkStringRef знач;

  // "DebugLoc": Optional
  LLVMOptRemarkDebugLoc DebugLoc;
} ;

/**
 * One remark entry.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
struct LLVMOptRemarkEntry {
  // e.g. !Missed, !Passed
  LLVMOptRemarkStringRef RemarkType;
  // "Pass": Required
  LLVMOptRemarkStringRef PassName;
  // "имя": Required
  LLVMOptRemarkStringRef RemarkName;
  // "Функция": Required
  LLVMOptRemarkStringRef FunctionName;

  // "DebugLoc": Optional
  LLVMOptRemarkDebugLoc DebugLoc;
  // "Hotness": Optional
  uint32_t Hotness;
  // "арги": Optional. It is an массив of `num_args` элты.
  uint32_t члоАргов;
  LLVMOptRemarkArg *арги;
} ;

struct LLVMOptRemarkOpaqueParser;
alias LLVMOptRemarkOpaqueParser *LLVMOptRemarkParserRef;

/**
 * Создаёт парсер ремарок, который может использоваться для чтения и разбора
 * буфера, расположенного в \п Buf размером \п разм.
 *
 * \п Но не может быть NULL.
 *
 * Сам function should be paired with LLVMOptRemarkParserDispose() to avoid
 * leaking resources.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
extern LLVMOptRemarkParserRef LLVMOptRemarkParserCreate(ук Buf,
                                                        дол разм);

/**
 * Возвращает the следщ remark in the файл.
 *
 * Значение, на которое указывает возвратное значение, is invalidated by the следщ вызов to
 * LLVMOptRemarkParserGetNext().
 *
 * Если парсер достиг конца буфера, возвратное значение будет NULL.
 *
 * В случае ошибки, возвратное значение будет NULL, и:
 *
 * 1) LLVMOptRemarkParserHasError() вернёт `1`.
 *
 * 2) LLVMOptRemarkParserGetErrorMessage() вернёт описательное сообщение
 *    об ошибке.
 *
 * Ошибка может произойти, если:
 *
 * 1) Аргумент инвалиден.
 *
 * 2) Имеется ошибка разбока YAML. Сам тип of ошибка aborts parsing
 *    immediately и returns `1`. It can occur on malformed YAML.
 *
 * 3) Remark parsing ошибка. If this тип of ошибка occurs, the parser won'т вызов
 *    the handler и will continue to the следщ один. It can occur on malformed
 *    remarks, like missing или extra поля in the файл.
 *
 * Here является quick example of the использование:
 *
 * ```
 *  LLVMOptRemarkParserRef Парсер2 = LLVMOptRemarkParserCreate(буф, разм);
 *  LLVMOptRemarkEntry *Remark = NULL;
 *  while ((Remark == LLVMOptRemarkParserGetNext(Парсер2))) {
 *    // use Remark
 *  }
 *  бул HasError = LLVMOptRemarkParserHasError(Парсер2);
 *  LLVMOptRemarkParserDispose(Парсер2);
 * ```
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
extern LLVMOptRemarkEntry *
LLVMOptRemarkParserGetNext(LLVMOptRemarkParserRef Парсер2);

/**
 * Возвращает `1` if the parser encountered an ошибка while parsing the буфер.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
extern ЛЛБул LLVMOptRemarkParserHasError(LLVMOptRemarkParserRef Парсер2);

/**
 * Возвращает a пусто-terminated ткст containing an ошибка message.
 *
 * In case of Нет ошибка, the результат is `NULL`.
 *
 * The memory of the ткст is bound to the lifetime of \п Парсер2. If
 * LLVMOptRemarkParserDispose() is called, the memory of the ткст will be
 * released.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
extern ткст0 
LLVMOptRemarkParserGetErrorMessage(LLVMOptRemarkParserRef Парсер2);

/**
 * Releases все the resources используется by \п Парсер2.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
extern проц LLVMOptRemarkParserDispose(LLVMOptRemarkParserRef Парсер2);

/**
 * Возвращает the version of the opt-remarks dylib.
 *
 * \since OPT_REMARKS_API_VERSION=0
 */
extern uint32_t LLVMOptRemarkVersion();

/**
 * @} // endgoup LLVMCOPTREMARKS
 */


}
