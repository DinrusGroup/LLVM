/*===-- clang-c/Index.h - Indexing Public C Interface -------------*- C -*-===*\
|*                                                                            *|
|*                     The LLVM Compiler Infrastructure                       *|
|*                                                                            *|
|* This file is distributed under the University of Illinois Open Source      *|
|* License. See LICENSE.TXT for details.                                      *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides a public interface to a Clang library for extracting  *|
|* high-level symbol information from source files without exposing the full  *|
|* Clang C++ API.                                                             *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module clang.c.Index;

import core.stdc.config;
import core.stdc.time;

public import clang.c.CXErrorCode;
public import clang.c.CXString;

extern (C):

/**
 * The version constants for the libclang API.
 * CINDEX_VERSION_MINOR should increase when there are API additions.
 * CINDEX_VERSION_MAJOR is intended for "major" source/ABI breaking changes.
 *
 * The policy about the libclang API was always to keep it source and ABI
 * compatible, thus CINDEX_VERSION_MAJOR is expected to remain stable.
 */
const CINDEX_VERSION_MAJOR = 0;
const CINDEX_VERSION_MINOR = 49;

/+ V-tas!!!

extern (Д) auto CINDEX_VERSION_ENCODE(T0, T1)(ref T0 major, ref T1 minor)
{
    return (major * 10000) + (minor * 1);
}

enum CINDEX_VERSION = CINDEX_VERSION_ENCODE(CINDEX_VERSION_MAJOR, CINDEX_VERSION_MINOR);

extern (Д) ткст CINDEX_VERSION_STRINGIZE_(T0, T1)(ref T0 major, ref T1 minor)
{
    import std.conv : to;

    return to!ткст(major) ~ "." ~ to!ткст(minor);
}

alias CINDEX_VERSION_STRINGIZE_ CINDEX_VERSION_STRINGIZE;

const CINDEX_VERSION_STRING = CINDEX_VERSION_STRINGIZE(CINDEX_VERSION_MAJOR, CINDEX_VERSION_MINOR);
+/

/** \defgroup CINDEX libclang: C Interface to Clang
 *
 * The C Interface to Clang provides a relatively small API that exposes
 * facilities for parsing source код into an abstract syntax tree (АСД),
 * loading already-parsed ASTs, traversing the АСД, associating
 * physical source locations with элты within the АСД, and другой
 * facilities that support Clang-based development tools.
 *
 * This C interface to Clang will never provide all of the information
 * representation stored in Clang's C++ АСД, nor should it: the intent is to
 * maintain an API that is relatively stable from один release to the next,
 * providing only the basic functionality needed to support development tools.
 *
 * To avoid простримён pollution, data types are prefixed with "CX" and
 * functions are prefixed with "clang_".
 *
 * @{
 */

/**
 * An "индекс" that consists of a set of translation units that would
 * typically be linked together into an executable or library.
 */
alias ук CXIndex;

/**
 * An opaque тип representing цель information for a given translation
 * unit.
 */
struct CXTargetInfoImpl;
alias CXTargetInfoImpl* CXTargetInfo;

/**
 * A single translation unit, which resides in an индекс.
 */
struct CXTranslationUnitImpl;
alias CXTranslationUnitImpl* CXTranslationUnit;

/**
 * Opaque pointer representing client data that will be passed through
 * to various callbacks and visitors.
 */
alias ук CXClientData;

/**
 * Provides the contents of a file that has not yet been saved to disk.
 *
 * Each CXUnsavedFile instance provides the name of a file on the
 * system along with the текущ contents of that file that have not
 * yet been saved to disk.
 */
struct CXUnsavedFile
{
    /**
     * The file whose contents have not yet been saved.
     *
     * This file must already exist in the file system.
     */
    ткст0 Filename;

    /**
     * A buffer containing the unsaved contents of this file.
     */
    ткст0 Contents;

    /**
     * The length of the unsaved contents of this buffer.
     */
    c_ulong Length;
}

/**
 * Describes the availability of a particular entity, which indicates
 * whether the use of this entity will result in a warning or ошибка due to
 * it being deprecated or unavailable.
 */
enum CXAvailabilityKind
{
    /**
     * The entity is available.
     */
    available = 0,
    /**
     * The entity is available, but has been deprecated (and its use is
     * not recommended).
     */
    deprecated_ = 1,
    /**
     * The entity is not available; any use of it will be an ошибка.
     */
    notAvailable = 2,
    /**
     * The entity is available, but not accessible; any use of it will be
     * an ошибка.
     */
    notAccessible = 3
}

/**
 * Describes a version number of the form major.minor.subminor.
 */
struct CXVersion
{
    /**
     * The major version number, e.g., the '10' in '10.7.3'. A negative
     * value indicates that there is Нет version number at all.
     */
    цел Major;
    /**
     * The minor version number, e.g., the '7' in '10.7.3'. This value
     * will be negative if Нет minor version number was provided, e.g., for
     * version '10'.
     */
    цел Minor;
    /**
     * The subminor version number, e.g., the '3' in '10.7.3'. This value
     * will be negative if Нет minor or subminor version number was provided,
     * e.g., in version '10' or '10.7'.
     */
    цел Subminor;
}

/**
 * Describes the exception specification of a cursor.
 *
 * A negative value indicates that the cursor is not a function declaration.
 */
enum CXCursor_ExceptionSpecificationKind
{
    /**
     * The cursor has Нет exception specification.
     */
    отсутствует = 0,

    /**
     * The cursor has exception specification throw()
     */
    dynamicNone = 1,

    /**
     * The cursor has exception specification throw(T1, T2)
     */
    dynamic = 2,

    /**
     * The cursor has exception specification throw(...).
     */
    msAny = 3,

    /**
     * The cursor has exception specification basic noexcept.
     */
    basicNoexcept = 4,

    /**
     * The cursor has exception specification computed noexcept.
     */
    computedNoexcept = 5,

    /**
     * The exception specification has not yet been evaluated.
     */
    unevaluated = 6,

    /**
     * The exception specification has not yet been instantiated.
     */
    uninstantiated = 7,

    /**
     * The exception specification has not been parsed yet.
     */
    unparsed = 8
}

/**
 * Provides a shared context for creating translation units.
 *
 * It provides two options:
 *
 * - excludeDeclarationsFromPCH: When non-zero, allows enumeration of "local"
 * declarations (when loading any new translation units). A "local" declaration
 * is один that belongs in the translation unit itself and not in a precompiled
 * header that was used by the translation unit. If zero, all declarations
 * will be enumerated.
 *
 * Here is an example:
 *
 * \код
 *   // excludeDeclsFromPCH = 1, displayDiagnostics=1
 *   Idx = clang_createIndex(1, 1);
 *
 *   // IndexTest.pch was produced with the following command:
 *   // "clang -x c IndexTest.h -emit-ast -o IndexTest.pch"
 *   TU = clang_createTranslationUnit(Idx, "IndexTest.pch");
 *
 *   // This will load all the symbols from 'IndexTest.pch'
 *   clang_visitChildren(clang_getTranslationUnitCursor(TU),
 *                       TranslationUnitVisitor, 0);
 *   clang_disposeTranslationUnit(TU);
 *
 *   // This will load all the symbols from 'IndexTest.c', excluding symbols
 *   // from 'IndexTest.pch'.
 *   сим *args[] = { "-Xclang", "-include-pch=IndexTest.pch" };
 *   TU = clang_createTranslationUnitFromSourceFile(Idx, "IndexTest.c", 2, args,
 *                                                  0, 0);
 *   clang_visitChildren(clang_getTranslationUnitCursor(TU),
 *                       TranslationUnitVisitor, 0);
 *   clang_disposeTranslationUnit(TU);
 * \endcode
 *
 * This process of creating the 'pch', loading it separately, and using it (via
 * -include-pch) allows 'excludeDeclsFromPCH' to remove redundant callbacks
 * (which gives the indexer the same performance benefit as the compiler).
 */
CXIndex clang_createIndex(
    цел excludeDeclarationsFromPCH,
    цел displayDiagnostics);

/**
 * Destroy the given индекс.
 *
 * The индекс must not be destroyed until all of the translation units created
 * within that индекс have been destroyed.
 */
проц clang_disposeIndex(CXIndex индекс);

enum CXGlobalOptFlags
{
    /**
     * Used to indicate that Нет special CXIndex options are needed.
     */
    отсутствует = 0x0,

    /**
     * Used to indicate that threads that libclang creates for indexing
     * purposes should use background priority.
     *
     * Affects #clang_indexSourceFile, #clang_indexTranslationUnit,
     * #clang_parseTranslationUnit, #clang_saveTranslationUnit.
     */
    threadBackgroundPriorityForIndexing = 0x1,

    /**
     * Used to indicate that threads that libclang creates for editing
     * purposes should use background priority.
     *
     * Affects #clang_reparseTranslationUnit, #clang_codeCompleteAt,
     * #clang_annotateTokens
     */
    threadBackgroundPriorityForEditing = 0x2,

    /**
     * Used to indicate that all threads that libclang creates should use
     * background priority.
     */
    threadBackgroundPriorityForAll = threadBackgroundPriorityForIndexing | threadBackgroundPriorityForEditing
}

/**
 * Sets general options associated with a CXIndex.
 *
 * For example:
 * \код
 * CXIndex idx = ...;
 * clang_CXIndex_setGlobalOptions(idx,
 *     clang_CXIndex_getGlobalOptions(idx) |
 *     CXGlobalOpt_ThreadBackgroundPriorityForIndexing);
 * \endcode
 *
 * \param options A bitmask of options, a bitwise OR of CXGlobalOpt_XXX флаги.
 */
проц clang_CXIndex_setGlobalOptions(CXIndex, uint options);

/**
 * Gets the general options associated with a CXIndex.
 *
 * \returns A bitmask of options, a bitwise OR of CXGlobalOpt_XXX флаги that
 * are associated with the given CXIndex object.
 */
uint clang_CXIndex_getGlobalOptions(CXIndex);

/**
 * Sets the invocation emission path option in a CXIndex.
 *
 * The invocation emission path specifies a path which will contain log
 * files for certain libclang invocations. A пусто value (default) implies that
 * libclang invocations are not logged..
 */
проц clang_CXIndex_setInvocationEmissionPathOption(CXIndex, ткст0 Path);

/**
 * \defgroup CINDEX_FILES File manipulation routines
 *
 * @{
 */

/**
 * A particular source file that is part of a translation unit.
 */
alias  ук CXFile;

/**
 * Retrieve the complete file and path name of the given file.
 */
CXString clang_getFileName(CXFile SFile);

/**
 * Retrieve the last modification time of the given file.
 */
time_t clang_getFileTime(CXFile SFile);

/**
 * Uniquely identifies a CXFile, that refers to the same underlying file,
 * across an indexing session.
 */
struct CXFileUniqueID
{
    бдол[3] data;
}

/**
 * Retrieve the unique ID for the given \c file.
 *
 * \param file the file to get the ID for.
 * \param outID stores the returned CXFileUniqueID.
 * \returns If there was a failure getting the unique ID, returns non-zero,
 * otherwise returns 0.
*/
цел clang_getFileUniqueID(CXFile file, CXFileUniqueID* outID);

/**
 * Determine whether the given header is guarded against
 * multiple inclusions, either with the conventional
 * \#ifndef/\#define/\#endif macro guards or with \#pragma once.
 */
uint clang_isFileMultipleIncludeGuarded(CXTranslationUnit tu, CXFile file);

/**
 * Retrieve a file handle within the given translation unit.
 *
 * \param tu the translation unit
 *
 * \param file_name the name of the file.
 *
 * \returns the file handle for the named file in the translation unit \п tu,
 * or a NULL file handle if the file was not a part of this translation unit.
 */
CXFile clang_getFile(CXTranslationUnit tu, ткст0 file_name);

/**
 * Retrieve the buffer associated with the given file.
 *
 * \param tu the translation unit
 *
 * \param file the file for which to retrieve the buffer.
 *
 * \param size [out] if non-NULL, will be set to the size of the buffer.
 *
 * \returns a pointer to the buffer in memory that holds the contents of
 * \п file, or a NULL pointer when the file is not loaded.
 */
ткст0 clang_getFileContents(
    CXTranslationUnit tu,
    CXFile file,
    т_мера* size);

/**
 * Returns non-zero if the \c file1 and \c file2 point to the same file,
 * or they are both NULL.
 */
цел clang_File_isEqual(CXFile file1, CXFile file2);

/**
 * Returns the real path name of \c file.
 *
 * An пуст ткст may be returned. Use \c clang_getFileName() in that case.
 */
CXString clang_File_tryGetRealPathName(CXFile file);

/**
 * @}
 */

/**
 * \defgroup CINDEX_LOCATIONS Physical source locations
 *
 * Clang represents physical source locations in its abstract syntax tree in
 * great detail, with file, строка, and column information for the majority of
 * the tokens parsed in the source код. These data types and functions are
 * used to represent source location information, either for a particular
 * point in the program or for a range of points in the program, and extract
 * specific location information from those data types.
 *
 * @{
 */

/**
 * Identifies a specific source location within a translation
 * unit.
 *
 * Use clang_getExpansionLocation() or clang_getSpellingLocation()
 * to map a source location to a particular file, строка, and column.
 */
struct CXSourceLocation
{
    ук[2] ptr_data;
    uint int_data;
}

/**
 * Identifies a half-open character range in the source код.
 *
 * Use clang_getRangeStart() and clang_getRangeEnd() to retrieve the
 * starting and end locations from a source range, respectively.
 */
struct CXSourceRange
{
    ук[2] ptr_data;
    uint begin_int_data;
    uint end_int_data;
}

/**
 * Retrieve a NULL (invalid) source location.
 */
CXSourceLocation clang_getNullLocation();

/**
 * Determine whether two source locations, which must refer into
 * the same translation unit, refer to exactly the same point in the source
 * код.
 *
 * \returns non-zero if the source locations refer to the same location, zero
 * if they refer to different locations.
 */
uint clang_equalLocations(CXSourceLocation loc1, CXSourceLocation loc2);

/**
 * Retrieves the source location associated with a given file/строка/column
 * in a particular translation unit.
 */
CXSourceLocation clang_getLocation(
    CXTranslationUnit tu,
    CXFile file,
    uint строка,
    uint column);
/**
 * Retrieves the source location associated with a given character offset
 * in a particular translation unit.
 */
CXSourceLocation clang_getLocationForOffset(
    CXTranslationUnit tu,
    CXFile file,
    uint offset);

/**
 * Returns non-zero if the given source location is in a system header.
 */
цел clang_Location_isInSystemHeader(CXSourceLocation location);

/**
 * Returns non-zero if the given source location is in the main file of
 * the corresponding translation unit.
 */
цел clang_Location_isFromMainFile(CXSourceLocation location);

/**
 * Retrieve a NULL (invalid) source range.
 */
CXSourceRange clang_getNullRange();

/**
 * Retrieve a source range given the beginning and ending source
 * locations.
 */
CXSourceRange clang_getRange(CXSourceLocation begin, CXSourceLocation end);

/**
 * Determine whether two ranges are equivalent.
 *
 * \returns non-zero if the ranges are the same, zero if they differ.
 */
uint clang_equalRanges(CXSourceRange range1, CXSourceRange range2);

/**
 * Returns non-zero if \п range is пусто.
 */
цел clang_Range_isNull(CXSourceRange range);

/**
 * Retrieve the file, строка, column, and offset represented by
 * the given source location.
 *
 * If the location refers into a macro expansion, retrieves the
 * location of the macro expansion.
 *
 * \param location the location within a source file that will be decomposed
 * into its parts.
 *
 * \param file [out] if non-NULL, will be set to the file to which the given
 * source location points.
 *
 * \param строка [out] if non-NULL, will be set to the строка to which the given
 * source location points.
 *
 * \param column [out] if non-NULL, will be set to the column to which the given
 * source location points.
 *
 * \param offset [out] if non-NULL, will be set to the offset into the
 * buffer to which the given source location points.
 */
проц clang_getExpansionLocation(
    CXSourceLocation location,
    CXFile* file,
    uint* строка,
    uint* column,
    uint* offset);

/**
 * Retrieve the file, строка and column represented by the given source
 * location, as specified in a # строка directive.
 *
 * Example: given the following source код in a file somefile.c
 *
 * \код
 * #123 "dummy.c" 1
 *
 * static цел функц(проц)
 * {
 *     return 0;
 * }
 * \endcode
 *
 * the location information returned by this function would be
 *
 * File: dummy.c Line: 124 Column: 12
 *
 * whereas clang_getExpansionLocation would have returned
 *
 * File: somefile.c Line: 3 Column: 12
 *
 * \param location the location within a source file that will be decomposed
 * into its parts.
 *
 * \param filename [out] if non-NULL, will be set to the filename of the
 * source location. Note that filenames returned will be for "virtual" files,
 * which don'т necessarily exist on the machine running clang - e.g. when
 * parsing preprocessed output obtained from a different environment. If
 * a non-NULL value is passed in, remember to dispose of the returned value
 * using \c clang_disposeString() once you've finished with it. For an invalid
 * source location, an пуст ткст is returned.
 *
 * \param строка [out] if non-NULL, will be set to the строка number of the
 * source location. For an invalid source location, zero is returned.
 *
 * \param column [out] if non-NULL, will be set to the column number of the
 * source location. For an invalid source location, zero is returned.
 */
проц clang_getPresumedLocation(
    CXSourceLocation location,
    CXString* filename,
    uint* строка,
    uint* column);

/**
 * Legacy API to retrieve the file, строка, column, and offset represented
 * by the given source location.
 *
 * This interface has been replaced by the newer interface
 * #clang_getExpansionLocation(). See that interface's documentation for
 * details.
 */
проц clang_getInstantiationLocation(
    CXSourceLocation location,
    CXFile* file,
    uint* строка,
    uint* column,
    uint* offset);

/**
 * Retrieve the file, строка, column, and offset represented by
 * the given source location.
 *
 * If the location refers into a macro instantiation, return where the
 * location was originally spelled in the source file.
 *
 * \param location the location within a source file that will be decomposed
 * into its parts.
 *
 * \param file [out] if non-NULL, will be set to the file to which the given
 * source location points.
 *
 * \param строка [out] if non-NULL, will be set to the строка to which the given
 * source location points.
 *
 * \param column [out] if non-NULL, will be set to the column to which the given
 * source location points.
 *
 * \param offset [out] if non-NULL, will be set to the offset into the
 * buffer to which the given source location points.
 */
проц clang_getSpellingLocation(
    CXSourceLocation location,
    CXFile* file,
    uint* строка,
    uint* column,
    uint* offset);

/**
 * Retrieve the file, строка, column, and offset represented by
 * the given source location.
 *
 * If the location refers into a macro expansion, return where the macro was
 * expanded or where the macro argument was written, if the location points at
 * a macro argument.
 *
 * \param location the location within a source file that will be decomposed
 * into its parts.
 *
 * \param file [out] if non-NULL, will be set to the file to which the given
 * source location points.
 *
 * \param строка [out] if non-NULL, will be set to the строка to which the given
 * source location points.
 *
 * \param column [out] if non-NULL, will be set to the column to which the given
 * source location points.
 *
 * \param offset [out] if non-NULL, will be set to the offset into the
 * buffer to which the given source location points.
 */
проц clang_getFileLocation(
    CXSourceLocation location,
    CXFile* file,
    uint* строка,
    uint* column,
    uint* offset);

/**
 * Retrieve a source location representing the first character within a
 * source range.
 */
CXSourceLocation clang_getRangeStart(CXSourceRange range);

/**
 * Retrieve a source location representing the last character within a
 * source range.
 */
CXSourceLocation clang_getRangeEnd(CXSourceRange range);

/**
 * Identifies an array of ranges.
 */
struct CXSourceRangeList
{
    /** The number of ranges in the \c ranges array. */
    uint счёт;
    /**
     * An array of \c CXSourceRanges.
     */
    CXSourceRange* ranges;
}

/**
 * Retrieve all ranges that were skipped by the preprocessor.
 *
 * The preprocessor will skip lines when they are surrounded by an
 * if/ifdef/ifndef directive whose condition does not evaluate to да.
 */
CXSourceRangeList* clang_getSkippedRanges(CXTranslationUnit tu, CXFile file);

/**
 * Retrieve all ranges from all files that were skipped by the
 * preprocessor.
 *
 * The preprocessor will skip lines when they are surrounded by an
 * if/ifdef/ifndef directive whose condition does not evaluate to да.
 */
CXSourceRangeList* clang_getAllSkippedRanges(CXTranslationUnit tu);

/**
 * Destroy the given \c CXSourceRangeList.
 */
проц clang_disposeSourceRangeList(CXSourceRangeList* ranges);

/**
 * @}
 */

/**
 * \defgroup CINDEX_DIAG Diagnostic reporting
 *
 * @{
 */

/**
 * Describes the severity of a particular diagnostic.
 */
enum CXDiagnosticSeverity
{
    /**
     * A diagnostic that has been suppressed, e.g., by a command-строка
     * option.
     */
    ignored = 0,

    /**
     * This diagnostic is a note that should be attached to the
     * previous (non-note) diagnostic.
     */
    note = 1,

    /**
     * This diagnostic indicates suspicious код that may not be
     * wrong.
     */
    warning = 2,

    /**
     * This diagnostic indicates that the код is ill-formed.
     */
    ошибка = 3,

    /**
     * This diagnostic indicates that the код is ill-formed such
     * that future parser recovery is unlikely to produce useful
     * results.
     */
    fatal = 4
}

/**
 * A single diagnostic, containing the diagnostic's severity,
 * location, text, source ranges, and fix-it hints.
 */
alias ук CXDiagnostic;

/**
 * A group of CXDiagnostics.
 */
alias ук CXDiagnosticSet;

/**
 * Determine the number of diagnostics in a CXDiagnosticSet.
 */
uint clang_getNumDiagnosticsInSet(CXDiagnosticSet Diags);

/**
 * Retrieve a diagnostic associated with the given CXDiagnosticSet.
 *
 * \param Diags the CXDiagnosticSet to query.
 * \param Index the zero-based diagnostic number to retrieve.
 *
 * \returns the requested diagnostic. This diagnostic must be freed
 * via a call to \c clang_disposeDiagnostic().
 */
CXDiagnostic clang_getDiagnosticInSet(CXDiagnosticSet Diags, uint Index);

/**
 * Describes the вид of ошибка that occurred (if any) in a call to
 * \c clang_loadDiagnostics.
 */
enum CXLoadDiag_Error
{
    /**
     * Indicates that Нет ошибка occurred.
     */
    отсутствует = 0,

    /**
     * Indicates that an unknown ошибка occurred while attempting to
     * deserialize diagnostics.
     */
    unknown = 1,

    /**
     * Indicates that the file containing the serialized diagnostics
     * could not be opened.
     */
    cannotLoad = 2,

    /**
     * Indicates that the serialized diagnostics file is invalid or
     * corrupt.
     */
    invalidFile = 3
}

/**
 * Deserialize a set of diagnostics from a Clang diagnostics bitcode
 * file.
 *
 * \param file The name of the file to deserialize.
 * \param ошибка A pointer to a enum value recording if there was a problem
 *        deserializing the diagnostics.
 * \param errorString A pointer to a CXString for recording the ошибка ткст
 *        if the file was not successfully loaded.
 *
 * \returns A loaded CXDiagnosticSet if successful, and NULL otherwise.  These
 * diagnostics should be released using clang_disposeDiagnosticSet().
 */
CXDiagnosticSet clang_loadDiagnostics(
    ткст0 file,
    CXLoadDiag_Error* ошибка,
    CXString* errorString);

/**
 * Release a CXDiagnosticSet and all of its contained diagnostics.
 */
проц clang_disposeDiagnosticSet(CXDiagnosticSet Diags);

/**
 * Retrieve the child diagnostics of a CXDiagnostic.
 *
 * This CXDiagnosticSet does not need to be released by
 * clang_disposeDiagnosticSet.
 */
CXDiagnosticSet clang_getChildDiagnostics(CXDiagnostic Д);

/**
 * Determine the number of diagnostics produced for the given
 * translation unit.
 */
uint clang_getNumDiagnostics(CXTranslationUnit Unit);

/**
 * Retrieve a diagnostic associated with the given translation unit.
 *
 * \param Unit the translation unit to query.
 * \param Index the zero-based diagnostic number to retrieve.
 *
 * \returns the requested diagnostic. This diagnostic must be freed
 * via a call to \c clang_disposeDiagnostic().
 */
CXDiagnostic clang_getDiagnostic(CXTranslationUnit Unit, uint Index);

/**
 * Retrieve the complete set of diagnostics associated with a
 *        translation unit.
 *
 * \param Unit the translation unit to query.
 */
CXDiagnosticSet clang_getDiagnosticSetFromTU(CXTranslationUnit Unit);

/**
 * Destroy a diagnostic.
 */
проц clang_disposeDiagnostic(CXDiagnostic Diagnostic);

/**
 * Options to control the display of diagnostics.
 *
 * The values in this enum are meant to be combined to customize the
 * behavior of \c clang_formatDiagnostic().
 */
enum CXDiagnosticDisplayOptions
{
    /**
     * Display the source-location information where the
     * diagnostic was located.
     *
     * When set, diagnostics will be prefixed by the file, строка, and
     * (optionally) column to which the diagnostic refers. For example,
     *
     * \код
     * test.c:28: warning: extra tokens at end of #endif directive
     * \endcode
     *
     * This option corresponds to the clang flag \c -fshow-source-location.
     */
    displaySourceLocation = 0x01,

    /**
     * If displaying the source-location information of the
     * diagnostic, also include the column number.
     *
     * This option corresponds to the clang flag \c -fshow-column.
     */
    displayColumn = 0x02,

    /**
     * If displaying the source-location information of the
     * diagnostic, also include information about source ranges in a
     * machine-parsable format.
     *
     * This option corresponds to the clang flag
     * \c -fdiagnostics-print-source-range-info.
     */
    displaySourceRanges = 0x04,

    /**
     * Display the option name associated with this diagnostic, if any.
     *
     * The option name displayed (e.g., -Wconversion) will be placed in brackets
     * after the diagnostic text. This option corresponds to the clang flag
     * \c -fdiagnostics-show-option.
     */
    displayOption = 0x08,

    /**
     * Display the category number associated with this diagnostic, if any.
     *
     * The category number is displayed within brackets after the diagnostic text.
     * This option corresponds to the clang flag
     * \c -fdiagnostics-show-category=ид.
     */
    displayCategoryId = 0x10,

    /**
     * Display the category name associated with this diagnostic, if any.
     *
     * The category name is displayed within brackets after the diagnostic text.
     * This option corresponds to the clang flag
     * \c -fdiagnostics-show-category=name.
     */
    displayCategoryName = 0x20
}

/**
 * Format the given diagnostic in a manner that is suitable for display.
 *
 * This routine will format the given diagnostic to a ткст, rendering
 * the diagnostic according to the various options given. The
 * \c clang_defaultDiagnosticDisplayOptions() function returns the set of
 * options that most closely mimics the behavior of the clang compiler.
 *
 * \param Diagnostic The diagnostic to print.
 *
 * \param Options A set of options that control the diagnostic display,
 * created by combining \c CXDiagnosticDisplayOptions values.
 *
 * \returns A new ткст containing for formatted diagnostic.
 */
CXString clang_formatDiagnostic(CXDiagnostic Diagnostic, uint Options);

/**
 * Retrieve the set of display options most similar to the
 * default behavior of the clang compiler.
 *
 * \returns A set of display options suitable for use with \c
 * clang_formatDiagnostic().
 */
uint clang_defaultDiagnosticDisplayOptions();

/**
 * Determine the severity of the given diagnostic.
 */
CXDiagnosticSeverity clang_getDiagnosticSeverity(CXDiagnostic);

/**
 * Retrieve the source location of the given diagnostic.
 *
 * This location is where Clang would print the caret ('^') when
 * displaying the diagnostic on the command строка.
 */
CXSourceLocation clang_getDiagnosticLocation(CXDiagnostic);

/**
 * Retrieve the text of the given diagnostic.
 */
CXString clang_getDiagnosticSpelling(CXDiagnostic);

/**
 * Retrieve the name of the command-строка option that enabled this
 * diagnostic.
 *
 * \param Diag The diagnostic to be queried.
 *
 * \param Disable If non-NULL, will be set to the option that disables this
 * diagnostic (if any).
 *
 * \returns A ткст that contains the command-строка option used to enable this
 * warning, such as "-Wconversion" or "-pedantic".
 */
CXString clang_getDiagnosticOption(CXDiagnostic Diag, CXString* Disable);

/**
 * Retrieve the category number for this diagnostic.
 *
 * Diagnostics can be categorized into groups along with другой, related
 * diagnostics (e.g., diagnostics under the same warning flag). This routine
 * retrieves the category number for the given diagnostic.
 *
 * \returns The number of the category that contains this diagnostic, or zero
 * if this diagnostic is uncategorized.
 */
uint clang_getDiagnosticCategory(CXDiagnostic);

/**
 * Retrieve the name of a particular diagnostic category.  This
 *  is now deprecated.  Use clang_getDiagnosticCategoryText()
 *  instead.
 *
 * \param Category A diagnostic category number, as returned by
 * \c clang_getDiagnosticCategory().
 *
 * \returns The name of the given diagnostic category.
 */
CXString clang_getDiagnosticCategoryName(uint Category);

/**
 * Retrieve the diagnostic category text for a given diagnostic.
 *
 * \returns The text of the given diagnostic category.
 */
CXString clang_getDiagnosticCategoryText(CXDiagnostic);

/**
 * Determine the number of source ranges associated with the given
 * diagnostic.
 */
uint clang_getDiagnosticNumRanges(CXDiagnostic);

/**
 * Retrieve a source range associated with the diagnostic.
 *
 * A diagnostic's source ranges highlight important элты in the source
 * код. On the command строка, Clang displays source ranges by
 * underlining them with '~' characters.
 *
 * \param Diagnostic the diagnostic whose range is being extracted.
 *
 * \param Range the zero-based индекс specifying which range to
 *
 * \returns the requested source range.
 */
CXSourceRange clang_getDiagnosticRange(CXDiagnostic Diagnostic, uint Range);

/**
 * Determine the number of fix-it hints associated with the
 * given diagnostic.
 */
uint clang_getDiagnosticNumFixIts(CXDiagnostic Diagnostic);

/**
 * Retrieve the replacement information for a given fix-it.
 *
 * Fix-its are described in terms of a source range whose contents
 * should be replaced by a ткст. This approach generalizes over
 * three kinds of operations: removal of source код (the range covers
 * the код to be removed and the replacement ткст is пуст),
 * replacement of source код (the range covers the код to be
 * replaced and the replacement ткст provides the new код), and
 * insertion (both the start and end of the range point at the
 * insertion location, and the replacement ткст provides the text to
 * insert).
 *
 * \param Diagnostic The diagnostic whose fix-its are being queried.
 *
 * \param FixIt The zero-based индекс of the fix-it.
 *
 * \param ReplacementRange The source range whose contents will be
 * replaced with the returned replacement ткст. Note that source
 * ranges are half-open ranges [a, b), so the source код should be
 * replaced from a and up to (but not including) b.
 *
 * \returns A ткст containing text that should be replace the source
 * код indicated by the \c ReplacementRange.
 */
CXString clang_getDiagnosticFixIt(
    CXDiagnostic Diagnostic,
    uint FixIt,
    CXSourceRange* ReplacementRange);

/**
 * @}
 */

/**
 * \defgroup CINDEX_TRANSLATION_UNIT Translation unit manipulation
 *
 * The routines in this group provide the ability to create and destroy
 * translation units from files, either by parsing the contents of the files or
 * by reading in a serialized representation of a translation unit.
 *
 * @{
 */

/**
 * Get the original translation unit source file name.
 */
CXString clang_getTranslationUnitSpelling(CXTranslationUnit CTUnit);

/**
 * Return the CXTranslationUnit for a given source file and the provided
 * command строка аргументы один would pass to the compiler.
 *
 * Note: The 'source_filename' argument is optional.  If the caller provides a
 * NULL pointer, the name of the source file is expected to reside in the
 * specified command строка аргументы.
 *
 * Note: When encountered in 'clang_command_line_args', the following options
 * are ignored:
 *
 *   '-c'
 *   '-emit-ast'
 *   '-fsyntax-only'
 *   '-o \<output file>'  (both '-o' and '\<output file>' are ignored)
 *
 * \param CIdx The индекс object with which the translation unit will be
 * associated.
 *
 * \param source_filename The name of the source file to load, or NULL if the
 * source file is included in \п clang_command_line_args.
 *
 * \param num_clang_command_line_args The number of command-строка аргументы in
 * \п clang_command_line_args.
 *
 * \param clang_command_line_args The command-строка аргументы that would be
 * passed to the \c clang executable if it were being invoked out-of-process.
 * These command-строка options will be parsed and will affect how the translation
 * unit is parsed. Note that the following options are ignored: '-c',
 * '-emit-ast', '-fsyntax-only' (which is the default), and '-o \<output file>'.
 *
 * \param num_unsaved_files the number of unsaved file entries in \п
 * unsaved_files.
 *
 * \param unsaved_files the files that have not yet been saved to disk
 * but may be required for код completion, including the contents of
 * those files.  The contents and name of these files (as specified by
 * CXUnsavedFile) are copied when necessary, so the client only needs to
 * guarantee their validity until the call to this function returns.
 */
CXTranslationUnit clang_createTranslationUnitFromSourceFile(
    CXIndex CIdx,
    ткст0 source_filename,
    цел num_clang_command_line_args,
    сим** clang_command_line_args,
    uint num_unsaved_files,
    CXUnsavedFile* unsaved_files);

/**
 * Same as \c clang_createTranslationUnit2, but returns
 * the \c CXTranslationUnit instead of an ошибка код.  In case of an ошибка this
 * routine returns a \c NULL \c CXTranslationUnit, without further detailed
 * ошибка codes.
 */
CXTranslationUnit clang_createTranslationUnit(
    CXIndex CIdx,
    ткст0 ast_filename);

/**
 * Create a translation unit from an АСД file (\c -emit-ast).
 *
 * \param[out] out_TU A non-NULL pointer to store the created
 * \c CXTranslationUnit.
 *
 * \returns Zero on success, otherwise returns an ошибка код.
 */
CXErrorCode clang_createTranslationUnit2(
    CXIndex CIdx,
    ткст0 ast_filename,
    CXTranslationUnit* out_TU);

/**
 * Flags that control the creation of translation units.
 *
 * The enumerators in this enumeration тип are meant to be bitwise
 * ORed together to specify which options should be used when
 * constructing the translation unit.
 */
enum CXTranslationUnit_Flags
{
    /**
     * Used to indicate that Нет special translation-unit options are
     * needed.
     */
    отсутствует = 0x0,

    /**
     * Used to indicate that the parser should construct a "detailed"
     * preprocessing record, including all macro definitions and instantiations.
     *
     * Constructing a detailed preprocessing record requires more memory
     * and time to parse, since the information contained in the record
     * is usually not retained. However, it can be useful for
     * applications that require more detailed information about the
     * behavior of the preprocessor.
     */
    detailedPreprocessingRecord = 0x01,

    /**
     * Used to indicate that the translation unit is incomplete.
     *
     * When a translation unit is considered "incomplete", semantic
     * analysis that is typically performed at the end of the
     * translation unit will be suppressed. For example, this suppresses
     * the completion of tentative declarations in C and of
     * instantiation of implicitly-instantiation function templates in
     * C++. This option is typically used when parsing a header with the
     * intent of producing a precompiled header.
     */
    incomplete = 0x02,

    /**
     * Used to indicate that the translation unit should be built with an
     * implicit precompiled header for the preamble.
     *
     * An implicit precompiled header is used as an optimization when a
     * particular translation unit is likely to be reparsed many times
     * when the sources aren'т changing that often. In this case, an
     * implicit precompiled header will be built containing all of the
     * начальн includes at the top of the main file (what we refer to as
     * the "preamble" of the file). In subsequent parses, if the
     * preamble or the files in it have not changed, \c
     * clang_reparseTranslationUnit() will рч-use the implicit
     * precompiled header to improve parsing performance.
     */
    precompiledPreamble = 0x04,

    /**
     * Used to indicate that the translation unit should cache some
     * код-completion results with each reparse of the source file.
     *
     * Caching of код-completion results is a performance optimization that
     * introduces some overhead to reparsing but improves the performance of
     * код-completion operations.
     */
    cacheCompletionResults = 0x08,

    /**
     * Used to indicate that the translation unit will be serialized with
     * \c clang_saveTranslationUnit.
     *
     * This option is typically used when parsing a header with the intent of
     * producing a precompiled header.
     */
    forSerialization = 0x10,

    /**
     * DEPRECATED: Enabled chained precompiled preambles in C++.
     *
     * Note: this is a *temporary* option that is available only while
     * we are testing C++ precompiled preamble support. It is deprecated.
     */
    cxxChainedPCH = 0x20,

    /**
     * Used to indicate that function/method bodies should be skipped while
     * parsing.
     *
     * This option can be used to ищи for declarations/definitions while
     * ignoring the usages.
     */
    skipFunctionBodies = 0x40,

    /**
     * Used to indicate that brief documentation comments should be
     * included into the set of код completions returned from this translation
     * unit.
     */
    includeBriefCommentsInCodeCompletion = 0x80,

    /**
     * Used to indicate that the precompiled preamble should be created on
     * the first parse. Otherwise it will be created on the first reparse. This
     * trades runtime on the first parse (serializing the preamble takes time) for
     * reduced runtime on the second parse (can now reuse the preamble).
     */
    createPreambleOnFirstParse = 0x100,

    /**
     * Do not stop processing when fatal ошибки are encountered.
     *
     * When fatal ошибки are encountered while parsing a translation unit,
     * semantic analysis is typically stopped early when compiling код. A common
     * source for fatal ошибки are unresolvable include files. For the
     * purposes of an IDE, this is undesirable behavior and as much information
     * as possible should be reported. Use this flag to enable this behavior.
     */
    keepGoing = 0x200,

    /**
     * Sets the preprocessor in a mode for parsing a single file only.
     */
    singleFileParse = 0x400,

    /**
     * Used in combination with CXTranslationUnit_SkipFunctionBodies to
     * constrain the skipping of function bodies to the preamble.
     *
     * The function bodies of the main file are not skipped.
     */
    limitSkipFunctionBodiesToPreamble = 0x800
}

/**
 * Returns the set of флаги that is suitable for parsing a translation
 * unit that is being edited.
 *
 * The set of флаги returned provide options for \c clang_parseTranslationUnit()
 * to indicate that the translation unit is likely to be reparsed many times,
 * either explicitly (via \c clang_reparseTranslationUnit()) or implicitly
 * (e.g., by код completion (\c clang_codeCompletionAt())). The returned flag
 * set contains an unspecified set of optimizations (e.g., the precompiled
 * preamble) geared toward improving the performance of these routines. The
 * set of optimizations enabled may change from один version to the next.
 */
uint clang_defaultEditingTranslationUnitOptions();

/**
 * Same as \c clang_parseTranslationUnit2, but returns
 * the \c CXTranslationUnit instead of an ошибка код.  In case of an ошибка this
 * routine returns a \c NULL \c CXTranslationUnit, without further detailed
 * ошибка codes.
 */
CXTranslationUnit clang_parseTranslationUnit(
    CXIndex CIdx,
    ткст0 source_filename,
    сим** command_line_args,
    цел num_command_line_args,
    CXUnsavedFile* unsaved_files,
    uint num_unsaved_files,
    uint options);

/**
 * Parse the given source file and the translation unit corresponding
 * to that file.
 *
 * This routine is the main entry point for the Clang C API, providing the
 * ability to parse a source file into a translation unit that can then be
 * queried by другой functions in the API. This routine accepts a set of
 * command-строка аргументы so that the compilation can be configured in the same
 * way that the compiler is configured on the command строка.
 *
 * \param CIdx The индекс object with which the translation unit will be
 * associated.
 *
 * \param source_filename The name of the source file to load, or NULL if the
 * source file is included in \c command_line_args.
 *
 * \param command_line_args The command-строка аргументы that would be
 * passed to the \c clang executable if it were being invoked out-of-process.
 * These command-строка options will be parsed and will affect how the translation
 * unit is parsed. Note that the following options are ignored: '-c',
 * '-emit-ast', '-fsyntax-only' (which is the default), and '-o \<output file>'.
 *
 * \param num_command_line_args The number of command-строка аргументы in
 * \c command_line_args.
 *
 * \param unsaved_files the files that have not yet been saved to disk
 * but may be required for parsing, including the contents of
 * those files.  The contents and name of these files (as specified by
 * CXUnsavedFile) are copied when necessary, so the client only needs to
 * guarantee their validity until the call to this function returns.
 *
 * \param num_unsaved_files the number of unsaved file entries in \п
 * unsaved_files.
 *
 * \param options A bitmask of options that affects how the translation unit
 * is managed but not its compilation. This should be a bitwise OR of the
 * CXTranslationUnit_XXX флаги.
 *
 * \param[out] out_TU A non-NULL pointer to store the created
 * \c CXTranslationUnit, describing the parsed код and containing any
 * diagnostics produced by the compiler.
 *
 * \returns Zero on success, otherwise returns an ошибка код.
 */
CXErrorCode clang_parseTranslationUnit2(
    CXIndex CIdx,
    ткст0 source_filename,
    сим** command_line_args,
    цел num_command_line_args,
    CXUnsavedFile* unsaved_files,
    uint num_unsaved_files,
    uint options,
    CXTranslationUnit* out_TU);

/**
 * Same as clang_parseTranslationUnit2 but requires a full command строка
 * for \c command_line_args including argv[0]. This is useful if the standard
 * library paths are relative to the binary.
 */
CXErrorCode clang_parseTranslationUnit2FullArgv(
    CXIndex CIdx,
    ткст0 source_filename,
    сим** command_line_args,
    цел num_command_line_args,
    CXUnsavedFile* unsaved_files,
    uint num_unsaved_files,
    uint options,
    CXTranslationUnit* out_TU);

/**
 * Flags that control how translation units are saved.
 *
 * The enumerators in this enumeration тип are meant to be bitwise
 * ORed together to specify which options should be used when
 * saving the translation unit.
 */
enum CXSaveTranslationUnit_Flags
{
    /**
     * Used to indicate that Нет special saving options are needed.
     */
    отсутствует = 0x0
}

/**
 * Returns the set of флаги that is suitable for saving a translation
 * unit.
 *
 * The set of флаги returned provide options for
 * \c clang_saveTranslationUnit() by default. The returned flag
 * set contains an unspecified set of options that save translation units with
 * the most commonly-requested data.
 */
uint clang_defaultSaveOptions(CXTranslationUnit TU);

/**
 * Describes the вид of ошибка that occurred (if any) in a call to
 * \c clang_saveTranslationUnit().
 */
enum CXSaveError
{
    /**
     * Indicates that Нет ошибка occurred while saving a translation unit.
     */
    отсутствует = 0,

    /**
     * Indicates that an unknown ошибка occurred while attempting to save
     * the file.
     *
     * This ошибка typically indicates that file I/O failed when attempting to
     * write the file.
     */
    unknown = 1,

    /**
     * Indicates that ошибки during translation prevented this attempt
     * to save the translation unit.
     *
     * Errors that prevent the translation unit from being saved can be
     * extracted using \c clang_getNumDiagnostics() and \c clang_getDiagnostic().
     */
    translationErrors = 2,

    /**
     * Indicates that the translation unit to be saved was somehow
     * invalid (e.g., NULL).
     */
    invalidTU = 3
}

/**
 * Saves a translation unit into a serialized representation of
 * that translation unit on disk.
 *
 * Any translation unit that was parsed without ошибка can be saved
 * into a file. The translation unit can then be deserialized into a
 * new \c CXTranslationUnit with \c clang_createTranslationUnit() or,
 * if it is an incomplete translation unit that corresponds to a
 * header, used as a precompiled header when parsing другой translation
 * units.
 *
 * \param TU The translation unit to save.
 *
 * \param FileName The file to which the translation unit will be saved.
 *
 * \param options A bitmask of options that affects how the translation unit
 * is saved. This should be a bitwise OR of the
 * CXSaveTranslationUnit_XXX флаги.
 *
 * \returns A value that will match один of the enumerators of the CXSaveError
 * enumeration. Zero (CXSaveError_None) indicates that the translation unit was
 * saved successfully, while a non-zero value indicates that a problem occurred.
 */
цел clang_saveTranslationUnit(
    CXTranslationUnit TU,
    ткст0 FileName,
    uint options);

/**
 * Suspend a translation unit in order to free memory associated with it.
 *
 * A suspended translation unit uses significantly less memory but on the другой
 * side does not support any другой calls than \c clang_reparseTranslationUnit
 * to resume it or \c clang_disposeTranslationUnit to dispose it completely.
 */
uint clang_suspendTranslationUnit(CXTranslationUnit);

/**
 * Destroy the specified CXTranslationUnit object.
 */
проц clang_disposeTranslationUnit(CXTranslationUnit);

/**
 * Flags that control the reparsing of translation units.
 *
 * The enumerators in this enumeration тип are meant to be bitwise
 * ORed together to specify which options should be used when
 * reparsing the translation unit.
 */
enum CXReparse_Flags
{
    /**
     * Used to indicate that Нет special reparsing options are needed.
     */
    отсутствует = 0x0
}

/**
 * Returns the set of флаги that is suitable for reparsing a translation
 * unit.
 *
 * The set of флаги returned provide options for
 * \c clang_reparseTranslationUnit() by default. The returned flag
 * set contains an unspecified set of optimizations geared toward common uses
 * of reparsing. The set of optimizations enabled may change from один version
 * to the next.
 */
uint clang_defaultReparseOptions(CXTranslationUnit TU);

/**
 * Reparse the source files that produced this translation unit.
 *
 * This routine can be used to рч-parse the source files that originally
 * created the given translation unit, for example because those source files
 * have changed (either on disk or as passed via \п unsaved_files). The
 * source код will be reparsed with the same command-строка options as it
 * was originally parsed.
 *
 * Reparsing a translation unit invalidates all cursors and source locations
 * that refer into that translation unit. This makes reparsing a translation
 * unit semantically equivalent to destroying the translation unit and then
 * creating a new translation unit with the same command-строка аргументы.
 * However, it may be more efficient to reparse a translation
 * unit using this routine.
 *
 * \param TU The translation unit whose contents will be рч-parsed. The
 * translation unit must originally have been built with
 * \c clang_createTranslationUnitFromSourceFile().
 *
 * \param num_unsaved_files The number of unsaved file entries in \п
 * unsaved_files.
 *
 * \param unsaved_files The files that have not yet been saved to disk
 * but may be required for parsing, including the contents of
 * those files.  The contents and name of these files (as specified by
 * CXUnsavedFile) are copied when necessary, so the client only needs to
 * guarantee their validity until the call to this function returns.
 *
 * \param options A bitset of options composed of the флаги in CXReparse_Flags.
 * The function \c clang_defaultReparseOptions() produces a default set of
 * options recommended for most uses, based on the translation unit.
 *
 * \returns 0 if the sources could be reparsed.  A non-zero ошибка код will be
 * returned if reparsing was impossible, such that the translation unit is
 * invalid. In such cases, the only valid call for \c TU is
 * \c clang_disposeTranslationUnit(TU).  The ошибка codes returned by this
 * routine are described by the \c CXErrorCode enum.
 */
цел clang_reparseTranslationUnit(
    CXTranslationUnit TU,
    uint num_unsaved_files,
    CXUnsavedFile* unsaved_files,
    uint options);

/**
  * Categorizes how memory is being used by a translation unit.
  */
enum CXTUResourceUsageKind
{
    ast = 1,
    identifiers = 2,
    selectors = 3,
    globalCompletionResults = 4,
    sourceManagerContentCache = 5,
    astSideTables = 6,
    sourceManagerMembufferMalloc = 7,
    sourceManagerMembufferMMap = 8,
    externalASTSourceMembufferMalloc = 9,
    externalASTSourceMembufferMMap = 10,
    preprocessor = 11,
    preprocessingRecord = 12,
    sourceManagerDataStructures = 13,
    preprocessorHeaderSearch = 14,
    memoryInBytesBegin = ast,
    memoryInBytesEnd = preprocessorHeaderSearch,

    first = ast,
    last = preprocessorHeaderSearch
}

/**
  * Returns the human-readable пусто-terminated C ткст that represents
  *  the name of the memory category.  This ткст should never be freed.
  */
ткст0 clang_getTUResourceUsageName(CXTUResourceUsageKind вид);

struct CXTUResourceUsageEntry
{
    /* The memory usage category. */
    CXTUResourceUsageKind вид;
    /* Amount of resources used.
        The units will depend on the resource вид. */
    c_ulong amount;
}

/**
  * The memory usage of a CXTranslationUnit, broken into categories.
  */
struct CXTUResourceUsage
{
    /* Private data member, used for queries. */
    ук data;

    /* The number of entries in the 'entries' array. */
    uint numEntries;

    /* An array of key-value pairs, representing the breakdown of memory
              usage. */
    CXTUResourceUsageEntry* entries;
}

/**
  * Return the memory usage of a translation unit.  This object
  *  should be released with clang_disposeCXTUResourceUsage().
  */
CXTUResourceUsage clang_getCXTUResourceUsage(CXTranslationUnit TU);

проц clang_disposeCXTUResourceUsage(CXTUResourceUsage usage);

/**
 * Get цель information for this translation unit.
 *
 * The CXTargetInfo object cannot outlive the CXTranslationUnit object.
 */
CXTargetInfo clang_getTranslationUnitTargetInfo(CXTranslationUnit CTUnit);

/**
 * Destroy the CXTargetInfo object.
 */
проц clang_TargetInfo_dispose(CXTargetInfo Info);

/**
 * Get the normalized цель triple as a ткст.
 *
 * Returns the пуст ткст in case of any ошибка.
 */
CXString clang_TargetInfo_getTriple(CXTargetInfo Info);

/**
 * Get the pointer width of the цель in bits.
 *
 * Returns -1 in case of ошибка.
 */
цел clang_TargetInfo_getPointerWidth(CXTargetInfo Info);

/**
 * @}
 */

/**
 * Describes the вид of entity that a cursor refers to.
 */
enum CXCursorKind
{
    /* Declarations */
    /**
     * A declaration whose specific вид is not exposed via this
     * interface.
     *
     * Unexposed declarations have the same operations as any другой вид
     * of declaration; один can extract their location information,
     * spelling, find their definitions, etc. However, the specific вид
     * of the declaration is not reported.
     */
    unexposedDecl = 1,
    /** A C or C++ struct. */
    structDecl = 2,
    /** A C or C++ union. */
    unionDecl = 3,
    /** A C++ class. */
    classDecl = 4,
    /** An enumeration. */
    enumDecl = 5,
    /**
     * A поле (in C) or non-static data member (in C++) in a
     * struct, union, or C++ class.
     */
    fieldDecl = 6,
    /** An enumerator constant. */
    enumConstantDecl = 7,
    /** A function. */
    functionDecl = 8,
    /** A переменная. */
    varDecl = 9,
    /** A function or method parameter. */
    parmDecl = 10,
    /** An Objective-C \@interface. */
    objCInterfaceDecl = 11,
    /** An Objective-C \@interface for a category. */
    objCCategoryDecl = 12,
    /** An Objective-C \@protocol declaration. */
    objCProtocolDecl = 13,
    /** An Objective-C \/*@property declaration. */
    objCPropertyDecl = 14,
    /** An Objective-C instance переменная. */
    objCIvarDecl = 15,
    /** An Objective-C instance method. */
    objCInstanceMethodDecl = 16,
    /** An Objective-C class method. */
    objCClassMethodDecl = 17,
    /** An Objective-C \@implementation. */
    objCImplementationDecl = 18,
    /** An Objective-C \@implementation for a category. */
    objCCategoryImplDecl = 19,
    /** A typedef. */
    typedefDecl = 20,
    /** A C++ class method. */
    cxxMethod = 21,
    /** A C++ простримён. */
    простримён = 22,
    /** A компонаж specification, e.g. 'extern "C"'. */
    linkageSpec = 23,
    /** A C++ constructor. */
    constructor = 24,
    /** A C++ destructor. */
    destructor = 25,
    /** A C++ conversion function. */
    conversionFunction = 26,
    /** A C++ template тип parameter. */
    templateTypeParameter = 27,
    /** A C++ non-тип template parameter. */
    nonTypeTemplateParameter = 28,
    /** A C++ template template parameter. */
    templateTemplateParameter = 29,
    /** A C++ function template. */
    functionTemplate = 30,
    /** A C++ class template. */
    classTemplate = 31,
    /** A C++ class template partial specialization. */
    classTemplatePartialSpecialization = 32,
    /** A C++ простримён alias declaration. */
    namespaceAlias = 33,
    /** A C++ using directive. */
    usingDirective = 34,
    /** A C++ using declaration. */
    usingDeclaration = 35,
    /** A C++ alias declaration */
    typeAliasDecl = 36,
    /** An Objective-C \@synthesize definition. */
    objCSynthesizeDecl = 37,
    /** An Objective-C \@dynamic definition. */
    objCDynamicDecl = 38,
    /** An access specifier. */
    cxxAccessSpecifier = 39,

    firstDecl = unexposedDecl,
    lastDecl = cxxAccessSpecifier,

    /* References */
    firstRef = 40, /* Decl references */
    objCSuperClassRef = 40,
    objCProtocolRef = 41,
    objCClassRef = 42,
    /**
     * A reference to a тип declaration.
     *
     * A тип reference occurs anywhere where a тип is named but not
     * declared. For example, given:
     *
     * \код
     * typedef unsigned т_мераype;
     * т_мераype size;
     * \endcode
     *
     * The typedef is a declaration of т_мераype (CXCursor_TypedefDecl),
     * while the тип of the переменная "size" is referenced. The cursor
     * referenced by the тип of size is the typedef for т_мераype.
     */
    typeRef = 43,
    cxxBaseSpecifier = 44,
    /**
     * A reference to a class template, function template, template
     * template parameter, or class template partial specialization.
     */
    templateRef = 45,
    /**
     * A reference to a простримён or простримён alias.
     */
    namespaceRef = 46,
    /**
     * A reference to a member of a struct, union, or class that occurs in
     * some non-expression context, e.g., a designated initializer.
     */
    memberRef = 47,
    /**
     * A reference to a labeled statement.
     *
     * This cursor вид is used to describe the jump to "start_over" in the
     * goto statement in the following example:
     *
     * \код
     *   start_over:
     *     ++counter;
     *
     *     goto start_over;
     * \endcode
     *
     * A label reference cursor refers to a label statement.
     */
    labelRef = 48,

    /**
     * A reference to a set of overloaded functions or function templates
     * that has not yet been resolved to a specific function or function template.
     *
     * An overloaded declaration reference cursor occurs in C++ templates where
     * a dependent name refers to a function. For example:
     *
     * \код
     * template<typename Т> проц swap(Т&, Т&);
     *
     * struct X { ... };
     * проц swap(X&, X&);
     *
     * template<typename Т>
     * проц реверсируй(Т* first, Т* last) {
     *   while (first < last - 1) {
     *     swap(*first, *--last);
     *     ++first;
     *   }
     * }
     *
     * struct Y { };
     * проц swap(Y&, Y&);
     * \endcode
     *
     * Here, the identifier "swap" is associated with an overloaded declaration
     * reference. In the template definition, "swap" refers to either of the two
     * "swap" functions declared above, so both results will be available. At
     * instantiation time, "swap" may also refer to другой functions found via
     * argument-dependent сыщи (e.g., the "swap" function at the end of the
     * example).
     *
     * The functions \c clang_getNumOverloadedDecls() and
     * \c clang_getOverloadedDecl() can be used to retrieve the definitions
     * referenced by this cursor.
     */
    overloadedDeclRef = 49,

    /**
     * A reference to a переменная that occurs in some non-expression
     * context, e.g., a C++ lambda capture list.
     */
    variableRef = 50,

    lastRef = variableRef,

    /* Error conditions */
    firstInvalid = 70,
    invalidFile = 70,
    noDeclFound = 71,
    notImplemented = 72,
    invalidCode = 73,
    lastInvalid = invalidCode,

    /* Expressions */
    firstExpr = 100,

    /**
     * An expression whose specific вид is not exposed via this
     * interface.
     *
     * Unexposed expressions have the same operations as any другой вид
     * of expression; один can extract their location information,
     * spelling, children, etc. However, the specific вид of the
     * expression is not reported.
     */
    unexposedExpr = 100,

    /**
     * An expression that refers to some value declaration, such
     * as a function, переменная, or enumerator.
     */
    declRefExpr = 101,

    /**
     * An expression that refers to a member of a struct, union,
     * class, Objective-C class, etc.
     */
    memberRefExpr = 102,

    /** An expression that calls a function. */
    callExpr = 103,

    /** An expression that sends a message to an Objective-C
     object or class. */
    objCMessageExpr = 104,

    /** An expression that represents a block literal. */
    blockExpr = 105,

    /** An integer literal.
     */
    integerLiteral = 106,

    /** A floating point number literal.
     */
    floatingLiteral = 107,

    /** An imaginary number literal.
     */
    imaginaryLiteral = 108,

    /** A ткст literal.
     */
    stringLiteral = 109,

    /** A character literal.
     */
    characterLiteral = 110,

    /** A parenthesized expression, e.g. "(1)".
     *
     * This АСД node is only formed if full location information is requested.
     */
    parenExpr = 111,

    /** This represents the unary-expression's (except sizeof and
     * alignof).
     */
    unaryOperator = 112,

    /** [C99 6.5.2.1] Массив Subscripting.
     */
    arraySubscriptExpr = 113,

    /** A builtin binary operation expression such as "x + y" or
     * "x <= y".
     */
    binaryOperator = 114,

    /** Compound assignment such as "+=".
     */
    compoundAssignOperator = 115,

    /** The ?: ternary operator.
     */
    conditionalOperator = 116,

    /** An explicit cast in C (C99 6.5.4) or a C-style cast in C++
     * (C++ [выр.cast]), which uses the syntax (Type)выр.
     *
     * For example: (цел)f.
     */
    cStyleCastExpr = 117,

    /** [C99 6.5.2.5]
     */
    compoundLiteralExpr = 118,

    /** Describes an C or C++ initializer list.
     */
    initListExpr = 119,

    /** The GNU адрес of label extension, representing &&label.
     */
    addrLabelExpr = 120,

    /** This is the GNU Инструкция2 Expression extension: ({цел X=4; X;})
     */
    stmtExpr = 121,

    /** Represents a C11 generic selection.
     */
    genericSelectionExpr = 122,

    /** Implements the GNU __null extension, which is a name for a пусто
     * pointer constant that has integral тип (e.g., цел or дол) and is the same
     * size and раскладка as a pointer.
     *
     * The __null extension is typically only used by system headers, which define
     * NULL as __null in C++ rather than using 0 (which is an integer that may not
     * match the size of a pointer).
     */
    gnuNullExpr = 123,

    /** C++'s static_cast<> expression.
     */
    cxxStaticCastExpr = 124,

    /** C++'s dynamic_cast<> expression.
     */
    cxxDynamicCastExpr = 125,

    /** C++'s reinterpret_cast<> expression.
     */
    cxxReinterpretCastExpr = 126,

    /** C++'s const_cast<> expression.
     */
    cxxConstCastExpr = 127,

    /** Represents an explicit C++ тип conversion that uses "functional"
     * notion (C++ [выр.тип.conv]).
     *
     * Example:
     * \код
     *   x = цел(0.5);
     * \endcode
     */
    cxxFunctionalCastExpr = 128,

    /** A C++ typeid expression (C++ [выр.typeid]).
     */
    cxxTypeidExpr = 129,

    /** [C++ 2.13.5] C++ Boolean Literal.
     */
    cxxBoolLiteralExpr = 130,

    /** [C++0x 2.14.7] C++ Pointer Literal.
     */
    cxxNullPtrLiteralExpr = 131,

    /** Represents the "this" expression in C++
     */
    cxxThisExpr = 132,

    /** [C++ 15] C++ Throw Expression.
     *
     * This handles 'throw' and 'throw' assignment-expression. When
     * assignment-expression isn'т present, Op will be пусто.
     */
    cxxThrowExpr = 133,

    /** A new expression for memory allocation and constructor calls, e.g:
     * "new CXXNewExpr(foo)".
     */
    cxxNewExpr = 134,

    /** A delete expression for memory deallocation and destructor calls,
     * e.g. "delete[] pМассив".
     */
    cxxDeleteExpr = 135,

    /** A unary expression. (noexcept, sizeof, or другой traits)
     */
    unaryExpr = 136,

    /** An Objective-C ткст literal i.e. @"foo".
     */
    objCStringLiteral = 137,

    /** An Objective-C \@encode expression.
     */
    objCEncodeExpr = 138,

    /** An Objective-C \@selector expression.
     */
    objCSelectorExpr = 139,

    /** An Objective-C \@protocol expression.
     */
    objCProtocolExpr = 140,

    /** An Objective-C "bridged" cast expression, which casts between
     * Objective-C pointers and C pointers, transferring ownership in the process.
     *
     * \код
     *   NSString *ткт = (__bridge_transfer NSString *)CFCreateString();
     * \endcode
     */
    objCBridgedCastExpr = 141,

    /** Represents a C++0x pack expansion that produces a sequence of
     * expressions.
     *
     * A pack expansion expression contains a pattern (which itself is an
     * expression) followed by an ellipsis. For example:
     *
     * \код
     * template<typename F, typename ...Типы>
     * проц forward(F f, Типы &&...args) {
     *  f(static_cast<Типы&&>(args)...);
     * }
     * \endcode
     */
    packExpansionExpr = 142,

    /** Represents an expression that computes the length of a parameter
     * pack.
     *
     * \код
     * template<typename ...Типы>
     * struct счёт {
     *   static const unsigned value = sizeof...(Типы);
     * };
     * \endcode
     */
    sizeOfPackExpr = 143,

    /* Represents a C++ lambda expression that produces a local function
     * object.
     *
     * \код
     * проц abssort(float *x, unsigned N) {
     *   std::sort(x, x + N,
     *             [](float a, float b) {
     *               return std::abs(a) < std::abs(b);
     *             });
     * }
     * \endcode
     */
    lambdaExpr = 144,

    /** Objective-c Boolean Literal.
     */
    objCBoolLiteralExpr = 145,

    /** Represents the "self" expression in an Objective-C method.
     */
    objCSelfExpr = 146,

    /** OpenMP 4.0 [2.4, Массив Section].
     */
    ompМассивSectionExpr = 147,

    /** Represents an @available(...) check.
     */
    objCAvailabilityCheckExpr = 148,

    /**
     * Fixed point literal
     */
    fixedPointLiteral = 149,

    lastExpr = fixedPointLiteral,

    /* Инструкции */
    firstStmt = 200,
    /**
     * A statement whose specific вид is not exposed via this
     * interface.
     *
     * Unexposed statements have the same operations as any другой вид of
     * statement; один can extract their location information, spelling,
     * children, etc. However, the specific вид of the statement is not
     * reported.
     */
    unexposedStmt = 200,

    /** A labelled statement in a function.
     *
     * This cursor вид is used to describe the "start_over:" label statement in
     * the following example:
     *
     * \код
     *   start_over:
     *     ++counter;
     * \endcode
     *
     */
    labelStmt = 201,

    /** A group of statements like { stmt stmt }.
     *
     * This cursor вид is used to describe compound statements, e.g. function
     * bodies.
     */
    compoundStmt = 202,

    /** A case statement.
     */
    caseStmt = 203,

    /** A default statement.
     */
    defaultStmt = 204,

    /** An if statement
     */
    ifStmt = 205,

    /** A switch statement.
     */
    switchStmt = 206,

    /** A while statement.
     */
    whileStmt = 207,

    /** A do statement.
     */
    doStmt = 208,

    /** A for statement.
     */
    forStmt = 209,

    /** A goto statement.
     */
    gotoStmt = 210,

    /** An indirect goto statement.
     */
    indirectGotoStmt = 211,

    /** A continue statement.
     */
    continueStmt = 212,

    /** A break statement.
     */
    breakStmt = 213,

    /** A return statement.
     */
    returnStmt = 214,

    /** A GCC inline assembly statement extension.
     */
    gccAsmStmt = 215,
    asmStmt = gccAsmStmt,

    /** Objective-C's overall \@try-\@catch-\@finally statement.
     */
    objCAtTryStmt = 216,

    /** Objective-C's \@catch statement.
     */
    objCAtCatchStmt = 217,

    /** Objective-C's \@finally statement.
     */
    objCAtFinallyStmt = 218,

    /** Objective-C's \@throw statement.
     */
    objCAtThrowStmt = 219,

    /** Objective-C's \@synchronized statement.
     */
    objCAtSynchronizedStmt = 220,

    /** Objective-C's autorelease pool statement.
     */
    objCAutoreleasePoolStmt = 221,

    /** Objective-C's collection statement.
     */
    objCForCollectionStmt = 222,

    /** C++'s catch statement.
     */
    cxxCatchStmt = 223,

    /** C++'s try statement.
     */
    cxxTryStmt = 224,

    /** C++'s for (* : *) statement.
     */
    cxxForRangeStmt = 225,

    /** Windows Structured Exception Handling's try statement.
     */
    sehTryStmt = 226,

    /** Windows Structured Exception Handling's except statement.
     */
    sehExceptStmt = 227,

    /** Windows Structured Exception Handling's finally statement.
     */
    sehFinallyStmt = 228,

    /** A MS inline assembly statement extension.
     */
    msAsmStmt = 229,

    /** The пусто statement ";": C99 6.8.3p3.
     *
     * This cursor вид is used to describe the пусто statement.
     */
    nullStmt = 230,

    /** Adaptor class for mixing declarations with statements and
     * expressions.
     */
    declStmt = 231,

    /** OpenMP parallel directive.
     */
    ompParallelDirective = 232,

    /** OpenMP SIMD directive.
     */
    ompSimdDirective = 233,

    /** OpenMP for directive.
     */
    ompForDirective = 234,

    /** OpenMP sections directive.
     */
    ompSectionsDirective = 235,

    /** OpenMP section directive.
     */
    ompSectionDirective = 236,

    /** OpenMP single directive.
     */
    ompSingleDirective = 237,

    /** OpenMP parallel for directive.
     */
    ompParallelForDirective = 238,

    /** OpenMP parallel sections directive.
     */
    ompParallelSectionsDirective = 239,

    /** OpenMP task directive.
     */
    ompTaskDirective = 240,

    /** OpenMP master directive.
     */
    ompMasterDirective = 241,

    /** OpenMP critical directive.
     */
    ompCriticalDirective = 242,

    /** OpenMP taskyield directive.
     */
    ompTaskyieldDirective = 243,

    /** OpenMP barrier directive.
     */
    ompBarrierDirective = 244,

    /** OpenMP taskwait directive.
     */
    ompTaskwaitDirective = 245,

    /** OpenMP flush directive.
     */
    ompFlushDirective = 246,

    /** Windows Structured Exception Handling's leave statement.
     */
    sehLeaveStmt = 247,

    /** OpenMP ordered directive.
     */
    ompOrderedDirective = 248,

    /** OpenMP atomic directive.
     */
    ompAtomicDirective = 249,

    /** OpenMP for SIMD directive.
     */
    ompForSimdDirective = 250,

    /** OpenMP parallel for SIMD directive.
     */
    ompParallelForSimdDirective = 251,

    /** OpenMP цель directive.
     */
    ompTargetDirective = 252,

    /** OpenMP teams directive.
     */
    ompTeamsDirective = 253,

    /** OpenMP taskgroup directive.
     */
    ompTaskgroupDirective = 254,

    /** OpenMP cancellation point directive.
     */
    ompCancellationPointDirective = 255,

    /** OpenMP cancel directive.
     */
    ompCancelDirective = 256,

    /** OpenMP цель data directive.
     */
    ompTargetDataDirective = 257,

    /** OpenMP taskloop directive.
     */
    ompTaskLoopDirective = 258,

    /** OpenMP taskloop simd directive.
     */
    ompTaskLoopSimdDirective = 259,

    /** OpenMP distribute directive.
     */
    ompDistributeDirective = 260,

    /** OpenMP цель enter data directive.
     */
    ompTargetEnterDataDirective = 261,

    /** OpenMP цель exit data directive.
     */
    ompTargetExitDataDirective = 262,

    /** OpenMP цель parallel directive.
     */
    ompTargetParallelDirective = 263,

    /** OpenMP цель parallel for directive.
     */
    ompTargetParallelForDirective = 264,

    /** OpenMP цель обнови directive.
     */
    ompTargetUpdateDirective = 265,

    /** OpenMP distribute parallel for directive.
     */
    ompDistributeParallelForDirective = 266,

    /** OpenMP distribute parallel for simd directive.
     */
    ompDistributeParallelForSimdDirective = 267,

    /** OpenMP distribute simd directive.
     */
    ompDistributeSimdDirective = 268,

    /** OpenMP цель parallel for simd directive.
     */
    ompTargetParallelForSimdDirective = 269,

    /** OpenMP цель simd directive.
     */
    ompTargetSimdDirective = 270,

    /** OpenMP teams distribute directive.
     */
    ompTeamsDistributeDirective = 271,

    /** OpenMP teams distribute simd directive.
     */
    ompTeamsDistributeSimdDirective = 272,

    /** OpenMP teams distribute parallel for simd directive.
     */
    ompTeamsDistributeParallelForSimdDirective = 273,

    /** OpenMP teams distribute parallel for directive.
     */
    ompTeamsDistributeParallelForDirective = 274,

    /** OpenMP цель teams directive.
     */
    ompTargetTeamsDirective = 275,

    /** OpenMP цель teams distribute directive.
     */
    ompTargetTeamsDistributeDirective = 276,

    /** OpenMP цель teams distribute parallel for directive.
     */
    ompTargetTeamsDistributeParallelForDirective = 277,

    /** OpenMP цель teams distribute parallel for simd directive.
     */
    ompTargetTeamsDistributeParallelForSimdDirective = 278,

    /** OpenMP цель teams distribute simd directive.
     */
    ompTargetTeamsDistributeSimdDirective = 279,

    lastStmt = ompTargetTeamsDistributeSimdDirective,

    /**
     * Cursor that represents the translation unit itself.
     *
     * The translation unit cursor exists primarily to act as the root
     * cursor for traversing the contents of a translation unit.
     */
    translationUnit = 300,

    /* Attributes */
    firstAttr = 400,
    /**
     * An attribute whose specific вид is not exposed via this
     * interface.
     */
    unexposedAttr = 400,

    ibActionAttr = 401,
    ibOutletAttr = 402,
    ibOutletCollectionAttr = 403,
    cxxFinalAttr = 404,
    cxxOverrideAttr = 405,
    annotateAttr = 406,
    asmLabelAttr = 407,
    packedAttr = 408,
    pureAttr = 409,
    constAttr = 410,
    noDuplicateAttr = 411,
    cudaConstantAttr = 412,
    cudaDeviceAttr = 413,
    cudaGlobalAttr = 414,
    cudaHostAttr = 415,
    cudaSharedAttr = 416,
    visibilityAttr = 417,
    dllExport = 418,
    dllImport = 419,
    lastAttr = dllImport,

    /* Preprocessing */
    preprocessingDirective = 500,
    macroDefinition = 501,
    macroExpansion = 502,
    macroInstantiation = macroExpansion,
    inclusionDirective = 503,
    firstPreprocessing = preprocessingDirective,
    lastPreprocessing = inclusionDirective,

    /* Extra Declarations */
    /**
     * A module import declaration.
     */
    moduleImportDecl = 600,
    typeAliasTemplateDecl = 601,
    /**
     * A static_assert or _Static_assert node
     */
    staticAssert = 602,
    /**
     * a friend declaration.
     */
    friendDecl = 603,
    firstExtraDecl = moduleImportDecl,
    lastExtraDecl = friendDecl,

    /**
     * A код completion overload candidate.
     */
    overloadCandidate = 700
}

/**
 * A cursor representing some element in the abstract syntax tree for
 * a translation unit.
 *
 * The cursor abstraction unifies the different kinds of entities in a
 * program--declaration, statements, expressions, references to declarations,
 * etc.--under a single "cursor" abstraction with a common set of operations.
 * Common operation for a cursor include: getting the physical location in
 * a source file where the cursor points, getting the name associated with a
 * cursor, and retrieving cursors for any child nodes of a particular cursor.
 *
 * Cursors can be produced in two specific ways.
 * clang_getTranslationUnitCursor() produces a cursor for a translation unit,
 * from which один can use clang_visitChildren() to explore the rest of the
 * translation unit. clang_getCursor() maps from a physical source location
 * to the entity that resides at that location, allowing один to map from the
 * source код into the АСД.
 */
struct CXCursor
{
    CXCursorKind вид;
    цел xdata;
    ук[3] data;
}

/**
 * \defgroup CINDEX_CURSOR_MANIP Cursor manipulations
 *
 * @{
 */

/**
 * Retrieve the NULL cursor, which represents Нет entity.
 */
CXCursor clang_getNullCursor();

/**
 * Retrieve the cursor that represents the given translation unit.
 *
 * The translation unit cursor can be used to start traversing the
 * various declarations within the given translation unit.
 */
CXCursor clang_getTranslationUnitCursor(CXTranslationUnit);

/**
 * Determine whether two cursors are equivalent.
 */
uint clang_equalCursors(CXCursor, CXCursor);

/**
 * Returns non-zero if \п cursor is пусто.
 */
цел clang_Cursor_isNull(CXCursor cursor);

/**
 * Compute a hash value for the given cursor.
 */
uint clang_hashCursor(CXCursor);

/**
 * Retrieve the вид of the given cursor.
 */
CXCursorKind clang_getCursorKind(CXCursor);

/**
 * Determine whether the given cursor вид represents a declaration.
 */
uint clang_isDeclaration(CXCursorKind);

/**
 * Determine whether the given declaration is invalid.
 *
 * A declaration is invalid if it could not be parsed successfully.
 *
 * \returns non-zero if the cursor represents a declaration and it is
 * invalid, otherwise NULL.
 */
uint clang_isInvalidDeclaration(CXCursor);

/**
 * Determine whether the given cursor вид represents a simple
 * reference.
 *
 * Note that другой kinds of cursors (such as expressions) can also refer to
 * другой cursors. Use clang_getCursorReferenced() to determine whether a
 * particular cursor refers to another entity.
 */
uint clang_isReference(CXCursorKind);

/**
 * Determine whether the given cursor вид represents an expression.
 */
uint clang_isExpression(CXCursorKind);

/**
 * Determine whether the given cursor вид represents a statement.
 */
uint clang_isStatement(CXCursorKind);

/**
 * Determine whether the given cursor вид represents an attribute.
 */
uint clang_isAttribute(CXCursorKind);

/**
 * Determine whether the given cursor has any attributes.
 */
uint clang_Cursor_hasAttrs(CXCursor C);

/**
 * Determine whether the given cursor вид represents an invalid
 * cursor.
 */
uint clang_isInvalid(CXCursorKind);

/**
 * Determine whether the given cursor вид represents a translation
 * unit.
 */
uint clang_isTranslationUnit(CXCursorKind);

/***
 * Determine whether the given cursor represents a preprocessing
 * element, such as a preprocessor directive or macro instantiation.
 */
uint clang_isPreprocessing(CXCursorKind);

/***
 * Determine whether the given cursor represents a currently
 *  unexposed piece of the АСД (e.g., CXCursor_UnexposedStmt).
 */
uint clang_isUnexposed(CXCursorKind);

/**
 * Describe the компонаж of the entity referred to by a cursor.
 */
enum CXLinkageKind
{
    /** This value indicates that Нет компонаж information is available
     * for a provided CXCursor. */
    invalid = 0,
    /**
     * This is the компонаж for variables, параметры, and so on that
     *  have automatic storage.  This covers normal (non-extern) local variables.
     */
    noLinkage = 1,
    /** This is the компонаж for static variables and static functions. */
    internal = 2,
    /** This is the компонаж for entities with external компонаж that live
     * in C++ anonymous namespaces.*/
    uniqueExternal = 3,
    /** This is the компонаж for entities with да, external компонаж. */
    external = 4
}

/**
 * Determine the компонаж of the entity referred to by a given cursor.
 */
CXLinkageKind clang_getCursorLinkage(CXCursor cursor);

enum CXVisibilityKind
{
    /** This value indicates that Нет visibility information is available
     * for a provided CXCursor. */
    invalid = 0,

    /** Символ2 not seen by the linker. */
    hidden = 1,
    /** Символ2 seen by the linker but resolves to a symbol inside this object. */
    протект_ = 2,
    /** Символ2 seen by the linker and acts like a normal symbol. */
    default_ = 3
}

/**
 * Describe the visibility of the entity referred to by a cursor.
 *
 * This returns the default visibility if not explicitly specified by
 * a visibility attribute. The default visibility may be changed by
 * commandline аргументы.
 *
 * \param cursor The cursor to query.
 *
 * \returns The visibility of the cursor.
 */
CXVisibilityKind clang_getCursorVisibility(CXCursor cursor);

/**
 * Determine the availability of the entity that this cursor refers to,
 * taking the текущ цель platform into account.
 *
 * \param cursor The cursor to query.
 *
 * \returns The availability of the cursor.
 */
CXAvailabilityKind clang_getCursorAvailability(CXCursor cursor);

/**
 * Describes the availability of a given entity on a particular platform, e.g.,
 * a particular class might only be available on Mac OS 10.7 or newer.
 */
struct CXPlatformAvailability
{
    /**
     * A ткст that describes the platform for which this structure
     * provides availability information.
     *
     * Possible values are "ios" or "macos".
     */
    CXString Platform;
    /**
     * The version number in which this entity was introduced.
     */
    CXVersion Introduced;
    /**
     * The version number in which this entity was deprecated (but is
     * still available).
     */
    CXVersion Deprecated;
    /**
     * The version number in which this entity was obsoleted, and therefore
     * is Нет longer available.
     */
    CXVersion Obsoleted;
    /**
     * Whether the entity is unconditionally unavailable on this platform.
     */
    цел Unavailable;
    /**
     * An optional message to provide to a user of this API, e.g., to
     * suggest replacement APIs.
     */
    CXString Message;
}

/**
 * Determine the availability of the entity that this cursor refers to
 * on any platforms for which availability information is known.
 *
 * \param cursor The cursor to query.
 *
 * \param always_deprecated If non-NULL, will be set to indicate whether the
 * entity is deprecated on all platforms.
 *
 * \param deprecated_message If non-NULL, will be set to the message text
 * provided along with the unconditional deprecation of this entity. The client
 * is responsible for deallocating this ткст.
 *
 * \param always_unavailable If non-NULL, will be set to indicate whether the
 * entity is unavailable on all platforms.
 *
 * \param unavailable_message If non-NULL, will be set to the message text
 * provided along with the unconditional unavailability of this entity. The
 * client is responsible for deallocating this ткст.
 *
 * \param availability If non-NULL, an array of CXPlatformAvailability instances
 * that will be populated with platform availability information, up to either
 * the number of platforms for which availability information is available (as
 * returned by this function) or \c availability_size, whichever is smaller.
 *
 * \param availability_size The number of элты available in the
 * \c availability array.
 *
 * \returns The number of platforms (N) for which availability information is
 * available (which is unrelated to \c availability_size).
 *
 * Note that the client is responsible for calling
 * \c clang_disposeCXPlatformAvailability to free each of the
 * platform-availability structures returned. There are
 * \c min(N, availability_size) such structures.
 */
цел clang_getCursorPlatformAvailability(
    CXCursor cursor,
    цел* always_deprecated,
    CXString* deprecated_message,
    цел* always_unavailable,
    CXString* unavailable_message,
    CXPlatformAvailability* availability,
    цел availability_size);

/**
 * Free the memory associated with a \c CXPlatformAvailability structure.
 */
проц clang_disposeCXPlatformAvailability(CXPlatformAvailability* availability);

/**
 * Describe the "language" of the entity referred to by a cursor.
 */
enum CXLanguageKind
{
    invalid = 0,
    c = 1,
    objC = 2,
    cPlusPlus = 3
}

/**
 * Determine the "language" of the entity referred to by a given cursor.
 */
CXLanguageKind clang_getCursorLanguage(CXCursor cursor);

/**
 * Describe the "thread-local storage (TLS) вид" of the declaration
 * referred to by a cursor.
 */
enum CXTLSKind
{
    отсутствует = 0,
    dynamic = 1,
    static_ = 2
}

/**
 * Determine the "thread-local storage (TLS) вид" of the declaration
 * referred to by a cursor.
 */
CXTLSKind clang_getCursorTLSKind(CXCursor cursor);

/**
 * Returns the translation unit that a cursor originated from.
 */
CXTranslationUnit clang_Cursor_getTranslationUnit(CXCursor);

/**
 * A fast container representing a set of CXCursors.
 */
struct CXCursorSetImpl;
alias  CXCursorSetImpl* CXCursorSet;

/**
 * Creates an пуст CXCursorSet.
 */
CXCursorSet clang_createCXCursorSet();

/**
 * Disposes a CXCursorSet and releases its associated memory.
 */
проц clang_disposeCXCursorSet(CXCursorSet cset);

/**
 * Queries a CXCursorSet to see if it contains a specific CXCursor.
 *
 * \returns non-zero if the set contains the specified cursor.
*/
uint clang_CXCursorSet_contains(CXCursorSet cset, CXCursor cursor);

/**
 * Inserts a CXCursor into a CXCursorSet.
 *
 * \returns zero if the CXCursor was already in the set, and non-zero otherwise.
*/
uint clang_CXCursorSet_insert(CXCursorSet cset, CXCursor cursor);

/**
 * Determine the semantic родитель of the given cursor.
 *
 * The semantic родитель of a cursor is the cursor that semantically contains
 * the given \п cursor. For many declarations, the lexical and semantic parents
 * are equivalent (the lexical родитель is returned by
 * \c clang_getCursorLexicalParent()). They diverge when declarations or
 * definitions are provided out-of-строка. For example:
 *
 * \код
 * class C {
 *  проц f();
 * };
 *
 * проц C::f() { }
 * \endcode
 *
 * In the out-of-строка definition of \c C::f, the semantic родитель is
 * the class \c C, of which this function is a member. The lexical родитель is
 * the place where the declaration actually occurs in the source код; in this
 * case, the definition occurs in the translation unit. In general, the
 * lexical родитель for a given entity can change without affecting the semantics
 * of the program, and the lexical родитель of different declarations of the
 * same entity may be different. Changing the semantic родитель of a declaration,
 * on the другой hand, can have a major impact on semantics, and redeclarations
 * of a particular entity should all have the same semantic context.
 *
 * In the example above, both declarations of \c C::f have \c C as their
 * semantic context, while the lexical context of the first \c C::f is \c C
 * and the lexical context of the second \c C::f is the translation unit.
 *
 * For глоб2 declarations, the semantic родитель is the translation unit.
 */
CXCursor clang_getCursorSemanticParent(CXCursor cursor);

/**
 * Determine the lexical родитель of the given cursor.
 *
 * The lexical родитель of a cursor is the cursor in which the given \п cursor
 * was actually written. For many declarations, the lexical and semantic parents
 * are equivalent (the semantic родитель is returned by
 * \c clang_getCursorSemanticParent()). They diverge when declarations or
 * definitions are provided out-of-строка. For example:
 *
 * \код
 * class C {
 *  проц f();
 * };
 *
 * проц C::f() { }
 * \endcode
 *
 * In the out-of-строка definition of \c C::f, the semantic родитель is
 * the class \c C, of which this function is a member. The lexical родитель is
 * the place where the declaration actually occurs in the source код; in this
 * case, the definition occurs in the translation unit. In general, the
 * lexical родитель for a given entity can change without affecting the semantics
 * of the program, and the lexical родитель of different declarations of the
 * same entity may be different. Changing the semantic родитель of a declaration,
 * on the другой hand, can have a major impact on semantics, and redeclarations
 * of a particular entity should all have the same semantic context.
 *
 * In the example above, both declarations of \c C::f have \c C as their
 * semantic context, while the lexical context of the first \c C::f is \c C
 * and the lexical context of the second \c C::f is the translation unit.
 *
 * For declarations written in the глоб2 масштаб, the lexical родитель is
 * the translation unit.
 */
CXCursor clang_getCursorLexicalParent(CXCursor cursor);

/**
 * Determine the set of methods that are overridden by the given
 * method.
 *
 * In both Objective-C and C++, a method (aka virtual member function,
 * in C++) can override a virtual method in a base class. For
 * Objective-C, a method is said to override any method in the class's
 * base class, its protocols, or its categories' protocols, that has the same
 * selector and is of the same вид (class or instance).
 * If Нет such method exists, the ищи continues to the class's superclass,
 * its protocols, and its categories, and so on. A method from an Objective-C
 * implementation is considered to override the same methods as its
 * corresponding method in the interface.
 *
 * For C++, a virtual member function overrides any virtual member
 * function with the same signature that occurs in its base
 * classes. With multiple inheritance, a virtual member function can
 * override several virtual member functions coming from different
 * base classes.
 *
 * In all cases, this function determines the immediate overridden
 * method, rather than all of the overridden methods. For example, if
 * a method is originally declared in a class A, then overridden in B
 * (which in inherits from A) and also in C (which inherited from B),
 * then the only overridden method returned from this function when
 * invoked on C's method will be B's method. The client may then
 * invoke this function again, given the previously-found overridden
 * methods, to map out the complete method-override set.
 *
 * \param cursor A cursor representing an Objective-C or C++
 * method. This routine will compute the set of methods that this
 * method overrides.
 *
 * \param overridden A pointer whose pointee will be replaced with a
 * pointer to an array of cursors, representing the set of overridden
 * methods. If there are Нет overridden methods, the pointee will be
 * set to NULL. The pointee must be freed via a call to
 * \c clang_disposeOverriddenCursors().
 *
 * \param num_overridden A pointer to the number of overridden
 * functions, will be set to the number of overridden functions in the
 * array pointed to by \п overridden.
 */
проц clang_getOverriddenCursors(
    CXCursor cursor,
    CXCursor** overridden,
    uint* num_overridden);

/**
 * Free the set of overridden cursors returned by \c
 * clang_getOverriddenCursors().
 */
проц clang_disposeOverriddenCursors(CXCursor* overridden);

/**
 * Retrieve the file that is included by the given inclusion directive
 * cursor.
 */
CXFile clang_getIncludedFile(CXCursor cursor);

/**
 * @}
 */

/**
 * \defgroup CINDEX_CURSOR_SOURCE Mapping between cursors and source код
 *
 * Cursors represent a location within the Abstract Syntax Tree (АСД). These
 * routines help map between cursors and the physical locations where the
 * described entities occur in the source код. The mapping is provided in
 * both directions, so один can map from source код to the АСД and back.
 *
 * @{
 */

/**
 * Map a source location to the cursor that describes the entity at that
 * location in the source код.
 *
 * clang_getCursor() maps an arbitrary source location within a translation
 * unit down to the most specific cursor that describes the entity at that
 * location. For example, given an expression \c x + y, invoking
 * clang_getCursor() with a source location pointing to "x" will return the
 * cursor for "x"; similarly for "y". If the cursor points anywhere between
 * "x" or "y" (e.g., on the + or the whitespace around it), clang_getCursor()
 * will return a cursor referring to the "+" expression.
 *
 * \returns a cursor representing the entity at the given source location, or
 * a NULL cursor if Нет such entity can be found.
 */
CXCursor clang_getCursor(CXTranslationUnit, CXSourceLocation);

/**
 * Retrieve the physical location of the source constructor referenced
 * by the given cursor.
 *
 * The location of a declaration is typically the location of the name of that
 * declaration, where the name of that declaration would occur if it is
 * unnamed, or some keyword that introduces that particular declaration.
 * The location of a reference is where that reference occurs within the
 * source код.
 */
CXSourceLocation clang_getCursorLocation(CXCursor);

/**
 * Retrieve the physical extent of the source construct referenced by
 * the given cursor.
 *
 * The extent of a cursor starts with the file/строка/column pointing at the
 * first character within the source construct that the cursor refers to and
 * ends with the last character within that source construct. For a
 * declaration, the extent covers the declaration itself. For a reference,
 * the extent covers the location of the reference (e.g., where the referenced
 * entity was actually used).
 */
CXSourceRange clang_getCursorExtent(CXCursor);

/**
 * @}
 */

/**
 * \defgroup CINDEX_TYPES Type information for CXCursors
 *
 * @{
 */

/**
 * Describes the вид of тип
 */
enum CXTypeKind
{
    /**
     * Represents an invalid тип (e.g., where Нет тип is available).
     */
    invalid = 0,

    /**
     * A тип whose specific вид is not exposed via this
     * interface.
     */
    unexposed = 1,

    /* Builtin types */
    проц_ = 2,
    бул_ = 3,
    charU = 4,
    uChar = 5,
    char16 = 6,
    char32 = 7,
    uShort = 8,
    uInt = 9,
    uLong = 10,
    uLongLong = 11,
    uInt128 = 12,
    charS = 13,
    sChar = 14,
    wChar = 15,
    short_ = 16,
    int_ = 17,
    long_ = 18,
    longLong = 19,
    int128 = 20,
    float_ = 21,
    double_ = 22,
    longDouble = 23,
    nullPtr = 24,
    overload = 25,
    dependent = 26,
    objCId = 27,
    objCClass = 28,
    objCSel = 29,
    float128 = 30,
    half = 31,
    float16 = 32,
    shortAccum = 33,
    accum = 34,
    longAccum = 35,
    uShortAccum = 36,
    uAccum = 37,
    uLongAccum = 38,
    firstBuiltin = проц_,
    lastBuiltin = uLongAccum,

    complex = 100,
    pointer = 101,
    blockPointer = 102,
    lValueReference = 103,
    rValueReference = 104,
    record = 105,
    enum_ = 106,
    typedef_ = 107,
    objCInterface = 108,
    objCObjectPointer = 109,
    functionNoProto = 110,
    functionProto = 111,
    constantМассив = 112,
    вектор = 113,
    incompleteМассив = 114,
    variableМассив = 115,
    dependentSizedМассив = 116,
    memberPointer = 117,
    auto_ = 118,

    /**
     * Represents a тип that was referred to using an elaborated тип keyword.
     *
     * В.g., struct И, or via a qualified name, e.g., N::M::тип, or both.
     */
    elaborated = 119,

    /* OpenCL PipeType. */
    pipe = 120,

    /* OpenCL builtin types. */
    oclImage1dRO = 121,
    oclImage1dМассивRO = 122,
    oclImage1dBufferRO = 123,
    oclImage2dRO = 124,
    oclImage2dМассивRO = 125,
    oclImage2dDepthRO = 126,
    oclImage2dМассивDepthRO = 127,
    oclImage2dMSAARO = 128,
    oclImage2dМассивMSAARO = 129,
    oclImage2dMSAADepthRO = 130,
    oclImage2dМассивMSAADepthRO = 131,
    oclImage3dRO = 132,
    oclImage1dWO = 133,
    oclImage1dМассивWO = 134,
    oclImage1dBufferWO = 135,
    oclImage2dWO = 136,
    oclImage2dМассивWO = 137,
    oclImage2dDepthWO = 138,
    oclImage2dМассивDepthWO = 139,
    oclImage2dMSAAWO = 140,
    oclImage2dМассивMSAAWO = 141,
    oclImage2dMSAADepthWO = 142,
    oclImage2dМассивMSAADepthWO = 143,
    oclImage3dWO = 144,
    oclImage1dRW = 145,
    oclImage1dМассивRW = 146,
    oclImage1dBufferRW = 147,
    oclImage2dRW = 148,
    oclImage2dМассивRW = 149,
    oclImage2dDepthRW = 150,
    oclImage2dМассивDepthRW = 151,
    oclImage2dMSAARW = 152,
    oclImage2dМассивMSAARW = 153,
    oclImage2dMSAADepthRW = 154,
    oclImage2dМассивMSAADepthRW = 155,
    oclImage3dRW = 156,
    oclSampler = 157,
    oclEvent = 158,
    oclQueue = 159,
    oclReserveID = 160
}

/**
 * Describes the calling convention of a function тип
 */
enum CXCallingConv
{
    default_ = 0,
    c = 1,
    x86StdCall = 2,
    x86FastCall = 3,
    x86ThisCall = 4,
    x86Pascal = 5,
    aapcs = 6,
    aapcsVfp = 7,
    x86RegCall = 8,
    intelOclBicc = 9,
    win64 = 10,
    /* Alias for compatibility with older versions of API. */
    x8664Win64 = win64,
    x8664SysV = 11,
    x86VectorCall = 12,
    swift = 13,
    preserveMost = 14,
    preserveAll = 15,

    invalid = 100,
    unexposed = 200
}

/**
 * The тип of an element in the abstract syntax tree.
 *
 */
struct CXType
{
    CXTypeKind вид;
    ук[2] data;
}

/**
 * Retrieve the тип of a CXCursor (if any).
 */
CXType clang_getCursorType(CXCursor C);

/**
 * Pretty-print the underlying тип using the rules of the
 * language of the translation unit from which it came.
 *
 * If the тип is invalid, an пуст ткст is returned.
 */
CXString clang_getTypeSpelling(CXType CT);

/**
 * Retrieve the underlying тип of a typedef declaration.
 *
 * If the cursor does not reference a typedef declaration, an invalid тип is
 * returned.
 */
CXType clang_getTypedefDeclUnderlyingType(CXCursor C);

/**
 * Retrieve the integer тип of an enum declaration.
 *
 * If the cursor does not reference an enum declaration, an invalid тип is
 * returned.
 */
CXType clang_getEnumDeclIntegerType(CXCursor C);

/**
 * Retrieve the integer value of an enum constant declaration as a signed
 *  дол дол.
 *
 * If the cursor does not reference an enum constant declaration, LLONG_MIN is returned.
 * Since this is also potentially a valid constant value, the вид of the cursor
 * must be verified before calling this function.
 */
дол clang_getEnumConstantDeclValue(CXCursor C);

/**
 * Retrieve the integer value of an enum constant declaration as an unsigned
 *  дол дол.
 *
 * If the cursor does not reference an enum constant declaration, ULLONG_MAX is returned.
 * Since this is also potentially a valid constant value, the вид of the cursor
 * must be verified before calling this function.
 */
бдол clang_getEnumConstantDeclUnsignedValue(CXCursor C);

/**
 * Retrieve the bit width of a bit поле declaration as an integer.
 *
 * If a cursor that is not a bit поле declaration is passed in, -1 is returned.
 */
цел clang_getFieldDeclBitWidth(CXCursor C);

/**
 * Retrieve the number of non-variadic аргументы associated with a given
 * cursor.
 *
 * The number of аргументы can be determined for calls as well as for
 * declarations of functions or methods. For другой cursors -1 is returned.
 */
цел clang_Cursor_getNumArguments(CXCursor C);

/**
 * Retrieve the argument cursor of a function or method.
 *
 * The argument cursor can be determined for calls as well as for declarations
 * of functions or methods. For другой cursors and for invalid indices, an
 * invalid cursor is returned.
 */
CXCursor clang_Cursor_getArgument(CXCursor C, uint i);

/**
 * Describes the вид of a template argument.
 *
 * See the definition of llvm::clang::TemplateArgument::ArgKind for full
 * element descriptions.
 */
enum CXTemplateArgumentKind
{
    пусто_ = 0,
    тип = 1,
    declaration = 2,
    nullPtr = 3,
    integral = 4,
    template_ = 5,
    templateExpansion = 6,
    expression = 7,
    pack = 8,
    /* Indicates an ошибка case, preventing the вид from being deduced. */
    invalid = 9
}

/**
 *Returns the number of template args of a function decl representing a
 * template specialization.
 *
 * If the argument cursor cannot be converted into a template function
 * declaration, -1 is returned.
 *
 * For example, for the following declaration and specialization:
 *   template <typename Т, цел kInt, бул kBool>
 *   проц foo() { ... }
 *
 *   template <>
 *   проц foo<float, -7, да>();
 *
 * The value 3 would be returned from this call.
 */
цел clang_Cursor_getNumTemplateArguments(CXCursor C);

/**
 * Retrieve the вид of the I'th template argument of the CXCursor C.
 *
 * If the argument CXCursor does not represent a FunctionDecl, an invalid
 * template argument вид is returned.
 *
 * For example, for the following declaration and specialization:
 *   template <typename Т, цел kInt, бул kBool>
 *   проц foo() { ... }
 *
 *   template <>
 *   проц foo<float, -7, да>();
 *
 * For I = 0, 1, and 2, Type, Integral, and Integral will be returned,
 * respectively.
 */
CXTemplateArgumentKind clang_Cursor_getTemplateArgumentKind(CXCursor C, uint I);

/**
 * Retrieve a CXType representing the тип of a TemplateArgument of a
 *  function decl representing a template specialization.
 *
 * If the argument CXCursor does not represent a FunctionDecl whose I'th
 * template argument has a вид of CXTemplateArgKind_Integral, an invalid тип
 * is returned.
 *
 * For example, for the following declaration and specialization:
 *   template <typename Т, цел kInt, бул kBool>
 *   проц foo() { ... }
 *
 *   template <>
 *   проц foo<float, -7, да>();
 *
 * If called with I = 0, "float", will be returned.
 * Invalid types will be returned for I == 1 or 2.
 */
CXType clang_Cursor_getTemplateArgumentType(CXCursor C, uint I);

/**
 * Retrieve the value of an Integral TemplateArgument (of a function
 *  decl representing a template specialization) as a signed дол дол.
 *
 * It неопределено to call this function on a CXCursor that does not represent a
 * FunctionDecl or whose I'th template argument is not an integral value.
 *
 * For example, for the following declaration and specialization:
 *   template <typename Т, цел kInt, бул kBool>
 *   проц foo() { ... }
 *
 *   template <>
 *   проц foo<float, -7, да>();
 *
 * If called with I = 1 or 2, -7 or да will be returned, respectively.
 * For I == 0, this function's behavior неопределено.
 */
дол clang_Cursor_getTemplateArgumentValue(CXCursor C, uint I);

/**
 * Retrieve the value of an Integral TemplateArgument (of a function
 *  decl representing a template specialization) as an unsigned дол дол.
 *
 * It неопределено to call this function on a CXCursor that does not represent a
 * FunctionDecl or whose I'th template argument is not an integral value.
 *
 * For example, for the following declaration and specialization:
 *   template <typename Т, цел kInt, бул kBool>
 *   проц foo() { ... }
 *
 *   template <>
 *   проц foo<float, 2147483649, да>();
 *
 * If called with I = 1 or 2, 2147483649 or да will be returned, respectively.
 * For I == 0, this function's behavior неопределено.
 */
бдол clang_Cursor_getTemplateArgumentUnsignedValue(CXCursor C, uint I);

/**
 * Determine whether two CXTypes represent the same тип.
 *
 * \returns non-zero if the CXTypes represent the same тип and
 *          zero otherwise.
 */
uint clang_equalTypes(CXType A, CXType B);

/**
 * Return the canonical тип for a CXType.
 *
 * Clang's тип system explicitly models typedefs and all the ways
 * a specific тип can be represented.  The canonical тип is the underlying
 * тип with all the "sugar" removed.  For example, if 'Т' is a typedef
 * for 'цел', the canonical тип for 'Т' would be 'цел'.
 */
CXType clang_getCanonicalType(CXType Т);

/**
 * Determine whether a CXType has the "const" qualifier set,
 * without looking through typedefs that may have added "const" at a
 * different level.
 */
uint clang_isConstQualifiedType(CXType Т);

/**
 * Determine whether a  CXCursor that is a macro, is
 * function like.
 */
uint clang_Cursor_isMacroFunctionLike(CXCursor C);

/**
 * Determine whether a  CXCursor that is a macro, is a
 * builtin один.
 */
uint clang_Cursor_isMacroBuiltin(CXCursor C);

/**
 * Determine whether a  CXCursor that is a function declaration, is an
 * inline declaration.
 */
uint clang_Cursor_isFunctionInlined(CXCursor C);

/**
 * Determine whether a CXType has the "volatile" qualifier set,
 * without looking through typedefs that may have added "volatile" at
 * a different level.
 */
uint clang_isVolatileQualifiedType(CXType Т);

/**
 * Determine whether a CXType has the "restrict" qualifier set,
 * without looking through typedefs that may have added "restrict" at a
 * different level.
 */
uint clang_isRestrictQualifiedType(CXType Т);

/**
 * Returns the адрес space of the given тип.
 */
uint clang_getAddressSpace(CXType Т);

/**
 * Returns the typedef name of the given тип.
 */
CXString clang_getTypedefName(CXType CT);

/**
 * For pointer types, returns the тип of the pointee.
 */
CXType clang_getPointeeType(CXType Т);

/**
 * Return the cursor for the declaration of the given тип.
 */
CXCursor clang_getTypeDeclaration(CXType Т);

/**
 * Returns the Objective-C тип encoding for the specified declaration.
 */
CXString clang_getDeclObjCTypeEncoding(CXCursor C);

/**
 * Returns the Objective-C тип encoding for the specified CXType.
 */
CXString clang_Type_getObjCEncoding(CXType тип);

/**
 * Retrieve the spelling of a given CXTypeKind.
 */
CXString clang_getTypeKindSpelling(CXTypeKind K);

/**
 * Retrieve the calling convention associated with a function тип.
 *
 * If a non-function тип is passed in, CXCallingConv_Invalid is returned.
 */
CXCallingConv clang_getFunctionTypeCallingConv(CXType Т);

/**
 * Retrieve the return тип associated with a function тип.
 *
 * If a non-function тип is passed in, an invalid тип is returned.
 */
CXType clang_getResultType(CXType Т);

/**
 * Retrieve the exception specification тип associated with a function тип.
 * This is a value of тип CXCursor_ExceptionSpecificationKind.
 *
 * If a non-function тип is passed in, an ошибка код of -1 is returned.
 */
цел clang_getExceptionSpecificationType(CXType Т);

/**
 * Retrieve the number of non-variadic параметры associated with a
 * function тип.
 *
 * If a non-function тип is passed in, -1 is returned.
 */
цел clang_getNumArgTypes(CXType Т);

/**
 * Retrieve the тип of a parameter of a function тип.
 *
 * If a non-function тип is passed in or the function does not have enough
 * параметры, an invalid тип is returned.
 */
CXType clang_getArgType(CXType Т, uint i);

/**
 * Return 1 if the CXType is a variadic function тип, and 0 otherwise.
 */
uint clang_isFunctionTypeVariadic(CXType Т);

/**
 * Retrieve the return тип associated with a given cursor.
 *
 * This only returns a valid тип if the cursor refers to a function or method.
 */
CXType clang_getCursorResultType(CXCursor C);

/**
 * Retrieve the exception specification тип associated with a given cursor.
 * This is a value of тип CXCursor_ExceptionSpecificationKind.
 *
 * This only returns a valid result if the cursor refers to a function or method.
 */
цел clang_getCursorExceptionSpecificationType(CXCursor C);

/**
 * Return 1 if the CXType is a POD (plain old data) тип, and 0
 *  otherwise.
 */
uint clang_isPODType(CXType Т);

/**
 * Return the element тип of an array, complex, or вектор тип.
 *
 * If a тип is passed in that is not an array, complex, or вектор тип,
 * an invalid тип is returned.
 */
CXType clang_getElementType(CXType Т);

/**
 * Return the number of элты of an array or вектор тип.
 *
 * If a тип is passed in that is not an array or вектор тип,
 * -1 is returned.
 */
дол clang_getNumElements(CXType Т);

/**
 * Return the element тип of an array тип.
 *
 * If a non-array тип is passed in, an invalid тип is returned.
 */
CXType clang_getМассивElementType(CXType Т);

/**
 * Return the array size of a constant array.
 *
 * If a non-array тип is passed in, -1 is returned.
 */
дол clang_getМассивSize(CXType Т);

/**
 * Retrieve the тип named by the qualified-ид.
 *
 * If a non-elaborated тип is passed in, an invalid тип is returned.
 */
CXType clang_Type_getNamedType(CXType Т);

/**
 * Determine if a typedef is 'transparent' tag.
 *
 * A typedef is considered 'transparent' if it shares a name and spelling
 * location with its underlying tag тип, as is the case with the NS_ENUM macro.
 *
 * \returns non-zero if transparent and zero otherwise.
 */
uint clang_Type_isTransparentTagTypedef(CXType Т);

/**
 * List the possible ошибка codes for \c clang_Type_getSizeOf,
 *   \c clang_Type_getAlignOf, \c clang_Type_getOffsetOf and
 *   \c clang_Cursor_getOffsetOf.
 *
 * A value of this enumeration тип can be returned if the цель тип is not
 * a valid argument to sizeof, alignof or offsetof.
 */
enum CXTypeLayoutError
{
    /**
     * Type is of вид CXType_Invalid.
     */
    invalid = -1,
    /**
     * The тип is an incomplete Type.
     */
    incomplete = -2,
    /**
     * The тип is a dependent Type.
     */
    dependent = -3,
    /**
     * The тип is not a constant size тип.
     */
    notConstantSize = -4,
    /**
     * The Field name is not valid for this record.
     */
    invalidFieldName = -5
}

/**
 * Return the раскладка of a тип in bytes as per C++[выр.alignof]
 *   standard.
 *
 * If the тип declaration is invalid, CXTypeLayoutError_Invalid is returned.
 * If the тип declaration is an incomplete тип, CXTypeLayoutError_Incomplete
 *   is returned.
 * If the тип declaration is a dependent тип, CXTypeLayoutError_Dependent is
 *   returned.
 * If the тип declaration is not a constant size тип,
 *   CXTypeLayoutError_NotConstantSize is returned.
 */
дол clang_Type_getAlignOf(CXType Т);

/**
 * Return the class тип of an member pointer тип.
 *
 * If a non-member-pointer тип is passed in, an invalid тип is returned.
 */
CXType clang_Type_getClassType(CXType Т);

/**
 * Return the size of a тип in bytes as per C++[выр.sizeof] standard.
 *
 * If the тип declaration is invalid, CXTypeLayoutError_Invalid is returned.
 * If the тип declaration is an incomplete тип, CXTypeLayoutError_Incomplete
 *   is returned.
 * If the тип declaration is a dependent тип, CXTypeLayoutError_Dependent is
 *   returned.
 */
дол clang_Type_getSizeOf(CXType Т);

/**
 * Return the offset of a поле named И in a record of тип Т in bits
 *   as it would be returned by __offsetof__ as per C++11[18.2p4]
 *
 * If the cursor is not a record поле declaration, CXTypeLayoutError_Invalid
 *   is returned.
 * If the поле's тип declaration is an incomplete тип,
 *   CXTypeLayoutError_Incomplete is returned.
 * If the поле's тип declaration is a dependent тип,
 *   CXTypeLayoutError_Dependent is returned.
 * If the поле's name И is not found,
 *   CXTypeLayoutError_InvalidFieldName is returned.
 */
дол clang_Type_getOffsetOf(CXType Т, ткст0 И);

/**
 * Return the offset of the поле represented by the Cursor.
 *
 * If the cursor is not a поле declaration, -1 is returned.
 * If the cursor semantic родитель is not a record поле declaration,
 *   CXTypeLayoutError_Invalid is returned.
 * If the поле's тип declaration is an incomplete тип,
 *   CXTypeLayoutError_Incomplete is returned.
 * If the поле's тип declaration is a dependent тип,
 *   CXTypeLayoutError_Dependent is returned.
 * If the поле's name И is not found,
 *   CXTypeLayoutError_InvalidFieldName is returned.
 */
дол clang_Cursor_getOffsetOfField(CXCursor C);

/**
 * Determine whether the given cursor represents an anonymous record
 * declaration.
 */
uint clang_Cursor_isAnonymous(CXCursor C);

enum CXRefQualifierKind
{
    /** No ref-qualifier was provided. */
    отсутствует = 0,
    /** An lvalue ref-qualifier was provided (\c &). */
    lValue = 1,
    /** An rvalue ref-qualifier was provided (\c &&). */
    rValue = 2
}

/**
 * Returns the number of template аргументы for given template
 * specialization, or -1 if тип \c Т is not a template specialization.
 */
цел clang_Type_getNumTemplateArguments(CXType Т);

/**
 * Returns the тип template argument of a template class specialization
 * at given индекс.
 *
 * This function only returns template тип аргументы and does not handle
 * template template аргументы or variadic packs.
 */
CXType clang_Type_getTemplateArgumentAsType(CXType Т, uint i);

/**
 * Retrieve the ref-qualifier вид of a function or method.
 *
 * The ref-qualifier is returned for C++ functions or methods. For другой types
 * or non-C++ declarations, CXRefQualifier_None is returned.
 */
CXRefQualifierKind clang_Type_getCXXRefQualifier(CXType Т);

/**
 * Returns non-zero if the cursor specifies a Record member that is a
 *   bitfield.
 */
uint clang_Cursor_isBitField(CXCursor C);

/**
 * Returns 1 if the base class specified by the cursor with вид
 *   CX_CXXBaseSpecifier is virtual.
 */
uint clang_isVirtualBase(CXCursor);

/**
 * Represents the C++ access control level to a base class for a
 * cursor with вид CX_CXXBaseSpecifier.
 */
enum CX_CXXAccessSpecifier
{
    cxxInvalidAccessSpecifier = 0,
    cxxPublic = 1,
    cxxProtected = 2,
    cxxPrivate = 3
}

/**
 * Returns the access control level for the referenced object.
 *
 * If the cursor refers to a C++ declaration, its access control level within its
 * родитель масштаб is returned. Otherwise, if the cursor refers to a base specifier or
 * access specifier, the specifier itself is returned.
 */
CX_CXXAccessSpecifier clang_getCXXAccessSpecifier(CXCursor);

/**
 * Represents the storage classes as declared in the source. CX_SC_Invalid
 * was added for the case that the passed cursor in not a declaration.
 */
enum CX_StorageClass
{
    invalid = 0,
    отсутствует = 1,
    extern_ = 2,
    static_ = 3,
    privateExtern = 4,
    openCLWorkGroupLocal = 5,
    auto_ = 6,
    register = 7
}

/**
 * Returns the storage class for a function or переменная declaration.
 *
 * If the passed in Cursor is not a function or переменная declaration,
 * CX_SC_Invalid is returned else the storage class.
 */
CX_StorageClass clang_Cursor_getStorageClass(CXCursor);

/**
 * Determine the number of overloaded declarations referenced by a
 * \c CXCursor_OverloadedDeclRef cursor.
 *
 * \param cursor The cursor whose overloaded declarations are being queried.
 *
 * \returns The number of overloaded declarations referenced by \c cursor. If it
 * is not a \c CXCursor_OverloadedDeclRef cursor, returns 0.
 */
uint clang_getNumOverloadedDecls(CXCursor cursor);

/**
 * Retrieve a cursor for один of the overloaded declarations referenced
 * by a \c CXCursor_OverloadedDeclRef cursor.
 *
 * \param cursor The cursor whose overloaded declarations are being queried.
 *
 * \param индекс The zero-based индекс into the set of overloaded declarations in
 * the cursor.
 *
 * \returns A cursor representing the declaration referenced by the given
 * \c cursor at the specified \c индекс. If the cursor does not have an
 * associated set of overloaded declarations, or if the индекс is out of bounds,
 * returns \c clang_getNullCursor();
 */
CXCursor clang_getOverloadedDecl(CXCursor cursor, uint индекс);

/**
 * @}
 */

/**
 * \defgroup CINDEX_ATTRIBUTES Information for attributes
 *
 * @{
 */

/**
 * For cursors representing an iboutletcollection attribute,
 *  this function returns the collection element тип.
 *
 */
CXType clang_getIBOutletCollectionType(CXCursor);

/**
 * @}
 */

/**
 * \defgroup CINDEX_CURSOR_TRAVERSAL Traversing the АСД with cursors
 *
 * These routines provide the ability to traverse the abstract syntax tree
 * using cursors.
 *
 * @{
 */

/**
 * Describes how the traversal of the children of a particular
 * cursor should proceed after visiting a particular child cursor.
 *
 * A value of this enumeration тип should be returned by each
 * \c CXCursorVisitor to indicate how clang_visitChildren() proceed.
 */
enum CXChildVisitResult
{
    /**
     * Terminates the cursor traversal.
     */
    всё_ = 0,
    /**
     * Continues the cursor traversal with the next sibling of
     * the cursor just visited, without visiting its children.
     */
    далее_ = 1,
    /**
     * Recursively traverse the children of this cursor, using
     * the same visitor and client data.
     */
    recurse = 2
}

/**
 * Visitor invoked for each cursor found by a traversal.
 *
 * This visitor function will be invoked for each cursor found by
 * clang_visitCursorChildren(). Its first argument is the cursor being
 * visited, its second argument is the родитель visitor for that cursor,
 * and its third argument is the client data provided to
 * clang_visitCursorChildren().
 *
 * The visitor should return один of the \c CXChildVisitResult values
 * to direct clang_visitCursorChildren().
 */
alias  CXChildVisitResult function(
    CXCursor cursor,
    CXCursor родитель,
    CXClientData client_data) CXCursorVisitor;

/**
 * Visit the children of a particular cursor.
 *
 * This function visits all the direct children of the given cursor,
 * invoking the given \п visitor function with the cursors of each
 * visited child. The traversal may be recursive, if the visitor returns
 * \c CXChildVisit_Recurse. The traversal may also be ended prematurely, if
 * the visitor returns \c CXChildVisit_Break.
 *
 * \param родитель the cursor whose child may be visited. All kinds of
 * cursors can be visited, including invalid cursors (which, by
 * definition, have Нет children).
 *
 * \param visitor the visitor function that will be invoked for each
 * child of \п родитель.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the visitor each time it is invoked.
 *
 * \returns a non-zero value if the traversal was terminated
 * prematurely by the visitor returning \c CXChildVisit_Break.
 */
uint clang_visitChildren(
    CXCursor родитель,
    CXCursorVisitor visitor,
    CXClientData client_data);
/**
 * Visitor invoked for each cursor found by a traversal.
 *
 * This visitor block will be invoked for each cursor found by
 * clang_visitChildrenWithBlock(). Its first argument is the cursor being
 * visited, its second argument is the родитель visitor for that cursor.
 *
 * The visitor should return один of the \c CXChildVisitResult values
 * to direct clang_visitChildrenWithBlock().
 */

/**
 * Visits the children of a cursor using the specified block.  Behaves
 * identically to clang_visitChildren() in all другой respects.
 */

/**
 * @}
 */

/**
 * \defgroup CINDEX_CURSOR_XREF Cross-referencing in the АСД
 *
 * These routines provide the ability to determine references within and
 * across translation units, by providing the имена of the entities referenced
 * by cursors, follow reference cursors to the declarations they reference,
 * and associate declarations with their definitions.
 *
 * @{
 */

/**
 * Retrieve a Unified Символ2 Resolution (USR) for the entity referenced
 * by the given cursor.
 *
 * A Unified Символ2 Resolution (USR) is a ткст that identifies a particular
 * entity (function, class, переменная, etc.) within a program. USRs can be
 * compared across translation units to determine, e.g., when references in
 * один translation refer to an entity defined in another translation unit.
 */
CXString clang_getCursorUSR(CXCursor);

/**
 * Construct a USR for a specified Objective-C class.
 */
CXString clang_constructUSR_ObjCClass(ткст0 class_name);

/**
 * Construct a USR for a specified Objective-C category.
 */
CXString clang_constructUSR_ObjCCategory(
    ткст0 class_name,
    ткст0 category_name);

/**
 * Construct a USR for a specified Objective-C protocol.
 */
CXString clang_constructUSR_ObjCProtocol(ткст0 protocol_name);

/**
 * Construct a USR for a specified Objective-C instance переменная and
 *   the USR for its containing class.
 */
CXString clang_constructUSR_ObjCIvar(ткст0 name, CXString classUSR);

/**
 * Construct a USR for a specified Objective-C method and
 *   the USR for its containing class.
 */
CXString clang_constructUSR_ObjCMethod(
    ткст0 name,
    uint isInstanceMethod,
    CXString classUSR);

/**
 * Construct a USR for a specified Objective-C property and the USR
 *  for its containing class.
 */
CXString clang_constructUSR_ObjCProperty(
   ткст0 property,
    CXString classUSR);

/**
 * Retrieve a name for the entity referenced by this cursor.
 */
CXString clang_getCursorSpelling(CXCursor);

/**
 * Retrieve a range for a piece that forms the cursors spelling name.
 * Most of the times there is only один range for the complete spelling but for
 * Objective-C methods and Objective-C message expressions, there are multiple
 * pieces for each selector identifier.
 *
 * \param pieceIndex the индекс of the spelling name piece. If this is greater
 * than the actual number of pieces, it will return a NULL (invalid) range.
 *
 * \param options Reserved.
 */
CXSourceRange clang_Cursor_getSpellingNameRange(
    CXCursor,
    uint pieceIndex,
    uint options);

/**
 * Opaque pointer representing a policy that controls pretty printing
 * for \c clang_getCursorPrettyPrinted.
 */
alias ук CXPrintingPolicy;

/**
 * Properties for the printing policy.
 *
 * See \c clang::PrintingPolicy for more information.
 */
enum CXPrintingPolicyProperty
{
    indentation = 0,
    suppressSpecifiers = 1,
    suppressTagKeyword = 2,
    includeTagDefinition = 3,
    suppressScope = 4,
    suppressUnwrittenScope = 5,
    suppressInitializers = 6,
    constantМассивSizeAsWritten = 7,
    anonymousTagLocations = 8,
    suppressStrongLifetime = 9,
    suppressLifetimeQualifiers = 10,
    suppressTemplateArgsInCXXConstructors = 11,
    бул_ = 12,
    restrict = 13,
    alignof_ = 14,
    underscoreAlignof = 15,
    useVoidForZeroParams = 16,
    terseOutput = 17,
    polishForDeclaration = 18,
    half = 19,
    mswChar = 20,
    includeNewlines = 21,
    msvcFormatting = 22,
    constantsAsWritten = 23,
    suppressImplicitBase = 24,
    fullyQualifiedName = 25,

    lastProperty = fullyQualifiedName
}

/**
 * Get a property value for the given printing policy.
 */
uint clang_PrintingPolicy_getProperty(
    CXPrintingPolicy Policy,
    CXPrintingPolicyProperty Property);

/**
 * Set a property value for the given printing policy.
 */
проц clang_PrintingPolicy_setProperty(
    CXPrintingPolicy Policy,
    CXPrintingPolicyProperty Property,
    uint Value);

/**
 * Retrieve the default policy for the cursor.
 *
 * The policy should be released after use with \c
 * clang_PrintingPolicy_dispose.
 */
CXPrintingPolicy clang_getCursorPrintingPolicy(CXCursor);

/**
 * Release a printing policy.
 */
проц clang_PrintingPolicy_dispose(CXPrintingPolicy Policy);

/**
 * Pretty print declarations.
 *
 * \param Cursor The cursor representing a declaration.
 *
 * \param Policy The policy to control the entities being printed. If
 * NULL, a default policy is used.
 *
 * \returns The pretty printed declaration or the пуст ткст for
 * другой cursors.
 */
CXString clang_getCursorPrettyPrinted(CXCursor Cursor, CXPrintingPolicy Policy);

/**
 * Retrieve the display name for the entity referenced by this cursor.
 *
 * The display name contains extra information that helps identify the cursor,
 * such as the параметры of a function or template or the аргументы of a
 * class template specialization.
 */
CXString clang_getCursorDisplayName(CXCursor);

/** For a cursor that is a reference, retrieve a cursor representing the
 * entity that it references.
 *
 * Reference cursors refer to другой entities in the АСД. For example, an
 * Objective-C superclass reference cursor refers to an Objective-C class.
 * This function produces the cursor for the Objective-C class from the
 * cursor for the superclass reference. If the input cursor is a declaration or
 * definition, it returns that declaration or definition unchanged.
 * Otherwise, returns the NULL cursor.
 */
CXCursor clang_getCursorReferenced(CXCursor);

/**
 *  For a cursor that is either a reference to or a declaration
 *  of some entity, retrieve a cursor that describes the definition of
 *  that entity.
 *
 *  Some entities can be declared multiple times within a translation
 *  unit, but only один of those declarations can also be a
 *  definition. For example, given:
 *
 *  \код
 *  цел f(цел, цел);
 *  цел g(цел x, цел y) { return f(x, y); }
 *  цел f(цел a, цел b) { return a + b; }
 *  цел f(цел, цел);
 *  \endcode
 *
 *  there are three declarations of the function "f", but only the
 *  second один is a definition. The clang_getCursorDefinition()
 *  function will take any cursor pointing to a declaration of "f"
 *  (the first or fourth lines of the example) or a cursor referenced
 *  that uses "f" (the call to "f' inside "g") and will return a
 *  declaration cursor pointing to the definition (the second "f"
 *  declaration).
 *
 *  If given a cursor for which there is Нет corresponding definition,
 *  e.g., because there is Нет definition of that entity within this
 *  translation unit, returns a NULL cursor.
 */
CXCursor clang_getCursorDefinition(CXCursor);

/**
 * Determine whether the declaration pointed to by this cursor
 * is also a definition of that entity.
 */
uint clang_isCursorDefinition(CXCursor);

/**
 * Retrieve the canonical cursor corresponding to the given cursor.
 *
 * In the C family of languages, many kinds of entities can be declared several
 * times within a single translation unit. For example, a structure тип can
 * be forward-declared (possibly multiple times) and later defined:
 *
 * \код
 * struct X;
 * struct X;
 * struct X {
 *   цел member;
 * };
 * \endcode
 *
 * The declarations and the definition of \c X are represented by three
 * different cursors, all of which are declarations of the same underlying
 * entity. One of these cursor is considered the "canonical" cursor, which
 * is effectively the representative for the underlying entity. One can
 * determine if two cursors are declarations of the same underlying entity by
 * comparing their canonical cursors.
 *
 * \returns The canonical cursor for the entity referred to by the given cursor.
 */
CXCursor clang_getCanonicalCursor(CXCursor);

/**
 * If the cursor points to a selector identifier in an Objective-C
 * method or message expression, this returns the selector индекс.
 *
 * After getting a cursor with #clang_getCursor, this can be called to
 * determine if the location points to a selector identifier.
 *
 * \returns The selector индекс if the cursor is an Objective-C method or message
 * expression and the cursor is pointing to a selector identifier, or -1
 * otherwise.
 */
цел clang_Cursor_getObjCSelectorIndex(CXCursor);

/**
 * Given a cursor pointing to a C++ method call or an Objective-C
 * message, returns non-zero if the method/message is "dynamic", meaning:
 *
 * For a C++ method: the call is virtual.
 * For an Objective-C message: the receiver is an object instance, not 'super'
 * or a specific class.
 *
 * If the method/message is "static" or the cursor does not point to a
 * method/message, it will return zero.
 */
цел clang_Cursor_isDynamicCall(CXCursor C);

/**
 * Given a cursor pointing to an Objective-C message or property
 * reference, or C++ method call, returns the CXType of the receiver.
 */
CXType clang_Cursor_getReceiverType(CXCursor C);

/**
 * Property attributes for a \c CXCursor_ObjCPropertyDecl.
 */
enum CXObjCPropertyAttrKind
{
    noattr = 0x00,
    readonly = 0x01,
    getter = 0x02,
    присвой = 0x04,
    readwrite = 0x08,
    retain = 0x10,
    copy = 0x20,
    nonatomic = 0x40,
    setter = 0x80,
    atomic = 0x100,
    weak = 0x200,
    strong = 0x400,
    unsafeUnretained = 0x800,
    class_ = 0x1000
}

/**
 * Given a cursor that represents a property declaration, return the
 * associated property attributes. The bits are formed from
 * \c CXObjCPropertyAttrKind.
 *
 * \param reserved Reserved for future use, pass 0.
 */
uint clang_Cursor_getObjCPropertyAttributes(CXCursor C, uint reserved);

/**
 * 'Qualifiers' written next to the return and parameter types in
 * Objective-C method declarations.
 */
enum CXObjCDeclQualifierKind
{
    отсутствует = 0x0,
    in_ = 0x1,
    inout_ = 0x2,
    out_ = 0x4,
    bycopy = 0x8,
    byref = 0x10,
    oneway = 0x20
}

/**
 * Given a cursor that represents an Objective-C method or parameter
 * declaration, return the associated Objective-C qualifiers for the return
 * тип or the parameter respectively. The bits are formed from
 * CXObjCDeclQualifierKind.
 */
uint clang_Cursor_getObjCDeclQualifiers(CXCursor C);

/**
 * Given a cursor that represents an Objective-C method or property
 * declaration, return non-zero if the declaration was affected by "\@optional".
 * Returns zero if the cursor is not such a declaration or it is "\@required".
 */
uint clang_Cursor_isObjCOptional(CXCursor C);

/**
 * Returns non-zero if the given cursor is a variadic function or method.
 */
uint clang_Cursor_isVariadic(CXCursor C);

/**
 * Returns non-zero if the given cursor points to a symbol marked with
 * external_source_symbol attribute.
 *
 * \param language If non-NULL, and the attribute is present, will be set to
 * the 'language' ткст from the attribute.
 *
 * \param definedIn If non-NULL, and the attribute is present, will be set to
 * the 'definedIn' ткст from the attribute.
 *
 * \param isGenerated If non-NULL, and the attribute is present, will be set to
 * non-zero if the 'generated_declaration' is set in the attribute.
 */
uint clang_Cursor_isExternalSymbol(
    CXCursor C,
    CXString* language,
    CXString* definedIn,
    uint* isGenerated);

/**
 * Given a cursor that represents a declaration, return the associated
 * коммент's source range.  The range may include multiple consecutive comments
 * with whitespace in between.
 */
CXSourceRange clang_Cursor_getCommentRange(CXCursor C);

/**
 * Given a cursor that represents a declaration, return the associated
 * коммент text, including коммент markers.
 */
CXString clang_Cursor_getRawCommentText(CXCursor C);

/**
 * Given a cursor that represents a documentable entity (e.g.,
 * declaration), return the associated \paragraph; otherwise return the
 * first paragraph.
 */
CXString clang_Cursor_getBriefCommentText(CXCursor C);

/**
 * @}
 */

/** \defgroup CINDEX_MANGLE Name Mangling API Functions
 *
 * @{
 */

/**
 * Retrieve the CXString representing the mangled name of the cursor.
 */
CXString clang_Cursor_getMangling(CXCursor);

/**
 * Retrieve the CXStrings representing the mangled symbols of the C++
 * constructor or destructor at the cursor.
 */
CXStringSet* clang_Cursor_getCXXManglings(CXCursor);

/**
 * Retrieve the CXStrings representing the mangled symbols of the ObjC
 * class interface or implementation at the cursor.
 */
CXStringSet* clang_Cursor_getObjCManglings(CXCursor);

/**
 * @}
 */

/**
 * \defgroup CINDEX_MODULE Модуль2 introspection
 *
 * The functions in this group provide access to information about модули.
 *
 * @{
 */

alias ук CXModule;

/**
 * Given a CXCursor_ModuleImportDecl cursor, return the associated module.
 */
CXModule clang_Cursor_getModule(CXCursor C);

/**
 * Given a CXFile header file, return the module that contains it, if один
 * exists.
 */
CXModule clang_getModuleForFile(CXTranslationUnit, CXFile);

/**
 * \param Модуль2 a module object.
 *
 * \returns the module file where the provided module object came from.
 */
CXFile clang_Module_getASTFile(CXModule Модуль2);

/**
 * \param Модуль2 a module object.
 *
 * \returns the родитель of a sub-module or NULL if the given module is top-level,
 * e.g. for 'std.вектор' it will return the 'std' module.
 */
CXModule clang_Module_getParent(CXModule Модуль2);

/**
 * \param Модуль2 a module object.
 *
 * \returns the name of the module, e.g. for the 'std.вектор' sub-module it
 * will return "вектор".
 */
CXString clang_Module_getName(CXModule Модуль2);

/**
 * \param Модуль2 a module object.
 *
 * \returns the full name of the module, e.g. "std.вектор".
 */
CXString clang_Module_getFullName(CXModule Модуль2);

/**
 * \param Модуль2 a module object.
 *
 * \returns non-zero if the module is a system один.
 */
цел clang_Module_isSystem(CXModule Модуль2);

/**
 * \param Модуль2 a module object.
 *
 * \returns the number of top level headers associated with this module.
 */
uint clang_Module_getNumTopLevelHeaders(CXTranslationUnit, CXModule Модуль2);

/**
 * \param Модуль2 a module object.
 *
 * \param Index top level header индекс (zero-based).
 *
 * \returns the specified top level header associated with the module.
 */
CXFile clang_Module_getTopLevelHeader(
    CXTranslationUnit,
    CXModule Модуль2,
    uint Index);

/**
 * @}
 */

/**
 * \defgroup CINDEX_CPP C++ АСД introspection
 *
 * The routines in this group provide access information in the ASTs specific
 * to C++ language features.
 *
 * @{
 */

/**
 * Determine if a C++ constructor is a converting constructor.
 */
uint clang_CXXConstructor_isConvertingConstructor(CXCursor C);

/**
 * Determine if a C++ constructor is a copy constructor.
 */
uint clang_CXXConstructor_isCopyConstructor(CXCursor C);

/**
 * Determine if a C++ constructor is the default constructor.
 */
uint clang_CXXConstructor_isDefaultConstructor(CXCursor C);

/**
 * Determine if a C++ constructor is a move constructor.
 */
uint clang_CXXConstructor_isMoveConstructor(CXCursor C);

/**
 * Determine if a C++ поле is declared 'mutable'.
 */
uint clang_CXXField_isMutable(CXCursor C);

/**
 * Determine if a C++ method is declared '= default'.
 */
uint clang_CXXMethod_isDefaulted(CXCursor C);

/**
 * Determine if a C++ member function or member function template is
 * pure virtual.
 */
uint clang_CXXMethod_isPureVirtual(CXCursor C);

/**
 * Determine if a C++ member function or member function template is
 * declared 'static'.
 */
uint clang_CXXMethod_isStatic(CXCursor C);

/**
 * Determine if a C++ member function or member function template is
 * explicitly declared 'virtual' or if it overrides a virtual method from
 * один of the base classes.
 */
uint clang_CXXMethod_isVirtual(CXCursor C);

/**
 * Determine if a C++ record is abstract, i.e. whether a class or struct
 * has a pure virtual member function.
 */
uint clang_CXXRecord_isAbstract(CXCursor C);

/**
 * Determine if an enum declaration refers to a scoped enum.
 */
uint clang_EnumDecl_isScoped(CXCursor C);

/**
 * Determine if a C++ member function or member function template is
 * declared 'const'.
 */
uint clang_CXXMethod_isConst(CXCursor C);

/**
 * Given a cursor that represents a template, determine
 * the cursor вид of the specializations would be generated by instantiating
 * the template.
 *
 * This routine can be used to determine what flavor of function template,
 * class template, or class template partial specialization is stored in the
 * cursor. For example, it can describe whether a class template cursor is
 * declared with "struct", "class" or "union".
 *
 * \param C The cursor to query. This cursor should represent a template
 * declaration.
 *
 * \returns The cursor вид of the specializations that would be generated
 * by instantiating the template \п C. If \п C is not a template, returns
 * \c CXCursor_NoDeclFound.
 */
CXCursorKind clang_getTemplateCursorKind(CXCursor C);

/**
 * Given a cursor that may represent a specialization or instantiation
 * of a template, retrieve the cursor that represents the template that it
 * specializes or from which it was instantiated.
 *
 * This routine determines the template involved both for explicit
 * specializations of templates and for implicit instantiations of the template,
 * both of which are referred to as "specializations". For a class template
 * specialization (e.g., \c std::вектор<бул>), this routine will return
 * either the primary template (\c std::вектор) or, if the specialization was
 * instantiated from a class template partial specialization, the class template
 * partial specialization. For a class template partial specialization and a
 * function template specialization (including instantiations), this
 * this routine will return the specialized template.
 *
 * For члены of a class template (e.g., member functions, member classes, or
 * static data члены), returns the specialized or instantiated member.
 * Although not strictly "templates" in the C++ language, члены of class
 * templates have the same notions of specializations and instantiations that
 * templates do, so this routine treats them similarly.
 *
 * \param C A cursor that may be a specialization of a template or a member
 * of a template.
 *
 * \returns If the given cursor is a specialization or instantiation of a
 * template or a member thereof, the template or member that it specializes or
 * from which it was instantiated. Otherwise, returns a NULL cursor.
 */
CXCursor clang_getSpecializedCursorTemplate(CXCursor C);

/**
 * Given a cursor that references something else, return the source range
 * covering that reference.
 *
 * \param C A cursor pointing to a member reference, a declaration reference, or
 * an operator call.
 * \param NameFlags A bitset with three independent флаги:
 * CXNameRange_WantQualifier, CXNameRange_WantTemplateArgs, and
 * CXNameRange_WantSinglePiece.
 * \param PieceIndex For contiguous имена or when passing the flag
 * CXNameRange_WantSinglePiece, only один piece with индекс 0 is
 * available. When the CXNameRange_WantSinglePiece flag is not passed for a
 * non-contiguous имена, this индекс can be used to retrieve the individual
 * pieces of the name. See also CXNameRange_WantSinglePiece.
 *
 * \returns The piece of the name pointed to by the given cursor. If there is Нет
 * name, or if the PieceIndex is out-of-range, a пусто-cursor will be returned.
 */
CXSourceRange clang_getCursorReferenceNameRange(
    CXCursor C,
    uint NameFlags,
    uint PieceIndex);

enum CXNameRefFlags
{
    /**
     * Include the nested-name-specifier, e.g. Foo:: in x.Foo::y, in the
     * range.
     */
    wantQualifier = 0x1,

    /**
     * Include the explicit template аргументы, e.g. \<цел> in x.f<цел>,
     * in the range.
     */
    wantTemplateArgs = 0x2,

    /**
     * If the name is non-contiguous, return the full spanning range.
     *
     * Non-contiguous имена occur in Objective-C when a selector with two or more
     * параметры is used, or in C++ when using an operator:
     * \код
     * [object doSomething:here withValue:there]; // Objective-C
     * return some_vector[1]; // C++
     * \endcode
     */
    wantSinglePiece = 0x4
}

/**
 * @}
 */

/**
 * \defgroup CINDEX_LEX Token extraction and manipulation
 *
 * The routines in this group provide access to the tokens within a
 * translation unit, along with a semantic mapping of those tokens to
 * their corresponding cursors.
 *
 * @{
 */

/**
 * Describes a вид of token.
 */
enum CXTokenKind
{
    /**
     * A token that contains some вид of punctuation.
     */
    punctuation = 0,

    /**
     * A language keyword.
     */
    keyword = 1,

    /**
     * An identifier (that is not a keyword).
     */
    identifier = 2,

    /**
     * A numeric, ткст, or character literal.
     */
    literal = 3,

    /**
     * A коммент.
     */
    коммент = 4
}

/**
 * Describes a single preprocessing token.
 */
struct CXToken
{
    uint[4] int_data;
    ук ptr_data;
}

/**
 * Get the raw lexical token starting with the given location.
 *
 * \param TU the translation unit whose text is being tokenized.
 *
 * \param Location the source location with which the token starts.
 *
 * \returns The token starting with the given location or NULL if Нет such token
 * exist. The returned pointer must be freed with clang_disposeTokens before the
 * translation unit is destroyed.
 */
CXToken* clang_getToken(CXTranslationUnit TU, CXSourceLocation Location);

/**
 * Determine the вид of the given token.
 */
CXTokenKind clang_getTokenKind(CXToken);

/**
 * Determine the spelling of the given token.
 *
 * The spelling of a token is the textual representation of that token, e.g.,
 * the text of an identifier or keyword.
 */
CXString clang_getTokenSpelling(CXTranslationUnit, CXToken);

/**
 * Retrieve the source location of the given token.
 */
CXSourceLocation clang_getTokenLocation(CXTranslationUnit, CXToken);

/**
 * Retrieve a source range that covers the given token.
 */
CXSourceRange clang_getTokenExtent(CXTranslationUnit, CXToken);

/**
 * Tokenize the source код described by the given range into raw
 * lexical tokens.
 *
 * \param TU the translation unit whose text is being tokenized.
 *
 * \param Range the source range in which text should be tokenized. All of the
 * tokens produced by tokenization will fall within this source range,
 *
 * \param Tokens this pointer will be set to point to the array of tokens
 * that occur within the given source range. The returned pointer must be
 * freed with clang_disposeTokens() before the translation unit is destroyed.
 *
 * \param NumTokens will be set to the number of tokens in the \c *Tokens
 * array.
 *
 */
проц clang_tokenize(
    CXTranslationUnit TU,
    CXSourceRange Range,
    CXToken** Tokens,
    uint* NumTokens);

/**
 * Annotate the given set of tokens by providing cursors for each token
 * that can be mapped to a specific entity within the abstract syntax tree.
 *
 * This token-annotation routine is equivalent to invoking
 * clang_getCursor() for the source locations of each of the
 * tokens. The cursors provided are filtered, so that only those
 * cursors that have a direct correspondence to the token are
 * accepted. For example, given a function call \c f(x),
 * clang_getCursor() would provide the following cursors:
 *
 *   * when the cursor is over the 'f', a DeclRefExpr cursor referring to 'f'.
 *   * when the cursor is over the '(' or the ')', a CallExpr referring to 'f'.
 *   * when the cursor is over the 'x', a DeclRefExpr cursor referring to 'x'.
 *
 * Only the first and last of these cursors will occur within the
 * annotate, since the tokens "f" and "x' directly refer to a function
 * and a переменная, respectively, but the parentheses are just a small
 * part of the full syntax of the function call expression, which is
 * not provided as an annotation.
 *
 * \param TU the translation unit that owns the given tokens.
 *
 * \param Tokens the set of tokens to annotate.
 *
 * \param NumTokens the number of tokens in \п Tokens.
 *
 * \param Cursors an array of \п NumTokens cursors, whose contents will be
 * replaced with the cursors corresponding to each token.
 */
проц clang_annotateTokens(
    CXTranslationUnit TU,
    CXToken* Tokens,
    uint NumTokens,
    CXCursor* Cursors);

/**
 * Free the given set of tokens.
 */
проц clang_disposeTokens(CXTranslationUnit TU, CXToken* Tokens, uint NumTokens);

/**
 * @}
 */

/**
 * \defgroup CINDEX_DEBUG Debugging facilities
 *
 * These routines are used for testing and debugging, only, and should not
 * be relied upon.
 *
 * @{
 */

/* for debug/testing */
CXString clang_getCursorKindSpelling(CXCursorKind Вид);
проц clang_getDefinitionSpellingAndExtent(
    CXCursor,
    сим** startBuf,
   сим** endBuf,
    uint* startLine,
    uint* startColumn,
    uint* endLine,
    uint* endColumn);
проц clang_enableStackTraces();
проц clang_executeOnThread(
    проц function(ук) fn,
    ук user_data,
    uint stack_size);

/**
 * @}
 */

/**
 * \defgroup CINDEX_CODE_COMPLET Code completion
 *
 * Code completion involves taking an (incomplete) source file, along with
 * knowledge of where the user is actively editing that file, and suggesting
 * syntactically- and semantically-valid constructs that the user might want to
 * use at that particular point in the source код. These data structures and
 * routines provide support for код completion.
 *
 * @{
 */

/**
 * A semantic ткст that describes a код-completion result.
 *
 * A semantic ткст that describes the formatting of a код-completion
 * result as a single "template" of text that should be inserted into the
 * source buffer when a particular код-completion result is selected.
 * Each semantic ткст is made up of some number of "chunks", each of which
 * contains some text along with a description of what that text means, e.g.,
 * the name of the entity being referenced, whether the text chunk is part of
 * the template, or whether it is a "placeholder" that the user should replace
 * with actual код,of a specific вид. See \c CXCompletionChunkKind for a
 * description of the different kinds of chunks.
 */
alias ук CXCompletionString;

/**
 * A single result of код completion.
 */
struct CXCompletionResult
{
    /**
     * The вид of entity that this completion refers to.
     *
     * The cursor вид will be a macro, keyword, or a declaration (один of the
     * *Decl cursor kinds), describing the entity that the completion is
     * referring to.
     *
     * \todo In the future, we would like to provide a full cursor, to allow
     * the client to extract additional information from declaration.
     */
    CXCursorKind CursorKind;

    /**
     * The код-completion ткст that describes how to insert this
     * код-completion result into the editing buffer.
     */
    CXCompletionString CompletionString;
}

/**
 * Describes a single piece of text within a код-completion ткст.
 *
 * Each "chunk" within a код-completion ткст (\c CXCompletionString) is
 * either a piece of text with a specific "вид" that describes how that text
 * should be interpreted by the client or is another completion ткст.
 */
enum CXCompletionChunkKind
{
    /**
     * A код-completion ткст that describes "optional" text that
     * could be a part of the template (but is not required).
     *
     * The Optional chunk is the only вид of chunk that has a код-completion
     * ткст for its representation, which is accessible via
     * \c clang_getCompletionChunkCompletionString(). The код-completion ткст
     * describes an additional part of the template that is completely optional.
     * For example, optional chunks can be used to describe the placeholders for
     * аргументы that match up with defaulted function параметры, e.g. given:
     *
     * \код
     * проц f(цел x, float y = 3.14, double z = 2.71828);
     * \endcode
     *
     * The код-completion ткст for this function would contain:
     *   - a TypedText chunk for "f".
     *   - a LeftParen chunk for "(".
     *   - a Placeholder chunk for "цел x"
     *   - an Optional chunk containing the remaining defaulted аргументы, e.g.,
     *       - a Comma chunk for ","
     *       - a Placeholder chunk for "float y"
     *       - an Optional chunk containing the last defaulted argument:
     *           - a Comma chunk for ","
     *           - a Placeholder chunk for "double z"
     *   - a RightParen chunk for ")"
     *
     * There are many ways to handle Optional chunks. Two simple approaches are:
     *   - Completely ignore optional chunks, in which case the template for the
     *     function "f" would only include the first parameter ("цел x").
     *   - Fully expand all optional chunks, in which case the template for the
     *     function "f" would have all of the параметры.
     */
    optional = 0,
    /**
     * Text that a user would be expected to тип to get this
     * код-completion result.
     *
     * There will be exactly один "typed text" chunk in a semantic ткст, which
     * will typically provide the spelling of a keyword or the name of a
     * declaration that could be used at the текущ код point. Clients are
     * expected to filter the код-completion results based on the text in this
     * chunk.
     */
    typedText = 1,
    /**
     * Text that should be inserted as part of a код-completion result.
     *
     * A "text" chunk represents text that is part of the template to be
     * inserted into user код should this particular код-completion result
     * be selected.
     */
    text = 2,
    /**
     * Placeholder text that should be replaced by the user.
     *
     * A "placeholder" chunk marks a place where the user should insert text
     * into the код-completion template. For example, placeholders might mark
     * the function параметры for a function declaration, to indicate that the
     * user should provide аргументы for each of those параметры. The actual
     * text in a placeholder is a suggestion for the text to display before
     * the user replaces the placeholder with real код.
     */
    placeholder = 3,
    /**
     * Informative text that should be displayed but never inserted as
     * part of the template.
     *
     * An "informative" chunk contains annotations that can be displayed to
     * help the user decide whether a particular код-completion result is the
     * right option, but which is not part of the actual template to be inserted
     * by код completion.
     */
    informative = 4,
    /**
     * Text that describes the текущ parameter when код-completion is
     * referring to function call, message send, or template specialization.
     *
     * A "текущ parameter" chunk occurs when код-completion is providing
     * information about a parameter corresponding to the argument at the
     * код-completion point. For example, given a function
     *
     * \код
     * цел add(цел x, цел y);
     * \endcode
     *
     * and the source код \c add(, where the код-completion point is after the
     * "(", the код-completion ткст will contain a "текущ parameter" chunk
     * for "цел x", indicating that the текущ argument will иниц that
     * parameter. After typing further, to \c add(17, (where the код-completion
     * point is after the ","), the код-completion ткст will contain a
     * "текущ parameter" chunk to "цел y".
     */
    currentParameter = 5,
    /**
     * A left parenthesis ('('), used to initiate a function call or
     * signal the beginning of a function parameter list.
     */
    leftParen = 6,
    /**
     * A right parenthesis (')'), used to finish a function call or
     * signal the end of a function parameter list.
     */
    rightParen = 7,
    /**
     * A left bracket ('[').
     */
    leftBracket = 8,
    /**
     * A right bracket (']').
     */
    rightBracket = 9,
    /**
     * A left brace ('{').
     */
    leftBrace = 10,
    /**
     * A right brace ('}').
     */
    rightBrace = 11,
    /**
     * A left angle bracket ('<').
     */
    leftAngle = 12,
    /**
     * A right angle bracket ('>').
     */
    rightAngle = 13,
    /**
     * A comma separator (',').
     */
    comma = 14,
    /**
     * Text that specifies the result тип of a given result.
     *
     * This special вид of informative chunk is not meant to be inserted into
     * the text buffer. Rather, it is meant to illustrate the тип that an
     * expression using the given completion ткст would have.
     */
    resultType = 15,
    /**
     * A colon (':').
     */
    colon = 16,
    /**
     * A semicolon (';').
     */
    semiColon = 17,
    /**
     * An '=' sign.
     */
    равен = 18,
    /**
     * Horizontal space (' ').
     */
    horizontalSpace = 19,
    /**
     * Vertical space ('\\n'), after which it is generally a good idea to
     * perform indentation.
     */
    verticalSpace = 20
}

/**
 * Determine the вид of a particular chunk within a completion ткст.
 *
 * \param completion_string the completion ткст to query.
 *
 * \param chunk_number the 0-based индекс of the chunk in the completion ткст.
 *
 * \returns the вид of the chunk at the индекс \c chunk_number.
 */
CXCompletionChunkKind clang_getCompletionChunkKind(
    CXCompletionString completion_string,
    uint chunk_number);

/**
 * Retrieve the text associated with a particular chunk within a
 * completion ткст.
 *
 * \param completion_string the completion ткст to query.
 *
 * \param chunk_number the 0-based индекс of the chunk in the completion ткст.
 *
 * \returns the text associated with the chunk at индекс \c chunk_number.
 */
CXString clang_getCompletionChunkText(
    CXCompletionString completion_string,
    uint chunk_number);

/**
 * Retrieve the completion ткст associated with a particular chunk
 * within a completion ткст.
 *
 * \param completion_string the completion ткст to query.
 *
 * \param chunk_number the 0-based индекс of the chunk in the completion ткст.
 *
 * \returns the completion ткст associated with the chunk at индекс
 * \c chunk_number.
 */
CXCompletionString clang_getCompletionChunkCompletionString(
    CXCompletionString completion_string,
    uint chunk_number);

/**
 * Retrieve the number of chunks in the given код-completion ткст.
 */
uint clang_getNumCompletionChunks(CXCompletionString completion_string);

/**
 * Determine the priority of this код completion.
 *
 * The priority of a код completion indicates how likely it is that this
 * particular completion is the completion that the user will select. The
 * priority is selected by various internal heuristics.
 *
 * \param completion_string The completion ткст to query.
 *
 * \returns The priority of this completion ткст. Smaller values indicate
 * higher-priority (more likely) completions.
 */
uint clang_getCompletionPriority(CXCompletionString completion_string);

/**
 * Determine the availability of the entity that this код-completion
 * ткст refers to.
 *
 * \param completion_string The completion ткст to query.
 *
 * \returns The availability of the completion ткст.
 */
CXAvailabilityKind clang_getCompletionAvailability(
    CXCompletionString completion_string);

/**
 * Retrieve the number of annotations associated with the given
 * completion ткст.
 *
 * \param completion_string the completion ткст to query.
 *
 * \returns the number of annotations associated with the given completion
 * ткст.
 */
uint clang_getCompletionNumAnnotations(CXCompletionString completion_string);

/**
 * Retrieve the annotation associated with the given completion ткст.
 *
 * \param completion_string the completion ткст to query.
 *
 * \param annotation_number the 0-based индекс of the annotation of the
 * completion ткст.
 *
 * \returns annotation ткст associated with the completion at индекс
 * \c annotation_number, or a NULL ткст if that annotation is not available.
 */
CXString clang_getCompletionAnnotation(
    CXCompletionString completion_string,
    uint annotation_number);

/**
 * Retrieve the родитель context of the given completion ткст.
 *
 * The родитель context of a completion ткст is the semantic родитель of
 * the declaration (if any) that the код completion represents. For example,
 * a код completion for an Objective-C method would have the method's class
 * or protocol as its context.
 *
 * \param completion_string The код completion ткст whose родитель is
 * being queried.
 *
 * \param вид DEPRECATED: always set to CXCursor_NotImplemented if non-NULL.
 *
 * \returns The name of the completion родитель, e.g., "NSObject" if
 * the completion ткст represents a method in the NSObject class.
 */
CXString clang_getCompletionParent(
    CXCompletionString completion_string,
    CXCursorKind* вид);

/**
 * Retrieve the brief documentation коммент attached to the declaration
 * that corresponds to the given completion ткст.
 */
CXString clang_getCompletionBriefComment(CXCompletionString completion_string);

/**
 * Retrieve a completion ткст for an arbitrary declaration or macro
 * definition cursor.
 *
 * \param cursor The cursor to query.
 *
 * \returns A non-context-sensitive completion ткст for declaration and macro
 * definition cursors, or NULL for другой kinds of cursors.
 */
CXCompletionString clang_getCursorCompletionString(CXCursor cursor);

/**
 * Contains the results of код-completion.
 *
 * This data structure contains the results of код completion, as
 * produced by \c clang_codeCompleteAt(). Its contents must be freed by
 * \c clang_disposeCodeCompleteResults.
 */
struct CXCodeCompleteResults
{
    /**
     * The код-completion results.
     */
    CXCompletionResult* Results;

    /**
     * The number of код-completion results stored in the
     * \c Results array.
     */
    uint NumResults;
}

/**
 * Retrieve the number of fix-its for the given completion индекс.
 *
 * Calling this makes sense only if CXCodeComplete_IncludeCompletionsWithFixIts
 * option was set.
 *
 * \param results The structure keeping all completion results
 *
 * \param completion_index The индекс of the completion
 *
 * \return The number of fix-its which must be applied before the completion at
 * completion_index can be applied
 */
uint clang_getCompletionNumFixIts(
    CXCodeCompleteResults* results,
    uint completion_index);

/**
 * Fix-its that *must* be applied before inserting the text for the
 * corresponding completion.
 *
 * By default, clang_codeCompleteAt() only returns completions with пуст
 * fix-its. Extra completions with non-пуст fix-its should be explicitly
 * requested by setting CXCodeComplete_IncludeCompletionsWithFixIts.
 *
 * For the clients to be able to compute position of the cursor after applying
 * fix-its, the following conditions are guaranteed to hold for
 * replacement_range of the stored fix-its:
 *  - Ranges in the fix-its are guaranteed to never contain the completion
 *  point (or identifier under completion point, if any) inside them, except
 *  at the start or at the end of the range.
 *  - If a fix-it range starts or ends with completion point (or starts or
 *  ends after the identifier under completion point), it will contain at
 *  least один character. It allows to unambiguously recompute completion
 *  point after applying the fix-it.
 *
 * The intuition is that provided fix-its change код around the identifier we
 * complete, but are not allowed to touch the identifier itself or the
 * completion point. One example of completions with corrections are the ones
 * replacing '.' with '->' and vice versa:
 *
 * std::unique_ptr<std::вектор<цел>> vec_ptr;
 * In 'vec_ptr.^', один of the completions is 'push_back', it requires
 * replacing '.' with '->'.
 * In 'vec_ptr->^', один of the completions is 'release', it requires
 * replacing '->' with '.'.
 *
 * \param results The structure keeping all completion results
 *
 * \param completion_index The индекс of the completion
 *
 * \param fixit_index The индекс of the fix-it for the completion at
 * completion_index
 *
 * \param replacement_range The fix-it range that must be replaced before the
 * completion at completion_index can be applied
 *
 * \returns The fix-it ткст that must replace the код at replacement_range
 * before the completion at completion_index can be applied
 */
CXString clang_getCompletionFixIt(
    CXCodeCompleteResults* results,
    uint completion_index,
    uint fixit_index,
    CXSourceRange* replacement_range);

/**
 * Flags that can be passed to \c clang_codeCompleteAt() to
 * modify its behavior.
 *
 * The enumerators in this enumeration can be bitwise-OR'd together to
 * provide multiple options to \c clang_codeCompleteAt().
 */
enum CXCodeComplete_Flags
{
    /**
     * Whether to include macros within the set of код
     * completions returned.
     */
    includeMacros = 0x01,

    /**
     * Whether to include код patterns for language constructs
     * within the set of код completions, e.g., for loops.
     */
    includeCodePatterns = 0x02,

    /**
     * Whether to include brief documentation within the set of код
     * completions returned.
     */
    includeBriefComments = 0x04,

    /**
     * Whether to speed up completion by omitting top- or простримён-level entities
     * defined in the preamble. There's Нет guarantee any particular entity is
     * omitted. This may be useful if the headers are indexed externally.
     */
    skipPreamble = 0x08,

    /**
     * Whether to include completions with small
     * fix-its, e.g. change '.' to '->' on member access, etc.
     */
    includeCompletionsWithFixIts = 0x10
}

/**
 * Bits that represent the context under which completion is occurring.
 *
 * The enumerators in this enumeration may be bitwise-OR'd together if multiple
 * contexts are occurring simultaneously.
 */
enum CXCompletionContext
{
    /**
     * The context for completions is unexposed, as only Clang results
     * should be included. (This is equivalent to having Нет context bits set.)
     */
    unexposed = 0,

    /**
     * Completions for any possible тип should be included in the results.
     */
    anyType = 1 << 0,

    /**
     * Completions for any possible value (variables, function calls, etc.)
     * should be included in the results.
     */
    anyValue = 1 << 1,
    /**
     * Completions for values that разреши to an Objective-C object should
     * be included in the results.
     */
    objCObjectValue = 1 << 2,
    /**
     * Completions for values that разреши to an Objective-C selector
     * should be included in the results.
     */
    objCSelectorValue = 1 << 3,
    /**
     * Completions for values that разреши to a C++ class тип should be
     * included in the results.
     */
    cxxClassTypeValue = 1 << 4,

    /**
     * Completions for поля of the member being accessed using the dot
     * operator should be included in the results.
     */
    dotMemberAccess = 1 << 5,
    /**
     * Completions for поля of the member being accessed using the arrow
     * operator should be included in the results.
     */
    arrowMemberAccess = 1 << 6,
    /**
     * Completions for properties of the Objective-C object being accessed
     * using the dot operator should be included in the results.
     */
    objCPropertyAccess = 1 << 7,

    /**
     * Completions for enum tags should be included in the results.
     */
    enumTag = 1 << 8,
    /**
     * Completions for union tags should be included in the results.
     */
    unionTag = 1 << 9,
    /**
     * Completions for struct tags should be included in the results.
     */
    structTag = 1 << 10,

    /**
     * Completions for C++ class имена should be included in the results.
     */
    classTag = 1 << 11,
    /**
     * Completions for C++ namespaces and простримён ники should be
     * included in the results.
     */
    простримён = 1 << 12,
    /**
     * Completions for C++ nested name specifiers should be included in
     * the results.
     */
    nestedNameSpecifier = 1 << 13,

    /**
     * Completions for Objective-C interfaces (classes) should be included
     * in the results.
     */
    objCInterface = 1 << 14,
    /**
     * Completions for Objective-C protocols should be included in
     * the results.
     */
    objCProtocol = 1 << 15,
    /**
     * Completions for Objective-C categories should be included in
     * the results.
     */
    objCCategory = 1 << 16,
    /**
     * Completions for Objective-C instance messages should be included
     * in the results.
     */
    objCInstanceMessage = 1 << 17,
    /**
     * Completions for Objective-C class messages should be included in
     * the results.
     */
    objCClassMessage = 1 << 18,
    /**
     * Completions for Objective-C selector имена should be included in
     * the results.
     */
    objCSelectorName = 1 << 19,

    /**
     * Completions for preprocessor macro имена should be included in
     * the results.
     */
    macroName = 1 << 20,

    /**
     * Natural language completions should be included in the results.
     */
    naturalLanguage = 1 << 21,

    /**
     * The текущ context is unknown, so set all contexts.
     */
    unknown = (1 << 22) - 1
}

/**
 * Returns a default set of код-completion options that can be
 * passed to\c clang_codeCompleteAt().
 */
uint clang_defaultCodeCompleteOptions();

/**
 * Perform код completion at a given location in a translation unit.
 *
 * This function performs код completion at a particular file, строка, and
 * column within source код, providing results that suggest potential
 * код snippets based on the context of the completion. The basic model
 * for код completion is that Clang will parse a complete source file,
 * performing syntax checking up to the location where код-completion has
 * been requested. At that point, a special код-completion token is passed
 * to the parser, which recognizes this token and determines, based on the
 * текущ location in the C/Objective-C/C++ grammar and the state of
 * semantic analysis, what completions to provide. These completions are
 * returned via a new \c CXCodeCompleteResults structure.
 *
 * Code completion itself is meant to be triggered by the client when the
 * user types punctuation characters or whitespace, at which point the
 * код-completion location will coincide with the cursor. For example, if \c п
 * is a pointer, код-completion might be triggered after the "-" and then
 * after the ">" in \c п->. When the код-completion location is after the ">",
 * the completion results will provide, e.g., the члены of the struct that
 * "п" points to. The client is responsible for placing the cursor at the
 * beginning of the token currently being typed, then filtering the results
 * based on the contents of the token. For example, when код-completing for
 * the expression \c п->get, the client should provide the location just after
 * the ">" (e.g., pointing at the "g") to this код-completion hook. Then, the
 * client can filter the results based on the текущ token text ("get"), only
 * showing those results that start with "get". The intent of this interface
 * is to separate the relatively high-latency acquisition of код-completion
 * results from the filtering of results on a per-character базис, which must
 * have a lower latency.
 *
 * \param TU The translation unit in which код-completion should
 * occur. The source files for this translation unit need not be
 * completely up-to-date (and the contents of those source files may
 * be overridden via \п unsaved_files). Cursors referring into the
 * translation unit may be invalidated by this invocation.
 *
 * \param complete_filename The name of the source file where код
 * completion should be performed. This filename may be any file
 * included in the translation unit.
 *
 * \param complete_line The строка at which код-completion should occur.
 *
 * \param complete_column The column at which код-completion should occur.
 * Note that the column should point just after the syntactic construct that
 * initiated код completion, and not in the middle of a lexical token.
 *
 * \param unsaved_files the Files that have not yet been saved to disk
 * but may be required for parsing or код completion, including the
 * contents of those files.  The contents and name of these files (as
 * specified by CXUnsavedFile) are copied when necessary, so the
 * client only needs to guarantee their validity until the call to
 * this function returns.
 *
 * \param num_unsaved_files The number of unsaved file entries in \п
 * unsaved_files.
 *
 * \param options Extra options that control the behavior of код
 * completion, expressed as a bitwise OR of the enumerators of the
 * CXCodeComplete_Flags enumeration. The
 * \c clang_defaultCodeCompleteOptions() function returns a default set
 * of код-completion options.
 *
 * \returns If successful, a new \c CXCodeCompleteResults structure
 * containing код-completion results, which should eventually be
 * freed with \c clang_disposeCodeCompleteResults(). If код
 * completion fails, returns NULL.
 */
CXCodeCompleteResults* clang_codeCompleteAt(
    CXTranslationUnit TU,
    ткст0 complete_filename,
    uint complete_line,
    uint complete_column,
    CXUnsavedFile* unsaved_files,
    uint num_unsaved_files,
    uint options);

/**
 * Sort the код-completion results in case-insensitive alphabetical
 * order.
 *
 * \param Results The set of results to sort.
 * \param NumResults The number of results in \п Results.
 */
проц clang_sortCodeCompletionResults(
    CXCompletionResult* Results,
    uint NumResults);

/**
 * Free the given set of код-completion results.
 */
проц clang_disposeCodeCompleteResults(CXCodeCompleteResults* Results);

/**
 * Determine the number of diagnostics produced prior to the
 * location where код completion was performed.
 */
uint clang_codeCompleteGetNumDiagnostics(CXCodeCompleteResults* Results);

/**
 * Retrieve a diagnostic associated with the given код completion.
 *
 * \param Results the код completion results to query.
 * \param Index the zero-based diagnostic number to retrieve.
 *
 * \returns the requested diagnostic. This diagnostic must be freed
 * via a call to \c clang_disposeDiagnostic().
 */
CXDiagnostic clang_codeCompleteGetDiagnostic(
    CXCodeCompleteResults* Results,
    uint Index);

/**
 * Determines what completions are appropriate for the context
 * the given код completion.
 *
 * \param Results the код completion results to query
 *
 * \returns the kinds of completions that are appropriate for use
 * along with the given код completion results.
 */
бдол clang_codeCompleteGetContexts(CXCodeCompleteResults* Results);

/**
 * Returns the cursor вид for the container for the текущ код
 * completion context. The container is only guaranteed to be set for
 * contexts where a container exists (i.e. member accesses or Objective-C
 * message sends); if there is not a container, this function will return
 * CXCursor_InvalidCode.
 *
 * \param Results the код completion results to query
 *
 * \param IsIncomplete on return, this value will be нет if Clang has complete
 * information about the container. If Clang does not have complete
 * information, this value will be да.
 *
 * \returns the container вид, or CXCursor_InvalidCode if there is not a
 * container
 */
CXCursorKind clang_codeCompleteGetContainerKind(
    CXCodeCompleteResults* Results,
    uint* IsIncomplete);

/**
 * Returns the USR for the container for the текущ код completion
 * context. If there is not a container for the текущ context, this
 * function will return the пуст ткст.
 *
 * \param Results the код completion results to query
 *
 * \returns the USR for the container
 */
CXString clang_codeCompleteGetContainerUSR(CXCodeCompleteResults* Results);

/**
 * Returns the currently-entered selector for an Objective-C message
 * send, formatted like "initWithFoo:bar:". Only guaranteed to return a
 * non-пуст ткст for CXCompletionContext_ObjCInstanceMessage and
 * CXCompletionContext_ObjCClassMessage.
 *
 * \param Results the код completion results to query
 *
 * \returns the selector (or partial selector) that has been entered thus far
 * for an Objective-C message send.
 */
CXString clang_codeCompleteGetObjCSelector(CXCodeCompleteResults* Results);

/**
 * @}
 */

/**
 * \defgroup CINDEX_MISC Miscellaneous utility functions
 *
 * @{
 */

/**
 * Return a version ткст, suitable for showing to a user, but not
 *        intended to be parsed (the format is not guaranteed to be stable).
 */
CXString clang_getClangVersion();

/**
 * Enable/disable crash recovery.
 *
 * \param isEnabled Flag to indicate if crash recovery is enabled.  A non-zero
 *        value enables crash recovery, while 0 disables it.
 */
проц clang_toggleCrashRecovery(uint isEnabled);

/**
 * Visitor invoked for each file in a translation unit
 *        (used with clang_getInclusions()).
 *
 * This visitor function will be invoked by clang_getInclusions() for each
 * file included (either at the top-level or by \#include directives) within
 * a translation unit.  The first argument is the file being included, and
 * the second and third аргументы provide the inclusion stack.  The
 * array is sorted in order of immediate inclusion.  For example,
 * the first element refers to the location that included 'included_file'.
 */
alias проц function(
    CXFile included_file,
    CXSourceLocation* inclusion_stack,
    uint include_len,
    CXClientData client_data) CXInclusionVisitor;

/**
 * Visit the set of preprocessor inclusions in a translation unit.
 *   The visitor function is called with the provided data for every included
 *   file.  This does not include headers included by the PCH file (unless один
 *   is inspecting the inclusions in the PCH file itself).
 */
проц clang_getInclusions(
    CXTranslationUnit tu,
    CXInclusionVisitor visitor,
    CXClientData client_data);

enum CXEvalResultKind
{
    int_ = 1,
    float_ = 2,
    objCStrLiteral = 3,
    strLiteral = 4,
    cfStr = 5,
    другой = 6,

    unExposed = 0
}

/**
 * Evaluation result of a cursor
 */
alias ук CXEvalResult ;

/**
 * If cursor is a statement declaration tries to evaluate the
 * statement and if its переменная, tries to evaluate its initializer,
 * into its corresponding тип.
 */
CXEvalResult clang_Cursor_Evaluate(CXCursor C);

/**
 * Returns the вид of the evaluated result.
 */
CXEvalResultKind clang_EvalResult_getKind(CXEvalResult В);

/**
 * Returns the evaluation result as integer if the
 * вид is Int.
 */
цел clang_EvalResult_getAsInt(CXEvalResult В);

/**
 * Returns the evaluation result as a дол дол integer if the
 * вид is Int. This prevents overflows that may happen if the result is
 * returned with clang_EvalResult_getAsInt.
 */
дол clang_EvalResult_getAsLongLong(CXEvalResult В);

/**
 * Returns a non-zero value if the вид is Int and the evaluation
 * result resulted in an unsigned integer.
 */
uint clang_EvalResult_isUnsignedInt(CXEvalResult В);

/**
 * Returns the evaluation result as an unsigned integer if
 * the вид is Int and clang_EvalResult_isUnsignedInt is non-zero.
 */
бдол clang_EvalResult_getAsUnsigned(CXEvalResult В);

/**
 * Returns the evaluation result as double if the
 * вид is double.
 */
double clang_EvalResult_getAsDouble(CXEvalResult В);

/**
 * Returns the evaluation result as a constant ткст if the
 * вид is другой than Int or float. User must not free this pointer,
 * instead call clang_EvalResult_dispose on the CXEvalResult returned
 * by clang_Cursor_Evaluate.
 */
ткст0 clang_EvalResult_getAsStr(CXEvalResult В);

/**
 * Disposes the created Eval memory.
 */
проц clang_EvalResult_dispose(CXEvalResult В);
/**
 * @}
 */

/** \defgroup CINDEX_REMAPPING Remapping functions
 *
 * @{
 */

/**
 * A remapping of original source files and their translated files.
 */
alias ук CXRemapping;

/**
 * Retrieve a remapping.
 *
 * \param path the path that contains metadata about remappings.
 *
 * \returns the requested remapping. This remapping must be freed
 * via a call to \c clang_remap_dispose(). Can return NULL if an ошибка occurred.
 */
CXRemapping clang_getRemappings(ткст0 path);

/**
 * Retrieve a remapping.
 *
 * \param filePaths pointer to an array of file paths containing remapping info.
 *
 * \param numFiles number of file paths.
 *
 * \returns the requested remapping. This remapping must be freed
 * via a call to \c clang_remap_dispose(). Can return NULL if an ошибка occurred.
 */
CXRemapping clang_getRemappingsFromFileList(
   сим** filePaths,
    uint numFiles);

/**
 * Determine the number of remappings.
 */
uint clang_remap_getNumFiles(CXRemapping);

/**
 * Get the original and the associated filename from the remapping.
 *
 * \param original If non-NULL, will be set to the original filename.
 *
 * \param transformed If non-NULL, will be set to the filename that the original
 * is associated with.
 */
проц clang_remap_getFilenames(
    CXRemapping,
    uint индекс,
    CXString* original,
    CXString* transformed);

/**
 * Dispose the remapping.
 */
проц clang_remap_dispose(CXRemapping);

/**
 * @}
 */

/** \defgroup CINDEX_HIGH Higher level API functions
 *
 * @{
 */

enum CXVisitorResult
{
    всё_ = 0,
    далее_ = 1
}

struct CXCursorAndRangeVisitor
{
    ук context;
    CXVisitorResult function(ук context, CXCursor, CXSourceRange) visit;
}

enum CXResult
{
    /**
     * Function returned successfully.
     */
    success = 0,
    /**
     * One of the параметры was invalid for the function.
     */
    invalid = 1,
    /**
     * The function was terminated by a callback (e.g. it returned
     * CXVisit_Break)
     */
    visitBreak = 2
}

/**
 * Find references of a declaration in a specific file.
 *
 * \param cursor pointing to a declaration or a reference of один.
 *
 * \param file to ищи for references.
 *
 * \param visitor callback that will receive pairs of CXCursor/CXSourceRange for
 * each reference found.
 * The CXSourceRange will point inside the file; if the reference is inside
 * a macro (and not a macro argument) the CXSourceRange will be invalid.
 *
 * \returns один of the CXResult enumerators.
 */
CXResult clang_findReferencesInFile(
    CXCursor cursor,
    CXFile file,
    CXCursorAndRangeVisitor visitor);

/**
 * Find #import/#include directives in a specific file.
 *
 * \param TU translation unit containing the file to query.
 *
 * \param file to ищи for #import/#include directives.
 *
 * \param visitor callback that will receive pairs of CXCursor/CXSourceRange for
 * each directive found.
 *
 * \returns один of the CXResult enumerators.
 */
CXResult clang_findIncludesInFile(
    CXTranslationUnit TU,
    CXFile file,
    CXCursorAndRangeVisitor visitor);

/**
 * The client's data object that is associated with a CXFile.
 */
alias ук CXIdxClientFile;

/**
 * The client's data object that is associated with a semantic entity.
 */
alias ук CXIdxClientEntity;

/**
 * The client's data object that is associated with a semantic container
 * of entities.
 */
alias ук CXIdxClientContainer;

/**
 * The client's data object that is associated with an АСД file (PCH
 * or module).
 */
alias ук CXIdxClientASTFile;

/**
 * Source location passed to индекс callbacks.
 */
struct CXIdxLoc
{
    ук[2] ptr_data;
    uint int_data;
}

/**
 * Data for ppIncludedFile callback.
 */
struct CXIdxIncludedFileInfo
{
    /**
     * Location of '#' in the \#include/\#import directive.
     */
    CXIdxLoc hashLoc;
    /**
     * Filename as written in the \#include/\#import directive.
     */
    ткст0 filename;
    /**
     * The actual file that the \#include/\#import directive resolved to.
     */
    CXFile file;
    цел isImport;
    цел isAngled;
    /**
     * Non-zero if the directive was automatically turned into a module
     * import.
     */
    цел isModuleImport;
}

/**
 * Data for IndexerCallbacks#importedASTFile.
 */
struct CXIdxImportedASTFileInfo
{
    /**
     * Top level АСД file containing the imported PCH, module or submodule.
     */
    CXFile file;
    /**
     * The imported module or NULL if the АСД file is a PCH.
     */
    CXModule module_;
    /**
     * Location where the file is imported. Applicable only for модули.
     */
    CXIdxLoc loc;
    /**
     * Non-zero if an inclusion directive was automatically turned into
     * a module import. Applicable only for модули.
     */
    цел isImplicit;
}

enum CXIdxEntityKind
{
    unexposed = 0,
    typedef_ = 1,
    функция_ = 2,
    переменная = 3,
    поле = 4,
    enumConstant = 5,

    objCClass = 6,
    objCProtocol = 7,
    objCCategory = 8,

    objCInstanceMethod = 9,
    objCClassMethod = 10,
    objCProperty = 11,
    objCIvar = 12,

    enum_ = 13,
    struct_ = 14,
    union_ = 15,

    cxxClass = 16,
    cxxNamespace = 17,
    cxxNamespaceAlias = 18,
    cxxStaticVariable = 19,
    cxxStaticMethod = 20,
    cxxInstanceMethod = 21,
    cxxConstructor = 22,
    cxxDestructor = 23,
    cxxConversionFunction = 24,
    cxxTypeAlias = 25,
    cxxInterface = 26
}

enum CXIdxEntityLanguage
{
    отсутствует = 0,
    c = 1,
    objC = 2,
    cxx = 3,
    swift = 4
}

/**
 * Extra C++ template information for an entity. This can apply to:
 * CXIdxEntity_Function
 * CXIdxEntity_CXXClass
 * CXIdxEntity_CXXStaticMethod
 * CXIdxEntity_CXXInstanceMethod
 * CXIdxEntity_CXXConstructor
 * CXIdxEntity_CXXConversionFunction
 * CXIdxEntity_CXXTypeAlias
 */
enum CXIdxEntityCXXTemplateKind
{
    nonTemplate = 0,
    template_ = 1,
    templatePartialSpecialization = 2,
    templateSpecialization = 3
}

enum CXIdxAttrKind
{
    unexposed = 0,
    ibAction = 1,
    ibOutlet = 2,
    ibOutletCollection = 3
}

struct CXIdxAttrInfo
{
    CXIdxAttrKind вид;
    CXCursor cursor;
    CXIdxLoc loc;
}

struct CXIdxEntityInfo
{
    CXIdxEntityKind вид;
    CXIdxEntityCXXTemplateKind templateKind;
    CXIdxEntityLanguage lang;
    ткст0 name;
    ткст0 USR;
    CXCursor cursor;
    CXIdxAttrInfo** attributes;
    uint numAttributes;
}

struct CXIdxContainerInfo
{
    CXCursor cursor;
}

struct CXIdxIBOutletCollectionAttrInfo
{
    CXIdxAttrInfo* attrInfo;
    CXIdxEntityInfo* objcClass;
    CXCursor classCursor;
    CXIdxLoc classLoc;
}

enum CXIdxDeclInfoFlags
{
    skipped = 0x1
}

struct CXIdxDeclInfo
{
    CXIdxEntityInfo* entityInfo;
    CXCursor cursor;
    CXIdxLoc loc;
    CXIdxContainerInfo* semanticContainer;
    /**
     * Generally same as #semanticContainer but can be different in
     * cases like out-of-строка C++ member functions.
     */
    CXIdxContainerInfo* lexicalContainer;
    цел isRedeclaration;
    цел isDefinition;
    цел isContainer;
    CXIdxContainerInfo* declAsContainer;
    /**
     * Whether the declaration exists in код or was created implicitly
     * by the compiler, e.g. implicit Objective-C methods for properties.
     */
    цел isImplicit;
    CXIdxAttrInfo** attributes;
    uint numAttributes;

    uint флаги;
}

enum CXIdxObjCContainerKind
{
    forwardRef = 0,
    interface_ = 1,
    implementation = 2
}

struct CXIdxObjCContainerDeclInfo
{
    CXIdxDeclInfo* declInfo;
    CXIdxObjCContainerKind вид;
}

struct CXIdxBaseClassInfo
{
    CXIdxEntityInfo* base;
    CXCursor cursor;
    CXIdxLoc loc;
}

struct CXIdxObjCProtocolRefInfo
{
    CXIdxEntityInfo* protocol;
    CXCursor cursor;
    CXIdxLoc loc;
}

struct CXIdxObjCProtocolRefListInfo
{
    CXIdxObjCProtocolRefInfo** protocols;
    uint numProtocols;
}

struct CXIdxObjCInterfaceDeclInfo
{
    CXIdxObjCContainerDeclInfo* containerInfo;
    CXIdxBaseClassInfo* superInfo;
    CXIdxObjCProtocolRefListInfo* protocols;
}

struct CXIdxObjCCategoryDeclInfo
{
    CXIdxObjCContainerDeclInfo* containerInfo;
    CXIdxEntityInfo* objcClass;
    CXCursor classCursor;
    CXIdxLoc classLoc;
    CXIdxObjCProtocolRefListInfo* protocols;
}

struct CXIdxObjCPropertyDeclInfo
{
    CXIdxDeclInfo* declInfo;
    CXIdxEntityInfo* getter;
    CXIdxEntityInfo* setter;
}

struct CXIdxCXXClassDeclInfo
{
    CXIdxDeclInfo* declInfo;
    CXIdxBaseClassInfo** bases;
    uint numBases;
}

/**
 * Data for IndexerCallbacks#indexEntityReference.
 *
 * This may be deprecated in a future version as this duplicates
 * the \c CXSymbolRole_Implicit bit in \c CXSymbolRole.
 */
enum CXIdxEntityRefKind
{
    /**
     * The entity is referenced directly in user's код.
     */
    direct = 1,
    /**
     * An implicit reference, e.g. a reference of an Objective-C method
     * via the dot syntax.
     */
    implicit = 2
}

/**
 * Roles that are attributed to symbol occurrences.
 *
 * Internal: this currently mirrors low 9 bits of clang::индекс::SymbolRole with
 * higher bits zeroed. These high bits may be exposed in the future.
 */
enum CXSymbolRole
{
    отсутствует = 0,
    declaration = 1 << 0,
    definition = 1 << 1,
    reference = 1 << 2,
    read = 1 << 3,
    write = 1 << 4,
    call = 1 << 5,
    dynamic = 1 << 6,
    addressOf = 1 << 7,
    implicit = 1 << 8
}

/**
 * Data for IndexerCallbacks#indexEntityReference.
 */
struct CXIdxEntityRefInfo
{
    CXIdxEntityRefKind вид;
    /**
     * Reference cursor.
     */
    CXCursor cursor;
    CXIdxLoc loc;
    /**
     * The entity that gets referenced.
     */
    CXIdxEntityInfo* referencedEntity;
    /**
     * Immediate "родитель" of the reference. For example:
     *
     * \код
     * Foo *var;
     * \endcode
     *
     * The родитель of reference of тип 'Foo' is the переменная 'var'.
     * For references inside statement bodies of functions/methods,
     * the parentEntity will be the function/method.
     */
    CXIdxEntityInfo* parentEntity;
    /**
     * Lexical container context of the reference.
     */
    CXIdxContainerInfo* container;
    /**
     * Sets of symbol roles of the reference.
     */
    CXSymbolRole role;
}

/**
 * A group of callbacks used by #clang_indexSourceFile and
 * #clang_indexTranslationUnit.
 */
struct IndexerCallbacks
{
    /**
     * Called periodically to check whether indexing should be aborted.
     * Should return 0 to continue, and non-zero to abort.
     */
    цел function(CXClientData client_data, ук reserved) abortQuery;

    /**
     * Called at the end of indexing; passes the complete diagnostic set.
     */
    проц function(
        CXClientData client_data,
        CXDiagnosticSet,
        ук reserved) diagnostic;

    CXIdxClientFile function(
        CXClientData client_data,
        CXFile mainFile,
        ук reserved) enteredMainFile;

    /**
     * Called when a file gets \#included/\#imported.
     */
    CXIdxClientFile function(
        CXClientData client_data,
        CXIdxIncludedFileInfo*) ppIncludedFile;

    /**
     * Called when a АСД file (PCH or module) gets imported.
     *
     * АСД files will not get indexed (there will not be callbacks to индекс all
     * the entities in an АСД file). The recommended action is that, if the АСД
     * file is not already indexed, to initiate a new indexing job specific to
     * the АСД file.
     */
    CXIdxClientASTFile function(
        CXClientData client_data,
        CXIdxImportedASTFileInfo*) importedASTFile;

    /**
     * Called at the beginning of indexing a translation unit.
     */
    CXIdxClientContainer function(
        CXClientData client_data,
        ук reserved) startedTranslationUnit;

    проц function(
        CXClientData client_data,
        CXIdxDeclInfo*) indexDeclaration;

    /**
     * Called to индекс a reference of an entity.
     */
    проц function(
        CXClientData client_data,
        CXIdxEntityRefInfo*) indexEntityReference;
}

цел clang_index_isEntityObjCContainerKind(CXIdxEntityKind);
CXIdxObjCContainerDeclInfo* clang_index_getObjCContainerDeclInfo(
    CXIdxDeclInfo*);

CXIdxObjCInterfaceDeclInfo* clang_index_getObjCInterfaceDeclInfo(
    CXIdxDeclInfo*);

CXIdxObjCCategoryDeclInfo* clang_index_getObjCCategoryDeclInfo(
    CXIdxDeclInfo*);

CXIdxObjCProtocolRefListInfo* clang_index_getObjCProtocolRefListInfo(
    CXIdxDeclInfo*);

CXIdxObjCPropertyDeclInfo* clang_index_getObjCPropertyDeclInfo(
    CXIdxDeclInfo*);

CXIdxIBOutletCollectionAttrInfo* clang_index_getIBOutletCollectionAttrInfo(
    CXIdxAttrInfo*);

CXIdxCXXClassDeclInfo* clang_index_getCXXClassDeclInfo(
    CXIdxDeclInfo*);

/**
 * For retrieving a custom CXIdxClientContainer attached to a
 * container.
 */
CXIdxClientContainer clang_index_getClientContainer(CXIdxContainerInfo*);

/**
 * For setting a custom CXIdxClientContainer attached to a
 * container.
 */
проц clang_index_setClientContainer(
    CXIdxContainerInfo*,
    CXIdxClientContainer);

/**
 * For retrieving a custom CXIdxClientEntity attached to an entity.
 */
CXIdxClientEntity clang_index_getClientEntity(CXIdxEntityInfo*);

/**
 * For setting a custom CXIdxClientEntity attached to an entity.
 */
проц clang_index_setClientEntity(CXIdxEntityInfo*, CXIdxClientEntity);

/**
 * An indexing action/session, to be applied to один or multiple
 * translation units.
 */
alias ук CXIndexAction;

/**
 * An indexing action/session, to be applied to один or multiple
 * translation units.
 *
 * \param CIdx The индекс object with which the индекс action will be associated.
 */
CXIndexAction clang_IndexAction_create(CXIndex CIdx);

/**
 * Destroy the given индекс action.
 *
 * The индекс action must not be destroyed until all of the translation units
 * created within that индекс action have been destroyed.
 */
проц clang_IndexAction_dispose(CXIndexAction);

enum CXIndexOptFlags
{
    /**
     * Used to indicate that Нет special indexing options are needed.
     */
    отсутствует = 0x0,

    /**
     * Used to indicate that IndexerCallbacks#indexEntityReference should
     * be invoked for only один reference of an entity per source file that does
     * not also include a declaration/definition of the entity.
     */
    suppressRedundantRefs = 0x1,

    /**
     * Function-local symbols should be indexed. If this is not set
     * function-local symbols will be ignored.
     */
    indexFunctionLocalSymbols = 0x2,

    /**
     * Implicit function/class template instantiations should be indexed.
     * If this is not set, implicit instantiations will be ignored.
     */
    indexImplicitTemplateInstantiations = 0x4,

    /**
     * Suppress all compiler warnings when parsing for indexing.
     */
    suppressWarnings = 0x8,

    /**
     * Skip a function/method body that was already parsed during an
     * indexing session associated with a \c CXIndexAction object.
     * Bodies in system headers are always skipped.
     */
    skipParsedBodiesInSession = 0x10
}

/**
 * Index the given source file and the translation unit corresponding
 * to that file via callbacks implemented through #IndexerCallbacks.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the invoked callbacks.
 *
 * \param index_callbacks Pointer to indexing callbacks that the client
 * implements.
 *
 * \param index_callbacks_size Size of #IndexerCallbacks structure that gets
 * passed in index_callbacks.
 *
 * \param index_options A bitmask of options that affects how indexing is
 * performed. This should be a bitwise OR of the CXIndexOpt_XXX флаги.
 *
 * \param[out] out_TU pointer to store a \c CXTranslationUnit that can be
 * reused after indexing is finished. Set to \c NULL if you do not require it.
 *
 * \returns 0 on success or if there were ошибки from which the compiler could
 * recover.  If there is a failure from which there is Нет recovery, returns
 * a non-zero \c CXErrorCode.
 *
 * The rest of the параметры are the same as #clang_parseTranslationUnit.
 */
цел clang_indexSourceFile(
    CXIndexAction,
    CXClientData client_data,
    IndexerCallbacks* index_callbacks,
    uint index_callbacks_size,
    uint index_options,
    ткст0 source_filename,
   сим** command_line_args,
    цел num_command_line_args,
    CXUnsavedFile* unsaved_files,
    uint num_unsaved_files,
    CXTranslationUnit* out_TU,
    uint TU_options);

/**
 * Same as clang_indexSourceFile but requires a full command строка
 * for \c command_line_args including argv[0]. This is useful if the standard
 * library paths are relative to the binary.
 */
цел clang_indexSourceFileFullArgv(
    CXIndexAction,
    CXClientData client_data,
    IndexerCallbacks* index_callbacks,
    uint index_callbacks_size,
    uint index_options,
    ткст0 source_filename,
   сим** command_line_args,
    цел num_command_line_args,
    CXUnsavedFile* unsaved_files,
    uint num_unsaved_files,
    CXTranslationUnit* out_TU,
    uint TU_options);

/**
 * Index the given translation unit via callbacks implemented through
 * #IndexerCallbacks.
 *
 * The order of callback invocations is not guaranteed to be the same as
 * when indexing a source file. The high level order will be:
 *
 *   -Preprocessor callbacks invocations
 *   -Declaration/reference callbacks invocations
 *   -Diagnostic callback invocations
 *
 * The параметры are the same as #clang_indexSourceFile.
 *
 * \returns If there is a failure from which there is Нет recovery, returns
 * non-zero, otherwise returns 0.
 */
цел clang_indexTranslationUnit(
    CXIndexAction,
    CXClientData client_data,
    IndexerCallbacks* index_callbacks,
    uint index_callbacks_size,
    uint index_options,
    CXTranslationUnit);

/**
 * Retrieve the CXIdxFile, file, строка, column, and offset represented by
 * the given CXIdxLoc.
 *
 * If the location refers into a macro expansion, retrieves the
 * location of the macro expansion and if it refers into a macro argument
 * retrieves the location of the argument.
 */
проц clang_indexLoc_getFileLocation(
    CXIdxLoc loc,
    CXIdxClientFile* indexFile,
    CXFile* file,
    uint* строка,
    uint* column,
    uint* offset);

/**
 * Retrieve the CXSourceLocation represented by the given CXIdxLoc.
 */
CXSourceLocation clang_indexLoc_getCXSourceLocation(CXIdxLoc loc);

/**
 * Visitor invoked for each поле found by a traversal.
 *
 * This visitor function will be invoked for each поле found by
 * \c clang_Type_visitFields. Its first argument is the cursor being
 * visited, its second argument is the client data provided to
 * \c clang_Type_visitFields.
 *
 * The visitor should return один of the \c CXVisitorResult values
 * to direct \c clang_Type_visitFields.
 */
alias CXVisitorResult function(
    CXCursor C,
    CXClientData client_data) CXFieldVisitor;

/**
 * Visit the поля of a particular тип.
 *
 * This function visits all the direct поля of the given cursor,
 * invoking the given \п visitor function with the cursors of each
 * visited поле. The traversal may be ended prematurely, if
 * the visitor returns \c CXFieldVisit_Break.
 *
 * \param Т the record тип whose поле may be visited.
 *
 * \param visitor the visitor function that will be invoked for each
 * поле of \п Т.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the visitor each time it is invoked.
 *
 * \returns a non-zero value if the traversal was terminated
 * prematurely by the visitor returning \c CXFieldVisit_Break.
 */
uint clang_Type_visitFields(
    CXType Т,
    CXFieldVisitor visitor,
    CXClientData client_data);

/**
 * @}
 */

/**
 * @}
 */

