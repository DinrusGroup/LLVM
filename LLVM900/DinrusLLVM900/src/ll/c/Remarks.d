
module ll.c.Remarks;
import ll.c.Types;

extern (C){

/**
 * @defgroup LLVMCREMARKS Remarks
 * @ingroup LLVMC
 *
 * @{
 */

const REMARKS_API_VERSION = 0;

/**
 * The тип of the emitted remark.
 */
enum LLVMRemarkType {
  Unknown,
  Passed,
  Missed,
  Analysis,
  AnalysisFPCommute,
  AnalysisAliasing,
  Failure
};

/**
 * текст containing a буфер и a length. The буфер is не guaranteed to be
 * нуль-terminated.
 *
 * \since REMARKS_API_VERSION=0
 */
struct LLVMRemarkOpaqueтекст;
alias LLVMRemarkOpaqueтекст *ЛЛТкстРемарки;

/**
 * Возвращает the буфер holding the ткст.
 *
 * \since REMARKS_API_VERSION=0
 */
 ткст0 ЛЛТкстРемарки_ДайДанные(ЛЛТкстРемарки текст);

/**
 * Возвращает the размер of the ткст.
 *
 * \since REMARKS_API_VERSION=0
 */
 uint32_t ЛЛТкстРемарки_ДайДлину(ЛЛТкстРемарки текст);

/**
 * DebugLoc containing Файл, Line и Column.
 *
 * \since REMARKS_API_VERSION=0
 */
struct LLVMRemarkOpaqueDebugLoc;
alias LLVMRemarkOpaqueDebugLoc *ЛЛОтладЛокРемарки;

/**
 * Return the путь to the source файл for a debug location.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛТкстРемарки
ЛЛОтладЛокРемарки_ДайПутьКИсходнику(ЛЛОтладЛокРемарки DL);

/**
 * Return the строка in the source файл for a debug location.
 *
 * \since REMARKS_API_VERSION=0
 */
 uint32_t ЛЛОтладЛокРемарки_ДайСтрокуИсходника(ЛЛОтладЛокРемарки DL);

/**
 * Return the column in the source файл for a debug location.
 *
 * \since REMARKS_API_VERSION=0
 */
 uint32_t ЛЛОтладЛокРемарки_ДайСтолбецИсходника(ЛЛОтладЛокРемарки DL);

/**
 * Element of the "арги" список. The ключ might give more information about what
 * the semantics of the знач are, e.g. "Callee" will tell you that the знач
 * является symbol that имена a function.
 *
 * \since REMARKS_API_VERSION=0
 */
struct LLVMRemarkOpaqueArg{}
alias LLVMRemarkOpaqueArg *ЛЛАргРемарки;

/**
 * Возвращает the ключ of an argument. The ключ defines what the знач is, и the
 * same ключ can appear multiple times in the список of аргументы.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛТкстРемарки ЛЛАргРемарки_ДайКлюч(ЛЛАргРемарки арг);

/**
 * Возвращает the знач of an argument. Сам является ткст that can contain newlines.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛТкстРемарки ЛЛАргРемарки_ДайЗначение(ЛЛАргРемарки арг);

/**
 * Возвращает the debug location that is attached to the знач of this argument.
 *
 * If there is Нет debug location, the return знач will be `NULL`.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛОтладЛокРемарки ЛЛАргРемарки_ДайОтладЛок(ЛЛАргРемарки арг);

/**
 * атр remark emitted by the compiler.
 *
 * \since REMARKS_API_VERSION=0
 */
struct LLVMRemarkOpaqueEntry{}
alias LLVMRemarkOpaqueEntry *ЛЛЗаписьРемарки;

/**
 * Free the resources используется by the remark entry.
 *
 * \since REMARKS_API_VERSION=0
 */
 проц ЛЛЗаписьРемарки_Вымести(ЛЛЗаписьРемарки Remark);

/**
 * The тип of the remark. For example, it can allow users to only keep the
 * missed optimizations from the compiler.
 *
 * \since REMARKS_API_VERSION=0
 */
 LLVMRemarkType ЛЛЗаписьРемарки_ДайТип(ЛЛЗаписьРемарки Remark);

/**
 * Get the имя of the pass that emitted this remark.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛТкстРемарки
ЛЛЗаписьРемарки_ДайИмяПроходки(ЛЛЗаписьРемарки Remark);

/**
 * Get an идентификатор of the remark.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛТкстРемарки
ЛЛЗаписьРемарки_ДайИмяРемарки(ЛЛЗаписьРемарки Remark);

/**
 * Get the имя of the function being processed when the remark was emitted.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛТкстРемарки
ЛЛЗаписьРемарки_ДайИмяФункции(ЛЛЗаписьРемарки Remark);

/**
 * Возвращает the debug location that is attached to this remark.
 *
 * If there is Нет debug location, the return знач will be `NULL`.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛОтладЛокРемарки
ЛЛЗаписьРемарки_ДайОтладЛок(ЛЛЗаписьРемарки Remark);

/**
 * Return the hotness of the remark.
 *
 * атр hotness of `0` means this знач is не set.
 *
 * \since REMARKS_API_VERSION=0
 */
 дол ЛЛЗаписьРемарки_ДайАктуальность(ЛЛЗаписьРемарки Remark);

/**
 * The number of аргументы the remark holds.
 *
 * \since REMARKS_API_VERSION=0
 */
 uint32_t ЛЛЗаписьРемарки_ДайЧлоАргов(ЛЛЗаписьРемарки Remark);

/**
 * Get a new iterator to iterate over a remark's argument.
 *
 * If there are Нет аргументы in \п Remark, the return знач will be `NULL`.
 *
 * The lifetime of the returned знач is bound to the lifetime of \п Remark.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛАргРемарки ЛЛЗаписьРемарки_ДайПервАрг(ЛЛЗаписьРемарки Remark);

/**
 * Get the следщ argument in \п Remark from the position of \п It.
 *
 * Возвращает `NULL` if there are Нет more аргументы доступно.
 *
 * The lifetime of the returned знач is bound to the lifetime of \п Remark.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛАргРемарки ЛЛЗаписьРемарки_ДайСледщАрг(ЛЛАргРемарки It,
                                                  ЛЛЗаписьРемарки Remark);

struct LLVMRemarkOpaqueпарсер;
alias LLVMRemarkOpaqueпарсер *ЛЛПарсерРемарок;

/**
 * Creates a remark parser that can be используется to parse the буфер located in \п
 * Buf of размер \п разм байты.
 *
 * \п Buf cannot be `NULL`.
 *
 * Сам function should be paired with LLVMRemarkпарсерDispose() to avoid
 * leaking resources.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛПарсерРемарок ЛЛПарсерРемарок_СоздайЙАМЛ(ук Buf,
                                                      дол разм);

/**
 * Возвращает the следщ remark in the файл.
 *
 * The знач pointed to by the return знач needs to be disposed using a вызов to
 * LLVMRemarkEntryDispose().
 *
 * All the entries in the returned знач that are of ЛЛТкстРемарки тип
 * will become invalidated once a вызов to LLVMRemarkпарсерDispose is made.
 *
 * If the parser reaches the end of the буфер, the return знач will be `NULL`.
 *
 * In the case of an ошибка, the return знач will be `NULL`, и:
 *
 * 1) LLVMRemarkпарсерHasError() will return `1`.
 *
 * 2) LLVMRemarkпарсерGetErrorMessage() will return a descriptive ошибка
 *    message.
 *
 * An ошибка may occur if:
 *
 * 1) An argument is invalid.
 *
 * 2) There является parsing ошибка. Сам can occur on things like malformed YAML.
 *
 * 3) There является Remark semantic ошибка. Сам can occur on well-formed файлы with
 *    missing или extra поля.
 *
 * Here является quick example of the использование:
 *
 * ```
 * ЛЛПарсерРемарок парсер = LLVMRemarkParserCreateYAML(Buf, разм);
 * ЛЛЗаписьРемарки Remark = NULL;
 * while ((Remark = LLVMRemarkParserGetNext(парсер))) {
 *    // use Remark
 *    LLVMRemarkEntryDispose(Remark); // Release memory.
 * }
 * бул HasError = LLVMRemarkParserHasError(парсер);
 * LLVMRemarkParserDispose(парсер);
 * ```
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛЗаписьРемарки ЛЛПарсерРемарок_ДайСледщ(ЛЛПарсерРемарок парсер);

/**
 * Возвращает `1` if the parser encountered an ошибка while parsing the буфер.
 *
 * \since REMARKS_API_VERSION=0
 */
 ЛЛБул ЛЛПарсерРемарок_ЕстьОш_ли(ЛЛПарсерРемарок парсер);

/**
 * Возвращает a пусто-terminated ткст containing an ошибка message.
 *
 * In case of Нет ошибка, the результат is `NULL`.
 *
 * The memory of the ткст is bound to the lifetime of \п парсер. If
 * LLVMRemarkпарсерDispose() is called, the memory of the ткст will be
 * released.
 *
 * \since REMARKS_API_VERSION=0
 */
 ткст0 ЛЛПарсерРемарок_ДайОшСооб(ЛЛПарсерРемарок парсер);

/**
 * Releases все the resources используется by \п парсер.
 *
 * \since REMARKS_API_VERSION=0
 */
 проц ЛЛПарсерРемарок_Вымести(ЛЛПарсерРемарок парсер);

}
